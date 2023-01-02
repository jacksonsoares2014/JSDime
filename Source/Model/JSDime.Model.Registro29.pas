unit JSDime.Model.Registro29;

interface

uses
  System.Generics.Collections,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro29 = class(TJSDimeModelRegistro)
  private
    Fdados : TDictionary<string, Currency>;
  public
    procedure AddOrSetValue(Seq: String; Value: Currency);
    function GetValueCurr(Seq: String): Currency;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro29 }

procedure TJSDimeModelRegistro29.AddOrSetValue(Seq: String; Value: Currency);
begin
  Fdados.AddOrSetValue(Seq, Value);
end;

constructor TJSDimeModelRegistro29.create;
begin
  inherited;
  reg    := '29';
  quadro := '08';
  Fdados := TDictionary<string, Currency>.Create;
end;

destructor TJSDimeModelRegistro29.Destroy;
begin
  Fdados.Free;
  inherited;
end;

function TJSDimeModelRegistro29.GetValueCurr(Seq: String): Currency;
begin
  result := FDados.Items[Seq];
end;

end.
