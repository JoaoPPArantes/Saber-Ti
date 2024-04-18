unit uPesqCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  uDM, ExtCtrls, DBGrids, ZDataset;

type

  { TFpesqCliente }

  TFpesqCliente = class(TForm)
    btnFecharCat: TButton;
    btnPesquisar: TBitBtn;
    GridCliente: TDBGrid;
    dtPesquisa: TDataSource;
    edtPesquisa: TEdit;
    Panel1: TPanel;
    procedure btnFecharCatClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridClienteDblClick(Sender: TObject);
  private

  public

  end;

var
  FpesqCliente: TFpesqCliente;

implementation

{$R *.lfm}

{ TFpesqCliente }

procedure TFpesqCliente.FormCreate(Sender: TObject);
begin
DataModule1.zqPesquisa.Active:=True ;
end;

procedure TFpesqCliente.FormShow(Sender: TObject);
begin

end;

procedure TFpesqCliente.GridClienteDblClick(Sender: TObject);
begin

  close;
end;

procedure TFpesqCliente.btnPesquisarClick(Sender: TObject);
begin
  DataModule1.zqPesquisa.Close;
  DataModule1.zqPesquisa.SQL.Clear;
  DataModule1.zqPesquisa.SQL.Add('SELECT * FROM cliente WHERE clienteid = ' + edtPesquisa.Text);
  DataModule1.zqPesquisa.Open;
end;

procedure TFpesqCliente.btnFecharCatClick(Sender: TObject);
begin
  close;
end;

end.

