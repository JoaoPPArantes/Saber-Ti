unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    ZConnection1: TZConnection;
    zqGenerica1: TZQuery;
    zqOrcamentoclienteid: TLongintField;
    zqOrcamentodt_orcamento: TDateTimeField;
    zqOrcamentodt_validade_orcamento: TDateTimeField;
    zqOrcamentoItem: TZQuery;
    zqOrcamentoItemorcamentoid: TLongintField;
    zqOrcamentoItemorcamentoitemid: TLongintField;
    zqOrcamentoItemprodutodesc: TStringField;
    zqOrcamentoItemprodutoid: TLongintField;
    zqOrcamentoItemqt_produto: TFloatField;
    zqOrcamentoItemvl_total: TFloatField;
    zqOrcamentoItemvl_unitario: TFloatField;
    zqOrcamentoorcamentoid: TLongintField;
    zqOrcamentovl_total_orcamento: TFloatField;
    zqPesquisa: TZQuery;
    zqPesquisaclienteid: TLongintField;
    zqPesquisacpf_cnpj_cliente: TStringField;
    zqPesquisanome_cliente: TStringField;
    zqPesquisatipo_cliente: TStringField;
    zqCategoria: TZQuery;
    zqOrcamento: TZQuery;
    zqProcProduto: TZQuery;
    zqProcProdutocategoriaprodutoid: TLongintField;
    zqProcProdutods_produto: TStringField;
    zqProcProdutodt_cadastro_produto: TDateTimeField;
    zqProcProdutoobs_produto: TStringField;
    zqProcProdutoprodutoid: TLongintField;
    zqProcProdutostatus_produto: TStringField;
    zqProcProdutovl_venda_produto: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ZConnection1AfterConnect(Sender: TObject);
    procedure zqOrcamentoItemNewRecord(DataSet: TDataSet);
    procedure zqProcProdutoNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

{ TDataModule1 }

procedure TDataModule1.ZConnection1AfterConnect(Sender: TObject);
begin

end;

procedure TDataModule1.zqOrcamentoItemNewRecord(DataSet: TDataSet);
begin
   zqGenerica1.Close;
   zqGenerica1.SQL.Clear;
   zqGenerica1.SQL.Add('select nextval('+ QuotedStr('orcamentoitem_orcamentoid_seq')+') AS CODIGO');
   zqGenerica1.Open;

  zqOrcamentoItemorcamentoitemid.AsInteger := DataModule1.zqGenerica1.FieldByName('CODIGO').AsInteger;
end;

procedure TDataModule1.zqProcProdutoNewRecord(DataSet: TDataSet);
begin

end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  ZConnection1.HostName := 'localhost';
  ZConnection1.DataBase := 'postgres';
  ZConnection1.User     := 'postgres';
  ZConnection1.Password := '1234';
  ZConnection1.Port     := 5432;
  ZConnection1.Protocol := 'postgresql';
  ZConnection1.Connected := True;

end;

end.

