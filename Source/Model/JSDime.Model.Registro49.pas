unit JSDime.Model.Registro49;

interface

uses
  JSDime.Model.Registro,
  JSDime.Model.Attributes,
  System.Generics.Defaults;

type
  TJSDimeModelRegistro49 = class(TJSDimeModelRegistro)
  private
    FsiglaEstado             : string;
    FvalorContabil           : Currency;
    FbaseCalculo             : Currency;
    Foutras                  : Currency;
    FpetroleEnergia          : Currency;
    fsubstituicaoTributaria  : Currency;
  public
    [Obrigatorio('Unidade da Federação')]
    property siglaEstado             : string   read FsiglaEstado            write FsiglaEstado;

    [ValorPositivo('Valor Contábil')]
    property valorContabil           : Currency read FvalorContabil          write FvalorContabil;

    [ValorPositivo('Base de Cálculo')]
    property baseCalculo             : Currency read FbaseCalculo            write FbaseCalculo;

    [ValorPositivo('Valor Outros')]
    property outras                  : Currency read Foutras                 write Foutras;

    [ValorPositivo('Valor Petóleo/Energia Elétrica')]
    property petroleEnergia          : Currency read FpetroleEnergia         write FpetroleEnergia;

    [ValorPositivo('Valor Substituição Tributária')]
    property substituicaoTributaria  : Currency read fsubstituicaoTributaria write fsubstituicaoTributaria;

    class function getComparer: IComparer<TJSDimeModelRegistro49>;
    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro49 }

constructor TJSDimeModelRegistro49.create;
begin
  inherited;
  reg    := '49';
  quadro := '49';
end;

destructor TJSDimeModelRegistro49.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro49.getComparer: IComparer<TJSDimeModelRegistro49>;
begin
  result := TComparer<TJSDimeModelRegistro49>.Construct(
    function(const Left, Right: TJSDimeModelRegistro49): Integer
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
