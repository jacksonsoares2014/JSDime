unit JSDime.Model.Registro30;

interface

uses
  System.Generics.Defaults,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro30 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    property item : String   read Fitem  write Fitem;
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro30>;
    class function Caption(Reg :TJSDimeModelRegistro30): string;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro30 }


class function TJSDimeModelRegistro30.Caption(
  Reg: TJSDimeModelRegistro30): string;
begin
  Result := '';

  if Reg.item = '010' then
    Result := '(+) Subtotal de débitos';

  if Reg.item = '011' then
    Result := '(+) Complemento de débito por mudança de regime de apuração';

  if Reg.item = '020' then
    Result := '(+) Saldos devedores recebidos de estab. consolidados';

  if Reg.item = '030' then
    Result := '(+) Débito por reserva de crédito acumulado';

  if Reg.item = '036' then
    Result := '(+) Segreg. Créd. Pres. em Subst. Créditos pelas Entradas';

  if Reg.item = '037' then
    Result := '(+) Segreg. Créd. Pag. Antecipado ICMS à Importação';

  if Reg.item = '038' then
    Result := '(+) Segreg. outros créditos p/ compensar débito créd. pres.';

  if Reg.item = '040' then
    Result := '(=) Total de débitos';

  if Reg.item = '050' then
    Result := '(+) Subtotal de créditos';

  if Reg.item = '060' then
    Result := '(+) Saldos credores recebidos de estab. consolidados';

  if Reg.item = '070' then
    Result := '(+) Créditos recebidos por transf. de outros contribuintes';

  if Reg.item = '075' then
    Result := '(+) Créditos declarados no DCIP';

  if Reg.item = '076' then
    Result := '(+) Segreg. Débitos Relativos às Saídas com Créd. Pres.';

  if Reg.item = '080' then
    Result := '(=) Total de créditos';

  if Reg.item = '090' then
    Result := '(+) Imposto do 1º decêndio';

  if Reg.item = '100' then
    Result := '(+) Imposto do 2º decêndio';

  if Reg.item = '105' then
    Result := '(+) Antecipações Combustíveis líquidos e gasosos';

  if Reg.item = '110' then
    Result := '(=) Total de ajustes da apuração decendial e antecipações';

  if Reg.item = '120' then
    Result := '(=) Saldo devedor';

  if Reg.item = '130' then
    Result := '(-) Saldo devedor transferido ao estab. consolidador';

  if Reg.item = '999' then
    Result := '(=) Imposto a recolher';

  if Reg.item = '140' then
    Result := '(=) Saldo Credor';

  if Reg.item = '150' then
    Result := '(-) Saldo credor transferido ao estab. consolidador';

  if Reg.item = '998' then
    Result := '(=) Saldo Credor para o mês seguinte';

  if Reg.item = '160' then
    Result := 'Saldo credor transferível relativo à exportação';

  if Reg.item = '170' then
    Result := 'Saldo credor transferível relativo a saídas isentas';

  if Reg.item = '180' then
    Result := 'Saldo credor transferível relativo a saídas diferidas';

  if Reg.item = '190' then
    Result := 'Saldo credor relativo a outros créditos';

end;

constructor TJSDimeModelRegistro30.create;
begin
  inherited;
  reg    := '30';
  quadro := '09';
end;

destructor TJSDimeModelRegistro30.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro30.getComparer: IComparer<TJSDimeModelRegistro30>;
begin
  result := TComparer<TJSDimeModelRegistro30>.Construct(
    function(const Left, Right: TJSDimeModelRegistro30): Integer
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
