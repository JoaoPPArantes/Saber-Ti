unit UMenuP;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  uCadProd, uCateProduto, uCadCliente, uCadUsuario, uCadOrcamento, uRelatorioClientes, uRelProduto, uRelOrcamento, uRelUsuario;

type

  { TFMenuP }

  TFMenuP = class(TForm)
    Image1: TImage;
    MenuPrincipal: TMainMenu;
    MenuItem1: TMenuItem;
    RClientes: TMenuItem;
    Rprodutos: TMenuItem;
    Rorcamento: TMenuItem;
    Usuarios: TMenuItem;
    Vorcamento: TMenuItem;
    MPCate: TMenuItem;
    MPCliente: TMenuItem;
    MPProdutos: TMenuItem;
    MPSair: TMenuItem;
    MPSobre: TMenuItem;
    MPRelat: TMenuItem;
    MPVenda: TMenuItem;
    MPCad: TMenuItem;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MPCateClick(Sender: TObject);
    procedure MPClienteClick(Sender: TObject);
    procedure MPProdutosClick(Sender: TObject);
    procedure MPSairClick(Sender: TObject);
    procedure MPSobreClick(Sender: TObject);
    procedure RClientesClick(Sender: TObject);
    procedure RorcamentoClick(Sender: TObject);
    procedure RprodutosClick(Sender: TObject);
    procedure UsuariosClick(Sender: TObject);
    procedure VorcamentoClick(Sender: TObject);
  private

  public

  end;

var
  FMenuP: TFMenuP;

implementation

{$R *.lfm}

{ TFMenuP }

procedure TFMenuP.MPProdutosClick(Sender: TObject);
begin
  CadProduto:= TCadProduto.create(Self);
  CadProduto.ShowModal;
end;

procedure TFMenuP.MPCateClick(Sender: TObject);
begin
   FCategoriaProduto:= TFCategoriaProduto.Create(self);
  FCategoriaProduto.ShowModal;
end;

procedure TFMenuP.MenuItem1Click(Sender: TObject);
begin
  fCadUsuario:= TfCadUsuario.Create(self);
  fCadUsuario.ShowModal;
end;

procedure TFMenuP.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TFMenuP.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TFMenuP.Image1Click(Sender: TObject);
begin

end;

procedure TFMenuP.MPClienteClick(Sender: TObject);
begin
  FCadCliente:= TFCadCliente.Create(self);
  FCadCliente.ShowModal;
end;

procedure TFMenuP.MPSairClick(Sender: TObject);
begin
   if MessageDlg('Você tem certeza que deseja encerrar o programa?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                begin

    Application.Terminate;
  end;
end;

procedure TFMenuP.MPSobreClick(Sender: TObject);
begin

end;

procedure TFMenuP.RClientesClick(Sender: TObject);
begin
  FrelClientes:= TFrelClientes.Create(self);
  FrelClientes.ShowModal;
end;

procedure TFMenuP.RorcamentoClick(Sender: TObject);
begin
  FRelOrcamento:= TFRelOrcamento.Create(self);
  FRelOrcamento.ShowModal;
end;

procedure TFMenuP.RprodutosClick(Sender: TObject);
begin
  FrelProd:= TFrelProd.Create(self);
  FrelProd.ShowModal;
end;

procedure TFMenuP.UsuariosClick(Sender: TObject);
begin
  FRelUsuario:= TFRelUsuario.Create(self);
  FRelUsuario.ShowModal;
end;

procedure TFMenuP.VorcamentoClick(Sender: TObject);
begin
    FcadOrcamento:= TFcadOrcamento.Create(self);
    FcadOrcamento.ShowModal;
end;

end.

