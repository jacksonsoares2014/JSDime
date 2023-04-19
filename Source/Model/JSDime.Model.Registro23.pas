unit JSDime.Model.Registro23;

interface

uses
  JSDime.Model.Attributes,
  JSDime.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSDimeModelRegistro23 = class(TJSDimeModelRegistro)
  private
    Fcfop                          : string;
    FvalorContabil                 : Currency;
    FbaseCalculo                   : Currency;
    FimpostoDebitado               : Currency;
    FisentasNaoTributadas          : Currency;
    Foutras                        : Currency;
    FbaseCalculoImpostoRetido      : Currency;
    FimpostoRetido                 : Currency;
  public
    [Obrigatorio('CFOP')]
    property cfop                          : string    read Fcfop                      write Fcfop;

    [ValorPositivo('Valor Contábil')]
    property valorContabil                 : Currency  read FvalorContabil             write FvalorContabil;

    [ValorPositivo('Base de Cálculo')]
    property baseCalculo                   : Currency  read FbaseCalculo               write FbaseCalculo;

    [ValorPositivo('Imposto Debitado')]
    property impostoDebitado               : Currency  read FimpostoDebitado           write FimpostoDebitado;

    [ValorPositivo('Valor Isento ou Não Tributado')]
    property isentasNaoTributadas          : Currency  read FisentasNaoTributadas      write FisentasNaoTributadas;

    [ValorPositivo('Valor Outros')]
    property outras                        : Currency  read Foutras                    write Foutras;

    [ValorPositivo('Base de Cálculo do Imposto Retido')]
    property baseCalculoImpostoRetido      : Currency  read FbaseCalculoImpostoRetido  write FbaseCalculoImpostoRetido;

    [ValorPositivo('Imposto Retido')]
    property impostoRetido                 : Currency  read FimpostoRetido             write FimpostoRetido;

    class function getComparer: IComparer<TJSDimeModelRegistro23>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro23 }

constructor TJSDimeModelRegistro23.create;
begin
  inherited;
  reg    := '23';
  quadro := '02';
end;

destructor TJSDimeModelRegistro23.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro23.getComparer: IComparer<TJSDimeModelRegistro23>;
begin
  result := TComparer<TJSDimeModelRegistro23>.Construct(
    function(const Left, Right: TJSDimeModelRegistro23): Integer
    begin
      if Left.cfop < Right.cfop then
        Result := -1
      else if Left.cfop > Right.cfop then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
