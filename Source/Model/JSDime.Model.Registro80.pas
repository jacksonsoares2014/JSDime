unit JSDime.Model.Registro80;

interface

uses
  JSDime.Model.Registro,
  JSDime.Model.Attributes,
  System.Generics.Defaults;

type
  TJSDimeModelRegistro80 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    [Obrigatorio('Item')]
    property item : String   read Fitem  write Fitem;

    [ValorPositivo('Valor')]
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro80>;
    class function Caption(Reg :TJSDimeModelRegistro80): string;
    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro80 }

class function TJSDimeModelRegistro80.Caption(
  Reg: TJSDimeModelRegistro80): string;
begin
  Result := '';

  if Reg.item = '010' then
    Result := 'Estoque no início do exercício';

  if Reg.item = '020' then
    Result := 'Estoque no fim do exercício';

  if Reg.item = '030' then
    Result := 'Receita bruta de vendas e serviços';
end;

constructor TJSDimeModelRegistro80.create;
begin
  inherited;
  reg    := '80';
  quadro := '80';
end;

destructor TJSDimeModelRegistro80.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro80.getComparer: IComparer<TJSDimeModelRegistro80>;
begin
  result := TComparer<TJSDimeModelRegistro80>.Construct(
    function(const Left, Right: TJSDimeModelRegistro80): Integer
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
