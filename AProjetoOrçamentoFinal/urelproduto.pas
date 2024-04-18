unit uRelProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LR_Class,
  LR_DBSet, ZDataset;

type

  { TFrelProd }

  TFrelProd = class(TForm)
    btnFecharRel: TButton;
    btnRel: TButton;
    FrDbRelProd: TfrDBDataSet;
    frProduto: TfrReport;
    zqRelProd: TZQuery;
    procedure btnFecharRelClick(Sender: TObject);
    procedure btnRelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FrelProd: TFrelProd;

implementation

{$R *.lfm}

{ TFrelProd }

procedure TFrelProd.btnRelClick(Sender: TObject);
begin
  frProduto.LoadFromFile('relProduto.lrf');
   frProduto.PrepareReport;
   frProduto.ShowReport;
end;

procedure TFrelProd.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TFrelProd.FormShow(Sender: TObject);
begin
  zqRelProd.Active:= True;
end;

procedure TFrelProd.btnFecharRelClick(Sender: TObject);
begin
  Close;
end;

end.

