unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPort, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  SubThread = class(TThread)
  private
    iCnt: Integer;
  protected
    procedure Execute; override;
    procedure Display;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TfrmMain = class(TForm)
    ComPort1: TComPort;
    btnConnect: TButton;
    cmbPort: TComboBox;
    panelStatus: TPanel;
    txtSaDelay: TEdit;
    forLabel1: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    forLabel3: TEdit;
    cmbMeleeKey: TComboBox;
    forLabel4: TEdit;
    txtTimer: TEdit;
    GroupBox3: TGroupBox;
    chkSlideAttack: TCheckBox;
    chkOperator: TCheckBox;
    Label1: TLabel;
    Timer1: TTimer;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  Status: String;
  SubT: SubThread;

implementation

{$R *.dfm}

//////////////////////////////////////////////

constructor SubThread.Create;
begin
  Status := '';
  iCnt := 0;
  FreeOnTerminate := False;
  inherited Create(false);
end;

destructor SubThread.Destroy;
begin
  inherited;
end;

procedure SubThread.Execute;
begin
  while not Terminated do
  begin
  Synchronize(Display);
  Application.ProcessMessages;

  if (Status = 'Run') then
  begin
    if (Round(iCnt / 1000) >= StrToInt(frmMain.txtTimer.Text)) then
    begin
      frmMain.ComPort1.WriteStr('operator');
      WaitForSingleObject(handle, 2200);
      iCnt := 0;
    end;

    if (Round(iCnt / 1000) < StrToInt(frmMain.txtTimer.Text)) then
    begin
      frmMain.ComPort1.WriteStr('!' + IntToStr(frmMain.cmbMeleeKey.ItemIndex));
      WaitForSingleObject(handle, StrToInt(frmMain.txtSaDelay.Text));
      iCnt := iCnt + StrToInt(frmMain.txtSaDelay.Text);
    end;
  end;

  if (Status = 'Stop') then
  begin
    iCnt := 0;
    WaitForSingleObject(handle, 200);
  end;
    Synchronize(Display);
    Application.ProcessMessages;
    WaitForSingleObject(handle, 1);
  end;
end;

procedure SubThread.Display;
begin
  if (Status = 'Run') then
  begin
    frmMain.panelStatus.Caption := ' Running.';
    frmMain.panelStatus.Font.Color := RGB(0,97,255);
  end;

  if (Status = 'Stop') then
  begin
    frmMain.panelStatus.Caption := ' Stopped.';
    frmMain.panelStatus.Font.Color := RGB(255,0,0);
  end;
end;

//////////////////////////////////////////////
//////////////////////////////////////////////

procedure TfrmMain.btnConnectClick(Sender: TObject);
begin
//ComPort1.ShowSetupDialog;
//check if connected
Comport1.CustomBaudRate := 115200;
Comport1.BaudRate := brcustom;
Comport1.Port := cmbPort.Text;
  if ComPort1.Connected then
  begin
    ComPort1.Close; //close comport
    ComPort1.Open;  //open comport
  end
  else //otherwise
  begin
    ComPort1.Open; //open comport
  end;

  if ComPort1.Connected then
    panelStatus.Caption := ' Connected.';
    panelStatus.Font.Color := RGB(27,135,0);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  panelStatus.Color := RGB(51,51,51);
  panelStatus.Caption := ' Waiting for connection...';
  SubT := SubThread.Create;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  SubT.Terminate;
  SubT.Free;
  SubT := nil;
  ComPort1.Close;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  if (GetAsyncKeyState(VK_HOME) <> 0) then //Hotkey
  begin
    Status := 'Run';
    ComPort1.WriteStr('wdown');
    Sleep(200);
  end;

  if (GetAsyncKeyState(VK_END) <> 0) then
  begin
    Status := 'Stop';
    ComPort1.WriteStr('wup');
    Sleep(200);
  end;

end;

end.
