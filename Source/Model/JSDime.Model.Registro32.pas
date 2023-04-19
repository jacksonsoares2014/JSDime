unit JSDime.Model.Registro32;

interface

uses
  System.Generics.Collections,
  JSDime.Model.Attributes,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro32 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    [Obrigatorio('Item')]
    property item : String   read Fitem  write Fitem;

    [Obrigatorio('Valor')]
    [ValorPositivo('Valor')]
    property valor: Currency read Fvalor write Fvalor;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro32 }

constructor TJSDimeModelRegistro32.create;
begin
  inherited;
  reg    := '32';
  quadro := '11';
end;

destructor TJSDimeModelRegistro32.Destroy;
begin

  inherited;
end;

end.
