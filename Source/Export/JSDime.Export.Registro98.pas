unit JSDime.Export.Registro98;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro98 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg98: TJSDimeModelRegistro98;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro98 }

function TJSDimeExportRegistro98.linhaDime(AModel: TJSDimeModelRegistro): string;

begin
  validateInstance<TJSDimeModelRegistro98>(AModel, FReg98);

  Result := FReg98.reg +
            FReg98.quadro +
            JSDF.PadL(FReg98.qtdReg,5,'0');
end;

end.
