unit JSDime.Model.Registro37;

interface

uses
  System.Generics.Defaults,
  JSDime.Model.Attributes,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro37 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    [Obrigatorio('Item')]
    property item : String   read Fitem  write Fitem;

    [ValorPositivo('Valor')]
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro37>;
    class function Caption(Reg :TJSDimeModelRegistro37): string;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro37 }

class function TJSDimeModelRegistro37.Caption(
  Reg: TJSDimeModelRegistro37): string;
begin
  Result := '';

  if Reg.item = '010' then
    Result := 'Soma Valor Devido aos FUMDES';
  if Reg.item = '020' then
    Result := 'Saldo Credor do FUMDES Apurado no Mês Anterior';
  if Reg.item = '030' then
    Result := 'Soma Valor FUMDES Relativo a Devolução';
  if Reg.item = '098' then
    Result := 'Saldo Credor para o Mês Seguinte FUMDES';
  if Reg.item = '099' then
    Result := 'FUMDES a Recolher';
  if Reg.item = '110' then
    Result := 'Soma Valor Devido ao FUNDO SOCIAL';
  if Reg.item = '120' then
    Result := 'Saldo Credor Mês do FUNDO SOCIAL Apurado no Mês Anterior';
  if Reg.item = '130' then
    Result := 'Soma Valores FUNDO SOCIAL Relativo a Devolução';
  if Reg.item = '198' then
    Result := 'Saldo Credor para o Mês Seguinte FUNDO SOCIAL';
  if Reg.item = '199' then
    Result := 'FUNDO SOCIAL a Recolher';
end;

constructor TJSDimeModelRegistro37.create;
begin
  inherited;
  reg    := '37';
  quadro := '16';
end;

destructor TJSDimeModelRegistro37.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro37.getComparer: IComparer<TJSDimeModelRegistro37>;
begin
  result := TComparer<TJSDimeModelRegistro37>.Construct(
    function(const Left, Right: TJSDimeModelRegistro37): Integer
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
