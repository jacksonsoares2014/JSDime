unit JSDime.Model.Registro20;

interface

uses
  JSDime.Model.Attributes,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro20 = class(TJSDimeModelRegistro)
  private
    [Obrigatorio('CPF do Contador')]
    Fcpf             : String;

    [Obrigatorio('Nome do Contador')]
    FnomeContabilista: String;

    [Obrigatorio('DataHora da geração do arquivo')]
    FdataHora        : String;
  public
    property cpf              : String    read Fcpf              write Fcpf;
    property nomeContabilista : String    read FnomeContabilista write FnomeContabilista;
    property dataHora         : String    read FdataHora         write FdataHora;

    constructor create; override;
  end;

implementation

{ TJSDimeModelRegistro20 }

constructor TJSDimeModelRegistro20.create;
begin
  inherited;
  reg    := '20';
  quadro := '  ';
end;

end.
