unit JSDime.Model.Registro24;

interface

uses
  System.Generics.Defaults,
  JSDime.Model.Attributes,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro24 = class(TJSDimeModelRegistro)
  private
    Fvalor : Currency;
    Fitem  : String;
  public
    [Obrigatorio('Item')]
    property item : String   read Fitem  write Fitem;

    [Obrigatorio('Valor')]
    [ValorPositivo('Valor')]
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro24>;
    class function Caption(Reg :TJSDimeModelRegistro24): string;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro24 }

class function TJSDimeModelRegistro24.Caption(
  Reg: TJSDimeModelRegistro24): string;
begin
  Result := '';

  if (Reg.item = '010') or (Reg.item = '060') then
    Result := 'Valor Contábil';

  if (Reg.item = '020') or (Reg.item = '070') then
    Result := 'Base de Cálculo';

  if Reg.item = '030' then
    Result := 'Imposto Creditado';

  if (Reg.item = '040') or (Reg.item = '090')then
    Result := 'Operações Isentas/Não Tributadas';

  if Reg.item = '050' then
    Result := 'Outras Operações sem crédito de imposto';

  if (Reg.item = '053') or (Reg.item = '103') then
    Result := 'Base de Cálculo Imposto Retido';

  if (Reg.item = '054') or (Reg.item = '104') then
    Result := 'Imposto Retido';

  if Reg.item = '057' then
    Result := 'Imposto Diferencial Alíquota';

  if Reg.item = '080' then
    Result := 'Imposto Debitado';

  if Reg.item = '100' then
    Result := 'Outras Operações sem débito de imposto';

end;

constructor TJSDimeModelRegistro24.create;
begin
  inherited;
  reg    := '24';
  quadro := '03';
end;

destructor TJSDimeModelRegistro24.Destroy;
begin

  inherited;
end;


class function TJSDimeModelRegistro24.getComparer: IComparer<TJSDimeModelRegistro24>;
begin
  result := TComparer<TJSDimeModelRegistro24>.Construct(
    function(const Left, Right: TJSDimeModelRegistro24): Integer
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
