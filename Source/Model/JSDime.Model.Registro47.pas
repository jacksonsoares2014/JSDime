unit JSDime.Model.Registro47;

interface

uses
  JSDime.Model.Attributes,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro47 = class(TJSDimeModelRegistro)
  private
    FcodigoMunicipio : string;
    Fvalor           : Currency;
  public
    [Obrigatorio('Código do Município')]
    property codigoMunicipio  : string     read FcodigoMunicipio  write FcodigoMunicipio;

    [Obrigatorio('Valor')]
    [ValorPositivo('Valor')]
    property valor            : Currency   read Fvalor            write Fvalor;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro47 }

constructor TJSDimeModelRegistro47.create;
begin
  inherited;
  reg    := '47';
  quadro := '47';
end;

destructor TJSDimeModelRegistro47.Destroy;
begin

  inherited;
end;

end.
