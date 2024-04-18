unit uCadUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ExtCtrls, ZDataset, uMod, DB, uDM;

type

  { TfCadUsuario }

  TfCadUsuario = class(TModelo)
    dbID: TDBEdit;
    dbNome: TDBEdit;
    dbPermissao: TDBComboBox;
    dbSenha: TDBEdit;
    dbUsuario: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    zqUsuario: TZQuery;
    zqUsuarioid: TLongintField;
    zqUsuarionome_completo: TStringField;
    zqUsuariosenha: TStringField;
    zqUsuariotipo_acesso: TStringField;
    zqUsuariousuario: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BtnNovoModClick(Sender: TObject);
    procedure BtPesqModClick(Sender: TObject);
    procedure dbPermissaoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure zqUsuarioNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  fCadUsuario: TfCadUsuario;

implementation

{$R *.lfm}

{ TfCadUsuario }

procedure TfCadUsuario.BtnNovoModClick(Sender: TObject);
begin
  zqUsuario.Insert;
  PageControl1.ActivePage:= TBSCad;
end;

procedure TfCadUsuario.BtPesqModClick(Sender: TObject);
begin

  if EdCodP.Text <> '' then
  begin
  zqUsuario.Close;
  zqUsuario.SQL.Clear;
  zqUsuario.SQL.Add('SELECT * FROM usuarios WHERE id = '+ EdCodP.Text );
  zqUsuario.Open;
end;
end;

procedure TfCadUsuario.dbPermissaoChange(Sender: TObject);
begin

end;

procedure TfCadUsuario.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

  inherited;
end;

procedure TfCadUsuario.FormResize(Sender: TObject);
begin

end;

procedure TfCadUsuario.FormShow(Sender: TObject);
begin

     WindowState := wsMaximized;
  zqUsuario.Active:= true;
  PageControl1.ActivePage:= TbsPesq;
end;

procedure TfCadUsuario.Panel1Click(Sender: TObject);
begin

end;

procedure TfCadUsuario.Panel1Resize(Sender: TObject);
begin

end;

procedure TfCadUsuario.zqUsuarioNewRecord(DataSet: TDataSet);
begin
  DataModule1.zqGenerica1.Close;
  DataModule1.zqGenerica1.SQL.Clear;
  DataModule1.zqGenerica1.SQL.Add('select nextval('+ QuotedStr('usuarios_id_seq')+') AS CODIGO');
  DataModule1.zqGenerica1.Open;

  zqUsuarioid.AsInteger := DataModule1.zqGenerica1.FieldByName('CODIGO').AsInteger;

end;

procedure TfCadUsuario.BtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfCadUsuario.btnExcluirClick(Sender: TObject);
begin
  zqUsuario.Delete;
  PageControl1.ActivePage:= TbsPesq;
end;

procedure TfCadUsuario.btnCancelarClick(Sender: TObject);
begin
  zqUsuario.Cancel;
  PageControl1.ActivePage:= TbsPesq;
end;

procedure TfCadUsuario.btnGravarClick(Sender: TObject);
begin
  zqUsuario.Insert;
  PageControl1.ActivePage:= TbsPesq;
end;

end.

