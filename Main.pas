unit MAIN;

interface

uses
  Forms, ImgList, Controls, StdActns, Classes, ActnList, Dialogs, Menus,
  ComCtrls, ToolWin, Utils;
//  Windows, SysUtils, Graphics,
//  StdCtrls, Buttons, Messages, ExtCtrls,

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileCloseItem: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    FileNew1: TAction;
    FileSave1: TAction;
    FileExit1: TAction;
    FileOpen1: TAction;
    FileSaveAs1: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll1: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
    HelpAbout: TAction;
    FileClose1: TWindowClose;
    WindowTileVertical1: TWindowTileVertical;
    WindowTileItem2: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ImageList1: TImageList;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure HelpAboutExecute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CreateMDIChild(const Name: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses ProProgramu;

{$R *.dfm}

//uses CHILDWIN, about;

procedure TMainForm.CreateMDIChild(const Name: string);
{
var
  Child: TMDIChild;
}
begin
{
  Child := TMDIChild.Create(Application);
  Child.Caption := Name;
  if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);
}
end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
{
  CreateMDIChild('NONAME' + IntToStr(MDIChildCount + 1));
}
end;

procedure TMainForm.FileOpen1Execute(Sender: TObject);
begin
{
  if OpenDialog.Execute then
    CreateMDIChild(OpenDialog.FileName);
}
end;

procedure TMainForm.FormCreate(Sender: TObject);
{
var
  ws: integer;
  Path, srvname: string;
  UserName, Password: string;
}
begin
{
  ws:=0;
  //Начальные параметры окна
  try
    Application.OnMessage:=frmMain.AppMessage;
    Application.OnHint:=ShowHint;

    frmMain.Caption:='Адміністративно-запобіжні заходи';
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
    frmMain.Width:=INIAZZ.ReadInteger('Main','Width',Width);
    frmMain.Height:=INIAZZ.ReadInteger('Main','Height',Height);
    frmMain.Left:=INIAZZ.ReadInteger('Main','Left',Left);
    frmMain.Top:=INIAZZ.ReadInteger('Main','Top',Top);
    ws:=INIAZZ.ReadInteger('Main','WindowState',ws);
    case ws of
      0: frmMain.WindowState:=wsNormal;
      1: frmMain.WindowState:=wsNormal;
      2: frmMain.WindowState:=wsMaximized;
    end;
    Path:=INIAZZ.ReadString('DataBase','AliasName',Path);
    srvname:=INIAZZ.ReadString('DataBase','ServerName',srvname);

    if frmMain.dbAzz.Connected then frmMain.dbAzz.Connected:=false;
    if frmMain.trAzz.Active then frmMain.trAzz.Active:=false;
    frmMain.dbAzz.DatabaseName:=srvname+':'+path;
    trAzz.Params.Clear;
    trAzz.Params.Add('read_committed');
    trAzz.Params.Add('rec_version');
    trAzz.Params.Add('nowait');
    UserName:=INIAZZ.ReadString('DataBase','UserName',UserName);
    Password:=INIAZZ.ReadString('DataBase','Password',Password);
    dbAzz.Params.Clear;
    dbAzz.Params.Add('user_name='+UserName);
    dbAzz.Params.Add('password='+Password);
    INIAZZ.Free;
  finally
    if not frmMain.IsFormOpen('frmLogOn') then frmLogOn:=TfrmLogOn.Create(Self);
    frmLogOn.Show;
    frmLogOn.FormStyle:=fsStayOnTop;
    frmLogOn.BorderStyle:=bsDialog;
    frmLogOn.Caption:='Пыдключення до БД';
    frmLogOn.Position:=poMainFormCenter;
    frmLogOn.edtServer.Text:=frmMain.dbAzz.DatabaseName;
    frmLogOn.edtUser_Name.Text:='';
    frmLogOn.edtPassword.Text:='';
    frmMain.Enabled:=false;
    frmLogOn.edtUser_Name.SetFocus;
  end;
  frmMain.cbMain.AutoSize:=true;
//  ShowMessage('доделать проверку пользователя и пароля');

  if frmMain.IsFormOpen('frmFinansoviSankcii') then
  begin
    with frmMain do
    begin
      N13.Visible:=true;
      mnZahodiFinansovi_SankciiNeVrucheni.Visible:=true;
      mnZahodiFinansovi_SankciiNeSplacheni.Visible:=true;
      mnZahodiFinansovi_SankciiOskarzheni.Visible:=true;
      mnZahodiFinansovi_SankciiObjekt.Visible:=true;
      mnZahodiFinansovi_SankciiObjektNazvaObjektu.Visible:=true;
      mnZahodiFinansovi_SankciiObjektAdresaObjektu.Visible:=true;
      mnZahodiFinansovi_SankciiSES.Visible:=true;
      mnZahodiFinansovi_SankciiSESPIBPredstavnika.Visible:=true;
      mnZahodiFinansovi_SankciiSESPosadaPredstavnika.Visible:=true;
      mnZahodiFinansovi_SankciiTipProdukcii.Visible:=true;
      mnZahodiFinansovi_SankciiRozdilT23F18.Visible:=true;
    end;
  end
  else
  begin
    with frmMain do
    begin
      N13.Visible:=true;
      mnZahodiFinansovi_SankciiNeVrucheni.Visible:=false;
      mnZahodiFinansovi_SankciiNeSplacheni.Visible:=false;
      mnZahodiFinansovi_SankciiOskarzheni.Visible:=false;
      mnZahodiFinansovi_SankciiObjekt.Visible:=false;
      mnZahodiFinansovi_SankciiObjektNazvaObjektu.Visible:=false;
      mnZahodiFinansovi_SankciiObjektAdresaObjektu.Visible:=false;
      mnZahodiFinansovi_SankciiSES.Visible:=false;
      mnZahodiFinansovi_SankciiSESPIBPredstavnika.Visible:=false;
      mnZahodiFinansovi_SankciiSESPosadaPredstavnika.Visible:=false;
      mnZahodiFinansovi_SankciiTipProdukcii.Visible:=false;
      mnZahodiFinansovi_SankciiRozdilT23F18.Visible:=false;
    end;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizacii') then
  begin
    with frmMain do
    begin
      mnVibir_Viluchenny_Choices.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiNeVrucheni.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiOskarzheni.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiNazvaObjektu.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiAdresaObjektu.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiTipPostanovi.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiPIBOsobiSES.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiPosadaOsobiSES.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiTipProdukcii.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciilRozdilT23F18.Visible:=true;
    end;
  end
  else
  begin
    with frmMain do
    begin
      mnVibir_Viluchenny_Choices.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiNeVrucheni.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiOskarzheni.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiNazvaObjektu.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiAdresaObjektu.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiTipPostanovi.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiPIBOsobiSES.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiPosadaOsobiSES.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiTipProdukcii.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciilRozdilT23F18.Visible:=false;
    end;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodi') then
  begin
    with frmMain do
    begin
      mnAdminChoices.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNeVrucheni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNeZnytiZKontrolu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiOskarzheni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNePovidomleni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiPovidomleni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiOpechatani.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNeVidnovleni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiObmezhennyAsortimentu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNazvaObjektu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiAdresaObjektu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiPIBPredstavnikaSES.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiTipPostanovi.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiRozdilT23F18.Visible:=true;
    end;
  end
  else
  begin
    with frmMain do
    begin
      mnAdminChoices.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNeVrucheni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNeZnytiZKontrolu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiOskarzheni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNePovidomleni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiPovidomleni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiOpechatani.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNeVidnovleni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiObmezhennyAsortimentu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNazvaObjektu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiAdresaObjektu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiPIBPredstavnikaSES.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiTipPostanovi.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiRozdilT23F18.Visible:=false;
    end;
  end;

  if frmMain.IsFormOpen('frmShtrafi') then
  begin
    with frmMain do
    begin
      mnShtrafiChoices.Visible:=true;
      mnZahodiShtrafiNeSplacheni.Visible:=true;
      mnZahodiShtrafiNeVrucheni.Visible:=true;
      mnZahodiShtrafiPeredaniDoVDVS.Visible:=true;
      mnZahodiShtrafiPeredaniDoVDVSPeredani.Visible:=true;
      mnZahodiShtrafiPeredaniDoVDVSSplacheni.Visible:=true;
      mnZahodiShtrafiNePeredaniDoVDVS.Visible:=true;
      mnZahodiShtrafiPrimusovoStygneni.Visible:=true;
      mnZahodiShtrafiSkasovani.Visible:=true;
      mnZahodiShtrafiSpivrobitnik.Visible:=true;
      mnZahodiShtrafiTipShtrafu.Visible:=true;
      mnZahodiShtrafiObjekt.Visible:=true;
      mnZahodiShtrafiObjektAdresa.Visible:=true;
      mnZahodiShtrafiObjektNazva.Visible:=true;
      mnZahodiShtrafiRozdilT23F18.Visible:=true;
    end;
  end
  else
  begin
    with frmMain do
    begin
      mnShtrafiChoices.Visible:=false;
      mnZahodiShtrafiNeSplacheni.Visible:=false;
      mnZahodiShtrafiNeVrucheni.Visible:=false;
      mnZahodiShtrafiPeredaniDoVDVS.Visible:=false;
      mnZahodiShtrafiPeredaniDoVDVSPeredani.Visible:=false;
      mnZahodiShtrafiPeredaniDoVDVSSplacheni.Visible:=false;
      mnZahodiShtrafiNePeredaniDoVDVS.Visible:=false;
      mnZahodiShtrafiPrimusovoStygneni.Visible:=false;
      mnZahodiShtrafiSkasovani.Visible:=false;
      mnZahodiShtrafiSpivrobitnik.Visible:=false;
      mnZahodiShtrafiTipShtrafu.Visible:=false;
      mnZahodiShtrafiObjekt.Visible:=false;
      mnZahodiShtrafiObjektAdresa.Visible:=false;
      mnZahodiShtrafiObjektNazva.Visible:=false;
      mnZahodiShtrafiRozdilT23F18.Visible:=false;
    end;
  end;
}
end;

procedure TMainForm.HelpAboutExecute(Sender: TObject);
begin
  try
    frmProProgramu:=TfrmProProgramu.Create(self);
    try
      frmProProgramu.ShowModal;
    finally
      frmProProgramu.Caption:='Про програму...';
      frmProProgramu.Position:=poMainFormCenter;
      frmProProgramu.BorderStyle:=bsDialog;
      frmProProgramu.Free;
    end;
  except
    Exit;
  end;
{
  if not IsFormOpen('frmProProgramu') then
  begin
    try
      frmProProgramu:=TfrmProProgramu.Create(self);
    except
      exit;
    end;
  end
  else
  begin
    frmProProgramu.Free;
    frmProProgramu:=TfrmProProgramu.Create(self);
  end;
  frmMain.Enabled:=false;
  frmProProgramu.Show;
}
{
  AboutBox.ShowModal;
}
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
{
  Close;
}
end;

end.
