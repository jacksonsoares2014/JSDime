unit JSDime.Model.Validator.Base;

interface

uses
  System.Rtti,
  JSDime.Service.Interfaces,
  JSDime.Model.Validator.Interfaces,
  JSDime.Model.Validator.RTTI,
  JSDime.Model.Attributes,
  JSDime.Model.Consts,
  JSDime.Model.Classes;

type
  TJSDimeModelValidator = class(TInterfacedObject, IJSDimeModelValidator)
  private
    FConfig    : IJSDimeConfig<IJSDimeService>;

    procedure OnLogErro(Value: string);
    procedure validateObrigatorio(AValue: TJSDimeModelRegistro; ALinha: Integer; AProp: TRttiProperty);
    procedure validateNumero(AValue: TJSDimeModelRegistro; ALinha: Integer; AProp: TRttiProperty);
    procedure validateProperty(AValue: TJSDimeModelRegistro; ALinha: Integer; AProp: TRttiProperty);
  public
    procedure Validate(AValue: TJSDimeModelRegistro; ALinha: Integer);

    constructor create(Config: IJSDimeConfig<IJSDimeService>);
    class function New(Config: IJSDimeConfig<IJSDimeService>): IJSDimeModelValidator;
  end;

implementation

uses
  System.SysUtils;

{ TJSDimeModelValidator }

constructor TJSDimeModelValidator.create(Config: IJSDimeConfig<IJSDimeService>);
begin
  FConfig := Config;
end;

class function TJSDimeModelValidator.New(
  Config: IJSDimeConfig<IJSDimeService>): IJSDimeModelValidator;
begin
  Result := Self.Create(Config);
end;

procedure TJSDimeModelValidator.OnLogErro(Value: string);
var
  onLogErro: TOnLogErro;
begin
  onLogErro := FConfig.OnLogErro;

  if Assigned(onLogErro) then
    onLogErro(Value);
end;

procedure TJSDimeModelValidator.Validate(AValue: TJSDimeModelRegistro;
  ALinha: Integer);
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  properties : TArray<TRttiProperty>;
  i: Integer;
begin
  Contexto := TRttiContext.Create;
  try
    Tipo := Contexto.GetType(AValue.ClassInfo);
    properties := Tipo.GetProperties;
    for i := 0 to Pred(Length(properties)) do
      validateProperty(AValue, ALinha, properties[i]);
  finally
    Contexto.Free;
  end;
end;

procedure TJSDimeModelValidator.validateNumero(AValue: TJSDimeModelRegistro;
  ALinha: Integer; AProp: TRttiProperty);
var
  LpropValue: Double;
  LAttValorPositivo: TCustomAttribute;
begin
  LpropValue := AProp.GetValue(AValue).AsExtended;
  LAttValorPositivo := AProp.GetAttribute<ValorPositivo>;
  if (Assigned(LAttValorPositivo)) and (LpropValue < 0) then
    OnLogErro(Format(cLogErrValorPositivo,[ALinha,AValue.reg,AValue.quadro,Obrigatorio(LAttValorPositivo).Campo]));
end;

procedure TJSDimeModelValidator.validateObrigatorio(
  AValue: TJSDimeModelRegistro; ALinha: Integer; AProp: TRttiProperty);
var
  LAtributo: TCustomAttribute;
begin
  LAtributo := AProp.GetAttribute<Obrigatorio>;
  if (Assigned(LAtributo)) and (AProp.IsEmptyValue(AValue)) then
    OnLogErro(Format(cLogErrCampoObrigatorio,[ALinha,AValue.reg,AValue.quadro,Obrigatorio(LAtributo).Campo]));
end;

procedure TJSDimeModelValidator.validateProperty(AValue: TJSDimeModelRegistro;
  ALinha: Integer; AProp: TRttiProperty);
begin
  validateObrigatorio(AValue, Alinha, Aprop);

  if (AProp.IsInteger or AProp.IsFloat) then
    validateNumero(AValue, Alinha, Aprop);
end;

end.
