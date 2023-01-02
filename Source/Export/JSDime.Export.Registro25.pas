unit JSDime.Export.Registro25;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro25 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg25: TJSDimeModelRegistro25;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro25 }

function TJSDimeExportRegistro25.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro25>(AModel, FReg25);

  Result := FReg25.reg +
            FReg25.quadro +
            FReg25.item +
            JSDF.formatCurrency(FReg25.valor);
end;

end.
