unit JSDime.Export.Registro46;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro46 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg46: TJSDimeModelRegistro46;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro46 }

function TJSDimeExportRegistro46.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro46>(AModel, FReg46);

  Result := FReg46.reg +
            FReg46.quadro +
            JSDF.PadL(FReg46.sequencia,3,'0') +
            JSDF.PadL(FReg46.identificacao,15,'0') +
            JSDF.formatCurrency(FReg46.valor) +
            JSDF.PadL(FReg46.origem,2,'0');
end;

end.
