unit uCadOrcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, Buttons, DBGrids, ZDataset, uMod, uPesqCliente, uDM, uAddOrcItem, DateUtils;

type

  { TFcadOrcamento }

  TFcadOrcamento = class(TModelo)
    btnEdit: TBitBtn;
    btnRmvItem: TBitBtn;
    btnAddItem: TBitBtn;
    Button1: TButton;
    dsOrcamento: TDataSource;
    dsCliente: TDataSource;
    dsOrcamentoItem: TDataSource;
    dbeTOrcamento: TDBEdit;
    dbeID: TDBEdit;
    dbeCliente: TDBEdit;
    dbeDTOrca: TDBEdit;
    dbeValidade: TDBEdit;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    zqCadOrcamento: TZQuery;
    zqCadOrcamentoclienteid: TLongintField;
    zqCadOrcamentodt_orcamento: TDateTimeField;
    zqCadOrcamentodt_validade_orcamento: TDateTimeField;
    zqCadOrcamentoorcamentoid: TLongintField;
    zqCadOrcamentovl_total_orcamento: TFloatField;
    procedure btnAddItemClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BtnNovoModClick(Sender: TObject);
    procedure btnRmvItemClick(Sender: TObject);
    procedure BtPesqModClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbeClienteChange(Sender: TObject);
    procedure dbeIDChange(Sender: TObject);
    procedure dbeTOrcamentoChange(Sender: TObject);
    procedure dbeValidadeChange(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure EdCodPChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure zqCadOrcamentoNewRecord(DataSet: TDataSet);
  private

  public
    procedure AbreOrcItens(orcamentoID: Integer);
     procedure calcularVT();
  end;


var
  FcadOrcamento: TFcadOrcamento;

implementation

{$R *.lfm}

{ TFcadOrcamento }
procedure TFcadOrcamento.AbreOrcItens(orcamentoid : Integer);
begin
  if orcamentoid <> 0 then
  begin
      DataModule1.zqOrcamentoItem.Close;
      DataModule1.zqOrcamentoItem.SQL.Clear;
      DataModule1.zqOrcamentoItem.SQL.Add(
                      'SELECT '+
                      'ORCAMENTOITEMID, '+
                      'ORCAMENTOID, '+
                      'PRODUTOID, '+
                      'produtodesc, '+
                      'QT_PRODUTO, '+
                      'VL_UNITARIO, '+
                      'VL_TOTAL '+
                      'FROM ORCAMENTO_ITEM ' +
                      'WHERE ORCAMENTOID = '+ inttostr(orcamentoid) + ' ' +
                      'ORDER BY ORCAMENTOID');
       //ShowMessage(DataModule1.qryOrcamentoItem.SQL.Text);
       DataModule1.zqOrcamentoItem.Open;
  end;
end;



procedure TFcadOrcamento.Button1Click(Sender: TObject);
begin
      FpesqCliente:= TFpesqCliente.Create(self);
      FpesqCliente.ShowModal
end;

procedure TFcadOrcamento.dbeClienteChange(Sender: TObject);
begin

end;

procedure TFcadOrcamento.dbeIDChange(Sender: TObject);
begin

end;

procedure TFcadOrcamento.dbeTOrcamentoChange(Sender: TObject);
begin

end;

procedure TFcadOrcamento.dbeValidadeChange(Sender: TObject);
begin

end;

procedure TFcadOrcamento.DBGrid2Exit(Sender: TObject);
begin

end;

procedure TFcadOrcamento.EdCodPChange(Sender: TObject);
begin

end;

procedure TFcadOrcamento.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
  inherited;
end;

procedure TFcadOrcamento.btnAddItemClick(Sender: TObject);
begin

  DataModule1.zqOrcamentoItem.Insert;
  FPesqProduto:= TFPesqProduto.Create(self);
  FPesqProduto.ShowModal;



end;

procedure TFcadOrcamento.btnCancelarClick(Sender: TObject);
begin
  zqCadOrcamento.Cancel;
  DataModule1.zqOrcamentoItem.Cancel;
  close;
end;

procedure TFcadOrcamento.btnEditClick(Sender: TObject);
begin
    zqCadOrcamento.Edit;
  PageControl1.ActivePage := TBSCad;
end;

procedure TFcadOrcamento.BtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFcadOrcamento.btnGravarClick(Sender: TObject);
begin

  zqCadOrcamentoclienteid.AsString := dbeCliente.Text;
  zqCadOrcamento.Post;
  PageControl1.ActivePage:= TbsPesq;
end;

procedure TFcadOrcamento.calcularVT();
var
  somar : Double;
begin

  somar := 0.0;

  DBGrid2.DataSource.DataSet.First;
  while not DBGrid2.DataSource.DataSet.EOF do
  begin
    somar := somar + DBGrid2.DataSource.DataSet.FieldByName('vl_total').AsFloat;
    DBGrid2.DataSource.DataSet.Next;
  end;

  dbeTOrcamento.Text:= FloatToStr(somar);
end;


procedure TFcadOrcamento.BtnNovoModClick(Sender: TObject);
var
  dataA : TDateTime;

begin

  DataModule1.zqOrcamentoItem.Close;
  DataModule1.zqOrcamentoItem.SQL.Clear;
  DataModule1.zqOrcamentoItem.SQL.Add('SELECT * FROM orcamento_item WHERE orcamentoitemid = -1' );
  DataModule1.zqOrcamentoItem.Open;
  dataA:= Now;

  zqCadOrcamento.insert;
  zqCadOrcamentodt_orcamento.AsString:=DateToStr(dataA);
  zqCadOrcamentodt_validade_orcamento.AsString:=DateToStr(IncDay(dataA, 15));


  PageControl1.ActivePage:= TBSCad;


end;

procedure TFcadOrcamento.btnRmvItemClick(Sender: TObject);
begin
    if MessageDlg('Confirmarção', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
     DataModule1.zqOrcamentoItem.Delete;
     calcularVT();
  end;
end;

procedure TFcadOrcamento.BtPesqModClick(Sender: TObject);
begin
      zqCadOrcamento.Close;
      zqCadOrcamento.SQL.Clear;
      zqCadOrcamento.SQL.Add('select * from orcamento where orcamentoid = ' + EdCodP.Text);
      zqCadOrcamento.Open;
end;


procedure TfcadOrcamento.FormShow(Sender: TObject);
begin

  DataModule1.zqPesquisa.Active:= True;
   DataModule1.zqOrcamentoItem.Active:= True;
   zqCadOrcamento.Active:= True;
   WindowState := wsMaximized;
   PageControl1.ActivePage := TbsPesq;

end;

procedure TFcadOrcamento.PageControl1Change(Sender: TObject);
begin
  DataModule1.zqOrcamentoItem.Close;
  DataModule1.zqOrcamentoItem.SQL.Clear;
  DataModule1.zqOrcamentoItem.SQL.Add('select * from orcamento_item where orcamentoid = ' + EdCodP.Text);
end;

procedure TFcadOrcamento.zqCadOrcamentoNewRecord(DataSet: TDataSet);
begin
  DataModule1.zqGenerica1.Close;
  DataModule1.zqGenerica1.SQL.Clear;
  DataModule1.zqGenerica1.SQL.Add('select nextval('+ QuotedStr('orcamento_orcamentoid_seq')+') AS CODIGO');
  DataModule1.zqGenerica1.Open;

  zqCadOrcamentoorcamentoid.AsInteger := DataModule1.zqGenerica1.FieldByName('CODIGO').AsInteger;

end;




end.

