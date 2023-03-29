unit JSDime.Export.Registro85;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro85 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg85: TJSDimeModelRegistro85;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro85 }

function TJSDimeExportRegistro85.linhaDime(
  AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro85>(AModel, FReg85);

  Result := FReg85.reg +
            FReg85.quadro +
            FReg85.item +
            JSDF.formatCurrency(FReg85.valor);
end;

end.
