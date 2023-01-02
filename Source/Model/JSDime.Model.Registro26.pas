unit JSDime.Model.Registro26;

interface

uses
  System.Generics.Defaults,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro26 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    property item : String   read Fitem  write Fitem;
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro26>;
    class function Caption(Reg :TJSDimeModelRegistro26): string;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro26 }

class function TJSDimeModelRegistro26.Caption(
  Reg: TJSDimeModelRegistro26): string;
begin
  Result := '';

  if Reg.item = '010' then
    Result := '(+) Saldo credor do m�s anterior';

  if Reg.item = '020' then
    Result := '(+) Cr�dito pelas entradas';

  if Reg.item = '030' then
    Result := '(+) Cr�dito de ativo permanente';

  if Reg.item = '040' then
    Result := '(+) Cr�dito por dif. al�q. material de uso/consumo';

  if Reg.item = '045' then
    Result := '(+) Cr�dito da dif. al�q. a Consumidor Final de Outro Estado';

  if Reg.item = '050' then
    Result := '(+) Cr�dito de ICMS retido por substitui��o tribut�ria';

  if Reg.item = '990' then
    Result := '(=) Subtotal de Cr�ditos';

end;

constructor TJSDimeModelRegistro26.create;
begin
  inherited;
  reg    := '26';
  quadro := '05';
end;

destructor TJSDimeModelRegistro26.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro26.getComparer: IComparer<TJSDimeModelRegistro26>;
begin
  result := TComparer<TJSDimeModelRegistro26>.Construct(
    function(const Left, Right: TJSDimeModelRegistro26): Integer
    begin
      if Left.item < Right.item then
        Result := -1
      else if Left.item > Right.item then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
