unit JSDime.Export.Interfaces;

interface

uses
  JSDime.Service.Interfaces,
  JSDime.Model.Classes;

type
  IJSDimeExport = interface
    ['{B1D29B17-8D3D-4C3E-9404-4A9427B26CB5}']
    function linhaDime(AModel: TJSDimeModelRegistro): string;
  end;

  IJSDimeExportFacade = interface
    ['{B26010EF-819B-4029-A5E9-951C860E0147}']
    function linhaDime(AModel: TJSDimeModelRegistro): string;
  end;

function FacadeExport(Emitente: IJSDimeEmitente; Config: IJSDimeConfig<IJSDimeService>): IJSDimeExportFacade;

implementation

uses
  JSDime.Export.Facade;

function FacadeExport(Emitente: IJSDimeEmitente; Config: IJSDimeConfig<IJSDimeService>): IJSDimeExportFacade;
begin
  result := TJSDimeExportFacade.New(Emitente, Config);
end;

end.
