[Files]
Source: files\botva2.dll; DestDir: {app}\uninstall; Attribs: hidden system;
Source: files\CallBackCtrl.dll; DestDir: {app}\uninstall; Attribs: hidden system;
Source: files\botva2\background.png; DestDir: {app}\uninstall; Attribs: hidden system;
Source: files\botva2\pbr.png; DestDir: {app}\uninstall; Attribs: hidden system;
Source: files\botva2\pbbkgr.png; DestDir: {app}\uninstall; Attribs: hidden system;
Source: files\botva2\uninstall.png; DestDir: {app}\uninstall; Attribs: hidden system;
Source: files\botva2\button.png; DestDir: {app}\uninstall; Attribs: hidden system;
Source: files\icons\icon.ico; DestDir: {app}\uninstall; Attribs: hidden system;

[Code]
function UnImgLoad(Wnd :HWND; FileName :PAnsiChar; Left, Top, Width, Height :integer; Stretch, IsBkg :boolean) :Longint; external 'ImgLoad@{tmp}\botva2.dll stdcall delayload';
procedure UnImgApplyChanges(h:HWND); external 'ImgApplyChanges@{tmp}\botva2.dll stdcall delayload';
procedure UnImgSetPosition(img :Longint; NewLeft, NewTop, NewWidth, NewHeight :integer); external 'ImgSetPosition@{tmp}\botva2.dll stdcall delayload';
procedure UngdipShutdown; external 'gdipShutdown@{tmp}\botva2.dll stdcall delayload';
function UnBtnCreate(hParent :HWND; Left, Top, Width, Height :integer; FileName :PAnsiChar; ShadowWidth :integer; IsCheckBtn :boolean) :HWND; external 'BtnCreate@{tmp}\botva2.dll stdcall delayload';
procedure UnBtnSetText(h :HWND; Text :PAnsiChar); external 'BtnSetText@{tmp}\botva2.dll stdcall delayload';
procedure UnBtnSetFont(h :HWND; Font :Cardinal); external 'BtnSetFont@{tmp}\botva2.dll stdcall delayload';
procedure UnBtnSetFontColor(h :HWND; NormalFontColor, FocusedFontColor, PressedFontColor, DisabledFontColor :Cardinal); external 'BtnSetFontColor@{tmp}\botva2.dll stdcall delayload';
procedure UnBtnSetEvent(h :HWND; EventID :integer; Event :Longword); external 'BtnSetEvent@{tmp}\botva2.dll stdcall delayload';

{type
  TImgPB = record
    Left,
    Top,
    Width,
    Height,
    MaxWidth  : integer;
    img1,img2 : Longint;
    //hParent   : HWND;
  end;   }

//создать прогрессбар
function UnImgPBCreate(hParent :HWND; bk, pb :ansistring; Left, Top, Width, Height :integer):TImgPB;
begin
  Result.Left:=Left+2;
  Result.Top:=Top+2;
  Result.Width:=0;
  Result.Height:=Height-4;
  Result.MaxWidth:=Width-4;
  if Length(pb)>0 then Result.img1:=UnImgLoad(hParent,pb,Result.Left,Result.Top,0,Result.Height,True,False) else Result.img1:=0;
  if Length(bk)>0 then Result.img2:=UnImgLoad(hParent,bk,Left,Top,Width,Height,True,False) else Result.img2:=0;
end;

//установить позицию прогрессбара (0-100)
procedure UnImgPBSetPosition(var PB :TImgPB; Percent :Extended);
var
  NewWidth:integer;
begin
  if PB.img1<>0 then begin
    NewWidth:=Round(PB.MaxWidth*Percent/100);
    if PB.Width<>NewWidth then begin
      PB.Width:=NewWidth;
      UnImgSetPosition(PB.img1,PB.Left,PB.Top,PB.Width,PB.Height);
    end;
  end;
end;

//удалить прогрессбар
{procedure ImgPBDelete(var PB :TImgPB);
begin
  if PB.img1<>0 then ImgRelease(PB.img1);
  if PB.img2<>0 then ImgRelease(PB.img2);
  PB.img1:=0;
  PB.img2:=0;
end;}


type
  TPBProc = function (h:hWnd;Msg,wParam,lParam:Longint):Longint;

var
  UninstPB: TImgPB;
  UninstPBOldProc:Longint;
  UFCaption:string;

function CallBackProc(P:TPBProc;ParamCount:integer):LongWord; external 'wrapcallbackaddr@{tmp}\CallbackCtrl.dll stdcall delayload';

function UninstPBProc(h:hWnd;Msg,wParam,lParam:Longint):Longint;
var
  pr,i1,i2:Extended;
  p:string;
begin
  if Msg=$2 then SetWindowLong(h,-4,UninstPBOldProc);

  Result:=CallWindowProc(UninstPBOldProc,h,Msg,wParam,lParam);

  if (Msg=$402) and (UninstallProgressForm.ProgressBar.Position>UninstallProgressForm.ProgressBar.Min) then begin
    i1:=UninstallProgressForm.ProgressBar.Position-UninstallProgressForm.ProgressBar.Min;
    i2:=UninstallProgressForm.ProgressBar.Max-UninstallProgressForm.ProgressBar.Min;
    pr:=(i1*100)/i2;
    p:=' - ['+Format('%f',[pr])+'%]';
    StringChange(p,',','.');

    UninstallProgressForm.Caption:=UFCaption+p;

    UnImgPBSetPosition(UninstPB,pr);
    UnImgApplyChanges(UninstallProgressForm.Handle);
  end;
end;

function InitializeUninstall: Boolean;
begin
  FileCopy(ExpandConstant('{app}\uninstall\botva2.dll'),ExpandConstant('{tmp}\botva2.dll'),False);
  FileCopy(ExpandConstant('{app}\uninstall\CallbackCtrl.dll'),ExpandConstant('{tmp}\CallbackCtrl.dll'),False);
  FileCopy(ExpandConstant('{app}\uninstall\background.png'),ExpandConstant('{tmp}\background.png'),False);
  FileCopy(ExpandConstant('{app}\uninstall\pbr.png'),ExpandConstant('{tmp}\pbr.png'),False);
  FileCopy(ExpandConstant('{app}\uninstall\pbbkgr.png'),ExpandConstant('{tmp}\pbbkgr.png'),False);
  FileCopy(ExpandConstant('{app}\uninstall\uninstall.png'),ExpandConstant('{tmp}\uninstall.png'),False);
  FileCopy(ExpandConstant('{app}\uninstall\icon.ico'),ExpandConstant('{tmp}\icon.ico'),False);
  FileCopy(ExpandConstant('{app}\uninstall\button.png'),ExpandConstant('{tmp}\button.png'),False);

  Result:=True;
end;

function CreateSaveForm(): integer;
var
  CloseLabel  :TLabel;
begin
  CloseForm:=CreateCustomForm;
  with CloseForm do
  begin
    Width       := 305;
    Height      := 120;
    //BorderIcons := [];   //(biSystemMenu, biMinimize, biMaximize, biHelp)
    BorderStyle :=bsDialog //(bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow, bsSizeToolWin)
    Color       := clWindowFrame;
    Position    := poScreenCenter;
    Caption     :='Удаление сохранений';
  end;
  Font:=TFont.Create;
  Font.Color:={#FirstColor};
  Font.Name:='{#FontName}';
  Font.Height:=-12;
  CloseForm.Font:=Font;
  //ExtractTemporaryFile('exit.ico');
  //SendMessage(CloseForm.Handle, $80, 0, LoadImage(0,ExpandConstant('{tmp}')+'\exit.ico',1,16,16,$1010));

  CloseLabel:=TLabel.Create(CloseForm);
  With CloseLabel do
  begin
    SetBounds(10,10,280,100);
    AutoSize      :=false;
    Alignment     :=taCenter;
    Transparent   :=true;
    Parent        :=CloseForm;
    Font.Height   :=-15;
    Caption       :='Удалить файлы сохранений?';
  end;
  bCloseYes:=UnBtnCreate(CloseForm.Handle,20,50,100,40,ExpandConstant('{tmp}\button.png'),18,false);
  UnBtnSetText(bCloseYes,'Да');
  UnBtnSetFont(bCloseYes,Font.Handle);
  UnBtnSetFontColor(bCloseYes,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  UnBtnSetEvent(bCloseYes,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));

  bCloseNo:=UnBtnCreate(CloseForm.Handle,180,50,100,40,ExpandConstant('{tmp}\button.png'),18,false);
  UnBtnSetText(bCloseNo,'Нет');
  UnBtnSetFont(bCloseNo,Font.Handle);
  UnBtnSetFontColor(bCloseNo,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  UnBtnSetEvent(bCloseNo,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));

  UnImgApplyChanges(CloseForm.Handle);
  CloseForm.ShowModal;

  if isidyes then Result:=IDYES else Result:=IDNO;
end;

#ifdef DelSave
procedure DeleteSave();
begin
  if MsgBox('Удалить файлы сохранений?', mbInformation, MB_YESNO) = IDYES then
    DelTree(ExpandConstant('{#SavePath}'),true,true,true);
end;
#endif

procedure InitializeUninstallProgressForm();
begin
  UninstallProgressForm.OuterNotebook.Hide;
  UninstallProgressForm.InnerNotebook.Hide;
  UninstallProgressForm.CancelButton.SetBounds(0,0,0,0);
  UninstallProgressForm.Bevel.Hide;
  UninstallProgressForm.ClientHeight:=400;
  UninstallProgressForm.ClientWidth:=600;
  
  SendMessage(UninstallProgressForm.Handle, $80, 0, LoadImage(0,ExpandConstant('{tmp}')+'\icon.ico',1,16,16,$1010));
  UnImgLoad(UninstallProgressForm.Handle,ExpandConstant('{tmp}\background.png'),0,0,UninstallProgressForm.ClientWidth,UninstallProgressForm.ClientHeight,false,True);
  UnImgLoad(UninstallProgressForm.Handle,ExpandConstant('{tmp}\uninstall.png'),110,15,500,200,false,true);
  UninstPB:=UnImgPBCreate(UninstallProgressForm.Handle, ExpandConstant('{tmp}\pbbkgr.png'), ExpandConstant('{tmp}\pbr.png'),10, 220, UninstallProgressForm.ClientWidth-20, 25);
  UnImgApplyChanges(UninstallProgressForm.Handle);
  UFCaption:=UninstallProgressForm.Caption;
  UninstPBOldProc:=SetWindowLong(UninstallProgressForm.ProgressBar.Handle,-4,CallBackProc(@UninstPBProc,4));
  PinToTaskbarWin7(ExpandConstant('{app}\{#AppExeName}'),false);
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usUninstall then
#ifdef GameExplorer
  RemoveGame();
#endif
  if CurUninstallStep = usPostUninstall then
#ifdef DelSave
    DeleteSave;
#endif
end;

procedure DeinitializeUninstall;
begin
  UngdipShutdown;
end;

