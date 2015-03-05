//created by David.D.Rocco 04.2012

[code]
type
  TMargins = record
    cxLeftWidth: Integer;
    cxRightWidth: Integer;
    cyTopHeight: Integer;
    cyBottomHeight: Integer;
  end;

  TBtnEvent = procedure(Btn: integer); //Btn - ������������� ������

const
  //���� ������������ �� ������ �����
  TBPF_NOPROGRESS         = 0;
  TBPF_INDETERMINATE      = 1;
  TBPF_NORMAL             = 2;
  TBPF_ERROR              = 4;
  TBPF_PAUSED             = 8;

var
  _m_: TMargins;

//��� ���������� ������� �� ������ ����� CallbackCtrl.dll
function BtnCallbackaddr(Callback: TBtnEvent; ParamCount: Integer): Longword; external 'wrapcallbackaddr@{tmp}\CallbackCtrl.dll stdcall delayload';


//----������ ������� Win7TBP v1.0----\\
procedure SetTaskBarProgressValue(APP:HWND; Value:Integer); external 'SetTaskBarProgressValue@{tmp}\WinTB.dll stdcall delayload';
//SetTaskBarProgressValue - ��������� ��������� �� ������ �����
//Value - �������� �� 0 �� 100

procedure SetTaskBarProgressState(APP:HWND; Value:Integer); external 'SetTaskBarProgressState@{tmp}\WinTB.dll stdcall delayload';
//SetTaskBarProgressState - ��������� ��������� ���������
//Value - ���� �� �������� TBPF_*

//APP - ��� ������������� TaskBarV11 ��� �������� = wizardform.handle
//��� ������ ������ application.handle ��� 0. ���������� ���� ������ handle ���� ��������� 0.


procedure SetTaskBarToolTip(APP:HWND; Hint:PAnsiChar); external 'SetTaskBarToolTip@{tmp}\WinTB.dll stdcall delayload';
//SetTaskBarToolTip - ��������� ��������� ��� ��������� ���������
//APP - application.handle ��� 0. TaskBarV11 �� ��������������.
//Hint - ���������

procedure SetTaskBarOverlayIcon(APP:HWND; Icon:Integer); external 'SetTaskBarOverlayIcon@{tmp}\WinTB.dll stdcall delayload';
//SetTaskBarOverlayIcon - ��������� �������������� ������ �� ���� ����
//APP - application.handle ��� 0. TaskBarV11 �� ��������������.
//Icon - ���������� �����������


function TaskBarAddButton(Icon: Cardinal; Hint: PAnsiChar; Event: Integer; Border: boolean): Integer; external 'TaskBarAddButton@{tmp}\WinTB.dll stdcall delayload';
//TaskBarAddButton - ��������� ������
//Icon - ���������� �����������
//Hint - ���������
//Event - ����� ��������� ����������� ��� ������� �� ������
//Border - ���������� ����� � ������
//������������ �������� - ������������� ������

procedure TaskBarUpdateButtons(APP: HWND); external 'TaskBarUpdateButtons@{tmp}\WinTB.dll stdcall delayload';
//TaskBarUpdateButtons - ��������� ������
//APP - application.handle ��� 0. TaskBarV11 �� ��������������.

procedure TaskBarButtonEnabled(Btn:Integer; Enabled:Boolean); external 'TaskBarButtonEnabled@{tmp}\WinTB.dll stdcall delayload';
//TaskBarButtonEnabled - ������������� ����������� ������
//Btn - ������������� ������(���������, ������������ TaskBarAddButton)
//Enabled - �������� ����������� ������

procedure TaskBarButtonToolTip(Btn:Integer; Hint: PAnsiChar); external 'TaskBarButtonToolTip@{tmp}\WinTB.dll stdcall delayload';
//TaskBarButtonToolTip - ��������� ����� ���������
//Btn - ������������� ������(���������, ������������ TaskBarAddButton)
//Hint - ���������

procedure TaskBarButtonIcon(Btn:Integer; Icon: Cardinal); external 'TaskBarButtonIcon@{tmp}\WinTB.dll stdcall delayload';
//TaskBarButtonIcon - ��������� ����� ������
//Btn - ������������� ������(���������, ������������ TaskBarAddButton)
//Icon - ���������� �����������


//----������ ������� Win6TaskBar v1.0----\\
procedure TaskBarV10(mf, wf: HWND; isSkin, isAero: boolean; Top, Frame: integer; const m: TMargins); external 'TaskBarV10@{tmp}\WinTB.dll stdcall delayload';
//TaskBarV10 - ������� ����� ������������ �� ������ �����
//mf - MainForm.Handle
//wf - WizardForm.Handle
//isSkin - ������������ �� ���� � ������������ (isskin.dll)
//isAero - ������������ �� aero � ������������
//Top - ������ ��������� ���� �� ������ + ������ ������ ����� ���� �� ������
//Frame - ������ ����� + ������ ������ ����� ���� �� ������
//m - ��������� ����� ��� � iswin7_add_glass

//----������ ������� Win6TaskBar v1.1----\\
procedure TaskBarV11(wf: HWND); external 'TaskBarV11@{tmp}\WinTB.dll stdcall delayload';
//TaskBarV11 - ������� ����� ������������ �� ������ �����
//wf - WizardForm.Handle

//----������ ������� Win6TaskBar v1.2----\\
procedure TaskBarV12(mf, wf: HWND; isAero:Boolean); external 'TaskBarV12@{tmp}\WinTB.dll stdcall delayload';
//TaskBarV12 - ������� ����� ������������ �� ������ �����
//mf - MainForm.Handle
//wf - WizardForm.Handle
//isAero - ������������ �� aero � ������������


procedure TaskBarDestroy; external 'TaskBarDestroy@{tmp}\WinTB.dll stdcall delayload';
//TaskBarDestroy - ����������� �������� ��� �������� ������������


{
  ����������!
  ����� �������� � ��������� Mainform ����� �������� ����������� ���������.
}






