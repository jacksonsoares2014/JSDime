unit JSDime.Model.Registro33;

interface

uses
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro33 = class(TJSDimeModelRegistro)
  private
    ForigemRecolhimento            : string;
    FcodigoReceita                 : string;
    FdataVencimento                : TDateTime;
    Fvalor                         : Currency;
    FclasseVencimento              : string;
    FnumeroAcordo                  : string;
  public
    property origemRecolhimento            : string     read ForigemRecolhimento   write ForigemRecolhimento;
    property codigoReceita                 : string     read FcodigoReceita        write FcodigoReceita;
    property dataVencimento                : TDateTime  read FdataVencimento       write FdataVencimento;
    property valor                         : Currency   read Fvalor                write Fvalor;
    property classeVencimento              : string     read FclasseVencimento     write FclasseVencimento;
    property numeroAcordo                  : string     read FnumeroAcordo         write FnumeroAcordo;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro33 }

constructor TJSDimeModelRegistro33.create;
begin
  inherited;
  reg    := '33';
  quadro := '12';
end;

destructor TJSDimeModelRegistro33.Destroy;
begin

  inherited;
end;

end.
