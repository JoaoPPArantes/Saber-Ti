unit uAddOrcItem;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, ZDataset, uDM, uProcurarProduto;

type

  { TFPesqProduto }

  TFPesqProduto = class(TForm)
    btnProcurarP: TBitBtn;
    btnInserir: TButton;
    btnCancelar: TButton;
    dsPesqProd: TDataSource;
    dbID: TDBEdit;
    dbCatId: TDBEdit;
    dbDesc: TDBEdit;
    dbObs: TDBEdit;
    dbStatus: TDBEdit;
    dbValor: TDBEdit;
    edtQntd: TEdit;
    edtValorFinal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnProcurarPClick(Sender: TObject);
    procedure dbValorChange(Sender: TObject);
    procedure dsPesqProdDataChange(Sender: TObject; Field: TField);
    procedure edtQntdChange(Sender: TObject);
    procedure edtValorFinalChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FPesqProduto: TFPesqProduto;

implementation
  uses
    uCadOrcamento;
{$R *.lfm}

{ TFPesqProduto }

procedure TFPesqProduto.FormCreate(Sender: TObject);
begin

end;

procedure TFPesqProduto.dsPesqProdDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFPesqProduto.edtQntdChange(Sender: TObject);

var
   valor: Double;
  quantidade: Double;
  valorFinal: Double;


begin
  valor := StrToFloat (dbValor.Text);
  quantidade := StrToInt(edtQntd.Text);


  valorFinal := valor * quantidade;


 edtValorFinal.Text := FormatFloat('#,##0.00', valorFinal);

end;

procedure TFPesqProduto.edtValorFinalChange(Sender: TObject);

begin

end;

procedure TFPesqProduto.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    CloseAction:= caFree;
  if(FcadOrcamento.dbeTOrcamento.Text = '') then
  begin
    FcadOrcamento.dbeTOrcamento.Text := edtValorFinal.Text;
  end
  else
      FcadOrcamento.dbeTOrcamento.Text:= FloatToStr(StrToFloat(FcadOrcamento.dbeTOrcamento.Text) +
                                            StrToFloat(edtValorFinal.Text));
end;

procedure TFPesqProduto.btnInserirClick(Sender: TObject);
begin
   if StrToInt(edtQntd.Text) < 0 then
  begin
     ShowMessage('Digite um quantidade valida');
     Exit;
  end;

  DataModule1.zqOrcamentoItem.FieldByName('orcamentoid').AsString:= FcadOrcamento.dbeID.Text;
  DataModule1.zqOrcamentoItem.FieldByName('produtoid').AsString:=dsPesqProd.DataSet.FieldByName('produtoid').AsString;
  DataModule1.zqOrcamentoItem.FieldByName('produtodesc').AsString:=dsPesqProd.DataSet.FieldByName('ds_produto').AsString;
  DataModule1.zqOrcamentoItem.FieldByName('qt_produto').AsString:=edtQntd.Text;
  DataModule1.zqOrcamentoItem.FieldByName('vl_unitario').AsString:=dsPesqProd.DataSet.FieldByName('vl_venda_produto').AsString;
  DataModule1.zqOrcamentoItem.FieldByName('vl_total').AsString:= edtValorFinal.text;

  DataModule1.zqOrcamentoItem.Post;
  Close;
end;

procedure TFPesqProduto.btnCancelarClick(Sender: TObject);
begin
  DataModule1.zqOrcamentoItem.Cancel;
  Close;
end;

procedure TFPesqProduto.btnProcurarPClick(Sender: TObject);
begin
  FProcProd:= TFProcProd.Create(self);
  FProcProd.ShowModal;

end;

procedure TFPesqProduto.dbValorChange(Sender: TObject);
begin

end;

end.

