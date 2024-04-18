unit uLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  StdCtrls, ZDataset;

type

  { TFlogin }

  TFlogin = class(TForm)
    btnLogin: TButton;
    dsUsuario: TDataSource;
    eUsuario: TEdit;
    eSenha: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Usuario: TLabel;
    Panel1: TPanel;
    zqUsuario: TZQuery;
    zqUsuarioid: TLongintField;
    zqUsuarionome_completo: TStringField;
    zqUsuariosenha: TStringField;
    zqUsuariotipo_acesso: TStringField;
    zqUsuariousuario: TStringField;
    procedure btnLoginClick(Sender: TObject);
  private

  public

  end;

var
  Flogin: TFlogin;

implementation

{$R *.lfm}

{ TFlogin }

procedure TFlogin.btnLoginClick(Sender: TObject);
begin
  zqUsuario.Close;
  zqUsuario.SQL.Clear;
  zqUsuario.SQL.Add('select * from usuarios where usuario = ' + QuotedStr(UpperCase(eUsuario.Text))
                               + 'and senha = ' + QuotedStr(UpperCase(eSenha.Text)));
  zqUsuario.Open;

  if (zqUsuariousuario.AsString <> '') and (zqUsuariosenha.AsString <> '') then
  begin
     menuPrincipalF := TmenuPrincipalF.Create(Self);
     menuPrincipalF.ShowModal;
  end;
end;

end.

