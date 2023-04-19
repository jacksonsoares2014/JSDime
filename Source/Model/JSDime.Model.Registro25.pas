unit JSDime.Model.Registro25;

interface

uses
  System.Generics.Defaults,
  JSDime.Model.Attributes,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro25 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    [Obrigatorio('Item')]
    property item : String   read Fitem  write Fitem;

    [Obrigatorio('Valor')]
    [ValorPositivo('Valor')]
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro25>;
    class function Caption(Reg :TJSDimeModelRegistro25): string;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro25 }

class function TJSDimeModelRegistro25.Caption(
  Reg: TJSDimeModelRegistro25): string;
begin
  Result := '';

  if Reg.item = '010' then
    Result := '(+) Débito pelas saídas';

  if Reg.item = '020' then
    Result := '(+) Débito por diferencial de alíquota de ativo permanente';

  if Reg.item = '030' then
    Result := '(+) Débito por dif. alíq. de material de uso e consumo';

  if Reg.item = '040' then
    Result := '(+) Débito de máq./equip. importados para ativo permanente';

  if Reg.item = '045' then
    Result := '(+) Débito da dif. alíq. a Consumidor Final de Outro Estado';

  if Reg.item = '050'  then
    Result := '(+) Estorno de crédito';

  if Reg.item = '060'  then
    Result := '(+) Outros estornos';

  if Reg.item = '065' then
    Result := '(+) Estorno de Crédito da Entrada da Util. Créd. Presumido';

  if Reg.item = '070' then
    Result := '(+) Outros débitos';

  if Reg.item = '990' then
    Result := '(=) Subtotal de Débitos';
end;

constructor TJSDimeModelRegistro25.create;
begin
  inherited;
  reg    := '25';
  quadro := '04';
end;

destructor TJSDimeModelRegistro25.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro25.getComparer: IComparer<TJSDimeModelRegistro25>;
begin
  result := TComparer<TJSDimeModelRegistro25>.Construct(
    function(const Left, Right: TJSDimeModelRegistro25): Integer
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
