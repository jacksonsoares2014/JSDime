unit JSDime.Model.Registro99;

interface

uses
  JSDime.Model.Attributes,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro99 = class(TJSDimeModelRegistro)
  private
    FqtdReg         : Integer;
    FqtdDeclaracoes : Integer;
  public
    [Obrigatorio('Quantidade de Registros no Arquivo')]
    [ValorPositivo('Quantidade de Registros no Arquivo')]
    property qtdReg        : Integer read FqtdReg         write FqtdReg;

    [Obrigatorio('Quantidade de Declarações')]
    [ValorPositivo('Quantidade de Declarações')]
    property qtdDeclaracoes: Integer read FqtdDeclaracoes write FqtdDeclaracoes;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro99 }

constructor TJSDimeModelRegistro99.create;
begin
  inherited;
  reg    := '99';
  quadro := '  ';
end;

destructor TJSDimeModelRegistro99.Destroy;
begin

  inherited;
end;

end.
