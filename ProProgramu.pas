unit ProProgramu;

interface

uses
  Forms, Controls, StdCtrls, ExtCtrls, Graphics, Classes, Utils;
//  , SysUtils, Dialogs;

type
  TfrmProProgramu = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    iLogoSES: TImage;
    Bevel1: TBevel;
    btnClose: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmProProgramu: TfrmProProgramu;

implementation

uses
  Main;

{$R *.dfm}

procedure TfrmProProgramu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmProProgramu.btnCloseClick(Sender: TObject);
begin
  frmProProgramu.Close;
end;

procedure TfrmProProgramu.FormActivate(Sender: TObject);
begin
  frmProProgramu.Label3.Caption:='Версія програми '+GetMyVersion;
end;

end.
