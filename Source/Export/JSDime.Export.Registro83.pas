unit JSDime.Export.Registro83;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro83 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg83: TJSDimeModelRegistro83;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro83 }

function TJSDimeExportRegistro83.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro83>(AModel, FReg83);

  Result := FReg83.reg +
            FReg83.quadro +
            FReg83.item +
            JSDF.formatCurrency(FReg83.valor);
end;

end.
