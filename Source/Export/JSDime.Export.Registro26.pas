unit JSDime.Export.Registro26;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro26 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg26: TJSDimeModelRegistro26;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro26 }

function TJSDimeExportRegistro26.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro26>(AModel, FReg26);

  Result := FReg26.reg +
            FReg26.quadro +
            FReg26.item +
            JSDF.formatCurrency(FReg26.valor);
end;

end.
