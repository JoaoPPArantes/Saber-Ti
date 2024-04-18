unit uCateProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  ExtCtrls, Buttons, ZDataset, uMod, DB, uDM;

type

  { TFCategoriaProduto }

  TFCategoriaProduto = class(TModelo)
    DBNavigator1: TDBNavigator;
    EditDesc: TDBEdit;
    EditId: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    zqCat: TZQuery;
    zqCatcategoriaprodutoid: TLongintField;
    zqCatds_categoria_produto: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BtnNovoModClick(Sender: TObject);
    procedure BtPesqModClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdCodPChange(Sender: TObject);
    procedure EditDescChange(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure zqCatNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  FCategoriaProduto: TFCategoriaProduto;

implementation

{$R *.lfm}

{ TFCategoriaProduto }

procedure TFCategoriaProduto.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFCategoriaProduto.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePage:= TBSCad;
end;

procedure TFCategoriaProduto.EdCodPChange(Sender: TObject);
begin

end;

procedure TFCategoriaProduto.EditDescChange(Sender: TObject);
begin

end;

procedure TFCategoriaProduto.btnExcluirClick(Sender: TObject);
begin

  zqCat.Delete;
end;

procedure TFCategoriaProduto.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFCategoriaProduto.btnCancelarClick(Sender: TObject);
begin
  zqCat.Cancel;
  PageControl1.ActivePage:=TbsPesq;
end;

procedure TFCategoriaProduto.btnGravarClick(Sender: TObject);
begin
  zqCat.Insert;
  PageControl1.ActivePage:=TbsPesq;
end;

procedure TFCategoriaProduto.BtnNovoModClick(Sender: TObject);
begin
  zqCat.Insert;
  PageControl1.ActivePage:=TBSCad;
end;

procedure TFCategoriaProduto.BtPesqModClick(Sender: TObject);
begin
 if EdCodP.Text <> '' then
begin
  zqCat.Close;
  zqCat.SQL.Clear;
  zqCat.SQL.Add('SELECT * FROM categoria_produto WHERE categoriaprodutoid = '+ EdCodP.Text);
  zqCat.Open;
end;
end;

procedure TFCategoriaProduto.FormClick(Sender: TObject);
begin

end;

procedure TFCategoriaProduto.FormClose(Sender: TObject var CloseAction: TCloseAction);
begin
 CloseAction:= caFree;
 inherited;
end;

procedure TFCategoriaProduto.FormShow(Sender: TObject);
begin
 PageControl1.ActivePage:= TbsPesq;
  zqCat.Active:= true;
 WindowState := wsMaximized;

end;

procedure TFCategoriaProduto.Panel1Click(Sender: TObject);
begin

end;

procedure TFCategoriaProduto.Panel1Resize(Sender: TObject);
  begin
end;

procedure TFCategoriaProduto.zqCatNewRecord(DataSet: TDataSet);
begin
  DataModule1.zqGenerica1.Close;
  DataModule1.zqGenerica1.SQL.Clear;
  DataModule1.zqGenerica1.SQL.Add('select nextval('+ QuotedStr('categoria_produto_categoriaprodutoid_seq')+') AS CODIGO');
  DataModule1.zqGenerica1.Open;

  zqCatcategoriaprodutoid.AsInteger := DataModule1.zqGenerica1.FieldByName('CODIGO').AsInteger;
end;

end.

