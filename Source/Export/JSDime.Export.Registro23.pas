unit JSDime.Export.Registro23;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.SysUtils;

type TJSDimeExportRegistro23 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg23: TJSDimeModelRegistro23;

    function linhaDimeAteJulho2013: string;
    function linhaDimeAtual       : string;
  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro23 }

function TJSDimeExportRegistro23.linhaDime(
  AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro23>(AModel, FReg23);

  if FConfig.DataInicial <= EncodeDate(2013,7,31) then
    Result := linhaDimeAteJulho2013
  else
    Result := linhaDimeAtual;
end;

function TJSDimeExportRegistro23.linhaDimeAteJulho2013: string;
begin
  Result := FReg23.reg +
            FReg23.quadro +
            JSDF.PadL(FReg23.cfop, 5, '0') +
            JSDF.formatCurrency(FReg23.valorContabil) +
            JSDF.formatCurrency(FReg23.baseCalculo) +
            JSDF.formatCurrency(FReg23.impostoDebitado) +
            JSDF.formatCurrency(FReg23.isentasNaoTributadas) +
            JSDF.formatCurrency(FReg23.outras);
end;

function TJSDimeExportRegistro23.linhaDimeAtual: string;
begin
  Result := FReg23.reg +
            FReg23.quadro +
            JSDF.PadL(FReg23.cfop, 5, '0') +
            JSDF.formatCurrency(FReg23.valorContabil) +
            JSDF.formatCurrency(FReg23.baseCalculo) +
            JSDF.formatCurrency(FReg23.impostoDebitado) +
            JSDF.formatCurrency(FReg23.isentasNaoTributadas) +
            JSDF.formatCurrency(FReg23.outras) +
            JSDF.formatCurrency(FReg23.baseCalculoImpostoRetido) +
            JSDF.formatCurrency(FReg23.impostoRetido) +
            JSDF.PadL(0,17,'0');
end;

end.
