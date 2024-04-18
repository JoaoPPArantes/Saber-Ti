unit uMod;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Buttons, DBGrids;

type

  { TModelo }

  TModelo = class(TForm)
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    BtPesqMod: TBitBtn;
    BtnNovoMod: TBitBtn;
    BtnFechar: TBitBtn;
    CodigoMod: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    EdCodP: TEdit;
    PageControl1: TPageControl;
    PtbsCad: TPanel;
    PModBot: TPanel;
    PModTop: TPanel;
    TbsPesq: TTabSheet;
    TBSCad: TTabSheet;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure BtnNovoModClick(Sender: TObject);

    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  Modelo: TModelo;

implementation

{$R *.lfm}

{ TModelo }

procedure TModelo.btnExcluirClick(Sender: TObject);
begin

end;

procedure TModelo.btnGravarClick(Sender: TObject);
begin

end;



procedure TModelo.BtnNovoModClick(Sender: TObject);
begin

end;

procedure TModelo.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure TModelo.btnCancelarClick(Sender: TObject);
begin

end;






end.

