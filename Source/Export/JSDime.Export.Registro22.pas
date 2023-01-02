unit JSDime.Export.Registro22;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.SysUtils;

type TJSDimeExportRegistro22 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg22: TJSDimeModelRegistro22;

    function linhaDimeAteJulho2013: string;
    function linhaDimeAtual       : string;
  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro22 }

function TJSDimeExportRegistro22.linhaDime(
  AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro22>(AModel, FReg22);

  if FConfig.DataInicial <= EncodeDate(2013,7,31) then
    Result := linhaDimeAteJulho2013
  else
    Result := linhaDimeAtual;
end;

function TJSDimeExportRegistro22.linhaDimeAteJulho2013: string;
begin
  Result := FReg22.reg +
            FReg22.quadro +
            JSDF.PadL(FReg22.cfop, 5, '0') +
            JSDF.formatCurrency(FReg22.valorContabil) +
            JSDF.formatCurrency(FReg22.baseCalculo) +
            JSDF.formatCurrency(FReg22.impostoCreditado) +
            JSDF.formatCurrency(FReg22.isentasNaoTributadas) +
            JSDF.formatCurrency(FReg22.outras);
end;

function TJSDimeExportRegistro22.linhaDimeAtual: string;
begin
  Result := FReg22.reg +
            FReg22.quadro +
            JSDF.PadL(FReg22.cfop, 5, '0') +
            JSDF.formatCurrency(FReg22.valorContabil) +
            JSDF.formatCurrency(FReg22.baseCalculo) +
            JSDF.formatCurrency(FReg22.impostoCreditado) +
            JSDF.formatCurrency(FReg22.isentasNaoTributadas) +
            JSDF.formatCurrency(FReg22.outras) +
            JSDF.formatCurrency(FReg22.baseCalculoImpostoRetido) +
            JSDF.formatCurrency(FReg22.impostoRetido) +
            JSDF.formatCurrency(FReg22.diferencaAliquota);
end;

end.
