unit JSDime.Model.Registro31;

interface

uses
  System.Generics.Collections,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro31 = class(TJSDimeModelRegistro)
  private
    Fdados : TDictionary<string, Currency>;
  public
    procedure AddOrSetValue(Seq: String; Value: Currency);
    function GetValueCurr(Seq: String): Currency;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro31 }

procedure TJSDimeModelRegistro31.AddOrSetValue(Seq: String; Value: Currency);
begin
  Fdados.AddOrSetValue(Seq, Value);
end;

constructor TJSDimeModelRegistro31.create;
begin
  inherited;
  reg    := '31';
  quadro := '10';
  Fdados := TDictionary<string, Currency>.Create;
end;

destructor TJSDimeModelRegistro31.Destroy;
begin
  Fdados.Free;
  inherited;
end;

function TJSDimeModelRegistro31.GetValueCurr(Seq: String): Currency;
begin
  result := FDados.Items[Seq];
end;

end.
