unit JSDime.Export.Facade;

interface

uses
  System.SysUtils,
  JSDime.Model.Classes,
  JSDime.Service.Interfaces,
  JSDime.Export.Interfaces,
  JSDime.Export.Classes,
  System.Generics.Collections;

type
  TJSDimeExportFacade = class(TInterfacedObject, IJSDimeExportFacade)
  private
    [Weak]
    FEmitente: IJSDimeEmitente;

    [Weak]
    FConfig: IJSDimeConfig<IJSDimeService>;

    FExports: TDictionary<String, IJSDimeExport>;

    procedure createExports;

    function GetExport(AModel: TJSDimeModelRegistro): IJSDimeExport;
  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string;

  public
    constructor create(Emitente: IJSDimeEmitente; Config: IJSDimeConfig<IJSDimeService>);
    class function New(Emitente: IJSDimeEmitente; Config: IJSDimeConfig<IJSDimeService>): IJSDimeExportFacade;
    destructor Destroy; override;

end;

implementation

{ TJSDimeExportFacade }

constructor TJSDimeExportFacade.create(Emitente: IJSDimeEmitente; Config: IJSDimeConfig<IJSDimeService>);
begin
  FEmitente := Emitente;
  FConfig   := Config;

  createExports;
end;

procedure TJSDimeExportFacade.createExports;
begin
  FExports := TDictionary<String, IJSDimeExport>.Create;

  FExports.Add('20', TJSDimeExportRegistro20.New(FEmitente, FConfig));
  FExports.Add('21', TJSDimeExportRegistro21.New(FEmitente, FConfig));
  FExports.Add('22', TJSDimeExportRegistro22.New(FEmitente, FConfig));
  FExports.Add('23', TJSDimeExportRegistro23.New(FEmitente, FConfig));
  FExports.Add('24', TJSDimeExportRegistro24.New(FEmitente, FConfig));
  FExports.Add('25', TJSDimeExportRegistro25.New(FEmitente, FConfig));
  FExports.Add('26', TJSDimeExportRegistro26.New(FEmitente, FConfig));
  FExports.Add('30', TJSDimeExportRegistro30.New(FEmitente, FConfig));
  FExports.Add('32', TJSDimeExportRegistro32.New(FEmitente, FConfig));
  FExports.Add('33', TJSDimeExportRegistro33.New(FEmitente, FConfig));
  FExports.Add('35', TJSDimeExportRegistro35.New(FEmitente, FConfig));
  FExports.Add('36', TJSDimeExportRegistro36.New(FEmitente, FConfig));
  FExports.Add('37', TJSDimeExportRegistro37.New(FEmitente, FConfig));
  FExports.Add('46', TJSDimeExportRegistro46.New(FEmitente, FConfig));
  FExports.Add('49', TJSDimeExportRegistro49.New(FEmitente, FConfig));
  FExports.Add('50', TJSDimeExportRegistro50.New(FEmitente, FConfig));
  FExports.Add('80', TJSDimeExportRegistro80.New(FEmitente, FConfig));
  FExports.Add('81', TJSDimeExportRegistro81.New(FEmitente, FConfig));
  FExports.Add('82', TJSDimeExportRegistro82.New(FEmitente, FConfig));
  FExports.Add('83', TJSDimeExportRegistro83.New(FEmitente, FConfig));
  FExports.Add('84', TJSDimeExportRegistro84.New(FEmitente, FConfig));
  FExports.Add('85', TJSDimeExportRegistro85.New(FEmitente, FConfig));
  FExports.Add('98', TJSDimeExportRegistro98.New(FEmitente, FConfig));
  FExports.Add('99', TJSDimeExportRegistro99.New(FEmitente, FConfig));
end;

destructor TJSDimeExportFacade.Destroy;
begin
  FExports.Free;
  inherited;
end;

function TJSDimeExportFacade.GetExport(
  AModel: TJSDimeModelRegistro): IJSDimeExport;
begin
  if not FExports.TryGetValue(AModel.reg, Result) then
    result := nil;
end;

function TJSDimeExportFacade.linhaDime(AModel: TJSDimeModelRegistro): string;
var
  &Export: IJSDimeExport;
begin
  &Export := GetExport(AModel);

  if not Assigned(&Export) then
    raise ENotImplemented.CreateFmt('Not implemented Export for Reg %s', [AModel.reg]);

  result := &Export.linhaDime(AModel);
end;

class function TJSDimeExportFacade.New(Emitente: IJSDimeEmitente;
  Config: IJSDimeConfig<IJSDimeService>): IJSDimeExportFacade;
begin
  result := Self.create(Emitente, Config);
end;

end.
