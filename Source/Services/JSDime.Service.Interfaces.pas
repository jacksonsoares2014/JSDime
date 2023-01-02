unit JSDime.Service.Interfaces;

interface

uses
  JSDime.DAO.Interfaces,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  System.Classes,
  System.Generics.Collections;


type
  TOnDimeAddRegistro = reference to procedure (Registro: TJSDimeModelRegistro);

  IJSDimeConfig<I: IInterface> = interface;
  IJSDimeDAOCollection = interface;
  IJSDimeEmitente = interface;

  IJSDimeService = interface
    ['{3E71A108-8F96-456F-BF2F-DA04F9668917}']
    function Emitente: IJSDimeEmitente;
    function Config  : IJSDimeConfig<IJSDimeService>;
    function DAO     : IJSDimeDAOCollection;

    function Execute: IJSDimeService;
  end;

  IJSDimeServiceRegistros = interface
    ['{865BF6D7-A093-49DD-B0D0-EDE92E38CA4C}']
    function Execute: TStrings;

    function &End: IJSDimeService;
  end;

  IJSDimeConfig<I: IInterface> = interface
    ['{73F130DF-C7B7-40DA-A6B0-0DDF9F6951AC}']
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
    function TipoDeclaracao         : TJSDimeTipoDeclaracao;                            overload;
    function RegimeApuracao         : TJSDimeRegimeApuracao;                            overload;
    function ApuracaoConsolidada    : TJSDimeApuracaoConsolidada;                       overload;
    function TranferenciaCredito    : TJSDimeTransferenciaCredito;                      overload;
    function Movimento              : TJSDimeMovimento;                                 overload;
    function SubstitutoTributario   : TJSDimeSubstitutoTributario;                      overload;
    function TemEscritaContabil     : TJSDimeEscritaContabil;                           overload;
    function NumeroTrabalhadores    : Integer;                                          overload;
    function NomeArquivo            : String;                                           overload;
    function GerarRelatorio         : Boolean;                                          overload;
    function UtilizaSoCredDCIP      : Boolean;                                          overload;

    function OnAddRegistro(Value: TOnDimeAddRegistro): IJSDimeConfig<I>; overload;
    function OnAddRegistro: TOnDimeAddRegistro; overload;

    function &Begin: IJSDimeConfig<I>;
    function &End: I;
  end;

  IJSDimeDAOCollection = interface
    ['{F1A7E836-A8B4-43A9-91D6-B2D550AC7C4E}']
    function AddRegistro20        (Value: IJSDimeDAORegistro20)        : IJSDimeDAOCollection;
    function AddRegistro22Quadro01(Value: IJSDimeDAORegistro22Quadro01): IJSDimeDAOCollection;
    function AddRegistro23Quadro02(Value: IJSDimeDAORegistro23Quadro02): IJSDimeDAOCollection;
    function AddRegistro25Quadro04(Value: IJSDimeDAORegistro25Quadro04): IJSDimeDAOCollection;
    function AddRegistro26Quadro05(Value: IJSDimeDAORegistro26Quadro05): IJSDimeDAOCollection;
    function AddRegistro30Quadro09(Value: IJSDimeDAORegistro30Quadro09): IJSDimeDAOCollection;
    function AddRegistro32Quadro11(Value: IJSDimeDAORegistro32Quadro11): IJSDimeDAOCollection;
    function AddRegistro33Quadro12(Value: IJSDimeDAORegistro33Quadro12): IJSDimeDAOCollection;
    function AddRegistro35Quadro14(Value: IJSDimeDAORegistro35Quadro14): IJSDimeDAOCollection;
    function AddRegistro46Quadro46(Value: IJSDimeDAORegistro46Quadro46): IJSDimeDAOCollection;

//    function AddRegistro47Quadro47(Value: IJSDimeDAORegistro47Quadro47): IJSDimeDAOCollection;
    function AddRegistro49Quadro49(Value: IJSDimeDAORegistro49Quadro49): IJSDimeDAOCollection;
    function AddRegistro50Quadro50(Value: IJSDimeDAORegistro50Quadro50): IJSDimeDAOCollection;
    function AddRegistro80Quadro80(Value: IJSDimeDAORegistro80Quadro80): IJSDimeDAOCollection;
    function AddRegistro81Quadro81(Value: IJSDimeDAORegistro81Quadro81): IJSDimeDAOCollection;
    function AddRegistro82Quadro82(Value: IJSDimeDAORegistro82Quadro82): IJSDimeDAOCollection;
    function AddRegistro83Quadro83(Value: IJSDimeDAORegistro83Quadro83): IJSDimeDAOCollection;
    function AddRegistro84Quadro84(Value: IJSDimeDAORegistro84Quadro84): IJSDimeDAOCollection;

    function DAORegistro20        : IJSDimeDAORegistro20;
    function DAORegistro22Quadro01: IJSDimeDAORegistro22Quadro01;
    function DAORegistro23Quadro02: IJSDimeDAORegistro23Quadro02;
    function DAORegistro25Quadro04: IJSDimeDAORegistro25Quadro04;
    function DAORegistro26Quadro05: IJSDimeDAORegistro26Quadro05;
    function DAORegistro30Quadro09: IJSDimeDAORegistro30Quadro09;
    function DAORegistro32Quadro11: IJSDimeDAORegistro32Quadro11;
    function DAORegistro33Quadro12: IJSDimeDAORegistro33Quadro12;
    function DAORegistro35Quadro14: IJSDimeDAORegistro35Quadro14;
    function DAORegistro46Quadro46: IJSDimeDAORegistro46Quadro46;

//    function DAORegistro47Quadro47: IJSDimeDAORegistro47Quadro47;
    function DAORegistro49Quadro49: IJSDimeDAORegistro49Quadro49;
    function DAORegistro50Quadro50: IJSDimeDAORegistro50Quadro50;
    function DAORegistro80Quadro80: IJSDimeDAORegistro80Quadro80;
    function DAORegistro81Quadro81: IJSDimeDAORegistro81Quadro81;
    function DAORegistro82Quadro82: IJSDimeDAORegistro82Quadro82;
    function DAORegistro83Quadro83: IJSDimeDAORegistro83Quadro83;
    function DAORegistro84Quadro84: IJSDimeDAORegistro84Quadro84;

    function &Begin: IJSDimeDAOCollection;
    function &End: IJSDimeService;
  end;

  IJSDimeEmitente = interface
    ['{95460EB1-113F-4757-B45A-3416B8A62FBF}']
    function CNPJ             (Value: String): IJSDimeEmitente; overload;
    function IncricaoEstadual (Value: String): IJSDimeEmitente; overload;
    function Nome             (Value: String): IJSDimeEmitente; overload;

    function CNPJ              : string; overload;
    function IncricaoEstadual  : string; overload;
    function Nome              : string; overload;

    function &End: IJSDimeService;
  end;

  IJSDimeServiceFactory = interface
    ['{03F7F844-197F-4667-9646-A661C7B3B38D}']
    function createService: IJSDimeService;
  end;

function DimeServiceFactory: IJSDimeServiceFactory;
function DimeService: IJSDimeService;

//////////////////
//  IJSDimeServiceRegistro24Quadro03
//IJSDimeServiceRegistro35Quadro14


implementation

uses
  JSDime.Service.Factory;

function DimeService: IJSDimeService;
begin
  result := DimeServiceFactory.createService;
end;

function DimeServiceFactory: IJSDimeServiceFactory;
begin
  Result := TJSDimeServiceFactory.New;
end;

end.
