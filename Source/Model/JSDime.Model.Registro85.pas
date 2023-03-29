unit JSDime.Model.Registro85;

interface

uses
  System.Generics.Defaults,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro85 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    property item : String   read Fitem  write Fitem;
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro85>;
    class function Caption(Reg :TJSDimeModelRegistro85): string;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro85 }

class function TJSDimeModelRegistro85.Caption(
  Reg: TJSDimeModelRegistro85): string;
begin
  Result := '';

  if Reg.item = '501' then
    Result := 'Valor do IRPJ devido no exercício anterior';
  if Reg.item = '511' then
    Result := 'Contribuição para o FIA por meio de DARE destinado ao Fundo Estadual';
  if Reg.item = '512' then
    Result := 'Transferência ou contribuição para o FIA direcionados a Fundos Municipais';
  if Reg.item = '519' then
    Result := 'Total das contribuições ou transferências ao FIA';
  if Reg.item = '521' then
    Result := 'Contribuição para o FEI por meio de DARE destinado ao Fundo Estadual';
  if Reg.item = '522' then
    Result := 'Transferência ou contribuição para o FEI direcionados a Fundos Municipais';
  if Reg.item = '529' then
    Result := 'Total das contribuições ou transferências ao FEI';

end;

constructor TJSDimeModelRegistro85.create;
begin
  inherited;
  reg    := '85';
  quadro := '85';
end;

destructor TJSDimeModelRegistro85.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro85.getComparer: IComparer<TJSDimeModelRegistro85>;
begin
  result := TComparer<TJSDimeModelRegistro85>.Construct(
    function(const Left, Right: TJSDimeModelRegistro85): Integer
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
