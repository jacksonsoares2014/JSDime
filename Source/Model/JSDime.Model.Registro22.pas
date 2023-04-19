unit JSDime.Model.Registro22;

interface

uses
  JSDime.Model.Attributes,
  JSDime.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;


type
  TJSDimeModelRegistro22 = class(TJSDimeModelRegistro)
  private
    Fcfop                          : string;
    FvalorContabil                 : Currency;
    FbaseCalculo                   : Currency;
    FimpostoCreditado              : Currency;
    FisentasNaoTributadas          : Currency;
    Foutras                        : Currency;
    FbaseCalculoImpostoRetido      : Currency;
    FimpostoRetido                 : Currency;
    FdiferencaAliquota             : Currency;
  public
    [Obrigatorio('CFOP')]
    property cfop                          : string    read Fcfop                      write Fcfop;

    [ValorPositivo('Valor Contábil')]
    property valorContabil                 : Currency  read FvalorContabil             write FvalorContabil;

    [ValorPositivo('Base de Cálculo')]
    property baseCalculo                   : Currency  read FbaseCalculo               write FbaseCalculo;

    [ValorPositivo('Imposto Creditado')]
    property impostoCreditado              : Currency  read FimpostoCreditado          write FimpostoCreditado;

    [ValorPositivo('Valor Isento ou Não Tributado')]
    property isentasNaoTributadas          : Currency  read FisentasNaoTributadas      write FisentasNaoTributadas;

    [ValorPositivo('Valor Outros')]
    property outras                        : Currency  read Foutras                    write Foutras;

    [ValorPositivo('Base de Cálculo do Imposto Retido')]
    property baseCalculoImpostoRetido      : Currency  read FbaseCalculoImpostoRetido  write FbaseCalculoImpostoRetido;

    [ValorPositivo('Imposto Retido')]
    property impostoRetido                 : Currency  read FimpostoRetido             write FimpostoRetido;

    [ValorPositivo('Diferencial de Aliquota')]
    property diferencaAliquota             : Currency  read FdiferencaAliquota         write FdiferencaAliquota;

    class function getComparer: IComparer<TJSDimeModelRegistro22>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro22 }

constructor TJSDimeModelRegistro22.create;
begin
  inherited;
  reg    := '22';
  quadro := '01';
end;

destructor TJSDimeModelRegistro22.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro22.getComparer: IComparer<TJSDimeModelRegistro22>;
begin
  result := TComparer<TJSDimeModelRegistro22>.Construct(
    function(const Left, Right: TJSDimeModelRegistro22): Integer
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
