[code]
const
  LOAD_LIBRARY_AS_DATAFILE = $2;

#ifdef UNICODE
    #define A "W"
#else
    #define A "A"
#endif

function LoadLibraryEx(lpFileName: String; hFile: THandle; dwFlags: DWORD): THandle; external 'LoadLibraryEx{#A}@kernel32.dll stdcall';
function LoadString(hInstance: THandle; uID: SmallInt; var lpBuffer: Char; nBufferMax: Integer): Integer; external 'LoadString{#A}@user32.dll stdcall';

//Filename: full path to executable file
//IsPin: False - unpin from TaskBar, True - pin to TaskBar
function PinToTaskbarWin7(Filename: String; IsPin: Boolean): Boolean;
var
  hInst: THandle;
  buf: array [0..255] of char;
  i, Res: Integer;
  strVerb: String;
  objShell, colVerbs: Variant;
begin
  if not FileExists(Filename) then Exit;
  if IsPin then Res := 5386 else Res := 5387;
  if (GetWindowsVersion shr 24 = 6) and ((GetWindowsVersion shr 16) and $FF = 1) then begin
    hInst := LoadLibraryEx(ExpandConstant('{sys}\shell32.dll'), 0, LOAD_LIBRARY_AS_DATAFILE);
    if hInst <> 0 then
    try
      for i := 0 to LoadString(hInst, Res, buf[0], 255)-1 do strVerb := strVerb + Buf[i];
      try
        objShell := CreateOleObject('Shell.Application');
      except
        ShowExceptionMessage;
        Exit;
      end;
      colVerbs := objShell.Namespace(ExtractFileDir(Filename)).ParseName(ExtractFileName(Filename)).Verbs;
      for i := colVerbs.Count downto 1 do if colVerbs.Item[i].Name = strVerb then begin
        colVerbs.Item[i].DoIt;
        Result := True;
        Break;
      end;
      finally
        FreeDLL(hInst);
    end;
  end;
end;