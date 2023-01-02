unit JSDime.Export.Registro80;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro80 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg80: TJSDimeModelRegistro80;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro80 }

function TJSDimeExportRegistro80.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro80>(AModel, FReg80);

  Result := FReg80.reg +
            FReg80.quadro +
            FReg80.item +
            JSDF.formatCurrency(FReg80.valor);
end;

end.
