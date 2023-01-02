unit JSDime.Export.Registro82;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro82 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg82: TJSDimeModelRegistro82;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro82 }

function TJSDimeExportRegistro82.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro82>(AModel, FReg82);

  Result := FReg82.reg +
            FReg82.quadro +
            FReg82.item +
            JSDF.formatCurrency(FReg82.valor);
end;

end.
