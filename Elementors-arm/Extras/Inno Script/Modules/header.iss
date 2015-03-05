[Files]
//********** ISDone **********//
Source: files\isdone\English.ini; DestDir: {tmp}; Flags: dontcopy
Source: files\isdone\Russian.ini; DestDir: {tmp}; Flags: dontcopy
Source: files\isdone\unarc.dll; DestDir: {tmp}; Flags: dontcopy
Source: files\ISDone.dll; DestDir: {tmp}; Flags: dontcopy
#ifdef records
Source: files\records.inf; DestDir: {tmp}; Flags: dontcopy
#endif

#ifdef PrecompInside
Source: files\isdone\CLS-precomp.dll; DestDir: {tmp}; Flags: dontcopy
Source: files\isdone\packjpg_dll.dll; DestDir: {tmp}; Flags: dontcopy
Source: files\isdone\packjpg_dll1.dll; DestDir: {tmp}; Flags: dontcopy
Source: files\isdone\precomp.exe; DestDir: {tmp}; Flags: dontcopy
Source: files\isdone\zlib1.dll; DestDir: {tmp}; Flags: dontcopy
#endif
#ifdef SrepInside
Source: files\isdone\CLS-srep.dll; DestDir: {tmp}; Flags: dontcopy
#endif
#ifdef MSCInside
Source: files\isdone\CLS-MSC.dll; DestDir: {tmp}; Flags: dontcopy
#endif
#ifdef facompress
Source: files\isdone\facompress.dll; DestDir: {tmp}; Flags: dontcopy
#endif
#ifdef precomp
  #if precomp == "0.38"
  Source: files\isdone\precomp038.exe; DestDir: {tmp}; Flags: dontcopy
  #else
    #if precomp == "0.4"
    Source: files\isdone\precomp040.exe; DestDir: {tmp}; Flags: dontcopy
    #else
      #if precomp == "0.41"
      Source: files\isdone\precomp041.exe; DestDir: {tmp}; Flags: dontcopy
      #else
        #if precomp == "0.42"
        Source: files\isdone\precomp042.exe; DestDir: {tmp}; Flags: dontcopy
        #else
        Source: files\isdone\precomp038.exe; DestDir: {tmp}; Flags: dontcopy
        Source: files\isdone\precomp040.exe; DestDir: {tmp}; Flags: dontcopy
        Source: files\isdone\precomp041.exe; DestDir: {tmp}; Flags: dontcopy
        Source: files\isdone\precomp042.exe; DestDir: {tmp}; Flags: dontcopy
        #endif
      #endif
    #endif
  #endif
#endif
#ifdef unrar
Source: files\isdone\Unrar.dll; DestDir: {tmp}; Flags: dontcopy
#endif
#ifdef XDelta
Source: files\isdone\XDelta3.dll; DestDir: {tmp}; Flags: dontcopy
#endif
#ifdef PackZIP
Source: files\isdone\7z.dll; DestDir: {tmp}; Flags: dontcopy
Source: files\isdone\packZIP.exe; DestDir: {tmp}; Flags: dontcopy
#endif
//********** ISDone **********//

[Code]
//********** ISDone **********//
const
  PCFonFLY=true;
  notPCFonFLY=false;
var
  ISDoneCancel:integer;
  ISDoneError:boolean;
  PercentLbl:TLabel;
  PCFVer:double;

type
  TCallback = function (OveralPct,CurrentPct: integer;CurrentFile,TimeStr1,TimeStr2,TimeStr3:PAnsiChar): longword;
function WrapCallback(callback:TCallback; paramcount:integer):longword;external 'wrapcallback@files:ISDone.dll stdcall delayload';

function ISArcExtract(CurComponent:Cardinal; PctOfTotal:double; InName, OutPath, ExtractedPath: AnsiString; DeleteInFile:boolean; Password, CfgFile, WorkPath: AnsiString; ExtractPCF: boolean ):boolean; external 'ISArcExtract@files:ISDone.dll stdcall delayload';
function IS7ZipExtract(CurComponent:Cardinal; PctOfTotal:double; InName, OutPath: AnsiString; DeleteInFile:boolean; Password: AnsiString):boolean; external 'IS7zipExtract@files:ISDone.dll stdcall delayload';
function ISRarExtract(CurComponent:Cardinal; PctOfTotal:double; InName, OutPath: AnsiString; DeleteInFile:boolean; Password: AnsiString):boolean; external 'ISRarExtract@files:ISDone.dll stdcall delayload';
function ISPrecompExtract(CurComponent:Cardinal; PctOfTotal:double; InName, OutFile: AnsiString; DeleteInFile:boolean):boolean; external 'ISPrecompExtract@files:ISDone.dll stdcall delayload';
function ISSRepExtract(CurComponent:Cardinal; PctOfTotal:double; InName, OutFile: AnsiString; DeleteInFile:boolean):boolean; external 'ISSrepExtract@files:ISDone.dll stdcall delayload';
function ISxDeltaExtract(CurComponent:Cardinal; PctOfTotal:double; minRAM,maxRAM:integer; InName, DiffFile, OutFile: AnsiString; DeleteInFile, DeleteDiffFile:boolean):boolean; external 'ISxDeltaExtract@files:ISDone.dll stdcall delayload';
function ISPackZIP(CurComponent:Cardinal; PctOfTotal:double; InName, OutFile: AnsiString;ComprLvl:integer; DeleteInFile:boolean):boolean; external 'ISPackZIP@files:ISDone.dll stdcall delayload';
function ShowChangeDiskWindow(Text, DefaultPath, SearchFile:AnsiString):boolean; external 'ShowChangeDiskWindow@files:ISDone.dll stdcall delayload';

function Exec2 (FileName, Param: PAnsiChar;Show:boolean):boolean; external 'Exec2@files:ISDone.dll stdcall delayload';
function ISFindFiles(CurComponent:Cardinal; FileMask:AnsiString; var ColFiles:integer):integer; external 'ISFindFiles@files:ISDone.dll stdcall delayload';
function ISPickFilename(FindHandle:integer; OutPath:AnsiString; var CurIndex:integer; DeleteInFile:boolean):boolean; external 'ISPickFilename@files:ISDone.dll stdcall delayload';
function ISGetName(TypeStr:integer):PAnsichar; external 'ISGetName@files:ISDone.dll stdcall delayload';
function ISFindFree(FindHandle:integer):boolean; external 'ISFindFree@files:ISDone.dll stdcall delayload';
function ISExec(CurComponent:Cardinal; PctOfTotal,SpecifiedProcessTime:double; ExeName,Parameters,TargetDir,OutputStr:AnsiString;Show:boolean):boolean; external 'ISExec@files:ISDone.dll stdcall delayload';

function SrepInit(TmpPath:PAnsiChar;VirtMem,MaxSave:Cardinal):boolean; external 'SrepInit@files:ISDone.dll stdcall delayload';
function PrecompInit(TmpPath:PAnsiChar;VirtMem:cardinal;PrecompVers:single):boolean; external 'PrecompInit@files:ISDone.dll stdcall delayload';
function FileSearchInit(RecursiveSubDir:boolean):boolean; external 'FileSearchInit@files:ISDone.dll stdcall delayload';
function ISDoneInit(RecordFileName:AnsiString; TimeType,Comp1,Comp2,Comp3:Cardinal; WinHandle, NeededMem:longint; callback:TCallback):boolean; external 'ISDoneInit@files:ISDone.dll stdcall';
function ISDoneStop:boolean; external 'ISDoneStop@files:ISDone.dll stdcall';
function ISDoneChangeLanguage(Language:AnsiString):boolean; external 'ChangeLanguage@files:ISDone.dll stdcall delayload';
function SuspendProc:boolean; external 'SuspendProc@files:ISDone.dll stdcall';
function ResumeProc:boolean; external 'ResumeProc@files:ISDone.dll stdcall';
//********** ISDone **********//

const
WM_SYSCOMMAND = $0112;
MF_DELETE = $200;
MF_SEPARATOR = $800;
MF_BYPOSITION = $400;

var
Menu: TMenuItem;

function AppendMenu(hMenu: HMENU; uFlags, uIDNewItem: UINT; lpNewItem: PAnsiChar): BOOL; external 'AppendMenuA@user32.dll stdcall';
function GetSystemMenu(hWnd: HWND; bRevert: BOOL): HMENU; external 'GetSystemMenu@user32.dll stdcall';

//type
//  TTimer=procedure(HandleW, msg, idEvent, TimeSys: LongWord);
var TimeTimerID: LongWord;
  
function WrapTimerProc(callback:procedure; paramcount:integer):longword; external 'wrapcallbackaddr@{tmp}\CallbackCtrl.dll stdcall delayload';
function SetTimer(hWnd, nIDEvent, uElapse, lpTimerFunc: LongWord): LongWord; external 'SetTimer@user32.dll stdcall';
function KillTimer(hWnd, nIDEvent: LongWord): LongWord; external 'KillTimer@user32.dll stdcall';

// »конка формы
function LoadImage(hInst: THandle; ImageName: PAnsiChar; ImageType: UINT; X, Y: Integer; Flags: UINT): THandle; external 'LoadImageA@user32.dll stdcall delayload';

function isWin6: Boolean;
var
  ver: TWindowsVersion;
begin
  GetWindowsVersionEx(ver);
  if ver.Major < 6 then result:=false
    else result:=true;
end;

// обработка нажати€ на крестик
#ifdef UNICODE
 #define A "W"
#else
 #define A "A"
#endif
const
  SC_CLOSE = 61536;
var
  OldProc: Longint;

function CallWindowProc(lpPrevWndFunc: Longint; hWnd: HWND; Msg: UINT; wParam, lParam: Longint): Longint;
 external 'CallWindowProc{#A}@user32.dll stdcall delayload';
function SetWindowLong(hWnd: HWND; nIndex: Integer; dwNewLong: Longint): Longint;
 external 'SetWindowLong{#A}@user32.dll stdcall delayload';
 // -------------------- //

Function NumToStr(Float: Extended): String;
Begin
    Result:= Format('%.2n', [Float]); StringChange(Result, ',', '.');
  while ((Result[Length(Result)] = '0') or (Result[Length(Result)] = '.')) and (Pos('.', Result) > 0) do
    SetLength(Result, Length(Result)-1);
End;

function NotEnoughtSpace(): boolean;
var
  FreeDiskSpace, TotalDiskSpace: Cardinal;
begin
  GetSpaceOnDisk(WizardForm.DirEdit.Text,true,FreeDiskSpace,TotalDiskSpace);
  if FreeDiskSpace < {#NeedSize} then
    result:=false
  else
    result:=true;
end;