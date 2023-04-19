unit JSDime.Model.Registro84;

interface

uses
  JSDime.Model.Registro,
  JSDime.Model.Attributes,
  System.Generics.Defaults;

type
  TJSDimeModelRegistro84 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    [Obrigatorio('Item')]
    property item : String   read Fitem  write Fitem;

    [ValorPositivo('Valor')]
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro84>;
    class function Caption(Reg :TJSDimeModelRegistro84): string;
    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro84 }

class function TJSDimeModelRegistro84.Caption(
  Reg: TJSDimeModelRegistro84): string;
begin
  Result := '';

  if Reg.item = '411' then
    Result := '(+) Pró-labore';

  if Reg.item = '412' then
    Result := '(+) Comissões, salários, ordenados';

  if Reg.item = '431' then
    Result := '(+) Combustíveis e lubrificantes';

  if Reg.item = '421' then
    Result := '(+) Encargos sociais';

  if Reg.item = '422' then
    Result := '(+) Tributos federais';

  if Reg.item = '423' then
    Result := '(+) Tributos estaduais';

  if Reg.item = '424' then
    Result := '(+) Tributos municipais';

  if Reg.item = '432' then
    Result := '(+) Água e telefone';

  if Reg.item = '433' then
    Result := '(+) Energia elétrica';

  if Reg.item = '441' then
    Result := '(+) Aluguéis';

  if Reg.item = '451' then
    Result := '(+) Serviços profissionais';

  if Reg.item = '442' then
    Result := '(+) Seguros';

  if Reg.item = '443' then
    Result := '(+) Fretes e carretos';

  if Reg.item = '461' then
    Result := '(+) Despesas financeiras';

  if Reg.item = '498' then
    Result := '(+) Outras despesas';

  if Reg.item = '499' then
    Result := '(=) Total';
end;

constructor TJSDimeModelRegistro84.create;
begin
  inherited;
  reg    := '84';
  quadro := '84';
end;

destructor TJSDimeModelRegistro84.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro84.getComparer: IComparer<TJSDimeModelRegistro84>;
begin
  result := TComparer<TJSDimeModelRegistro84>.Construct(
    function(const Left, Right: TJSDimeModelRegistro84): Integer
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
