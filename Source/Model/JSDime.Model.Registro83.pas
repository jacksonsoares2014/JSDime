unit JSDime.Model.Registro83;

interface

uses
  JSDime.Model.Registro,
  System.Generics.Defaults;

type
  TJSDimeModelRegistro83 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    property item : String   read Fitem  write Fitem;
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro83>;
    class function Caption(Reg :TJSDimeModelRegistro83): string;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro83 }

class function TJSDimeModelRegistro83.Caption(
  Reg: TJSDimeModelRegistro83): string;
begin
  Result := '';

  if Reg.item = '310' then
    Result := '(+) Receita bruta vendas/servi�os';

  if Reg.item = '311' then
    Result := '(-) Dedu��es da receita bruta';

  if Reg.item = '320' then
    Result := '(=) Receita l�quida vendas/servi�os';

  if Reg.item = '323' then
    Result := '(-) Custo da mercadoria ou prod. vendidos ou serv. prest.';

  if Reg.item = '330' then
    Result := '(=) Lucro bruto';

  if Reg.item = '331' then
    Result := '(=) Preju�zo bruto';

  if Reg.item = '333' then
    Result := '(+) Outras receitas operacionais';

  if Reg.item = '335' then
    Result := '(-) Despesas operacionais';

  if Reg.item = '340' then
    Result := '(=) Lucro operacional';

  if Reg.item = '341' then
    Result := '(=) Preju�zo operacional';

  if Reg.item = '343' then
    Result := '(+) Receitas n�o operacionais';

  if Reg.item = '345' then
    Result := '(-) Despesas n�o operacionais';

  if Reg.item = '350' then
    Result := '(=) Resultado antes do I.R. e da contribui��o social';

  if Reg.item = '351' then
    Result := '(=) Resultado negativo antes do I.R. e da contrib. social';

  if Reg.item = '353' then
    Result := '(-) Provis�o para o IR e para a contribui��o social';

  if Reg.item = '354' then
    Result := '(+) Provis�o para o IR e para contribui��o social';

  if Reg.item = '360' then
    Result := '(=) Resultado ap�s o I.R. e a contribui��o social';

  if Reg.item = '361' then
    Result := '(=) Resultado negativo ap�s o I.R. e a contrib. social';

  if Reg.item = '363' then
    Result := '(-) Participa��es e contribui��es';

  if Reg.item = '398' then
    Result := '(=) Preju�zo do exerc�cio';

  if Reg.item = '399' then
    Result := '(=) Lucro  do exerc�cio';

end;

constructor TJSDimeModelRegistro83.create;
begin
  inherited;
  reg    := '83';
  quadro := '83';
end;

destructor TJSDimeModelRegistro83.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro83.getComparer: IComparer<TJSDimeModelRegistro83>;
begin
  result := TComparer<TJSDimeModelRegistro83>.Construct(
    function(const Left, Right: TJSDimeModelRegistro83): Integer
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
