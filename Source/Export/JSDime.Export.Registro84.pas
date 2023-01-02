unit JSDime.Export.Registro84;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro84 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg84: TJSDimeModelRegistro84;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro84 }

function TJSDimeExportRegistro84.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro84>(AModel, FReg84);

  Result := FReg84.reg +
            FReg84.quadro +
            FReg84.item +
            JSDF.formatCurrency(FReg84.valor);
end;

end.
