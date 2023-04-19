unit JSDime.Service.Config;

interface

uses
  JSDime.Service.Interfaces,
  JSDime.Model.Types,
  System.SysUtils;

type
  TJSDimeServiceConfig<I: IInterface> = class(TInterfacedObject, IJSDimeConfig<I>)
  private
    [Weak]
    FParent: I;

    FDataInicial            : TDateTime;
    FDataFinal              : TDateTime;
    FTipoDeclaracao         : TJSDimeTipoDeclaracao;
    FRegimeApuracao         : TJSDimeRegimeApuracao;
    FApuracaoConsolidada    : TJSDimeApuracaoConsolidada;
    FTranferenciaCredito    : TJSDimeTransferenciaCredito;
    FMovimento              : TJSDimeMovimento;
    FSubstitutoTributario   : TJSDimeSubstitutoTributario;
    FTemEscritaContabil     : TJSDimeEscritaContabil;
    FNumeroTrabalhadores    : Integer;
    FNomeArquivo            : String;
    FGerarRelatorio         : Boolean;
    FUtilizaSoCredDCIP      : Boolean;
    FOnAddRegistro          : TOnDimeAddRegistro;
    FOnLogErro              : TOnLogErro;

  public
    function DataInicial            (Value: TDateTime)                                         : IJSDimeConfig<I>; overload;
    function DataFinal              (Value: TDateTime)                                         : IJSDimeConfig<I>; overload;
    function TipoDeclaracao         (Value: TJSDimeTipoDeclaracao)                             : IJSDimeConfig<I>; overload;
    function RegimeApuracao         (Value: TJSDimeRegimeApuracao)                             : IJSDimeConfig<I>; overload;
    function ApuracaoConsolidada    (Value: TJSDimeApuracaoConsolidada)                        : IJSDimeConfig<I>; overload;
    function TranferenciaCredito    (Value: TJSDimeTransferenciaCredito)                       : IJSDimeConfig<I>; overload;
    function Movimento              (Value: TJSDimeMovimento)                                  : IJSDimeConfig<I>; overload;
    function SubstitutoTributario   (Value: TJSDimeSubstitutoTributario)                       : IJSDimeConfig<I>; overload;
    function TemEscritaContabil     (Value: TJSDimeEscritaContabil)                            : IJSDimeConfig<I>; overload;
    function NumeroTrabalhadores    (Value: Integer)                                           : IJSDimeConfig<I>; overload;
    function NomeArquivo            (Value: String)                                            : IJSDimeConfig<I>; overload;
    function GerarRelatorio         (Value: Boolean)                                           : IJSDimeConfig<I>; overload;
    function UtilizaSoCredDCIP      (Value: Boolean)                                           : IJSDimeConfig<I>; overload;

    function DataInicial            : TDateTime;                                        overload;
    function DataFinal              : TDateTime;                                        overload;
    function TipoDeclaracao         : TJSDimeTipoDeclaracao                             overload;
    function RegimeApuracao         : TJSDimeRegimeApuracao                             overload;
    function ApuracaoConsolidada    : TJSDimeApuracaoConsolidada                        overload;
    function TranferenciaCredito    : TJSDimeTransferenciaCredito                       overload;
    function Movimento              : TJSDimeMovimento                                  overload;
    function SubstitutoTributario   : TJSDimeSubstitutoTributario                       overload;
    function TemEscritaContabil     : TJSDimeEscritaContabil                            overload;
    function NumeroTrabalhadores    : Integer                                           overload;
    function NomeArquivo            : String                                            overload;
    function GerarRelatorio         : Boolean                                           overload;
    function UtilizaSoCredDCIP      : Boolean;                                          overload;

    function OnAddRegistro(Value: TOnDimeAddRegistro): IJSDimeConfig<I>; overload;
    function OnAddRegistro: TOnDimeAddRegistro; overload;

    function OnLogErro(Value: TOnLogErro): IJSDimeConfig<I>; overload;
    function OnLogErro: TOnLogErro; overload;

    function &Begin: IJSDimeConfig<I>;
    function &End: I;

    class function New(Parent: I): IJSDimeConfig<I>;
    constructor create(Parent: I);
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeServiceConfig<I> }

function TJSDimeServiceConfig<I>.ApuracaoConsolidada(
  Value: TJSDimeApuracaoConsolidada): IJSDimeConfig<I>;
begin
  result := Self;
  FApuracaoConsolidada := Value;
end;

function TJSDimeServiceConfig<I>.ApuracaoConsolidada: TJSDimeApuracaoConsolidada;
begin
  result := FApuracaoConsolidada;
end;

function TJSDimeServiceConfig<I>.&Begin: IJSDimeConfig<I>;
begin
  result := Self;
end;

constructor TJSDimeServiceConfig<I>.create(Parent: I);
begin
  FParent := Parent;
end;

function TJSDimeServiceConfig<I>.DataFinal(Value: TDateTime): IJSDimeConfig<I>;
begin
  result := Self;
  FDataFinal := Value;
end;

function TJSDimeServiceConfig<I>.DataFinal: TDateTime;
begin
  result := FDataFinal;
end;

function TJSDimeServiceConfig<I>.DataInicial: TDateTime;
begin
  result := FDataInicial;
end;

function TJSDimeServiceConfig<I>.DataInicial(
  Value: TDateTime): IJSDimeConfig<I>;
begin
  result := Self;
  FDataInicial := Value;
end;

destructor TJSDimeServiceConfig<I>.Destroy;
begin

  inherited;
end;

function TJSDimeServiceConfig<I>.&End: I;
begin
  result := FParent;
end;

function TJSDimeServiceConfig<I>.GerarRelatorio: Boolean;
begin
  result := FGerarRelatorio;
end;

function TJSDimeServiceConfig<I>.GerarRelatorio(
  Value: Boolean): IJSDimeConfig<I>;
begin
  result := Self;
  FGerarRelatorio := Value;
end;

function TJSDimeServiceConfig<I>.Movimento(
  Value: TJSDimeMovimento): IJSDimeConfig<I>;
begin
  result := Self;
  FMovimento := Value;
end;

function TJSDimeServiceConfig<I>.Movimento: TJSDimeMovimento;
begin
  result := FMovimento;
end;

class function TJSDimeServiceConfig<I>.New(Parent: I): IJSDimeConfig<I>;
begin
  result := Self.create(Parent);
end;

function TJSDimeServiceConfig<I>.NomeArquivo: String;
begin
  result := FNomeArquivo;
end;

function TJSDimeServiceConfig<I>.NomeArquivo(Value: String): IJSDimeConfig<I>;
begin
  result := Self;
  FNomeArquivo := Value;
end;

function TJSDimeServiceConfig<I>.NumeroTrabalhadores(
  Value: Integer): IJSDimeConfig<I>;
begin
  result := Self;
  FNumeroTrabalhadores := Value;
end;

function TJSDimeServiceConfig<I>.NumeroTrabalhadores: Integer;
begin
  result := FNumeroTrabalhadores;
end;

function TJSDimeServiceConfig<I>.OnAddRegistro: TOnDimeAddRegistro;
begin
  Result := FOnAddRegistro;
end;

function TJSDimeServiceConfig<I>.OnLogErro: TOnLogErro;
begin
  Result := FOnLogErro;
end;

function TJSDimeServiceConfig<I>.OnLogErro(Value: TOnLogErro): IJSDimeConfig<I>;
begin
  result := Self;
  FOnLogErro := Value;
end;

function TJSDimeServiceConfig<I>.OnAddRegistro(
  Value: TOnDimeAddRegistro): IJSDimeConfig<I>;
begin
  result := Self;
  FOnAddRegistro := Value;
end;

function TJSDimeServiceConfig<I>.RegimeApuracao: TJSDimeRegimeApuracao;
begin
  result := FRegimeApuracao;
end;

function TJSDimeServiceConfig<I>.RegimeApuracao(
  Value: TJSDimeRegimeApuracao): IJSDimeConfig<I>;
begin
  result := Self;
  FRegimeApuracao := Value;
end;

function TJSDimeServiceConfig<I>.SubstitutoTributario: TJSDimeSubstitutoTributario;
begin
  result := FSubstitutoTributario;
end;

function TJSDimeServiceConfig<I>.SubstitutoTributario(
  Value: TJSDimeSubstitutoTributario): IJSDimeConfig<I>;
begin
  result := Self;
  FSubstitutoTributario := Value;
end;

function TJSDimeServiceConfig<I>.TemEscritaContabil(
  Value: TJSDimeEscritaContabil): IJSDimeConfig<I>;
begin
  result := Self;
  FTemEscritaContabil := Value;
end;

function TJSDimeServiceConfig<I>.TemEscritaContabil: TJSDimeEscritaContabil;
begin
  result := FTemEscritaContabil;
end;

function TJSDimeServiceConfig<I>.TipoDeclaracao(
  Value: TJSDimeTipoDeclaracao): IJSDimeConfig<I>;
begin
  result := Self;
  FTipoDeclaracao := Value;
end;

function TJSDimeServiceConfig<I>.TipoDeclaracao: TJSDimeTipoDeclaracao;
begin
  result := FTipoDeclaracao;
end;

function TJSDimeServiceConfig<I>.TranferenciaCredito(
  Value: TJSDimeTransferenciaCredito): IJSDimeConfig<I>;
begin
  result := Self;
  FTranferenciaCredito := Value;
end;

function TJSDimeServiceConfig<I>.TranferenciaCredito: TJSDimeTransferenciaCredito;
begin
  result := FTranferenciaCredito;
end;

function TJSDimeServiceConfig<I>.UtilizaSoCredDCIP: Boolean;
begin
  result := FUtilizaSoCredDCIP;
end;

function TJSDimeServiceConfig<I>.UtilizaSoCredDCIP(
  Value: Boolean): IJSDimeConfig<I>;
begin
  result := Self;
  FUtilizaSoCredDCIP := Value;
end;

end.
