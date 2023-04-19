unit JSDime.Model.Registro46;

interface

uses
  JSDime.Model.Attributes,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro46 = class(TJSDimeModelRegistro)
  private
    Fsequencia      : Integer;
    Fidentificacao  : string;
    Fvalor          : Currency;
    Forigem         : string;
  public
    [Obrigatorio('Sequência')]
    property sequencia      : Integer    read Fsequencia      write Fsequencia;

    [Obrigatorio('Identificação')]
    property identificacao  : string     read Fidentificacao  write Fidentificacao;

    [Obrigatorio('Valor')]
    [ValorPositivo('Valor')]
    property valor          : Currency   read Fvalor          write Fvalor;

    [Obrigatorio('Origem')]
    property origem         : string     read Forigem         write Forigem;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro46 }

constructor TJSDimeModelRegistro46.create;
begin
  inherited;
  reg    := '46';
  quadro := '46';
end;

destructor TJSDimeModelRegistro46.Destroy;
begin

  inherited;
end;

end.
