unit JSDime.Export.Registro32;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro32 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg32: TJSDimeModelRegistro32;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro32 }

function TJSDimeExportRegistro32.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro32>(AModel, FReg32);

  Result := FReg32.reg +
            FReg32.quadro +
            FReg32.item +
            JSDF.formatCurrency(FReg32.valor);
end;

end.
