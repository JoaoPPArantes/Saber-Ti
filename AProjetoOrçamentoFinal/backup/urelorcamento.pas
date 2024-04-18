unit uRelOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  LR_DBSet, LR_Class;

type

  { TFRelOrcamento }

  TFRelOrcamento = class(TForm)
    btnFecharRel: TButton;
    btnRel: TButton;
    frDbDsOrcamento: TfrDBDataSet;
    frReportOrcamento: TfrReport;
    zqRelOrcamento: TZQuery;
    zqRelOrcamentodt_orcamento: TDateTimeField;
    zqRelOrcamentodt_validade_orcamento: TDateTimeField;
    zqRelOrcamentoorcamentoid: TLongintField;
    zqRelOrcamentovl_total_orcamento: TFloatField;
    procedure btnFecharRelClick(Sender: TObject);
    procedure btnRelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  FRelOrcamento: TFRelOrcamento;

implementation

{$R *.lfm}

{ TFRelOrcamento }

procedure TFRelOrcamento.btnRelClick(Sender: TObject);
begin
   frReportOrcamento.LoadFromFile('RelOrcamento.lrf');
   frReportOrcamento.PrepareReport;
   frReportOrcamento.ShowReport;
end;

procedure TFRelOrcamento.FormClose(Sender: TObject;);
begin
   CloseAction := caFree;
end;

procedure TFRelOrcamento.btnFecharRelClick(Sender: TObject);
begin
  close;
end;

end.

