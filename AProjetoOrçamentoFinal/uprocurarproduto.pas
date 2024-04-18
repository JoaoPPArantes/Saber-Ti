unit uProcurarProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, DBGrids, ZDataset, uDM, Types;

type

  { TFProcProd }

  TFProcProd = class(TForm)
    btnFecharCat: TButton;
    btnPesquisar: TBitBtn;
    dsProcProd: TDataSource;
    DBGrid1: TDBGrid;
    edtPesquisa: TEdit;
    Panel1: TPanel;
    procedure btnFecharCatClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure dsProcProdDataChange(Sender: TObject; Field: TField);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FProcProd: TFProcProd;

implementation

{$R *.lfm}

{ TFProcProd }

procedure TFProcProd.dsProcProdDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFProcProd.edtPesquisaChange(Sender: TObject);
begin

end;

procedure TFProcProd.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TFProcProd.FormShow(Sender: TObject);
begin
  DataModule1.zqProcProduto.Active:=True;
end;

procedure TFProcProd.btnPesquisarClick(Sender: TObject);
begin
  DataModule1.zqProcProduto.Close;
  DataModule1.zqProcProduto.SQL.Clear;
  DataModule1.zqProcProduto.SQL.Add('SELECT * FROM produto WHERE produtoid = ' + edtPesquisa.Text);
  DataModule1.zqProcProduto.Open;
end;

procedure TFProcProd.DBGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  Close;
end;

procedure TFProcProd.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TFProcProd.btnFecharCatClick(Sender: TObject);
begin
  Close;
end;

end.

