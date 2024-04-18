unit uCadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ExtCtrls, ZDataset, uMod, uDM;

type

  { TFCadCliente }

  TFCadCliente = class(TModelo)
    CentP: TPanel;
    dbCpf: TDBEdit;
    dbcTipo: TDBComboBox;
    dbID: TDBEdit;
    dbNome: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    zqCadCliente: TZQuery;
    zqCadClienteclienteid: TLongintField;
    zqCadClientecpf_cnpj_cliente: TStringField;
    zqCadClientenome_cliente: TStringField;
    zqCadClientetipo_cliente: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BtnNovoModClick(Sender: TObject);
    procedure BtPesqModClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure zqCadClienteNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  FCadCliente: TFCadCliente;

implementation

{$R *.lfm}

{ TFCadCliente }

procedure TFCadCliente.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePage:=TBSCad;
end;

procedure TFCadCliente.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
  inherited;
end;

procedure TFCadCliente.FormShow(Sender: TObject);
begin

   WindowState := wsMaximized;
  zqCadCliente.Active:= true;
  PageControl1.ActivePage:= TbsPesq;
end;

procedure TFCadCliente.Panel1Click(Sender: TObject);
begin

end;

procedure TFCadCliente.Panel1Resize(Sender: TObject);
begin

end;

procedure TFCadCliente.zqCadClienteNewRecord(DataSet: TDataSet);
begin
    DataModule1.zqGenerica1.Close;
    DataModule1.zqGenerica1.SQL.Clear;
    DataModule1.zqGenerica1.SQL.Add('select nextval('+ QuotedStr('usuarios_id_seq')+') AS CODIGO');
    DataModule1.zqGenerica1.Open;

  zqCadClienteclienteid.AsInteger := DataModule1.zqGenerica1.FieldByName('CODIGO').AsInteger;
end;

procedure TFCadCliente.BtPesqModClick(Sender: TObject);
begin
   zqCadCliente.Close;
  zqCadCliente.SQL.Clear;
  zqCadCliente.SQL.Add('SELECT * FROM cliente WHERE clienteid = '+ EdCodP.Text );
  zqCadCliente.Open;

end;

procedure TFCadCliente.BtnNovoModClick(Sender: TObject);
begin
  zqCadCliente.insert;
  PageControl1.ActivePage:= TBSCad;

  inherited;
end;

procedure TFCadCliente.BtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFCadCliente.btnCancelarClick(Sender: TObject);
begin
  zqCadCliente.Cancel;
  PageControl1.ActivePage:= TbsPesq;

  inherited;
end;

procedure TFCadCliente.btnGravarClick(Sender: TObject);
begin
  zqCadCliente.Insert;
  PageControl1.ActivePage:= TbsPesq;
end;

end.

