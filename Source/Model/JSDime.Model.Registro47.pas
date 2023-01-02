unit JSDime.Model.Registro47;

interface

uses
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro47 = class(TJSDimeModelRegistro)
  private
    FcodigoMunicipio : string;
    Fvalor           : Currency;
  public
    property codigoMunicipio  : string     read FcodigoMunicipio  write FcodigoMunicipio;
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
