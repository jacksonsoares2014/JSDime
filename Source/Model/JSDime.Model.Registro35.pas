unit JSDime.Model.Registro35;

interface

uses
  System.Generics.Defaults,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro35 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    property item : String   read Fitem  write Fitem;
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro35>;
    class function Caption(Reg :TJSDimeModelRegistro35): string;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro35 }

class function TJSDimeModelRegistro35.Caption(
  Reg: TJSDimeModelRegistro35): string;
begin
  Result := '';

  if Reg.item = '010' then
    Result := 'Valor da Base de Cálculo das Saídas com Crédito Presumido';

  if Reg.item = '020' then
    Result := '(+) Débitos Relativos às Saídas com Crédito Presumido';

  if Reg.item = '030' then
    Result := '(-) Crédito Presumido Utilizado';

  if Reg.item = '031' then
    Result := '(-) Créditos Permitidos p/ Compensar c/ Débito Crédito Pres.';

  if Reg.item = '040' then
    Result := '(=) Saldo Devedor pela Apropriação Crédito Presumido no Mês';

  if Reg.item = '045' then
    Result := '(=) Débito pela util. créd. pres. receb. estab. consolidado';

  if Reg.item = '050' then
    Result := '(=) Débito Apurado pela Aprop. Extemporânea do Créd. Pres.';

  if Reg.item = '110' then
    Result := '(+) Saldo Credor das Antecip. p/Mês Seguinte Apur. Mês Ant.';

  if Reg.item = '120' then
    Result := '(+) Crédito decorrente do Pagto Antecipado do ICMS';

  if Reg.item = '130' then
    Result := '(=) Total das Antecipações';

  if Reg.item = '150' then
    Result := '(-) Débito pela utilização do crédito presumido transferido';

  if Reg.item = '199' then
    Result := '(=) Imposto a Recolher pela Utilização do Crédito Presumido';

  if Reg.item = '198' then
    Result := '(=) Saldo Credor das Antecipações para o Mês Seguinte';

end;

constructor TJSDimeModelRegistro35.create;
begin
  inherited;
  reg    := '35';
  quadro := '14';
end;

destructor TJSDimeModelRegistro35.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro35.getComparer: IComparer<TJSDimeModelRegistro35>;
begin
  result := TComparer<TJSDimeModelRegistro35>.Construct(
    function(const Left, Right: TJSDimeModelRegistro35): Integer
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
