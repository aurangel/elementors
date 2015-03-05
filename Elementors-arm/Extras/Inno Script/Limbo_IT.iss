; Название игры
#define AppName "Elementors ARM"
; Версия игры
#define AppVersion "1.0"
; Издатель
#define AppPublisher "Vlasenko"
; Имя главного запусакаемого файла
#define AppExeName "Elementors Arm.exe"
; Рабочий каталог запускаемого файла(если не корень {app}, то слэш обязателен)
;#define AppExeWorkingDir "bin\"
#define AppExeWorkingDir ""
; Стандартная папка для установки
#define DefaultDir "{pf}"
; Необходимый обьем памяти на HDD
#define NeedSize "100"
; Сколько необходимо оперативной памяти для расспаковки
#define NeedMem 132
; Удаление сохранений
;#define DelSave
#ifdef DelSave
; Папка сохранений
  #define SavePath ""
#endif

; Ярлык в обозревателе игр
#define GameExplorer
#ifdef GameExplorer
; Имя библиотеки
  #define GDFBinary "L_GDF.dll"
#endif

; Нужны ли компоненты
#define Components
; Нужно ли дополнительное програмное обеспечение
#define Soft
#ifdef Soft
  #define DirectX
  #define VC
#endif

#define records
#define facompress
;#define PrecompInside
;#define SrepInside
;#define MSCInside
;#define precomp "0.42"
;#define unrar
;#define XDelta
;#define PackZIP

; Шрифт инсталлятора
#define FontName "Candara"
; Главный цвет текста
#define FirstColor "$ffffff"
; Второй цвет текста
#define SecondColor "$dcbb5f"
; Главный цвет текста на кнопках
#define BtnFirstColor "$ffffff"
; Цвет текста на кнопках при нажатии
#define BtnSecondColor "$808080"
; Цвет фона
#define BackgroundColor "clWindowFrame"
; Затемненный цвет фона (используется в компонентлисте)
#define ShadowedBackgroundColor "$282828"

; Запрет русских символов в пути
;#define RussianChars

#define Time GetDateTimeString('dd/mm/yyyy hh:nn', '-', ':')
#define VersionInfoTime GetDateTimeString('yy/mm/dd.hh', '.', '.')

#ifdef GameExplorer
  #include "modules\WinGE.iss"
#endif
#include "modules\PinToTaskbarWin7.iss"
#include "modules\botva2.iss"
#include "modules\ProgressBar.iss"
#include "modules\header.iss"
#include "modules\WinTB.iss"
#include "modules\Languages.iss"

[Setup]
AppName={#AppName}
AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
DefaultDirName={#DefaultDir}\{#AppName}
DefaultGroupName={#AppName}
OutputBaseFilename={#AppName}
AppVersion=1.0r6
Compression=lzma
SetupIconFile=Files\icons\Icon.ico
UninstallIconFile=Files\icons\Icon.ico
UninstallFilesDir={app}\uninstall
UsePreviousSetupType=False
UsePreviousAppDir=no
UsePreviousGroup=no
UsePreviousTasks=False
UsePreviousLanguage=False
VersionInfoVersion={#VersionInfoTime}
VersionInfoCopyright=Vlasenko
//InfoBeforeFile=Info.rtf

[Files]
Source: files\Languages.ini; Flags: dontcopy;
Source: files\icons\exit.ico; Flags: dontcopy;
Source: files\icons\icon.ico; Flags: dontcopy;
Source: files\icons\settings.ico; Flags: dontcopy;
Source: files\icons\folder.ico; Flags: dontcopy;
Source: files\icons\about.ico; Flags: dontcopy;
#ifdef GameExplorer
Source: files\GDF\GameuxInstallHelper.dll; DestDir: {app}; Flags: overwritereadonly; Attribs: hidden system;
Source: files\GDF\{#GDFBinary}; DestDir: {app}; Flags: ignoreversion; Attribs: hidden system;
#endif
Source: files\CallbackCtrl.dll; Flags: dontcopy; Attribs: hidden system;
Source: files\WinTB.dll; Flags: dontcopy; Attribs: hidden system;
Source: files\b2p.dll; Flags: dontcopy; Attribs: hidden system;
Source: files\botva2.dll; Flags: dontcopy; Attribs: hidden system;
Source: files\botva2\*; Flags: dontcopy
Source: "D:\Program\S\Deploy\Ит планета\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Types]
Name: full; Description: Full installation; Flags: iscustom

[Icons]
Name: {group}\{#AppName}; Filename: {app}\{#AppExeName}
Name: {group}\{cm:UninstallProgram,{#AppName}}; Filename: {uninstallexe}
Name: {commondesktop}\{#AppName}; Filename: {app}\{#AppExeName}; Components: icons\desktopicon

[Components]
Name: icons; Description: Дополнительные иконки; Types: full;
Name: icons\desktopicon; Description: Иконка на робочем столе; Types: full;
Name: icons\quicklaunchicon; Description: Иконка на панели быстрого доступа; OnlyBelowVersion: 0,6.1; Types: full;
Name: icons\quicklaunchicon7; Description: Иконка на панели быстрого доступа; MinVersion: 0,6.1; Types: full;
#ifdef GameExplorer
Name: icons\gameux; Description: 'Иконка в программном стеке';
#endif
#ifdef Components
Name: language; Description: Язык интерфейса:; Types: full; Flags:fixed;
Name: language\ru; Description: Русский; Flags: exclusive;
Name: language\uk; Description: Английский; Flags: exclusive;
Name: language\br; Description: Бразильский; Flags: exclusive;
Name: language\de; Description: Немецкий; Flags: exclusive;
Name: language\es; Description: Испанский; Flags: exclusive;
Name: language\fr; Description: Французcкий; Flags: exclusive;
Name: language\it; Description: Итальянский; Flags: exclusive;
Name: language\ja; Description: Японский; Flags: exclusive;
Name: language\ko; Description: Корейский; Flags: exclusive;
Name: language\pl; Description: Польский; Flags: exclusive;
Name: language\pt; Description: Португальский; Flags: exclusive;
Name: language\sz; Description: Сычуаньский; Flags: exclusive;
Name: language\tr; Description: Турецкий; Flags: exclusive;
Name: language\zh; Description: Китайский; Flags: exclusive;
#endif

[UninstallDelete]
Type: filesandordirs; Name: {app}

[Code]
const
  wpSettings = 20;
  wpExists = 21;
  wpExit = 22;
var
    LangBackgr,Flags,
    Background, GameLogo, InfoMainPanel, InfoPanel,
    DirSmallPanel, GroupSmallPanel, ComponentsPanel: longint;

    bRun, bReInstall, bDelete,
    bCloseYes, bCloseNo, bNext, bBack, bCancel, bDirBrowse,
    bGroupBrowse, bGroupOnOff, bSettings, bFClose, bBrowseOk,
    bBrowseReset, bBrowseNew, bBrowseCancel: longint;

    ReadyLblDir, ReadyLblIcons, ReadyLblSoft, ReadyLblLang, ExistsDirLbl: array of TLabel;

    LangVisibilityLbl,RusLbl,EngLbl,TextLbl,
    AboutLbl, InfoPanelLbl, WelcomeLbl, SDirLbl, SDirNameLbl,
    SGroupLbl, SGroupNameLbl, ComponentsName: TLabel;

    PostInstallStep,
    AllTimeStr, InstallLocation, UninstallPath: string;
    AllTimeCount, ResultCode, CurLangPageID: integer;

    Font: TFont;

    FSettings, CloseForm, BrowseForm, AboutForm, InstalledForm: TForm;

    CloseTemp, isDir, InitializeFlag, isopend, isrus, ISInstallStep,
    exconfirm, excancel,isidyes, ExitCommand: boolean;

    BrowseText: TNewEdit;

    DirTree: TFolderTreeView;
    GroupTree: TStartMenuFolderTreeView;

    ProgressBar: TImgPB;
    CurrProgress: integer;

    tLeft, tTop, tWidth, tHeight: integer;

    WD, WS, WGE, WQL, WSL,   WDX, WVC: integer;

    FreeSpace, TotalSpace: Cardinal;
    NeedSpace: integer;

procedure Count(var LabelArray: array of TLabel; ident: string); forward;

Function MbOrTb(Byte: Extended): String;
begin
  if Byte < 1024 then Result := NumToStr(Byte) + ' ' + GetWord('Mb') else
  if Byte/1024 < 1024 then Result := NumToStr(round(Byte/1024*100)/100) + ' ' + GetWord('Gb') else
    Result:= NumToStr(round((Byte/(1024*1024))*100)/100) + ' ' + GetWord('Tb')
end;

procedure NextCheck();
begin
  BtnSetEnabled(bNext,true);
  if CurLangPageID = wpReady then begin
    GetSpaceOnDisk(ExtractFileDrive(WizardForm.DirEdit.Text), True, FreeSpace, TotalSpace);
    NeedSpace := {#NeedSize};

  //проверяем доступное место на жестком диске
    if FreeSpace < NeedSpace then
      BtnSetEnabled(bNext,false)
    else
      BtnSetEnabled(bNext,true);
    BtnRefresh(bNext);
  end;
end;

procedure Components();
var
  i: integer;
begin
  for i := 0 to WizardForm.ComponentsList.ItemCount-1 do begin                          // Переименование компонентов
    WizardForm.ComponentsList.ItemCaption[i] := GetWord('Component_' + IntToStr(i));    // на названия получамые из файла
  end;                                                                                  // языка с дескриптором Component_НомерКомпонента

// Не помешало бы что-то более универсальное

// *****************************************
end;


procedure BrowseOnChange(Sender: TObject);
begin
  if isDir then
    BrowseText.Text := AddBackslash(DirTree.Directory) + '{#AppName}'
  else
    BrowseText.Text := AddBackslash(GroupTree.Directory) + '{#AppName}';
end;

procedure TreeViewButtonsOnClick(bBtn:HWND);
begin
  case bBtn of
    bBrowseOk :
    begin
      if isDir then
      begin
        SDirLbl.Caption := MinimizePathName(BrowseText.Text,SDirLbl.Font,SDirLbl.Width);
        WizardForm.DirEdit.Text := BrowseText.Text;
        ReadyLblDir[2].Caption := MinimizePathName(WizardForm.DirEdit.Text,ReadyLblDir[2].Font,560);
        NextCheck();
        Count(ReadyLblDir,'dir');
      end
      else
      begin
        SGroupLbl.Caption := MinimizePathName(BrowseText.Text,SGroupLbl.Font,SGroupLbl.Width);
        WizardForm.GroupEdit.Text := BrowseText.Text;
      end;
      BrowseForm.Close;
    end;
    bBrowseReset :
    begin
      if isDir then
        DirTree.ChangeDirectory(ExpandConstant('{#DefaultDir}'),true)
      else
        GroupTree.ChangeDirectory('',true);
    end;
    bBrowseNew :
    begin
      if isDir then
        DirTree.CreateNewDirectory(GetWord('NewFolder'))
      else
        GroupTree.CreateNewDirectory(GetWord('NewFolder'));
    end;
    bBrowseCancel : BrowseForm.Close;
  end;
end;

procedure TreeViewOnClick(bBtn:HWND);
begin
  BrowseForm := CreateCustomForm;
  with BrowseForm do
  begin
    Width       := 410;
    Height      := 330;
    BorderStyle := bsDialog //(bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow, bsSizeToolWin)
    Color       := {#BackgroundColor};
    Position    := poScreenCenter;
    if bBtn = bDirBrowse then
      Caption := GetWord('DirSelect')
    else if bBtn = bGroupBrowse then
      Caption := GetWord('StartSelect');
  end;
  ExtractTemporaryFile('folder.ico');
  SendMessage(BrowseForm.Handle, $80, 0, LoadImage(0,ExpandConstant('{tmp}')+'\folder.ico',1,16,16,$1010));

  BrowseText := TNewEdit.Create(BrowseForm);
  with BrowseText do
  begin
    Parent := BrowseForm;
    Color := clWindowFrame;
    Font.Color := {#FirstColor};
    SetBounds(10,10,380,20);
  end;
  if bBtn = bDirBrowse then
  begin
    isDir := true;
    DirTree := TFolderTreeView.Create(BrowseForm);
    DirTree.Parent := BrowseForm;
    DirTree.SetBounds(BrowseText.Left,BrowseText.Top + BrowseText.Height + 10,BrowseText.Width,200);
    DirTree.OnChange := @BrowseOnChange;
    DirTree.ChangeDirectory(WizardForm.DirEdit.Text,true);
    BrowseText.Text := DirTree.Directory;
  end
  else if bBtn = bGroupBrowse then
  begin
    isDir := false;
    GroupTree := TStartMenuFolderTreeView.Create(BrowseForm);
    GroupTree.Parent := BrowseForm;
    GroupTree.SetBounds(BrowseText.Left,BrowseText.Top + BrowseText.Height + 10,BrowseText.Width,200);
    GroupTree.OnChange := @BrowseOnChange;
    GroupTree.SetPaths(ExpandConstant('{userprograms}'),ExpandConstant('{commonprograms}'),ExpandConstant('{userstartup}'),ExpandConstant('{commonstartup}'));
    GroupTree.ChangeDirectory(WizardForm.GroupEdit.Text,true);
    BrowseText.Text := GroupTree.Directory;
  end;

//---------- Кнопка "Ок" ----------//
  if bBtn = bDirBrowse then
    bBrowseOk := BtnCreate(BrowseForm.Handle,DirTree.Left - 18 / 2,DirTree.Top + DirTree.Height + 10,100,40,'button.png',18,false)
  else if bBtn = bGroupBrowse then
    bBrowseOk := BtnCreate(BrowseForm.Handle,GroupTree.Left - 18 / 2,GroupTree.Top + GroupTree.Height + 10,100,40,'button.png',18,false);
  BtnSetText(bBrowseOk,GetWord('Ok'));
  BtnSetFont(bBrowseOk,Font.Handle);
  BtnSetFontColor(bBrowseOk,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  BtnSetEvent(bBrowseOk,BtnClickEventID,WrapBtnCallback(@TreeViewButtonsOnClick,1));
//---------- Кнопка "Ок" ----------//

//---------- Кнопка "Сброс" ----------//
  if bBtn = bDirBrowse then
    bBrowseReset := BtnCreate(BrowseForm.Handle,DirTree.Left + 100 - 18 / 2,DirTree.Top + DirTree.Height + 10,100,40,'button.png',18,false)
  else if bBtn = bGroupBrowse then
    bBrowseReset := BtnCreate(BrowseForm.Handle,GroupTree.Left + 100 - 18 / 2,GroupTree.Top + GroupTree.Height + 10,100,40,'button.png',18,false);
  BtnSetText(bBrowseReset,GetWord('Reset'));
  BtnSetFont(bBrowseReset,Font.Handle);
  BtnSetFontColor(bBrowseReset,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  BtnSetEvent(bBrowseReset,BtnClickEventID,WrapBtnCallback(@TreeViewButtonsOnClick,1));
//---------- Кнопка "Сброс" ----------//

//---------- Кнопка "Создать папку" ----------//
  if bBtn = bDirBrowse then
    bBrowseNew := BtnCreate(BrowseForm.Handle,DirTree.Left + 200 - 18 / 2,DirTree.Top + DirTree.Height + 10,100,40,'button.png',18,false)
  else if bBtn = bGroupBrowse then
    bBrowseNew := BtnCreate(BrowseForm.Handle,GroupTree.Left + 200 - 18 / 2,GroupTree.Top + GroupTree.Height + 10,100,40,'button.png',18,false);
  BtnSetText(bBrowseNew,GetWord('CreateFolder'));
  BtnSetFont(bBrowseNew,Font.Handle);
  BtnSetFontColor(bBrowseNew,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  BtnSetEvent(bBrowseNew,BtnClickEventID,WrapBtnCallback(@TreeViewButtonsOnClick,1));
//---------- Кнопка "Создать папку" ----------//

//---------- Кнопка "Отмена" ----------//
  if bBtn = bDirBrowse then
    bBrowseCancel := BtnCreate(BrowseForm.Handle,DirTree.Left + 300 - 18 / 2,DirTree.Top + DirTree.Height + 10,100,40,'button.png',18,false)
  else if bBtn = bGroupBrowse then
    bBrowseCancel := BtnCreate(BrowseForm.Handle,GroupTree.Left + 300 - 18 / 2,GroupTree.Top + GroupTree.Height + 10,100,40,'button.png',18,false);
  BtnSetText(bBrowseCancel,GetWord('Cancel'));
  BtnSetFont(bBrowseCancel,Font.Handle);
  BtnSetFontColor(bBrowseCancel,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  BtnSetEvent(bBrowseCancel,BtnClickEventID,WrapBtnCallback(@TreeViewButtonsOnClick,1));
//---------- Кнопка "Отмена" ----------//

  BrowseForm.ShowModal;
end;

procedure Settings(); forward;

procedure OnLangChange(lang: string; CurPageID: integer; Change: boolean); forward;
procedure CancelButtonClick(CurPageID: Integer;var Cancel, Confirm: Boolean); forward;

procedure ButtonsOnClick(bBtn:HWND);
var cnc,conf: boolean;
begin
  case bBtn of
    bNext         : begin WizardForm.NextButton.Show; WizardForm.NextButton.Click; WizardForm.NextButton.Hide; end;
    bBack         : begin WizardForm.BackButton.Show; WizardForm.BackButton.Click; WizardForm.BackButton.Hide; end;
    bCancel       : begin WizardForm.CancelButton.Show; WizardForm.CancelButton.Click; WizardForm.CancelButton.Hide; end;
    bDirBrowse    : TreeViewOnClick(bBtn);
    bGroupBrowse  : TreeViewOnClick(bBtn);
    bGroupOnOff   :
      begin
      if BtnGetEnabled(bGroupBrowse) then
      begin
        SGroupLbl.Font.Color := {#BtnSecondColor};
        BtnSetEnabled(bGroupBrowse,false);
        BtnSetText(bGroupOnOff,GetWord('DontCreate'));
        WizardForm.NoIconsCheck.Checked := true;
      end
      else
      begin
        SGroupLbl.Font.Color := {#FirstColor};
        BtnSetEnabled(bGroupBrowse,true);
        BtnSetText(bGroupOnOff,GetWord('Create'));
        WizardForm.NoIconsCheck.Checked := false;
      end;
    end;
    bSettings     : begin Settings; FSettings.ShowModal; end;
    bFClose       : begin OnLangChange('',wpReady,false); FSettings.Close; end;
    bCloseYes     : begin isidyes := true;  CloseForm.Close; end;
    bCloseNo      : begin isidyes := false; CloseForm.Close; end;
    bRun: begin
      RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#AppName}_is1','InstallLocation', InstallLocation);
      Exec(ExpandConstant(InstallLocation + '{#AppExeWorkingDir}{#AppExeName}'), '', '', SW_SHOW, ewNoWait, ResultCode);
      if WizardForm.CurPageID = wpWelcome then begin
        ExitCommand := true;
        ButtonsOnClick(bCancel);
      end else
        ButtonsOnClick(bNext);
    end;
    bReInstall: WizardForm.NextButton.Click;
    bDelete: begin
      RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#AppName}_is1','UninstallString', UninstallPath);
      UninstallPath := RemoveQuotes(UninstallPath);
      Exec(UninstallPath, '/SILENT', '', SW_SHOW, ewNoWait, ResultCode);
      ExitCommand := true;
      ButtonsOnClick(bCancel);
    end;
  end;
  BtnRefresh(bBtn);
end;

procedure Timer();
begin
  AllTimeCount := AllTimeCount+1;
end;

function CreateCancelForm(): integer;
var
  CloseLabel  :TLabel;
begin
  If WizardForm.CurPageID = wpInstalling then
  begin
    SuspendProc;
    KillTimer(0,TimeTimerID);
    SetTaskBarProgressState(0,TBPF_PAUSED);
    ImgPBDelete(ProgressBar);
    ProgressBar := ImgPBCreate(WizardForm.Handle, ExpandConstant('{tmp}\pbbkgy.png'), ExpandConstant('{tmp}\pby.png'), 10, 220, WizardForm.ClientWidth-20, 25);
    ImgPBSetPosition(ProgressBar,CurrProgress);
    ImgApplyChanges(WizardForm.Handle);
  end;
  CloseForm := CreateCustomForm;
  with CloseForm do
  begin
    Width       := 305;
    Height      := 120;
    //BorderIcons := [];   //(biSystemMenu, biMinimize, biMaximize, biHelp)
    BorderStyle  := bsDialog //(bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow, bsSizeToolWin)
    Color       := {#BackgroundColor};
    Position    := poScreenCenter;
    Caption      := GetWord('Exit');
  end;
  CloseForm.Font := Font;
  ExtractTemporaryFile('exit.ico');
  SendMessage(CloseForm.Handle, $80, 0, LoadImage(0,ExpandConstant('{tmp}')+'\exit.ico',1,16,16,$1010));

  CloseLabel := TLabel.Create(CloseForm);
  With CloseLabel do
  begin
    SetBounds(10,10,280,100);
    AutoSize       := false;
    Alignment      := taCenter;
    Transparent    := true;
    Parent         := CloseForm;
    Font.Height    := -15;
    Caption        := GetWord('ExitLbl');
  end;
  bCloseYes := BtnCreate(CloseForm.Handle,20,50,100,40,'button.png',18,false);
  BtnSetText(bCloseYes,GetWord('Yes'));
  BtnSetFont(bCloseYes,Font.Handle);
  BtnSetFontColor(bCloseYes,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  BtnSetEvent(bCloseYes,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));

  bCloseNo := BtnCreate(CloseForm.Handle,180,50,100,40,'button.png',18,false);
  BtnSetText(bCloseNo,GetWord('No'));
  BtnSetFont(bCloseNo,Font.Handle);
  BtnSetFontColor(bCloseNo,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  BtnSetEvent(bCloseNo,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));

  ImgApplyChanges(CloseForm.Handle);
  CloseForm.ShowModal;

  if WizardForm.CurPageID = wpInstalling then
  begin
    ImgPBDelete(ProgressBar);
    ProgressBar := ImgPBCreate(WizardForm.Handle, ExpandConstant('{tmp}\pbbkgg.png'), ExpandConstant('{tmp}\pbg.png'), 10, 220, WizardForm.ClientWidth-20, 25);
    ImgPBSetPosition(ProgressBar,CurrProgress);
    ImgApplyChanges(WizardForm.Handle);
    SetTaskBarProgressState(0,TBPF_NORMAL);
    ResumeProc;
  end;

  if isidyes then Result := IDYES else Result := IDNO;
end;

procedure CancelButtonClick(CurPageID: Integer;var Cancel, Confirm: Boolean);
begin
  if ExitCommand then begin
    ExitCommand := false;
    Cancel := true;
    Confirm := false;
  end else
    if CreateCancelForm = IDYES then begin
      Cancel := true;
      Confirm := false;
      ISDoneCancel := 1;
    end else begin
      Cancel := false;
      Confirm := false;
    end;
end;

procedure Settings();
begin
  FSettings := CreateCustomForm;
  with FSettings do
  begin
    Width         := 445;
//#if defined(Components) || defined(Soft)
    Height        := 430;
//#else
//    Height        := 240;
//#endif
    BorderStyle    := bsDialog //(bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow, bsSizeToolWin)
    Color         := {#BackgroundColor};
    Font           := Font;
    Position      := poScreenCenter;
    Caption        := GetWord('Settings');
  end;
  ExtractTemporaryFile('settings.ico');
  SendMessage(FSettings.Handle, $80, 0, LoadImage(0,ExpandConstant('{tmp}')+'\settings.ico',1,16,16,$1010));

//*************Путь установки*************//
  DirSmallPanel := ImgLoad(FSettings.Handle,'panelsmall.png',20,30,0,0,false,true);

  ImgGetPosition(DirSmallPanel,tLeft,tTop,tWidth,tHeight);
  SDirNameLbl := TLabel.Create(WizardForm);
  with SDirNameLbl do
  begin
    Alignment := taCenter;
    AutoSize := false;
    Left := 0;
    Top := 5;
    Width := FSettings.Width-5;
    Parent := FSettings;
    Font.Color := {#FirstColor};
    Font.Style := [fsBold];
    Font.Name := '{#FontName}';
    Font.Height := -15;
    Transparent := true;
    Caption := GetWord('InstallFolder');
  end;
  SDirLbl := TLabel.Create(FSettings)
  with SDirLbl do
  begin
    AutoSize     := false;
    SetBounds(tLeft + 10,tTop + 15,tWidth-120,tHeight);
    Caption      := MinimizePathName(WizardForm.DirEdit.Text,WizardForm.DirEdit.Font,WizardForm.DirEdit.Width);
    Parent       := FSettings;
    Font.Color   := {#FirstColor};
    Font.Height  := -15;
    Transparent  := true;
  end;

//--------- Кнопка "Обзор" ----------//
  bDirBrowse := BtnCreate(FSettings.Handle,SDirLbl.Left + SDirLbl.Width,SDirLbl.Top - 10,100,40,'button.png',18,false);
  BtnSetEvent(bDirBrowse,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
  BtnSetFont(bDirBrowse,Font.Handle);
  BtnSetFontColor(bDirBrowse,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  BtnSetText(bDirBrowse,GetWord('Browse'));
//--------- Кнопка "Обзор" ----------//
//*************Путь установки*************//

//*************Папка в меню Пуск*************//
  GroupSmallPanel := ImgLoad(FSettings.Handle,'panelsmall.png',20,tTop + tHeight + 30,0,0,false,true);
  ImgGetPosition(GroupSmallPanel,tLeft,tTop,tWidth,tHeight);

  SGroupNameLbl := TLabel.Create(WizardForm);
  with SGroupNameLbl do
  begin
    Alignment := taCenter;
    AutoSize := false;
    Left := 0;
    Top := tTop-25;
    Width := FSettings.Width-5;
    Parent := FSettings;
    Font.Color := {#FirstColor};;
    Font.Style := [fsBold];
    Font.Name := '{#FontName}';
    Font.Height := -15;
    Transparent := true;
    Caption := GetWord('StartDir');
  end;

  SGroupLbl := TLabel.Create(FSettings)
  with SGroupLbl do
  begin
    AutoSize       := false;
    SetBounds(tLeft + 10,tTop + 15,tWidth-220,20);
    Caption        := MinimizePathName(WizardForm.GroupEdit.Text,WizardForm.GroupEdit.Font,WizardForm.GroupEdit.Width);
    Parent         := FSettings;
    Font.Color     := {#FirstColor};
    Font.Height    := -15;
    Transparent    := true;
  end;

//--------- Кнопка "Обзор" ----------//
  bGroupBrowse := BtnCreate(FSettings.Handle,SGroupLbl.Left + SGroupLbl.Width,SGroupLbl.Top - 10,100,40,'button.png',18,false);
  BtnSetEvent(bGroupBrowse,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
  BtnSetFont(bGroupBrowse,Font.Handle);
  BtnSetFontColor(bGroupBrowse,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  BtnSetText(bGroupBrowse,GetWord('Browse'));
//--------- Кнопка "Обзор" ----------//
  if BtnGetText(bGroupOnOff)=GetWord('DontCreate') then
  begin
    ButtonsOnClick(bGroupOnOff);
    bGroupOnOff := BtnCreate(FSettings.Handle,SGroupLbl.Left + SGroupLbl.Width + 100,SGroupLbl.Top - 10,100,40,'button.png',18,false);
    BtnSetEvent(bGroupOnOff,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
    BtnSetFont(bGroupOnOff,Font.Handle);
    BtnSetFontColor(bGroupOnOff,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
    BtnSetText(bGroupOnOff,GetWord('DontCreate'));
  end
  else
  begin
    bGroupOnOff := BtnCreate(FSettings.Handle,SGroupLbl.Left + SGroupLbl.Width + 100,SGroupLbl.Top - 10,100,40,'button.png',18,false);
    BtnSetEvent(bGroupOnOff,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
    BtnSetFont(bGroupOnOff,Font.Handle);
    BtnSetFontColor(bGroupOnOff,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
    BtnSetText(bGroupOnOff,GetWord('Create'));
  end;
    //*************Папка в меню Пуск*************//
//#ifdef Components
//*************Компоненты*************//
  ComponentsPanel := ImgLoad(FSettings.Handle,'panelcomp.png',20,tTop + tHeight + 30,0,0,false,true);
  ImgGetPosition(ComponentsPanel,tLeft,tTop,tWidth,tHeight);

  ComponentsName := TLabel.Create(WizardForm);
  with ComponentsName do
  begin
    Alignment := taCenter;
    AutoSize := false;
    Left := 0;
    Top := tTop-25;
    Width := FSettings.Width-5;
    Parent := FSettings;
    Font.Color := {#FirstColor};
    Font.Style := [fsBold];
    Font.Name := '{#FontName}';
    Font.Height := -15;
    Transparent := true;
    Caption := GetWord('Tasks');
    #ifdef Components
    Caption := GetWord('Components');
    #endif
    #ifdef Soft
    Caption := GetWord('Soft');
    #endif
    #if defined(Components) && defined(Soft)
    Caption := GetWord('CompAndSoft');
    #endif
  end;
  with WizardForm.ComponentsList do
  begin
    BorderStyle  := bsNone;
    Parent       := FSettings;
    Top          := tTop + 15;
    Left         := tLeft + 10;
    Width        := tWidth - 20;
    Height       := tTop - 60;
    Color        := {#ShadowedBackgroundColor};    //изменяем если цвет фона другой
    Font.Color   := {#FirstColor};
    //LoadBGBmpFromFile(ExpandConstant('{tmp}\background.bmp'),WizardForm.ComponentsList.Left + (WizardForm.ComponentsList.Width-WizardForm.ComponentsList.ClientWidth) div 2,WizardForm.ComponentsList.Top + (WizardForm.ComponentsList.Width-WizardForm.ComponentsList.ClientWidth) div 2);
  end;
//*************Компоненты*************//
//#endif
//*************Кнопка "Закрыть"*************//
  bFClose := BtnCreate(FSettings.Handle,tLeft +tWidth - 100 + 18/2,tTop + tHeight + 5,100,40,'button.png',18,false);
  BtnSetEvent(bFClose,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
  BtnSetFont(bFClose,Font.Handle);
  BtnSetFontColor(bFClose,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
  BtnSetText(bFClose,GetWord('Close'));
//*************Кнопка "Закрыть"*************//

  ImgApplyChanges(FSettings.Handle);
end;

function ProgressCallback(OveralPct,CurrentPct: integer;CurrentFile,TimeStr1,TimeStr2,TimeStr3:PAnsiChar): longword;
begin
  if OveralPct<=1000 then ImgPBSetPosition(ProgressBar,OveralPct);
  SetTaskBarProgressValue(0,OveralPct div 10);
  CurrProgress := OveralPct;
  ImgApplyChanges(WizardForm.Handle);
  PercentLbl.Caption := IntToStr(OveralPct div 10)+'.'+chr(48 + OveralPct mod 10)+'%';
  AllTimeStr := TimeStr3;
  Result := ISDoneCancel;
end;

function CheckError:boolean;
begin
  result :=  not ISDoneError;
end;

#ifdef RussianChars
function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := true;
  if CurPageID = wpReady then begin
    if not ((CompareStr(AnsiUppercase(WizardForm.DirEdit.Text), Uppercase(WizardForm.DirEdit.Text)) = 0)
    and(CompareStr(AnsiLowercase(WizardForm.DirEdit.Text), Lowercase(WizardForm.DirEdit.Text)) = 0)) then begin
      MsgBox('В пути присутствуют русские символы', mbError, mb_OK); Result := False ;
    end;
  end;
end;
#endif

procedure AppOnMessage(var Msg: TMsg; var Handled: Boolean);
begin
  if (Msg.message = WM_SYSCOMMAND) and (Msg.wParam = Menu.Handle) then
  begin
    AboutForm := CreateCustomForm;
    with AboutForm do
    begin
      Width       := 305;
      Height      := 120;
      //BorderIcons := [];   //(biSystemMenu, biMinimize, biMaximize, biHelp)
      BorderStyle  := bsDialog //(bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow, bsSizeToolWin)
      Color       := {#BackgroundColor};
      Position    := poScreenCenter;
      Caption      := GetWord('About');
    end;
    AboutForm.Font := Font;
    ExtractTemporaryFile('about.ico');
    SendMessage(AboutForm.Handle, $80, 0, LoadImage(0,ExpandConstant('{tmp}')+'\about.ico',1,16,16,$1010));
    AboutLbl := TLabel.Create(AboutForm);
    with AboutLbl do
    begin
      SetBounds(0,20,AboutForm.Width,AboutForm.Height);
      AutoSize       := false;
      Alignment      := taCenter;
      Transparent    := true;
      Parent         := AboutForm;
      Font.Height    := -18;
      Caption := 'aLLeXUs © 2012' + #13#10 + GetWord('ReleaseDate') + ' {#Time}';
    end;
    AboutForm.ShowModal;
  end;
end;

procedure ExistsFormCount(); forward;

function TimeToTime(Time: longint): string;
var hrs,min,sec: integer;
begin
  sec := Time;
  min := sec div 60;
  sec := sec mod 60;
  hrs := min div 60;
  min := min mod 60;
  if hrs>0 then
  begin
    Result := IntToStr(hrs);
    if (hrs >= 11) and (hrs <= 14) then Result := Result+' ' + GetWord('Hours1') + ' ' else
      case hrs of
        1: Result := Result+' ' + GetWord('Hours2') + ' ';
        2,3,4: Result := Result+' ' + GetWord('Hours3') + ' ';
        0,5,6,7,8,9: Result := Result+' ' + GetWord('Hours1') + ' ';
      end;
  end;
  if min>0 then
  begin
    Result := Result + IntToStr(min);
    if (min >= 11) and (min <= 14) then Result := Result+' ' + GetWord('Minutes1') + ' ' else
      case min mod 10 of
        1: Result := Result+' ' + GetWord('Minutes2') + ' ';
        2,3,4: Result := Result+' ' + GetWord('Minutes3') + ' ';
        0,5,6,7,8,9: Result := Result+' ' + GetWord('Minutes1') + ' ';
      end;
  end;
  Result := Result + IntToStr(sec);
  if (sec >= 11) and (sec <= 14) then Result := Result + ' ' + GetWord('Seconds1') else
    case sec mod 10 of
      1: Result := Result+' ' + GetWord('Seconds2');
      2,3,4: Result := Result+' ' + GetWord('Seconds3');
      0,5,6,7,8,9: Result := Result+' ' + GetWord('Seconds1');
    end;
end;

procedure OnLangChange(lang: string; CurPageID: integer; Change: boolean);
begin
  if Change then ChangeLanguage(lang);                           // смена языка
  if Change and ISInstallStep then ISDoneChangeLanguage(lang);   // смена языка ISDone

  if CurPageID = wpWelcome then begin
    BtnSetText(bReInstall,GetWord('Reinstall'));
    BtnSetText(bDelete,GetWord('Delete'));
    BtnSetText(bRun,GetWord('RunGame'));
    ExistsDirLbl[1].Caption := GetWord('ExistsLbl') + ' ';
    ExistsFormCount;
    WizardForm.Caption := GetWord('Installing') + ' — ' + '{#AppName}';
  end;

  if CurPageID = wpSelectProgramGroup then begin
    BtnSetText(bNext,GetWord('Next'));
    BtnSetText(bCancel,GetWord('Cancel'));
    WelcomeLbl.Caption := GetWord('WelcomePage1');
    WizardForm.Caption := GetWord('Installing') + ' — ' + '{#AppName}';
  end;

  if CurPageID = wpReady then begin
    BtnSetText(bNext,GetWord('Install'));
    BtnSetText(bCancel,GetWord('Cancel'));
    BtnSetText(bSettings,GetWord('Settings'));
    BtnSetText(bBack,GetWord('Back'));
    InfoPanelLbl.Caption := GetWord('ReadyPage1');
    ReadyLblDir[1].Caption := GetWord('ReadyPage2') + ' ';
    ReadyLblDir[2].Caption := MinimizePathName(WizardForm.DirEdit.Text,ReadyLblDir[2].Font,560);
    ReadyLblDir[3].Caption := GetWord('ReadyPage3') + ' ';
    ReadyLblDir[4].Caption := MbOrTb({#NeedSize}) + ' ';
    ReadyLblDir[5].Caption := GetWord('ReadyPage4');
    Count(ReadyLblDir,'dir');
    WizardForm.Caption := GetWord('Installing') + ' — ' + '{#AppName}';

    #ifdef Components
    ReadyLblLang[1].Caption := GetWord('ReadyPage5') + ' ';
    if IsComponentSelected('language\ru') then ReadyLblLang[2].Caption := GetWord('Russian') else
    if IsComponentSelected('language\uk') then ReadyLblLang[2].Caption := GetWord('English') else
    if IsComponentSelected('language\br') then ReadyLblLang[2].Caption := GetWord('Brazilian') else
    if IsComponentSelected('language\de') then ReadyLblLang[2].Caption := GetWord('German') else
    if IsComponentSelected('language\es') then ReadyLblLang[2].Caption := GetWord('Espanol') else
    if IsComponentSelected('language\fr') then ReadyLblLang[2].Caption := GetWord('French') else
    if IsComponentSelected('language\it') then ReadyLblLang[2].Caption := GetWord('Italian') else
    if IsComponentSelected('language\ja') then ReadyLblLang[2].Caption := GetWord('Japanese') else
    if IsComponentSelected('language\ko') then ReadyLblLang[2].Caption := GetWord('Korean') else
    if IsComponentSelected('language\pl') then ReadyLblLang[2].Caption := GetWord('Polish') else
    if IsComponentSelected('language\pt') then ReadyLblLang[2].Caption := GetWord('Portuguese') else
    if IsComponentSelected('language\sz') then ReadyLblLang[2].Caption := GetWord('Szechuan') else
    if IsComponentSelected('language\tr') then ReadyLblLang[2].Caption := GetWord('Turkish') else
    if IsComponentSelected('language\zh') then ReadyLblLang[2].Caption := GetWord('Chinese');
    ReadyLblLang[3].Caption := ' ' + GetWord('ReadyPage6');
    Count(ReadyLblLang,'lang');
    #endif
    Components;

    //ReadyLblIcons[1].Caption := 'В следующих местах будут созданы ярлыки: ';
    ReadyLblIcons[2].Caption := GetWord('Desktop');
    ReadyLblIcons[3].Caption := ' \ ';
    ReadyLblIcons[4].Caption := GetWord('StartMenu');
    ReadyLblIcons[5].Caption := ' \ ';
    ReadyLblIcons[6].Caption := GetWord('GameExplorer');
    ReadyLblIcons[7].Caption := ' \ ';
    ReadyLblIcons[8].Caption := GetWord('QuickLaunch');
    if ReadyLblIcons[2].Width <> 0 then WD := ReadyLblIcons[2].Width;     // ширина лейбла рабочего стола
    if ReadyLblIcons[4].Width <> 0 then WS := ReadyLblIcons[4].Width;     // ширина лейбла пуск
    if ReadyLblIcons[6].Width <> 0 then WGE := ReadyLblIcons[6].Width;    // ширина лейбла обозревателя игр
    if ReadyLblIcons[8].Width <> 0 then WQL := ReadyLblIcons[8].Width;    // ширина лейбла быстрого запуска
    if ReadyLblIcons[3].Width <> 0 then WSL := ReadyLblIcons[3].Width;    // ширина лейбла слэша

    Count(ReadyLblIcons,'icons');

    #ifdef Soft
    ReadyLblSoft[1].Caption := GetWord('ReadyPage9') + ' ';
    ReadyLblSoft[2].Caption := GetWord('DirectX');
    ReadyLblSoft[3].Caption := ' \ ';
    ReadyLblSoft[4].Caption := GetWord('VC');
    if ReadyLblSoft[2].Width <> 0 then WDX := ReadyLblSoft[2].Width;   // условие исправило непонятную ошибку когда
    if ReadyLblSoft[4].Width <> 0 then WVC := ReadyLblSoft[4].Width;   // здесь присваевалось нулевое значение

    Count(ReadyLblSoft,'soft');
//    if IsComponentSelected('soft\directx') then begin
//      ReadyLblSoft[1].Caption := GetWord('ReadyPage9') + ' ';
//      ReadyLblSoft[2].Caption := GetWord('DirectX');
//    end
//    else
//    begin
//      ReadyLblSoft[2].Hide;
//      ReadyLblSoft[1].Caption := GetWord('ReadyPage10');
//    end;
//    Count(ReadyLblSoft,'soft');
    #endif
  end;
  if CurPageID = wpInstalling then begin
    InfoPanelLbl.Caption := GetWord('Installing');
    if PostInstallStep='icons' then begin
      PercentLbl.Caption := GetWord('CreatingIcons');
      WizardForm.Caption := GetWord('CreatingIcons');
    end;
    if PostInstallStep='revert' then begin
      PercentLbl.Caption := GetWord('Revert');
      WizardForm.Caption := GetWord('Revert');
    end;
    if PostInstallStep='directx' then begin
      PercentLbl.Caption := GetWord('InstallingDX');
      WizardForm.Caption := GetWord('InstallingDX');
    end;
    if PostInstallStep='visualc' then begin
      PercentLbl.Caption := GetWord('InstallingVC');
      WizardForm.Caption := GetWord('InstallingVC');
    end;
  end;
  if CurPageID = wpFinished then begin
    if ISDoneError then begin
      WelcomeLbl.Caption := GetWord('InstallError');
      WizardForm.Caption := GetWord('Installing') + ' — ' + '{#AppName}' + ' — ' + GetWord('InstError');
    end else begin
      WelcomeLbl.Caption := GetWord('InstallDone') + ' ' + TimeToTime(AllTimeCount) + '.';
      BtnSetText(bRun,GetWord('RunGame'));
      WizardForm.Caption := GetWord('Installing') + ' — ' + '{#AppName}' + ' — ' + GetWord('InstDone');
    end;
    BtnSetText(bNext,GetWord('Close'));
  end;
end;

procedure EngOnClick(Sender: TObject);
var temp: integer;
begin
  ImgRelease(flags);
  flags := ImgLoad(LangVisibilityLbl.Parent.Handle,ExpandConstant('{tmp}')+'\flagseng.png',150,LangVisibilityLbl.Parent.ClientHeight-50,0,0,False,True);
  ImgApplyChanges(LangVisibilityLbl.Parent.Handle);
  OnLangChange('English',CurLangPageID,true);
  isrus := false;
end;

procedure RusOnClick(Sender: TObject);
var temp: integer;
begin
  ImgRelease(flags);
  flags := ImgLoad(LangVisibilityLbl.Parent.Handle,ExpandConstant('{tmp}')+'\flagsrus.png',150,LangVisibilityLbl.Parent.ClientHeight-50,0,0,False,True);
  ImgApplyChanges(LangVisibilityLbl.Parent.Handle);
  OnLangChange('Russian',CurLangPageID,true);
  isrus := true;
end;

procedure LangVisibilityOnClick(Sender: TObject);
var temp: integer;
begin
  if isopend then begin
    ImgGetPosition(LangBackgr,tLeft,tTop,tWidth,tHeight);
    ImgRelease(LangBackgr);
    LangBackgr := ImgLoad(LangVisibilityLbl.Parent.Handle,'langbackgr.png',tLeft,tTop,tWidth,tHeight,False,True);
    ImgGetPosition(flags,tLeft,tTop,tWidth,tHeight);
    ImgRelease(flags);
    if CurrLanguage='Russian' then
      flags := ImgLoad(LangVisibilityLbl.Parent.Handle,ExpandConstant('{tmp}')+'\flagsrus.png',tLeft,tTop,tWidth,tHeight,False,True)
    else if CurrLanguage='English' then
      flags := ImgLoad(LangVisibilityLbl.Parent.Handle,ExpandConstant('{tmp}')+'\flagseng.png',tLeft,tTop,tWidth,tHeight,False,True);
    ImgApplyChanges(LangVisibilityLbl.Parent.Handle);
    for temp := 1 to 25 do begin
      ImgGetPosition(LangBackgr,tleft,ttop,twidth,theight);
      ImgSetPosition(LangBackgr,tleft,ttop+2,twidth,theight);
      ImgGetPosition(flags,tleft,ttop,twidth,theight);
      ImgSetPosition(flags,tleft,ttop+2,twidth,theight);
      LangVisibilityLbl.Top := LangVisibilityLbl.Top+2;
      RusLbl.Top := RusLbl.Top+2;
      EngLbl.Top := EngLbl.Top+2;
      ImgSetTransparent(LangBackgr,ImgGetTransparent(LangBackgr)-4);
      ImgSetTransparent(flags,ImgGetTransparent(flags)-4);
      ImgApplyChanges(LangVisibilityLbl.Parent.Handle);
      isopend := false;
      Sleep(2);
    end;
  end
  else begin
    ImgGetPosition(LangBackgr,tLeft,tTop,tWidth,tHeight);
    ImgRelease(LangBackgr);
    LangBackgr := ImgLoad(LangVisibilityLbl.Parent.Handle,'langbackgr2.png',tLeft,tTop,tWidth,tHeight,False,True);
    ImgGetPosition(flags,tLeft,tTop,tWidth,tHeight);
    ImgRelease(flags);
    if CurrLanguage='Russian' then
      flags := ImgLoad(LangVisibilityLbl.Parent.Handle,ExpandConstant('{tmp}')+'\flagsrus.png',tLeft,tTop,tWidth,tHeight,False,True)
    else if CurrLanguage='English' then
      flags := ImgLoad(LangVisibilityLbl.Parent.Handle,ExpandConstant('{tmp}')+'\flagseng.png',tLeft,tTop,tWidth,tHeight,False,True);
    ImgApplyChanges(LangVisibilityLbl.Parent.Handle);
    for temp := 1 to 25 do begin
      ImgGetPosition(LangBackgr,tleft,ttop,twidth,theight);
      ImgSetPosition(LangBackgr,tleft,ttop-2,twidth,theight);
      ImgGetPosition(flags,tleft,ttop,twidth,theight);
      ImgSetPosition(flags,tleft,ttop-2,twidth,theight);
      LangVisibilityLbl.Top := LangVisibilityLbl.Top-2;
      RusLbl.Top := RusLbl.Top-2;
      EngLbl.Top := EngLbl.Top-2;
      ImgSetTransparent(LangBackgr,ImgGetTransparent(LangBackgr)+4);
      ImgSetTransparent(flags,ImgGetTransparent(flags)+4);
      ImgApplyChanges(LangVisibilityLbl.Parent.Handle);
      isopend := true;
      Sleep(2);
    end;
  end;
end;

// Нажатие на крестик
function CrossAction(h: hwnd; Msg, wParam, lParam: Longint): Longint;
begin
  if (Msg = $0112) then begin
    if (wParam = SC_CLOSE) then begin {действие при нажатии на крестик}
      ButtonsOnClick(bCancel);
      wParam := 0;
    end;
  end;
  Result := CallWindowProc(OldProc, h, Msg, wParam, lParam);
end;

//var tt: longint;
//procedure MEnter(Sender: TObject);
//begin
//  ReadyLblDir[4].Font.Color := clBlue;
//  tt:=ImgLoad(WizardForm.Handle,'flagseng.png',50,WizardForm.ClientHeight-100,0,0,False,True);
//  ImgApplyChanges(WizardForm.Handle);
//end;
//
//procedure MLeave(Sender: TObject);
//begin
//  ReadyLblDir[4].Font.Color := clWhite;
//  ImgRelease(tt);
//  ImgApplyChanges(WizardForm.Handle);
//end;

procedure Create();
var i: integer;
begin
  Font := TFont.Create;
  Font.Color := {#FirstColor};
  Font.Name := '{#FontName}';
  Font.Height := -12;

//---------- Замена пункта меню 'О программе' ----------//
  if not AppendMenu(GetSystemMenu(Wizardform.Handle, True), MF_DELETE, 0, GetWord('About')) then
    WizardForm.Position :=  poScreenCenter;
  AppendMenu(GetSystemMenu(Wizardform.Handle, False), MF_SEPARATOR, 0, '');
  Menu := TMenuItem.Create(WizardForm);
  AppendMenu(GetSystemMenu(Wizardform.Handle, False), MF_BYPOSITION, Menu.Handle, GetWord('About'));
  Application.OnMessage := @AppOnMessage;
//---------- Замена пункта меню 'О программе' ----------//

// Нажатие на крестик
  OldProc := SetWindowLong(WizardForm.Handle, -4, CallbackAddr('CrossAction'));

  WizardForm.ClientWidth := 600;
  WizardForm.ClientHeight := 400;
  WizardForm.OuterNotebook.Hide;
  WizardForm.InnerNotebook.Hide;
  WizardForm.Bevel.Hide;
  WizardForm.Font := Font;
  WizardForm.Position := poScreenCenter;
  WizardForm.NextButton.SetBounds(0,0,0,0);
  WizardForm.BackButton.SetBounds(0,0,0,0);
  WizardForm.CancelButton.SetBounds(0,0,0,0);

  PercentLbl := TLabel.Create(WizardForm);
  with PercentLbl do
  begin
    Parent := WizardForm;
    AutoSize := false;
    SetBounds(0,300,WizardForm.ClientWidth,50);
    Alignment      := taCenter;
    Transparent    := true;
    Font.Color     := {#FirstColor};
    Font.Height    := -18;
    Font.Name      := '{#FontName}';
  end;

  InfoPanelLbl := TLabel.Create(WizardForm);
  with InfoPanelLbl do
  begin
    SetBounds(10,43,590,100);
    AutoSize       := false;
    Alignment      := taCenter;
    Transparent    := true;
    Parent         := WizardForm;
    Font.Color     := {#FirstColor};
    Font.Height    := -18;
    Font.Name      := '{#FontName}';
  end;

  WelcomeLbl := TLabel.Create(WizardForm);
  with WelcomeLbl do
  begin
    SetBounds(10,155,580,150);
    AutoSize       := false;
    Alignment      := taCenter;
    Transparent    := true;
    Parent         := WizardForm;
    Font.Color     := {#FirstColor};
    Font.Height    := -18;
  end;

  LangVisibilityLbl := TLabel.Create(WizardForm);
  with LangVisibilityLbl do
  begin
    Parent := WizardForm;
    AutoSize := False;
    Transparent := True;
    OnClick := @LangVisibilityOnClick;
    Caption := '';
    Left := ScaleX(150);
    Top := WizardForm.ClientHeight - ScaleY(70);
    Width := ScaleX(100);
    Height := ScaleY(20);
  end;

  RusLbl := TLabel.Create(WizardForm);
  with RusLbl do
  begin
    Parent := WizardForm;
    AutoSize := False;
    Transparent := True;
    OnClick := @RusOnClick;
    Caption := '';
    Left := ScaleX(150);
    Top := WizardForm.ClientHeight - ScaleY(50);;
    Width := ScaleX(50);
    Height := ScaleY(50);
  end;

  EngLbl := TLabel.Create(WizardForm);
  with EngLbl do
  begin
    Parent := WizardForm;
    AutoSize := False;
    Transparent := True;
    OnClick := @EngOnClick;
    Caption := '';
    Left := ScaleX(200);
    Top := WizardForm.ClientHeight - ScaleY(50);;
    Width := ScaleX(50);
    Height := ScaleY(50);
  end;

  SetArrayLength(ReadyLblDir,6);
  for i := 1 to GetArrayLength(ReadyLblDir)-1 do
  begin
    ReadyLblDir[i] := TLabel.Create(WizardForm);
    ReadyLblDir[i].Transparent := true;
    ReadyLblDir[i].Parent := WizardForm;
    ReadyLblDir[i].Font.Height := -15;
  end;
  ReadyLblDir[2].Font.Color := {#SecondColor};
  ReadyLblDir[4].Font.Color := {#SecondColor};
  ReadyLblDir[2].Font.Style := [fsBold];
  ReadyLblDir[4].Font.Style := [fsBold];
//  ReadyLblDir[4].OnMouseEnter := @MEnter;
//  ReadyLblDir[4].OnMouseLeave := @MLeave;

  SetArrayLength(ReadyLblIcons,9);
  for i := 1 to GetArrayLength(ReadyLblIcons)-1 do
  begin
    ReadyLblIcons[i] := TLabel.Create(WizardForm);
    ReadyLblIcons[i].Transparent := true;
    ReadyLblIcons[i].Parent := WizardForm;
    ReadyLblIcons[i].Font.Height := -15;
  end;
  ReadyLblIcons[2].Font.Color := {#SecondColor};
  ReadyLblIcons[2].Font.Style := [fsBold];
  ReadyLblIcons[4].Font.Color := {#SecondColor};
  ReadyLblIcons[4].Font.Style := [fsBold];
  ReadyLblIcons[6].Font.Color := {#SecondColor};
  ReadyLblIcons[6].Font.Style := [fsBold];
  ReadyLblIcons[8].Font.Color := {#SecondColor};
  ReadyLblIcons[8].Font.Style := [fsBold];

#ifdef Soft
  SetArrayLength(ReadyLblSoft,5);
  for i := 1 to GetArrayLength(ReadyLblSoft)-1 do
  begin
    ReadyLblSoft[i] := TLabel.Create(WizardForm);
    ReadyLblSoft[i].Transparent := true;
    ReadyLblSoft[i].Parent := WizardForm;
    ReadyLblSoft[i].Font.Height := -15;
  end;
  ReadyLblSoft[2].Font.Color := {#SecondColor};
  ReadyLblSoft[2].Font.Style := [fsBold];
  ReadyLblSoft[4].Font.Color := {#SecondColor};
  ReadyLblSoft[4].Font.Style := [fsBold];
#endif

#ifdef Components
  SetArrayLength(ReadyLblLang,4);
  for i := 1 to GetArrayLength(ReadyLblLang)-1 do
  begin
    ReadyLblLang[i] := TLabel.Create(WizardForm);
    ReadyLblLang[i].Transparent := true;
    ReadyLblLang[i].Parent := WizardForm;
    ReadyLblLang[i].Font.Height := -15;
  end;
  ReadyLblLang[2].Font.Color := {#SecondColor};
  ReadyLblLang[2].Font.Style := [fsBold];
#endif

  InfoPanel := ImgLoad(WizardForm.Handle,'panel.png',10,150,0,0,false,true);
  ImgGetPosition(InfoPanel,tLeft,tTop,tWidth,tHeight);
  SetArrayLength(ExistsDirLbl,3);
  for i := 1 to GetArrayLength(ExistsDirLbl)-1 do begin
    ExistsDirLbl[i] := TLabel.Create(WizardForm);
    ExistsDirLbl[i].Parent := WizardForm;
    ExistsDirLbl[i].Transparent := true;
    ExistsDirLbl[i].Font := Font;
    ExistsDirLbl[i].Font.Height := -15;
  end;
  ExistsDirLbl[2].Font.Color := {#SecondColor};
  ExistsDirLbl[2].Font.Style := [fsBold];
  ExistsDirLbl[1].Caption := GetWord('ExistsLbl') + ' ';
  RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#AppName}_is1','InstallLocation', InstallLocation);
  ExistsDirLbl[2].Caption := MinimizePathName(RemoveBackslash(InstallLocation),ExistsDirLbl[2].Font,tWidth-20);
  //ExistsFormCount;

  isopend := true;
  Background := ImgLoad(WizardForm.Handle,'background.png',0,0,0,0,false,true);
  GameLogo := ImgLoad(WizardForm.Handle,'gamelogo.png',110,15,500,200,false,true);
  ImgGetPosition(GameLogo,tLeft,tTop,tWidth,tHeight);
  ImgSetPosition(GameLogo,(WizardForm.Width/2) - (tWidth/2),tTop,tWidth,tHeight);

  InfoMainPanel := ImgLoad(WizardForm.Handle,'panelmain.png',10,150,0,0,false,true);
  InfoPanel := ImgLoad(WizardForm.Handle,'panel.png',10,30,0,0,false,true);
  if isopend then
    LangBackgr := ImgLoad(WizardForm.Handle,'langbackgr2.png',150,WizardForm.ClientHeight-70,0,0,False,True)
  else
    LangBackgr := ImgLoad(WizardForm.Handle,'langbackgr.png',150,WizardForm.ClientHeight-70,0,0,False,True);
  if isrus then
    flags := ImgLoad(WizardForm.Handle,'flagsrus.png',150,WizardForm.ClientHeight-50,0,0,False,True)
  else
    flags := ImgLoad(WizardForm.Handle,'flagseng.png',150,WizardForm.ClientHeight-50,0,0,False,True);
  //ImgApplyChanges(WizardForm.Handle);
  //isrus := true;

//---------- Кнопка "Настройки" ----------//
  bSettings := BtnCreate(WizardForm.Handle,0,350,100,40,'button.png',18,false);
  BtnSetEvent(bSettings,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
  BtnSetFont(bSettings,Font.Handle);
  BtnSetFontColor(bSettings,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
//---------- Кнопка "Настройки" ----------//

//---------- Кнопка "Далее" ----------//
  bNext := BtnCreate(WizardForm.Handle,400,350,100,40,'button.png',18,false);
  BtnSetEvent(bNext,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
  BtnSetFont(bNext,Font.Handle);
  BtnSetFontColor(bNext,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
//---------- Кнопка "Далее" ----------//

//---------- Кнопка "Назад" ----------//
  bBack := BtnCreate(WizardForm.Handle,300,350,100,40,'button.png',18,false);
  BtnSetEvent(bBack,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
  BtnSetFont(bBack,Font.Handle);
  BtnSetFontColor(bBack,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
//---------- Кнопка "Назад" ----------//

//---------- Кнопка "Отмена" ----------//
  bCancel := BtnCreate(WizardForm.Handle,500,350,100,40,'button.png',18,false);
  BtnSetEvent(bCancel,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
  BtnSetFont(bCancel,Font.Handle);
  BtnSetFontColor(bCancel,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
//---------- Кнопка "Отмена" ----------//

//---------- Кнопка "Запустить игру" ----------//
  bRun := BtnCreate(WizardForm.Handle,0,350,120,40,'button.png',18,false);
  BtnSetEvent(bRun,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
  BtnSetFont(bRun,Font.Handle);
  BtnSetFontColor(bRun,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
//---------- Кнопка "Запустить игру" ----------//

//---------- Кнопка "Переустановить" ----------//
  bReInstall := BtnCreate(WizardForm.Handle,380,350,120,40,'button.png',18,false);
  BtnSetEvent(bReInstall,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
  BtnSetFont(bReInstall,Font.Handle);
  BtnSetFontColor(bReInstall,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
//---------- Кнопка "Переустановить" ----------//

//---------- Кнопка "Удалить" ----------//
  bDelete := BtnCreate(WizardForm.Handle,500,350,100,40,'button.png',18,false);
  BtnSetEvent(bDelete,BtnClickEventID,WrapBtnCallback(@ButtonsOnClick,1));
  BtnSetFont(bDelete,Font.Handle);
  BtnSetFontColor(bDelete,{#BtnFirstColor},{#BtnFirstColor},{#BtnSecondColor},{#BtnSecondColor});
//---------- Кнопка "Удалить" ----------//

  ImgApplyChanges(WizardForm.Handle);

  TaskBarV12(MainForm.Handle,WizardForm.Handle,false);
end;

procedure Count(var LabelArray: array of TLabel; ident: string);
var i: integer;
begin
  if ident='dir' then
  begin
    ImgGetPosition(InfoMainPanel,tLeft,tTop,tWidth,tHeight);
    if (tLeft+10+LabelArray[1].Width+LabelArray[2].Width+LabelArray[3].Width < tWidth-20) then
      LabelArray[3].Caption := ' ' + GetWord('ReadyPage3') + ' '
    else
      LabelArray[3].Caption := GetWord('ReadyPage3') + ' ';
  end;

  if ident='lang' then
  begin
    ImgGetPosition(InfoMainPanel,tLeft,tTop,tWidth,tHeight);
    tTop := ReadyLblDir[5].Top+ReadyLblDir[5].Height-10;
  end;

  if ident='icons' then
  begin
    ImgGetPosition(InfoMainPanel,tLeft,tTop,tWidth,tHeight);
#ifdef Components
    tTop := ReadyLblLang[3].Top+ReadyLblLang[3].Height-10;
#else
    tTop := ReadyLblDir[5].Top+ReadyLblDir[5].Height-10;
#endif
    if (not IsComponentSelected('icons\desktopicon') and not BtnGetEnabled(bGroupBrowse) and not IsComponentSelected('icons\gameux') and (not IsComponentSelected('icons\quicklaunchicon') or not IsComponentSelected('icons\quicklaunchicon7'))) then ReadyLblIcons[1].Caption := GetWord('ReadyPage7') else ReadyLblIcons[1].Caption := GetWord('ReadyPage8') + ' ';
    if IsComponentSelected('icons\desktopicon') then ReadyLblIcons[2].Width := WD else ReadyLblIcons[2].Width := 0;
    if IsComponentSelected('icons\desktopicon') and (BtnGetEnabled(bGroupBrowse) or IsComponentSelected('icons\gameux') or (IsComponentSelected('icons\quicklaunchicon') or IsComponentSelected('icons\quicklaunchicon7'))) then ReadyLblIcons[3].Width := WSL else ReadyLblIcons[3].Width := 0;
    if BtnGetEnabled(bGroupBrowse) then ReadyLblIcons[4].Width := WS else ReadyLblIcons[4].Width := 0;
    if BtnGetEnabled(bGroupBrowse) and (IsComponentSelected('icons\gameux') or (IsComponentSelected('icons\quicklaunchicon') or IsComponentSelected('icons\quicklaunchicon7'))) then ReadyLblIcons[5].Width := WSL else ReadyLblIcons[5].Width := 0;
    if IsComponentSelected('icons\gameux') then ReadyLblIcons[6].Width := WGE else ReadyLblIcons[6].Width := 0;
    if IsComponentSelected('icons\gameux') and (IsComponentSelected('icons\quicklaunchicon') or IsComponentSelected('icons\quicklaunchicon7')) then ReadyLblIcons[7].Width := WSL else ReadyLblIcons[7].Width := 0;
    if (IsComponentSelected('icons\quicklaunchicon') or IsComponentSelected('icons\quicklaunchicon7')) then ReadyLblIcons[8].Width := WQL else ReadyLblIcons[8].Width := 0;
  end;

  if ident='soft' then
  begin
    ImgGetPosition(InfoMainPanel,tLeft,tTop,tWidth,tHeight);
    tTop := ReadyLblIcons[8].Top+ReadyLblIcons[8].Height-10;
    if not IsComponentSelected('soft\DirectX') and not IsComponentSelected('soft\VC') then ReadyLblSoft[1].Caption := GetWord('ReadyPage10') else ReadyLblSoft[1].Caption := GetWord('ReadyPage9') + ' ';
    if IsComponentSelected('soft\DirectX') then ReadyLblSoft[2].Width := WDX else ReadyLblSoft[2].Width := 0;
    if IsComponentSelected('soft\DirectX') and IsComponentSelected('soft\VC') then ReadyLblSoft[3].Width := WSL else ReadyLblSoft[3].Width := 0;
    if IsComponentSelected('soft\VC') then ReadyLblSoft[4].Width := WVC else ReadyLblSoft[4].Width := 0;
  end;

  LabelArray[1].SetBounds(tLeft+10,tTop+10,LabelArray[1].Width,LabelArray[1].Height);
  for i := 2 to GetArrayLength(LabelArray)-1 do
  begin
    if (LabelArray[i-1].Left+LabelArray[i-1].Width+LabelArray[i].Width > tWidth-20) then
      LabelArray[i].SetBounds(tLeft+10,LabelArray[i-1].Top+LabelArray[i-1].Height,LabelArray[i].Width,LabelArray[i].Height)
    else
      LabelArray[i].SetBounds(LabelArray[i-1].Left+LabelArray[i-1].Width,LabelArray[i-1].Top,LabelArray[i].Width,LabelArray[i].Height);
  end;
end;

procedure Hide;
var i: integer;
begin
  BtnSetVisibility(bBack,false);
  BtnSetVisibility(bCancel,false);
  BtnSetVisibility(bNext,false);
  BtnSetVisibility(bSettings,false);
  BtnSetVisibility(bRun,false);
  BtnSetVisibility(bReInstall,false);
  BtnSetVisibility(bDelete,false);
  ImgSetVisibility(InfoMainPanel,false);
  ImgSetVisibility(InfoPanel,false);
  ImgSetVisibility(GameLogo,false);
  WelcomeLbl.Hide;
  InfoPanelLbl.Hide;
  PercentLbl.Hide;
  for i := 1 to GetArrayLength(ReadyLblDir)-1 do
    ReadyLblDir[i].Hide;
  for i := 1 to GetArrayLength(ReadyLblSoft)-1 do
    ReadyLblSoft[i].Hide;
  for i := 1 to GetArrayLength(ReadyLblLang)-1 do
    ReadyLblLang[i].Hide;
  for i := 1 to GetArrayLength(ReadyLblIcons)-1 do
    ReadyLblIcons[i].Hide;
  for i := 1 to GetArrayLength(ExistsDirLbl)-1 do
    ExistsDirLbl[i].Hide;

  WizardForm.NextButton.Hide;
  WizardForm.CancelButton.Hide;
  WizardForm.BackButton.Hide;

  ImgApplyChanges(WizardForm.Handle);
end;

procedure ShowComponents(CurPageID: integer);
var i: integer;
begin
  case CurPageID of
  // страница показывается если игра уже установлена
    wpWelcome:
    begin
      CurLangPageID := CurPageID;
      OnLangChange('',CurPageID,false);
      Hide;
      ImgGetPosition(InfoPanel,tLeft,tTop,tWidth,tHeight);
      ImgSetPosition(InfoPanel,10,150,tWidth,tHeight);
      ExistsFormCount;
      ImgSetVisibility(InfoPanel,true);
      ImgSetVisibility(GameLogo,true);
      BtnSetVisibility(bReInstall,true);
      BtnSetVisibility(bDelete,true);
      BtnSetVisibility(bRun,true);
      for i := 1 to GetArrayLength(ExistsDirLbl)-1 do
        ExistsDirLbl[i].Show;
      if not RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#AppName}_is1','UninstallString', UninstallPath) then
        ButtonsOnClick(bNext);

      ImgApplyChanges(WizardForm.Handle);
    end;
    wpSelectProgramGroup:
    begin
      CurLangPageID := CurPageID;
      OnLangChange('',CurPageID,false);
      Hide;
      ImgGetPosition(InfoPanel,tLeft,tTop,tWidth,tHeight);
      ImgSetPosition(InfoPanel,10,30,tWidth,tHeight);
      WelcomeLbl.Show;
      BtnSetVisibility(bCancel,true);
      BtnSetVisibility(bNext,true);
      BtnSetEnabled(bNext,true);
      ImgSetVisibility(InfoMainPanel,true);
      ImgSetVisibility(GameLogo,true);
      ImgApplyChanges(WizardForm.Handle);
      NextCheck();
    end;
    wpReady:
    begin
      CurLangPageID := CurPageID;
      OnLangChange('',CurPageID,false);
      Hide;
      BtnSetVisibility(bBack,true);
      BtnSetVisibility(bCancel,true);
      BtnSetVisibility(bNext,true);
      BtnSetVisibility(bSettings,true);
      ImgSetVisibility(InfoPanel,true);
      ImgSetVisibility(InfoMainPanel,true);
      InfoPanelLbl.Show;
      //ImgGetPosition(InfoMainPanel,tLeft,tTop,tWidth,tHeight);
      for i := 1 to GetArrayLength(ReadyLblDir)-1 do
        ReadyLblDir[i].Show;
      for i := 1 to GetArrayLength(ReadyLblIcons)-1 do
        ReadyLblIcons[i].Show;
      #ifdef Components
      for i := 1 to GetArrayLength(ReadyLblLang)-1 do
        ReadyLblLang[i].Show;
      #endif
      for i := 1 to GetArrayLength(ReadyLblSoft)-1 do
        ReadyLblSoft[i].Show;

     // CheckComponents;
      NextCheck();
      ImgApplyChanges(WizardForm.Handle);
    end;
    wpInstalling:
    begin
      CurLangPageID := CurPageID;
      OnLangChange('',CurPageID,false);
      Hide;
      BtnSetVisibility(bCancel,true);
      ImgSetVisibility(InfoPanel,true);
      InfoPanelLbl.Show;
      PercentLbl.Show;
      ProgressBar := ImgPBCreate(WizardForm.Handle, ExpandConstant('{tmp}\pbbkgg.png'), ExpandConstant('{tmp}\pbg.png'), 10, 220, WizardForm.ClientWidth-20, 25);
      TimeTimerID := SetTimer(0,0,1000,WrapTimerProc(@Timer,0));
      ImgApplyChanges(WizardForm.Handle);
    end;
    wpFinished:
    begin
      CurLangPageID := CurPageID;
      OnLangChange('',CurPageID,false);
      Hide;
      ImgPBDelete(ProgressBar);
      WelcomeLbl.Show;
      BtnSetVisibility(bNext,true);
      BtnSetEnabled(bNext,true);
      BtnSetPosition(bNext,500,350,100,40);
      BtnSetVisibility(bRun,true);
      ImgSetVisibility(InfoMainPanel,true);
      ImgSetVisibility(GameLogo,true);
      KillTimer(0,TimeTimerID);
      ImgApplyChanges(WizardForm.Handle);
    end;
  end;
end;

procedure CurPageChanged(CurPageID: integer);
begin
  ShowComponents(CurPageID);
  if (CurPageID = wpFinished) and ISDoneError then
  begin
    WizardForm.Caption :=  GetWord('Error');
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  Comps1,Comps2,Comps3, TmpValue:cardinal;
  FindHandle1,ColFiles1,CurIndex1,tmp:integer;
  ExecError:boolean;
  InFilePath,OutFilePath,OutFileName:PAnsiChar;
  GDFBinary: String;  // от GDF
begin
  if CurStep = ssInstall then
  begin
    ISDoneCancel := 0;

// Распаковка всех необходимых файлов в папку {tmp}.

ExtractTemporaryFile('unarc.dll');

#ifdef PrecompInside
ExtractTemporaryFile('CLS-precomp.dll');
ExtractTemporaryFile('packjpg_dll.dll');
ExtractTemporaryFile('packjpg_dll1.dll');
ExtractTemporaryFile('precomp.exe');
ExtractTemporaryFile('zlib1.dll');
#endif
#ifdef SrepInside
ExtractTemporaryFile('CLS-srep.dll');
#endif
#ifdef MSCInside
ExtractTemporaryFile('CLS-MSC.dll');
#endif
#ifdef facompress
    ExtractTemporaryFile('facompress.dll'); //ускоряет распаковку .arc архивов.
#endif
#ifdef records
    ExtractTemporaryFile('records.inf');
#endif
#ifdef precomp
  #if precomp == "0.38"
    ExtractTemporaryFile('precomp038.exe');
  #else
    #if precomp == "0.4"
      ExtractTemporaryFile('precomp040.exe');
    #else
      #if precomp == "0.41"
        ExtractTemporaryFile('precomp041.exe');
      #else
        #if precomp == "0.42"
          ExtractTemporaryFile('precomp042.exe');
        #else
          ExtractTemporaryFile('precomp038.exe');
          ExtractTemporaryFile('precomp040.exe');
          ExtractTemporaryFile('precomp041.exe');
          ExtractTemporaryFile('precomp042.exe');
        #endif
      #endif
    #endif
  #endif
#endif
#ifdef unrar
    ExtractTemporaryFile('Unrar.dll');
#endif
#ifdef XDelta
    ExtractTemporaryFile('XDelta3.dll');
#endif
#ifdef PackZIP
    ExtractTemporaryFile('7z.dll');
    ExtractTemporaryFile('PackZIP.exe');
#endif

    ExtractTemporaryFile('English.ini');
    ExtractTemporaryFile('Russian.ini');

// Подготавливаем переменную, содержащую всю информацию о выделенных компонентах для ISDone.dll
// максимум 96 компонентов.
    Comps1 := 0; Comps2 := 0; Comps3 := 0;
#ifdef Components
    TmpValue := 1;
    if IsComponentSelected('language\ru') then Comps1 := Comps1+TmpValue;     //компонент 1
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\uk') then Comps1 := Comps1+TmpValue;     //компонент 2
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\br') then Comps1 := Comps1+TmpValue;    //компонент 3
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\de') then Comps1 := Comps1+TmpValue;    //компонент 4
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\es') then Comps1 := Comps1+TmpValue;    //компонент 5
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\fr') then Comps1 := Comps1+TmpValue;    //компонент 6
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\it') then Comps1 := Comps1+TmpValue;    //компонент 7
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\ja') then Comps1 := Comps1+TmpValue;    //компонент 8
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\ko') then Comps1 := Comps1+TmpValue;    //компонент 9
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\pl') then Comps1 := Comps1+TmpValue;    //компонент 10
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\pt') then Comps1 := Comps1+TmpValue;    //компонент 11
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\sz') then Comps1 := Comps1+TmpValue;    //компонент 12
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\tr') then Comps1 := Comps1+TmpValue;    //компонент 13
    TmpValue := TmpValue*2;
    if IsComponentSelected('language\zh') then Comps1 := Comps1+TmpValue;    //компонент 14
//    .....
// см. справку
#endif

    ImgPBDelete(ProgressBar);
    BtnSetEnabled(bCancel,false);
    ImgApplyChanges(WizardForm.Handle);
    if not ISDoneError then
    begin
      PostInstallStep := 'icons';
      PercentLbl.Caption := GetWord('CreatingIcons');
      WizardForm.Caption := GetWord('Installing') + ' — ' + '{#AppName}' + ' — ' + GetWord('CreatingIcons');
      if IsComponentSelected('icons\quicklaunchicon7') then PinToTaskbarWin7(ExpandConstant('{app}\{#AppExeName}'),true);   
#ifdef GameExplorer
      if IsComponentSelected('icons\gameux') then AddGame(CurStep); // Процесс добавления ярлыков в Game Explorer
#endif
    end;
  end;
  if (CurStep=ssInstall) and ISDoneError then begin
    PostInstallStep := 'revert';
    PercentLbl.Caption := GetWord('Revert');
    WizardForm.Caption := GetWord('Installing') + ' — ' + '{#AppName}' + ' — ' + GetWord('Revert');
    Exec2(ExpandConstant('{uninstallexe}'), '/VERYSILENT', false);
    PinToTaskbarWin7(ExpandConstant('{app}\{#AppExeName}'),false);
    DelTree(ExpandConstant('{app}'), True, True, True);
    RegDeleteKeyIncludingSubkeys(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#AppName}_is1');
  end;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if (PageID = wpSelectDir) or (PageID = wpSelectComponents) then Result := True;
end;

procedure ExistsFormCount();
begin
  ImgGetPosition(InfoPanel,tLeft,tTop,tWidth,tHeight);
  ExistsDirLbl[1].Left := tLeft+10;
  //ExistsDirLbl[1].Top := tTop+10;
  if (tWidth-20 > ExistsDirLbl[1].Width+ExistsDirLbl[2].Width) then begin
    ExistsDirLbl[2].SetBounds(ExistsDirLbl[1].Left+ExistsDirLbl[1].Width,ExistsDirLbl[1].Top,ExistsDirLbl[2].Width,ExistsDirLbl[2].Height);
    ExistsDirLbl[1].Top := tTop+(tHeight div 2) - (ExistsDirLbl[1].Height div 2);
    ExistsDirLbl[2].Top := ExistsDirLbl[1].Top;
  end
  else begin
    ExistsDirLbl[1].Top := tTop+(tHeight div 2) - ExistsDirLbl[1].Height;
    ExistsDirLbl[2].Top := tTop+(tHeight div 2) + ExistsDirLbl[2].Height;
    ExistsDirLbl[2].SetBounds(ExistsDirLbl[1].Left,ExistsDirLbl[1].Top+ExistsDirLbl[2].Height,ExistsDirLbl[2].Width,ExistsDirLbl[2].Height);
  end;
end;

function InitializeSetup: boolean;
begin
  ChangeLanguage('Russian');
  isrus := true;
  begin
    if not FileExists(ExpandConstant('{tmp}\b2p.dll')) then ExtractTemporaryFile('b2p.dll');
    if not FileExists(ExpandConstant('{tmp}\botva2.dll')) then ExtractTemporaryFile('botva2.dll');
    if not FileExists(ExpandConstant('{tmp}\CallBackCtrl.dll')) then ExtractTemporaryFile('CallBackCtrl.dll');
    if not FileExists(ExpandConstant('{tmp}\ISDone.dll')) then ExtractTemporaryFile('ISDone.dll');
    if not FileExists(ExpandConstant('{tmp}\WinTB.dll')) then ExtractTemporaryFile('WinTB.dll');
    if not FileExists(ExpandConstant('{tmp}\Languages.ini')) then ExtractTemporaryFile('Languages.ini');
    Result := true;
    InitializeFlag := true;
  end;
end;

procedure InitializeWizard();
begin
  Create;
  Settings;
  //ExistsForm;
end;

procedure DeinitializeSetup;
begin
  if InitializeFlag then
  begin
    gdipShutDown;
    TaskBarDestroy;
    SetWindowLong(WizardForm.Handle, -4, OldProc);
  end;
end;

#include "modules\Uninstall.iss"