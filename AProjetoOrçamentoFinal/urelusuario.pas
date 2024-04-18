unit uRelUsuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  LR_Class, LR_DBSet;

type

  { TFRelUsuario }

  TFRelUsuario = class(TForm)
    btnFecharRel: TButton;
    btnRel: TButton;
    frDbDsUsuario: TfrDBDataSet;
    frReportUsuario: TfrReport;
    zqRelUsuario: TZQuery;
    zqRelUsuarioid: TLongintField;
    zqRelUsuarionome_completo: TStringField;
    zqRelUsuariosenha: TStringField;
    zqRelUsuariotipo_acesso: TStringField;
    zqRelUsuariousuario: TStringField;
    procedure btnFecharRelClick(Sender: TObject);
    procedure btnRelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  FRelUsuario: TFRelUsuario;

implementation

{$R *.lfm}

{ TFRelUsuario }

procedure TFRelUsuario.btnFecharRelClick(Sender: TObject);
begin
  close;
end;

procedure TFRelUsuario.btnRelClick(Sender: TObject);
begin
   frReportUsuario.LoadFromFile('RelUsuario.lrf');
   frReportUsuario.PrepareReport;
   frReportUsuario.ShowReport;
end;

procedure TFRelUsuario.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
 CloseAction := caFree;
end;

end.

