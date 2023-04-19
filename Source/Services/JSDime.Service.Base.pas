unit JSDime.Service.Base;

interface

uses
  JSDime.Service.Interfaces,
  JSDime.Service.Config,
  JSDime.Service.Collection,
  JSDime.Service.Emitente,
  System.SysUtils,
  System.Threading,
  System.Classes,
  System.Generics.Collections;


type
  TJSDimeService = class(TInterfacedObject, IJSDimeService)
  private
    FRegistros      : IJSDimeServiceRegistros;

    FJSDAOCollection: IJSDimeDAOCollection;
    FEmitente       : IJSDimeEmitente;
    FConfig         : IJSDimeConfig<IJSDimeService>;

    FArquivoDime: TStrings;

    function gerarRegistros: TStrings;
    procedure SaveToFile;
  public
    function Emitente: IJSDimeEmitente;
    function DAO     : IJSDimeDAOCollection;
    function Config  : IJSDimeConfig<IJSDimeService>;

    function Execute: IJSDimeService;

    constructor create;
    destructor  Destroy; override;
    class function New: IJSDimeService;

  end;

implementation

uses
  JSDime.Service.Registros;

{ TJSDimeService }


function TJSDimeService.Config: IJSDimeConfig<IJSDimeService>;
begin
  if not Assigned(FConfig) then
    FConfig := TJSDimeServiceConfig<IJSDimeService>.New(Self);
  result := FConfig;
end;

constructor TJSDimeService.create;
begin
  FArquivoDime := TStringList.Create;
  FRegistros   := TJSDimeServiceRegistros.New(Self);
end;

function TJSDimeService.DAO: IJSDimeDAOCollection;
begin
  if not Assigned(FJSDAOCollection) then
    FJSDAOCollection := TJSDimeServiceCollection.New(Self);
  result := FJSDAOCollection;
end;

destructor TJSDimeService.Destroy;
begin
  FArquivoDime.Free;
  inherited;
end;

function TJSDimeService.Emitente: IJSDimeEmitente;
begin
  if not Assigned(FEmitente) then
    FEmitente := TJSDimeEmitente.New(Self);
  result := FEmitente;
end;

function TJSDimeService.Execute: IJSDimeService;
var
  Registros: TStrings;

  procedure addDime(s: TStrings);
  var
    j : Integer;
  begin
    if (not Assigned(s)) or (s.Count = 0) then
      Exit;

    for j := 0 to Pred(s.Count) do
      FArquivoDime.Add(s[j]);
  end;

begin
  Result := self;
  Registros := nil;

  try
    Registros := gerarRegistros;
    addDime(Registros);
  finally
    Registros.Free;
  end;

  SaveToFile;
end;

function TJSDimeService.gerarRegistros: TStrings;
begin
  Result := FRegistros.Execute;
end;

class function TJSDimeService.New: IJSDimeService;
begin
  result := Self.create;
end;

procedure TJSDimeService.SaveToFile;
begin
  if not FConfig.GerarRelatorio then
    FArquivoDime.SaveToFile(FConfig.NomeArquivo);
end;

end.
