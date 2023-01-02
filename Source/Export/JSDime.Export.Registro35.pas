unit JSDime.Export.Registro35;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro35 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg35: TJSDimeModelRegistro35;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro35 }

function TJSDimeExportRegistro35.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro35>(AModel, FReg35);

  Result := FReg35.reg +
            FReg35.quadro +
            FReg35.item +
            JSDF.formatCurrency(FReg35.valor);
end;

end.
