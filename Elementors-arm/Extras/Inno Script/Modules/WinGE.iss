[code]
type
  TGUID_ForGDF = record
    Data1: Cardinal;
    Data2, Data3: Word;
    Data4: array [0..7] of Byte;
  end;

  hKey = DWORD;
  REGSAM = DWORD;

const
  KEY_WRITE = 131078;
  KEY_WOW64_32KEY = 512;
  KEY_WOW64_64KEY = 256;
  ERROR_SUCCESS = 0;
  REG_DWORD = 4;
  REG_OPTION_NON_VOLATILE = 0;
  PlayTask = 0;
  SupportTask = 1;

var
  GUID: TGUID_ForGDF;

function GenerateGUID(var GUID: TGUID_ForGDF): Cardinal; external 'GenerateGUID@files:GameuxInstallHelper.dll stdcall setuponly';
function AddToGameExplorer(Binary: AnsiString; Path: AnsiString; InstallType: Integer; var GUID: TGUID_ForGDF): Cardinal;
  external 'AddToGameExplorerA@files:GameuxInstallHelper.dll stdcall setuponly';
function CreateTask(InstallType: Integer; var GUID: TGUID_ForGDF; TaskType: Integer; TaskNumber: Integer; TaskName: AnsiString; Binary: AnsiString; Parameters: AnsiString): Cardinal;
  external 'CreateTaskA@files:GameuxInstallHelper.dll stdcall setuponly';
function RetrieveGUIDForApplication(Binary: AnsiString; var GUID: TGUID_ForGDF): Cardinal;
  external 'RetrieveGUIDForApplicationA@{app}\GameuxInstallHelper.dll stdcall uninstallonly';
function RemoveFromGameExplorer(var GUID: TGUID_ForGDF): Cardinal; external 'RemoveFromGameExplorer@{app}\GameuxInstallHelper.dll stdcall uninstallonly';
function RemoveTasks(var GUID: TGUID_ForGDF): Cardinal; external 'RemoveTasks@{app}\GameuxInstallHelper.dll stdcall uninstallonly';  
function RegCreateKeyEx(hKey: HKEY; lpSubKey: PAnsiChar; Reserved: DWORD; lpClass: PAnsiChar; dwOptions: DWORD; samDesired: REGSAM; lpSecurityAttributes: DWORD; var phkResult: HKEY; lpdwDisposition: DWORD): Longint;
  external 'RegCreateKeyExA@advapi32.dll stdcall';
function RegSetValueEx(hKey: HKEY; lpValueName: PAnsiChar; Reserved: DWORD; dwType: DWORD; var lpData: DWORD; cbData: DWORD): Longint;
  external 'RegSetValueExA@advapi32.dll stdcall';
function RegCloseKey(hKey: HKEY): Longint; external 'RegCloseKey@advapi32.dll stdcall';
function GetLastError: Dword; external 'GetLastError@kernel32.dll stdcall';

function IntToHex(Int: Cardinal; Digits: Integer): AnsiString;
var
  i, Digit: Integer;
  ch: Byte;
begin
  result:='';
  for i:=0 to Digits-1 do begin
    digit:=Int mod 16;
    Int:=Int div 16;
    if digit<0 then
      digit:=digit+16;
    ch:=Ord('0')+digit;
    if digit>9 then
      ch:=ch+7;
    result:=chr(ch)+result;
  end;
end;

function GetGUID(S: AnsiString): AnsiString;
var
  i: integer;
begin
  result:='{'+IntToHex(GUID.Data1, 8)+'-'+IntToHex(GUID.Data2, 4)+'-'+IntToHex(GUID.Data3, 4)+'-'+IntToHex(Ord(GUID.Data4[0]), 2)+IntToHex(Ord(GUID.Data4[1]), 2)+'-';
  for i:=2 to 7 do
    result:=result+IntToHex(Ord(GUID.Data4[i]), 2);
  result:=result+'}';
end;

function SetRegLong(RootKey: DWORD; Subkey: AnsiString; ValueName: AnsiString; Data: DWORD; DisableRedir: Boolean): Boolean;
var
  Key: hKey;
  Flags: Dword;
begin
  Result := false;

  Flags := KEY_WRITE;
  if DisableRedir and IsWin64 then
    Flags := Flags or KEY_WOW64_64KEY
  else
    Flags := Flags or KEY_WOW64_32KEY;

  if RegCreateKeyEx(RootKey, PAnsiChar(Subkey), 0, '', REG_OPTION_NON_VOLATILE, Flags, 0, Key, 0) <> ERROR_SUCCESS then Exit;
  try
    if RegSetValueEx(Key, PAnsiChar(ValueName), 0, REG_DWORD, Data, SizeOf(Data)) <> ERROR_SUCCESS then Exit;
  finally
    RegCloseKey(Key);
  end;
  Result := true;
end;

procedure AddGame(CurStep: TSetupStep);
var
  Binary, MainExe: AnsiString;
begin
  case CurStep of
    ssInstall: begin
      GenerateGUID(GUID);
    end;
    ssPostInstall: begin
      Binary:=ExpandConstant('{app}\{#GDFBinary}');
      MainExe:=ExpandConstant('{app}\{#AppExeWorkingDir}{#AppExeName}');
      AddToGameExplorer(Binary, ExpandConstant('{app}'), 3, GUID);
      CreateTask(3, GUID, PlayTask, 0, ExpandConstant('Запустить игру'), MainExe, '');
      SetRegLong(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\GameUX\Games\'+GetGUID(''), 'IsSigned', 1, IsWin64);
    end;
  end;
end;

procedure RemoveGame();
var
  GDFBinary: AnsiString; 
  GUID: TGUID_ForGDF;
begin
  GDFBinary:=ExpandConstant('{app}\{#GDFBinary}');
  RetrieveGUIDForApplication(GDFBinary, GUID);
  RemoveFromGameExplorer(GUID);
  UnloadDll(ExpandConstant('{app}\GameuxInstallHelper.dll'));
end;