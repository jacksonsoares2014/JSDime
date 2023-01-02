unit JSDime.Model.Registro28;

interface

uses
  System.Generics.Collections,
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro28 = class(TJSDimeModelRegistro)
  private
    Fdados : TDictionary<string, Currency>;
  public
    procedure AddOrSetValue(Seq: String; Value: Currency);
    function GetValueCurr(Seq: String): Currency;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro28 }

procedure TJSDimeModelRegistro28.AddOrSetValue(Seq: String; Value: Currency);
begin
  Fdados.AddOrSetValue(Seq, Value);
end;

constructor TJSDimeModelRegistro28.create;
begin
  inherited;
  reg    := '28';
  quadro := '07';
  Fdados := TDictionary<string, Currency>.Create;
end;

destructor TJSDimeModelRegistro28.Destroy;
begin
  Fdados.Free;
  inherited;
end;

function TJSDimeModelRegistro28.GetValueCurr(Seq: String): Currency;
begin
  result := FDados.Items[Seq];
end;

end.
