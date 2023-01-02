unit JSDime.Model.Registro46;

interface

uses
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro46 = class(TJSDimeModelRegistro)
  private
    Fsequencia      : Integer;
    Fidentificacao  : string;
    Fvalor          : Currency;
    Forigem         : string;
  public
    property sequencia      : Integer    read Fsequencia      write Fsequencia;
    property identificacao  : string     read Fidentificacao  write Fidentificacao;
    property valor          : Currency   read Fvalor          write Fvalor;
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
