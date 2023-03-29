unit JSDime.Export.Registro37;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro37 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg37: TJSDimeModelRegistro37;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro37 }

function TJSDimeExportRegistro37.linhaDime(
  AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro37>(AModel, FReg37);

  Result := FReg37.reg +
            FReg37.quadro +
            FReg37.item +
            JSDF.formatCurrency(FReg37.valor);
end;

end.
