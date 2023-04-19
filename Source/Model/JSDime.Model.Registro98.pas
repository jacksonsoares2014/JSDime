unit JSDime.Model.Registro98;

interface

uses
  JSDime.Model.Attributes,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro98 = class(TJSDimeModelRegistro)
  private
    FqtdReg: Integer;
  public
    [Obrigatorio('Quantidade de Registros da Declaração')]
    [ValorPositivo('Quantidade de Registros da Declaração')]
    property qtdReg: Integer read FqtdReg write FqtdReg;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro98 }

constructor TJSDimeModelRegistro98.create;
begin
  inherited;
  reg    := '98';
  quadro := '  ';
end;

destructor TJSDimeModelRegistro98.Destroy;
begin

  inherited;
end;

end.
