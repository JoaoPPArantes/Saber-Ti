unit uCadProd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  Buttons, StdCtrls, DBCtrls, ZDataset, uMod, uDM, sqldb, uCatEscolha;

type

  { TCadProduto }

  TCadProduto = class(TModelo)
    cat: TButton;
    CategoriaEdt: TDBEdit;
    DBComboBox1: TDBComboBox;
    DescricaoEdt: TDBEdit;
    DtCadEdt: TDBEdit;
    IDEdt: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LId: TLabel;
    ObservacaoEdt: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    VlrVendaEdt: TDBEdit;
    qrCadProd: TZQuery;
    qrCadProdcategoriaprodutoid: TLongintField;
    qrCadProdds_produto: TStringField;
    qrCadProddt_cadastro_produto: TDateTimeField;
    qrCadProdobs_produto: TStringField;
    qrCadProdprodutoid: TLongintField;
    qrCadProdstatus_produto: TStringField;
    qrCadProdvl_venda_produto: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnNovoModClick(Sender: TObject);
    procedure BtPesqModClick(Sender: TObject);
    procedure catClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DtCadEdtChange(Sender: TObject);
    procedure EdCodPChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LIdClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure PInfoCadClick(Sender: TObject);
    procedure qrCadProdNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  CadProduto: TCadProduto;

implementation

{$R *.lfm}

{ TCadProduto }

procedure TCadProduto.PInfoCadClick(Sender: TObject);
begin

end;

procedure TCadProduto.qrCadProdNewRecord(DataSet: TDataSet);
begin
  DataModule1.zqGenerica1.Close;
  DataModule1.zqGenerica1.SQL.Clear;
  DataModule1.zqGenerica1.SQL.Add('select nextval('+ QuotedStr('produto_produtoid')+') AS CODIGO');
  DataModule1.zqGenerica1.Open;

  qrCadProdprodutoid.AsInteger := DataModule1.zqGenerica1.FieldByName('CODIGO').AsInteger;
end;

procedure TCadProduto.FormResize(Sender: TObject);
begin

end;

procedure TCadProduto.FormShow(Sender: TObject);
begin
   WindowState := wsMaximized;
  qrCadProd.Active:= true;
  PageControl1.ActivePage:= TbsPesq;
end;

procedure TCadProduto.LIdClick(Sender: TObject);
begin

end;

procedure TCadProduto.Panel2Click(Sender: TObject);
begin

end;

procedure TCadProduto.Panel2Resize(Sender: TObject);
begin

end;

procedure TCadProduto.FormCreate(Sender: TObject);
begin

end;

procedure TCadProduto.BitBtn1Click(Sender: TObject);
begin
  qrCadProd.Insert;
end;

procedure TCadProduto.BitBtn2Click(Sender: TObject);
begin
  qrCadProd.Delete;
end;

procedure TCadProduto.btnCancelarClick(Sender: TObject);
begin
   qrCadProd.Cancel;
   PageControl1.ActivePage:= TbsPesq;
end;

procedure TCadProduto.BtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TCadProduto.BtnNovoModClick(Sender: TObject);
begin
  qrCadProd.Insert;
  PageControl1.ActivePage:= TBSCad;
   DtCadEdt.Text := DateToStr(Date);
end;

procedure TCadProduto.BtPesqModClick(Sender: TObject);

begin
qrCadProd.Close;
qrCadProd.SQL.Clear;
qrCadProd.SQL.Add('SELECT * FROM produto WHERE produtoid = '+ EdCodP.Text );
qrCadProd.Open;
end;

procedure TCadProduto.catClick(Sender: TObject);
begin
      fCatEscolha:= TfCatEscolha.Create(self);
      fCatEscolha.ShowModal
end;

procedure TCadProduto.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TCadProduto.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePage := TBSCad;
end;

procedure TCadProduto.DtCadEdtChange(Sender: TObject);
begin

end;

procedure TCadProduto.EdCodPChange(Sender: TObject);
begin

end;

procedure TCadProduto.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  inherited;

end;

end.

