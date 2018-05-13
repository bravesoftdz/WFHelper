program WFHelper;

uses
  Vcl.Forms,
  Main in 'Main.Pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.Title := 'WFHelper';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
