unit uSobre;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TFsobre }

  TFsobre = class(TForm)
    Image1: TImage;
    StaticText1: TStaticText;
    procedure StaticText1Click(Sender: TObject);
  private

  public

  end;

var
  Fsobre: TFsobre;

implementation

{$R *.lfm}

{ TFsobre }

procedure TFsobre.StaticText1Click(Sender: TObject);
begin

end;

end.

