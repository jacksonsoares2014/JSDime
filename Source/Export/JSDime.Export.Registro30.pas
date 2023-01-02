unit JSDime.Export.Registro30;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro30 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg30: TJSDimeModelRegistro30;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro30 }

function TJSDimeExportRegistro30.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro30>(AModel, FReg30);

  Result := FReg30.reg +
            FReg30.quadro +
            FReg30.item +
            JSDF.formatCurrency(FReg30.valor);
end;

end.
