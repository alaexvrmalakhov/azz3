program azz3;

uses
  Forms,
  MAIN in 'MAIN.PAS' {MainForm},
  Utils in 'Utils.pas',
  ProProgramu in 'ProProgramu.pas' {frmProProgramu},
  splash in 'splash.pas' {frmSplash};

{$R *.RES}

begin
  frmSplash:=TfrmSplash.Create(Application);
  frmSplash.Position:=poMainFormCenter;
  frmSplash.BorderStyle:=bsNone;
  frmSplash.Show;
  Application.Initialize;
  frmSplash.Update;
  Application.Title := 'Адміністративно-запобіжні заходи';
  Application.CreateForm(TMainForm, MainForm);
//  Application.CreateForm(TfrmSplash, frmSplash);
  //  Application.CreateForm(TfrmProProgramu, frmProProgramu);
  //  Application.CreateForm(TAboutBox, AboutBox);
  frmSplash.Hide;
  frmSplash.Free;
  Application.Run;
end.
