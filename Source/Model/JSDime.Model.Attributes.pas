unit JSDime.Model.Attributes;

interface

type
  Obrigatorio = class(TCustomAttribute)
  private
    FCampo: string;
  public
    property Campo: string read FCampo write FCampo;
    constructor Create(ACampo: string);
  end;

  ValorPositivo = class(TCustomAttribute)
  private
    FCampo: string;
  public
    property Campo: string read FCampo write FCampo;
    constructor Create(ACampo: string);
  end;

implementation

{ Obrigatorio }

constructor Obrigatorio.Create(ACampo: string);
begin
  FCampo := ACampo;
end;

{ ValorPositivo }

constructor ValorPositivo.Create(ACampo: string);
begin
  FCampo := ACampo;
end;

end.
