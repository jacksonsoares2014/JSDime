unit JSDime.Export.Registro81;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro81 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg81: TJSDimeModelRegistro81;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro81 }

function TJSDimeExportRegistro81.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro81>(AModel, FReg81);

  Result := FReg81.reg +
            FReg81.quadro +
            FReg81.item +
            JSDF.formatCurrency(FReg81.valor);
end;

end.
