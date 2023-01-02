unit JSDime.Export.Registro24;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro24 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg24: TJSDimeModelRegistro24;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro24 }

function TJSDimeExportRegistro24.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro24>(AModel, FReg24);

  Result := FReg24.reg +
            FReg24.quadro +
            FReg24.item +
            JSDF.formatCurrency(FReg24.valor);
end;

end.
