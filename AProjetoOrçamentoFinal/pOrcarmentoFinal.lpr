program pOrcarmentoFinal;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, uMod, uDM, UMenuP, uCadProd, uCateProduto, uCadCliente,
  uCadUsuario, uCatEscolha, uCadOrcamento, uPesqCliente, uAddOrcItem,
  uProcurarProduto, uRelatorioClientes, uRelProduto, uRelOrcamento, uRelUsuario,
  uSobre, uLogin
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFlogin, Flogin);
  Application.CreateForm(TModelo, Modelo);
  Application.Run;
end.

