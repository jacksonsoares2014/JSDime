unit JSDime.Export.Registro50;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro50 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg50: TJSDimeModelRegistro50;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro50 }

function TJSDimeExportRegistro50.linhaDime(AModel: TJSDimeModelRegistro): string;

begin
  validateInstance<TJSDimeModelRegistro50>(AModel, FReg50);

  Result := FReg50.reg +
            FReg50.quadro +
            FReg50.siglaEstado +
            JSDF.formatCurrency(FReg50.valorContabilNaoContribuinte) +
            JSDF.formatCurrency(FReg50.valorContabilContribuinte) +
            JSDF.formatCurrency(FReg50.baseCalculoNaoContribuinte) +
            JSDF.formatCurrency(FReg50.baseCalculoContribuinte) +
            JSDF.formatCurrency(FReg50.outras) +
            JSDF.formatCurrency(FReg50.substituicaoTributaria);
end;

end.
