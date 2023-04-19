unit JSDime.Model.Registro81;

interface

uses
  JSDime.Model.Registro,
  JSDime.Model.Attributes,
  System.Generics.Defaults;

type
  TJSDimeModelRegistro81 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    [Obrigatorio('Item')]
    property item : String   read Fitem  write Fitem;

    [ValorPositivo('Valor')]
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro81>;
    class function Caption(Reg :TJSDimeModelRegistro81): string;
    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro81 }

class function TJSDimeModelRegistro81.Caption(
  Reg: TJSDimeModelRegistro81): string;
begin
  Result := '';

  if Reg.item = '110' then
    Result := '(=) Circulante';

  if Reg.item = '111' then
    Result := '(+) Disponibilidades';

  if Reg.item = '113' then
    Result := '(+) Contas a receber do circulante';

  if Reg.item = '121' then
    Result := '(+) Estoque de mercadorias e matéria-prima';

  if Reg.item = '123' then
    Result := '(+) Outros estoques';

  if Reg.item = '128' then
    Result := '(+) Outras contas do ativo circulante';

  if Reg.item = '130' then
    Result := '(=) Realizável a longo prazo';

  if Reg.item = '131' then
    Result := '(+) Contas a receber do realizável';

  if Reg.item = '148' then
    Result := '(+) Outras contas do realizável';

  if Reg.item = '150' then
    Result := '(=) Permanente';

  if Reg.item = '151' then
    Result := '(+) Investimentos';

  if Reg.item = '155' then
    Result := '(+) Imobilizado (líquido)';

  if Reg.item = '157' then
    Result := '(+) Diferido (líquido)';

  if Reg.item = '159' then
    Result := '(+) Intangível';

  if Reg.item = '199' then
    Result := '(=) Total geral do ativo';

end;

constructor TJSDimeModelRegistro81.create;
begin
  inherited;
  reg    := '81';
  quadro := '81';
end;

destructor TJSDimeModelRegistro81.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro81.getComparer: IComparer<TJSDimeModelRegistro81>;
begin
  result := TComparer<TJSDimeModelRegistro81>.Construct(
    function(const Left, Right: TJSDimeModelRegistro81): Integer
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
