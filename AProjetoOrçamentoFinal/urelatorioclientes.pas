unit uRelatorioClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  LR_Class, LR_DBSet, uDM, LR_DSet;

type

  { TFrelClientes }

  TFrelClientes = class(TForm)
    btnRel: TButton;
    btnFecharRel: TButton;
    frDbDsClientes: TfrDBDataSet;
    frReportClientes: TfrReport;
    zqRelClientes: TZQuery;
    zqRelClientesclienteid: TLongintField;
    zqRelClientescpf_cnpj_cliente: TStringField;
    zqRelClientesnome_cliente: TStringField;
    zqRelClientestipo_cliente: TStringField;
    procedure btnFecharRelClick(Sender: TObject);
    procedure btnRelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure frDbDsClientesCheckEOF(Sender: TObject; var Eof: Boolean);
  private

  public

  end;

var
  FrelClientes: TFrelClientes;

implementation

{$R *.lfm}

{ TFrelClientes }

procedure TFrelClientes.FormShow(Sender: TObject);
begin
   zqRelClientes.Active:= True;
end;

procedure TFrelClientes.btnRelClick(Sender: TObject);
begin
    frReportClientes.LoadFromFile('RelCliente.lrf');
   frReportClientes.PrepareReport;
   frReportClientes.ShowReport;
end;

procedure TFrelClientes.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TFrelClientes.btnFecharRelClick(Sender: TObject);
begin
  close;
end;

procedure TFrelClientes.frDbDsClientesCheckEOF(Sender: TObject; var Eof: Boolean
  );
begin

end;

end.

