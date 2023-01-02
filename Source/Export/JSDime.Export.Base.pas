unit JSDime.Export.Base;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Service.Interfaces,
  JSDime.Model.Classes,
  System.SysUtils;

type
  TJSDimeExportBase = class(TInterfacedObject, IJSDimeExport)
  protected
    [Weak]
    FEmitente: IJSDimeEmitente;

    [Weak]
    FConfig: IJSDimeConfig<IJSDimeService>;

    function linhaDime(AModel: TJSDimeModelRegistro): string; virtual; abstract;

    procedure validateInstance<T: TJSDimeModelRegistro, constructor>(AModel: TJSDimeModelRegistro; var Reference: T);
  public
    constructor create(Emitente: IJSDimeEmitente; Config: IJSDimeConfig<IJSDimeService>);
    class function New(Emitente: IJSDimeEmitente; Config: IJSDimeConfig<IJSDimeService>): IJSDimeExport;
end;

implementation

{ TJSDimeExportBase }

constructor TJSDimeExportBase.create(Emitente: IJSDimeEmitente; Config: IJSDimeConfig<IJSDimeService>);
begin
  FEmitente := Emitente;
  FConfig   := Config;
end;

class function TJSDimeExportBase.New(Emitente: IJSDimeEmitente;
  Config: IJSDimeConfig<IJSDimeService>): IJSDimeExport;
begin
  result := Self.create(Emitente, Config);
end;

procedure TJSDimeExportBase.validateInstance<T>(AModel: TJSDimeModelRegistro;
  var Reference: T);
var
  model: T;
begin
  model := T.create;
  try
    if not (AModel is T) then
      raise Exception.CreateFmt('Invalid Instance %s, expected is %s', [AModel.reg, model.reg]);

    Reference := T(AModel);
  finally
    model.free;
  end;
end;

end.
