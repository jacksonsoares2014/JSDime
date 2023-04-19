unit JSDime.Model.Registro50;

interface

uses
  JSDime.Model.Registro,
  JSDime.Model.Attributes,
  System.Generics.Defaults;

type
  TJSDimeModelRegistro50 = class(TJSDimeModelRegistro)
  private
    FsiglaEstado                   : string;
    FvalorContabilNaoContribuinte  : Currency;
    FvalorContabilContribuinte     : Currency;
    FbaseCalculoNaoContribuinte    : Currency;
    FbaseCalculoContribuinte       : Currency;
    Foutras                        : Currency;
    fsubstituicaoTributaria        : Currency;
  public
    [Obrigatorio('Unidade da Federação')]
    property siglaEstado                  : string   read FsiglaEstado                  write FsiglaEstado;

    [ValorPositivo('Valor Contábil Não Contribuinte')]
    property valorContabilNaoContribuinte : Currency read FvalorContabilNaoContribuinte write FvalorContabilNaoContribuinte;

    [ValorPositivo('Valor Contábil Contribuinte')]
    property valorContabilContribuinte    : Currency read FvalorContabilContribuinte    write FvalorContabilContribuinte;

    [ValorPositivo('Base de Cálculo Não Contribuinte')]
    property baseCalculoNaoContribuinte   : Currency read FbaseCalculoNaoContribuinte   write FbaseCalculoNaoContribuinte;

    [ValorPositivo('Base de Cálculo Contribuinte')]
    property baseCalculoContribuinte      : Currency read FbaseCalculoContribuinte      write FbaseCalculoContribuinte;

    [ValorPositivo('Valor Outros')]
    property outras                       : Currency read Foutras                       write Foutras;

    [ValorPositivo('Valor Substituição Tributária')]
    property substituicaoTributaria       : Currency read fsubstituicaoTributaria       write fsubstituicaoTributaria;

    class function getComparer: IComparer<TJSDimeModelRegistro50>;
    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro50 }

constructor TJSDimeModelRegistro50.create;
begin
  inherited;
  reg    := '50';
  quadro := '50';
end;

destructor TJSDimeModelRegistro50.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro50.getComparer: IComparer<TJSDimeModelRegistro50>;
begin
  result := TComparer<TJSDimeModelRegistro50>.Construct(
    function(const Left, Right: TJSDimeModelRegistro50): Integer
    begin
      if Left.siglaEstado < Right.siglaEstado then
        Result := -1
      else if Left.siglaEstado > Right.siglaEstado then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
