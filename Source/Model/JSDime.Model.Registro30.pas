unit JSDime.Model.Registro30;

interface

uses
  System.Generics.Defaults,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro30 = class(TJSDimeModelRegistro)
  private
    Fvalor: Currency;
    Fitem : String;
  public
    property item : String   read Fitem  write Fitem;
    property valor: Currency read Fvalor write Fvalor;

    class function getComparer: IComparer<TJSDimeModelRegistro30>;
    class function Caption(Reg :TJSDimeModelRegistro30): string;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro30 }


class function TJSDimeModelRegistro30.Caption(
  Reg: TJSDimeModelRegistro30): string;
begin
  Result := '';

  if Reg.item = '010' then
    Result := '(+) Subtotal de d�bitos';

  if Reg.item = '011' then
    Result := '(+) Complemento de d�bito por mudan�a de regime de apura��o';

  if Reg.item = '020' then
    Result := '(+) Saldos devedores recebidos de estab. consolidados';

  if Reg.item = '030' then
    Result := '(+) D�bito por reserva de cr�dito acumulado';

  if Reg.item = '036' then
    Result := '(+) Segreg. Cr�d. Pres. em Subst. Cr�ditos pelas Entradas';

  if Reg.item = '037' then
    Result := '(+) Segreg. Cr�d. Pag. Antecipado ICMS � Importa��o';

  if Reg.item = '038' then
    Result := '(+) Segreg. outros cr�ditos p/ compensar d�bito cr�d. pres.';

  if Reg.item = '040' then
    Result := '(=) Total de d�bitos';

  if Reg.item = '050' then
    Result := '(+) Subtotal de cr�ditos';

  if Reg.item = '060' then
    Result := '(+) Saldos credores recebidos de estab. consolidados';

  if Reg.item = '070' then
    Result := '(+) Cr�ditos recebidos por transf. de outros contribuintes';

  if Reg.item = '075' then
    Result := '(+) Cr�ditos declarados no DCIP';

  if Reg.item = '076' then
    Result := '(+) Segreg. D�bitos Relativos �s Sa�das com Cr�d. Pres.';

  if Reg.item = '080' then
    Result := '(=) Total de cr�ditos';

  if Reg.item = '090' then
    Result := '(+) Imposto do 1� dec�ndio';

  if Reg.item = '100' then
    Result := '(+) Imposto do 2� dec�ndio';

  if Reg.item = '105' then
    Result := '(+) Antecipa��es Combust�veis l�quidos e gasosos';

  if Reg.item = '110' then
    Result := '(=) Total de ajustes da apura��o decendial e antecipa��es';

  if Reg.item = '120' then
    Result := '(=) Saldo devedor';

  if Reg.item = '130' then
    Result := '(-) Saldo devedor transferido ao estab. consolidador';

  if Reg.item = '999' then
    Result := '(=) Imposto a recolher';

  if Reg.item = '140' then
    Result := '(=) Saldo Credor';

  if Reg.item = '150' then
    Result := '(-) Saldo credor transferido ao estab. consolidador';

  if Reg.item = '998' then
    Result := '(=) Saldo Credor para o m�s seguinte';

  if Reg.item = '160' then
    Result := 'Saldo credor transfer�vel relativo � exporta��o';

  if Reg.item = '170' then
    Result := 'Saldo credor transfer�vel relativo a sa�das isentas';

  if Reg.item = '180' then
    Result := 'Saldo credor transfer�vel relativo a sa�das diferidas';

  if Reg.item = '190' then
    Result := 'Saldo credor relativo a outros cr�ditos';

end;

constructor TJSDimeModelRegistro30.create;
begin
  inherited;
  reg    := '30';
  quadro := '09';
end;

destructor TJSDimeModelRegistro30.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro30.getComparer: IComparer<TJSDimeModelRegistro30>;
begin
  result := TComparer<TJSDimeModelRegistro30>.Construct(
    function(const Left, Right: TJSDimeModelRegistro30): Integer
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
