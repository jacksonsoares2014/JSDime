unit JSDime.Model.Registro82;

interface

uses
  JSDime.Model.Registro,
  System.Generics.Defaults;

type
  TJSDimeModelRegistro82 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    property item : String   read Fitem  write Fitem;
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro82>;
    class function Caption(Reg :TJSDimeModelRegistro82): string;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro82 }

class function TJSDimeModelRegistro82.Caption(
  Reg: TJSDimeModelRegistro82): string;
begin
  Result := '';

  if Reg.item = '210' then
    Result := '(=) Circulante';

  if Reg.item = '211' then
    Result := '(+) Fornecedores';

  if Reg.item = '213' then
    Result := '(+) Empréstimos e financiamentos';

  if Reg.item = '215' then
    Result := '(+) Outras contas do passivo circulante';

  if Reg.item = '230' then
    Result := '(=) Exigível a longo prazo';

  if Reg.item = '240' then
    Result := '(=) Resultados de exercícios futuros';

  if Reg.item = '269' then
    Result := '(=) Passivo a Descoberto';

  if Reg.item = '270' then
    Result := '(=) Patrimônio líquido';

  if Reg.item = '271' then
    Result := '(+) Capital social';

  if Reg.item = '278' then
    Result := '(+) Outras contas do patrimônio líquido';

  if Reg.item = '279' then
    Result := '(-) Outras contas do patrimônio líquido (de valor negativo)';

  if Reg.item = '299' then
    Result := '(=) Total geral do passivo';

end;

constructor TJSDimeModelRegistro82.create;
begin
  inherited;
  reg    := '82';
  quadro := '82';
end;

destructor TJSDimeModelRegistro82.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro82.getComparer: IComparer<TJSDimeModelRegistro82>;
begin
  result := TComparer<TJSDimeModelRegistro82>.Construct(
    function(const Left, Right: TJSDimeModelRegistro82): Integer
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
