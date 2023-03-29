unit JSDime.Export.Registro36;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro36 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg36: TJSDimeModelRegistro36;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro36 }

function TJSDimeExportRegistro36.linhaDime(
  AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro36>(AModel, FReg36);

  Result := FReg36.reg +
            FReg36.quadro +
            JSDF.PadL(FReg36.sequencia,3,'0') +
            JSDF.PadL(FReg36.codigoBeneficioTTD,4,'0') +
            JSDF.PadL(FReg36.numeroConcessaoTTD,15,'0') +
            JSDF.PadL(FReg36.subtipoDCIPsemExigenciaTTD,4,'0') +
            JSDF.formatCurrency(FReg36.valorBaseCalculoICMS) +
            JSDF.formatCurrency(FReg36.valorICMSExonerado) +
            FReg36.codigoCalculoFUMDES.toString +
            JSDF.formatCurrency(FReg36.valorFUMDES) +
            FReg36.codigoCalculoFundoSocial.toString +
            JSDF.formatCurrency(FReg36.valorFundoSocial) +
            JSDF.formatCurrency(FReg36.valorBaseCalculoICMSDevolucao) +
            JSDF.formatCurrency(FReg36.valorICMSExoneradoDevolucao) +
            JSDF.formatCurrency(FReg36.valorFUMDESDevolucao) +
            JSDF.formatCurrency(FReg36.valorFundoSocialDevolucao);
end;

end.
