unit JSDime.Export.Registro49;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro49 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg49: TJSDimeModelRegistro49;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro49 }

function TJSDimeExportRegistro49.linhaDime(AModel: TJSDimeModelRegistro): string;

begin
  validateInstance<TJSDimeModelRegistro49>(AModel, FReg49);

  Result := FReg49.reg +
            FReg49.quadro +
            FReg49.siglaEstado +
            JSDF.formatCurrency(FReg49.valorContabil) +
            JSDF.formatCurrency(FReg49.baseCalculo) +
            JSDF.formatCurrency(FReg49.outras) +
            JSDF.formatCurrency(FReg49.petroleEnergia) +
            JSDF.formatCurrency(FReg49.substituicaoTributaria);
end;

end.
