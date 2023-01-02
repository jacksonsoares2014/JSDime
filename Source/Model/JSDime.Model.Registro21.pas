unit JSDime.Model.Registro21;

interface

uses
  JSDime.Model.Types,
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
    property numeroInscricao               : string                      read FnumeroInscricao              write FnumeroInscricao;
    property nomeContribuinte              : string                      read FnomeContribuinte             write FnomeContribuinte;
    property periodoReferencia             : string                      read FperiodoReferencia            write FperiodoReferencia;
    property tipoDeclaracao                : TJSDimeTipoDeclaracao       read FtipoDeclaracao               write FtipoDeclaracao;
    property regimeApuracao                : TJSDimeRegimeApuracao       read FregimeApuracao               write FregimeApuracao;
    property porteEmpresa                  : TJSDimeNaoSeAplica          read FporteEmpresa                 write FporteEmpresa;
    property apuracaoConsolidada           : TJSDimeApuracaoConsolidada  read FapuracaoConsolidada          write FapuracaoConsolidada;
    property apuracaoCentralizada          : TJSDimeNaoSeAplica          read FapuracaoCentralizada         write FapuracaoCentralizada;
    property transfCreditos                : TJSDimeTransferenciaCredito read FtransfCreditos               write FtransfCreditos;
    property temCreditosPresumidos         : TJSDimeNaoSeAplica          read FtemCreditosPresumidos        write FtemCreditosPresumidos;
    property temCreditosIncentivosFiscais  : TJSDimeNaoSeAplica          read FtemCreditosIncentivosFiscais write FtemCreditosIncentivosFiscais;
    property movimento                     : TJSDimeMovimento            read Fmovimento                    write Fmovimento;
    property substitutoTributario          : TJSDimeSubstitutoTributario read FsubstitutoTributario         write FsubstitutoTributario;
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
