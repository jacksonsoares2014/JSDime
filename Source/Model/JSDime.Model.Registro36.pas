unit JSDime.Model.Registro36;

interface

uses
  System.Generics.Defaults,
  JSDime.Model.Attributes,
  JSDime.Model.Types,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro36 = class(TJSDimeModelRegistro)
  private
    FcodigoCalculoFundoSocial: TJSDimeCodigoCalculoFundoSocial;
    Fsequencia: Integer;
    FvalorICMSExoneradoDevolucao: Currency;
    FvalorFUMDES: Currency;
    FvalorFundoSocialDevolucao: Currency;
    FvalorBaseCalculoICMS: Currency;
    FsubtipoDCIPsemExigenciaTTD: string;
    FcodigoCalculoFUMDES: TJSDimeCodigoCalculoFUMDES;
    FvalorICMSExonerado: Currency;
    FcodigoBeneficioTTD: string;
    FvalorFundoSocial: Currency;
    FvalorFUMDESDevolucao: Currency;
    FvalorBaseCalculoICMSDevolucao: Currency;
    FnumeroConcessaoTTD: string;

  public
    [Obrigatorio('Sequência')]
    property sequencia                     : Integer                         read Fsequencia                     write Fsequencia;

    property codigoBeneficioTTD            : string                          read FcodigoBeneficioTTD            write FcodigoBeneficioTTD;
    property numeroConcessaoTTD            : string                          read FnumeroConcessaoTTD            write FnumeroConcessaoTTD;
    property subtipoDCIPsemExigenciaTTD    : string                          read FsubtipoDCIPsemExigenciaTTD    write FsubtipoDCIPsemExigenciaTTD;

    [ValorPositivo('Base de Cálculo ICMS')]
    property valorBaseCalculoICMS          : Currency                        read FvalorBaseCalculoICMS          write FvalorBaseCalculoICMS;

    [ValorPositivo('Valor ICMS Exonerado')]
    property valorICMSExonerado            : Currency                        read FvalorICMSExonerado            write FvalorICMSExonerado;

    property codigoCalculoFUMDES           : TJSDimeCodigoCalculoFUMDES      read FcodigoCalculoFUMDES           write FcodigoCalculoFUMDES;

    [ValorPositivo('Valor FUMDES')]
    property valorFUMDES                   : Currency                        read FvalorFUMDES                   write FvalorFUMDES;

    property codigoCalculoFundoSocial      : TJSDimeCodigoCalculoFundoSocial read FcodigoCalculoFundoSocial      write FcodigoCalculoFundoSocial;

    [ValorPositivo('Valor Fundo Social')]
    property valorFundoSocial              : Currency                        read FvalorFundoSocial              write FvalorFundoSocial;

    [ValorPositivo('Base de Cálculo ICMS Devolução')]
    property valorBaseCalculoICMSDevolucao : Currency                        read FvalorBaseCalculoICMSDevolucao write FvalorBaseCalculoICMSDevolucao;

    [ValorPositivo('Valor do ICMS Exonerado Devolução')]
    property valorICMSExoneradoDevolucao   : Currency                        read FvalorICMSExoneradoDevolucao   write FvalorICMSExoneradoDevolucao;

    [ValorPositivo('Valor FUMDES Devolução')]
    property valorFUMDESDevolucao          : Currency                        read FvalorFUMDESDevolucao          write FvalorFUMDESDevolucao;

    [ValorPositivo('Valor Fundo Social Devolução')]
    property valorFundoSocialDevolucao     : Currency                        read FvalorFundoSocialDevolucao     write FvalorFundoSocialDevolucao;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro36 }

constructor TJSDimeModelRegistro36.create;
begin
  inherited;
  reg    := '36';
  quadro := '15';
end;

destructor TJSDimeModelRegistro36.Destroy;
begin

  inherited;
end;

end.
