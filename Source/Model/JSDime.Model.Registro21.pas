unit JSDime.Model.Registro21;

interface

uses
  JSDime.Model.Types,
  JSDime.Model.Attributes,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro21 = class(TJSDimeModelRegistro)
  private
    FnumeroInscricao               : string;
    FnomeContribuinte              : string;
    FperiodoReferencia             : string;
    FtipoDeclaracao                : TJSDimeTipoDeclaracao;
    FregimeApuracao                : TJSDimeRegimeApuracao;
    FporteEmpresa                  : TJSDimeNaoSeAplica;
    FapuracaoConsolidada           : TJSDimeApuracaoConsolidada;
    FapuracaoCentralizada          : TJSDimeNaoSeAplica;
    FtransfCreditos                : TJSDimeTransferenciaCredito;
    FtemCreditosPresumidos         : TJSDimeNaoSeAplica;
    FtemCreditosIncentivosFiscais  : TJSDimeNaoSeAplica;
    Fmovimento                     : TJSDimeMovimento;
    FsubstitutoTributario          : TJSDimeSubstitutoTributario;
    FtemEscritaContabil            : TJSDimeEscritaContabil;
    FquantidadeTrabalhadores       : integer;

  public
    [Obrigatorio('N�mero de Inscri��o')]
    property numeroInscricao               : string                      read FnumeroInscricao              write FnumeroInscricao;

    [Obrigatorio('Nome do Contribuinte')]
    property nomeContribuinte              : string                      read FnomeContribuinte             write FnomeContribuinte;

    [Obrigatorio('Per�odo de refer�ncia')]
    property periodoReferencia             : string                      read FperiodoReferencia            write FperiodoReferencia;

    [Obrigatorio('Tipo de declara��o')]
    property tipoDeclaracao                : TJSDimeTipoDeclaracao       read FtipoDeclaracao               write FtipoDeclaracao;

    [Obrigatorio('Regime de Apura��o')]
    property regimeApuracao                : TJSDimeRegimeApuracao       read FregimeApuracao               write FregimeApuracao;

    [Obrigatorio('Porte da empresa')]
    property porteEmpresa                  : TJSDimeNaoSeAplica          read FporteEmpresa                 write FporteEmpresa;

    [Obrigatorio('Apura��o consolidada')]
    property apuracaoConsolidada           : TJSDimeApuracaoConsolidada  read FapuracaoConsolidada          write FapuracaoConsolidada;

    [Obrigatorio('Apura��o centralizada')]
    property apuracaoCentralizada          : TJSDimeNaoSeAplica          read FapuracaoCentralizada         write FapuracaoCentralizada;

    [Obrigatorio('Transfer�ncia de cr�ditos')]
    property transfCreditos                : TJSDimeTransferenciaCredito read FtransfCreditos               write FtransfCreditos;

    [Obrigatorio('Tem cr�ditos presumidos')]
    property temCreditosPresumidos         : TJSDimeNaoSeAplica          read FtemCreditosPresumidos        write FtemCreditosPresumidos;

    [Obrigatorio('Tem cr�d p/incentivos fiscais')]
    property temCreditosIncentivosFiscais  : TJSDimeNaoSeAplica          read FtemCreditosIncentivosFiscais write FtemCreditosIncentivosFiscais;

    [Obrigatorio('Movimento')]
    property movimento                     : TJSDimeMovimento            read Fmovimento                    write Fmovimento;

    [Obrigatorio('Substituto Tribut�rio')]
    property substitutoTributario          : TJSDimeSubstitutoTributario read FsubstitutoTributario         write FsubstitutoTributario;

    [Obrigatorio('Tem escrita cont�bil')]
    property temEscritaContabil            : TJSDimeEscritaContabil      read FtemEscritaContabil           write FtemEscritaContabil;

    property quantidadeTrabalhadores       : integer                     read FquantidadeTrabalhadores      write FquantidadeTrabalhadores;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro21 }

constructor TJSDimeModelRegistro21.create;
begin
  inherited;
  reg    := '21';
  quadro := '00';
end;

destructor TJSDimeModelRegistro21.Destroy;
begin

  inherited;
end;

end.
