unit uCatEscolha;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, ExtCtrls,
  StdCtrls, Buttons, uDM;

type

  { TfCatEscolha }

  TfCatEscolha = class(TForm)
    btnPesqCat: TBitBtn;
    btnFecharCat: TButton;
    DsPesqCat: TDataSource;
    DBPesqCat: TDBGrid;
    edtPesqCat: TEdit;
    Panel1: TPanel;
    procedure btnFecharCatClick(Sender: TObject);
    procedure btnPesqCatClick(Sender: TObject);
    procedure DBPesqCatDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fCatEscolha: TfCatEscolha;

implementation

{$R *.lfm}

{ TfCatEscolha }

procedure TfCatEscolha.btnPesqCatClick(Sender: TObject);
begin
  DataModule1.zqCategoria.Close;
  DataModule1.zqCategoria.SQL.Clear;
  DataModule1.zqCategoria.SQL.Add('SELECT * FROM cliente WHERE clienteid = ' + edtPesqCat.Text);
  DataModule1.zqCategoria.Open;
end;

procedure TfCatEscolha.btnFecharCatClick(Sender: TObject);
begin
  close;
end;

procedure TfCatEscolha.DBPesqCatDblClick(Sender: TObject);
begin

end;

procedure TfCatEscolha.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TfCatEscolha.FormDblClick(Sender: TObject);
begin

  close;
end;

procedure TfCatEscolha.FormShow(Sender: TObject);
begin
  DataModule1.zqCategoria.Active:= true;
end;

end.

