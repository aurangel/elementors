//created by David.D.Rocco 04.2012

[code]
type
  TMargins = record
    cxLeftWidth: Integer;
    cxRightWidth: Integer;
    cyTopHeight: Integer;
    cyBottomHeight: Integer;
  end;

  TBtnEvent = procedure(Btn: integer); //Btn - идентификатор кнопки

const
  //Типы прогрессбара на панели задач
  TBPF_NOPROGRESS         = 0;
  TBPF_INDETERMINATE      = 1;
  TBPF_NORMAL             = 2;
  TBPF_ERROR              = 4;
  TBPF_PAUSED             = 8;

var
  _m_: TMargins;

//для выполнения нажатий на кнопки нужен CallbackCtrl.dll
function BtnCallbackaddr(Callback: TBtnEvent; ParamCount: Integer): Longword; external 'wrapcallbackaddr@{tmp}\CallbackCtrl.dll stdcall delayload';


//----замена скрипта Win7TBP v1.0----\\
procedure SetTaskBarProgressValue(APP:HWND; Value:Integer); external 'SetTaskBarProgressValue@{tmp}\WinTB.dll stdcall delayload';
//SetTaskBarProgressValue - установка прогресса на панели задач
//Value - значение от 0 до 100

procedure SetTaskBarProgressState(APP:HWND; Value:Integer); external 'SetTaskBarProgressState@{tmp}\WinTB.dll stdcall delayload';
//SetTaskBarProgressState - установка состояния прогресса
//Value - одна из констант TBPF_*

//APP - при использовании TaskBarV11 это значение = wizardform.handle
//для других версий application.handle или 0. библиотека сама найдет handle если выставить 0.


procedure SetTaskBarToolTip(APP:HWND; Hint:PAnsiChar); external 'SetTaskBarToolTip@{tmp}\WinTB.dll stdcall delayload';
//SetTaskBarToolTip - установка подсказки при появлении миниатюры
//APP - application.handle или 0. TaskBarV11 не поддерживается.
//Hint - подсказка

procedure SetTaskBarOverlayIcon(APP:HWND; Icon:Integer); external 'SetTaskBarOverlayIcon@{tmp}\WinTB.dll stdcall delayload';
//SetTaskBarOverlayIcon - установка дополнительной иконки на таск баре
//APP - application.handle или 0. TaskBarV11 не поддерживается.
//Icon - дескриптор изображения


function TaskBarAddButton(Icon: Cardinal; Hint: PAnsiChar; Event: Integer; Border: boolean): Integer; external 'TaskBarAddButton@{tmp}\WinTB.dll stdcall delayload';
//TaskBarAddButton - добавляет кнопку
//Icon - дескриптор изображения
//Hint - подсказка
//Event - адрес процедуры выполняемой при нажатии на кнопку
//Border - показывать рамку у кнопки
//Возвращаемое значение - идентификатор кнопки

procedure TaskBarUpdateButtons(APP: HWND); external 'TaskBarUpdateButtons@{tmp}\WinTB.dll stdcall delayload';
//TaskBarUpdateButtons - обновляет кнопки
//APP - application.handle или 0. TaskBarV11 не поддерживается.

procedure TaskBarButtonEnabled(Btn:Integer; Enabled:Boolean); external 'TaskBarButtonEnabled@{tmp}\WinTB.dll stdcall delayload';
//TaskBarButtonEnabled - устанавливает доступность кнопки
//Btn - идентификатор кнопки(результат, возвращенный TaskBarAddButton)
//Enabled - значение доступности кнопки

procedure TaskBarButtonToolTip(Btn:Integer; Hint: PAnsiChar); external 'TaskBarButtonToolTip@{tmp}\WinTB.dll stdcall delayload';
//TaskBarButtonToolTip - установка новой подсказки
//Btn - идентификатор кнопки(результат, возвращенный TaskBarAddButton)
//Hint - подсказка

procedure TaskBarButtonIcon(Btn:Integer; Icon: Cardinal); external 'TaskBarButtonIcon@{tmp}\WinTB.dll stdcall delayload';
//TaskBarButtonIcon - установка новой иконки
//Btn - идентификатор кнопки(результат, возвращенный TaskBarAddButton)
//Icon - дескриптор изображения


//----замена скрипта Win6TaskBar v1.0----\\
procedure TaskBarV10(mf, wf: HWND; isSkin, isAero: boolean; Top, Frame: integer; const m: TMargins); external 'TaskBarV10@{tmp}\WinTB.dll stdcall delayload';
//TaskBarV10 - создает эскиз инсталлятора на панели задач
//mf - MainForm.Handle
//wf - WizardForm.Handle
//isSkin - используется ли скин в инсталляторе (isskin.dll)
//isAero - используется ли aero в инсталляторе
//Top - высота заголовка окна со скином + высота нижней рамка окна со скином
//Frame - ширина левой + ширина правой рамки окна со скином
//m - заполнить также как и iswin7_add_glass

//----замена скрипта Win6TaskBar v1.1----\\
procedure TaskBarV11(wf: HWND); external 'TaskBarV11@{tmp}\WinTB.dll stdcall delayload';
//TaskBarV11 - создает эскиз инсталлятора на панели задач
//wf - WizardForm.Handle

//----замена скрипта Win6TaskBar v1.2----\\
procedure TaskBarV12(mf, wf: HWND; isAero:Boolean); external 'TaskBarV12@{tmp}\WinTB.dll stdcall delayload';
//TaskBarV12 - создает эскиз инсталлятора на панели задач
//mf - MainForm.Handle
//wf - WizardForm.Handle
//isAero - используется ли aero в инсталляторе


procedure TaskBarDestroy; external 'TaskBarDestroy@{tmp}\WinTB.dll stdcall delayload';
//TaskBarDestroy - обязательно вызывать при закрытии инсталлятора


{
  Примечание!
  Любые действия в отношении Mainform могут нарушить отображение миниатюры.
}






