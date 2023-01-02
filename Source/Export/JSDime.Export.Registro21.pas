unit JSDime.Export.Registro21;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.SysUtils;

type TJSDimeExportRegistro21 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg21: TJSDimeModelRegistro21;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro21 }

function TJSDimeExportRegistro21.linhaDime(
  AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro21>(AModel, FReg21);

  Result := FReg21.reg +
            FReg21.quadro +
            JSDF.PadR(FReg21.numeroInscricao,9,' ') +
            JSDF.PadR(FReg21.nomeContribuinte,50,' ') +
            JSDF.PadR(FReg21.periodoReferencia,6,' ') +
            FReg21.tipoDeclaracao.toString +
            FReg21.regimeApuracao.toString +
            FReg21.porteEmpresa.toString +
            FReg21.apuracaoConsolidada.toString +
            FReg21.apuracaoCentralizada.toString +
            FReg21.transfCreditos.toString +
            FReg21.temCreditosPresumidos.toString +
            FReg21.temCreditosIncentivosFiscais.toString +
            FReg21.movimento.toString +
            FReg21.substitutoTributario.toString +
            FReg21.temEscritaContabil.toString +
            JSDF.PadL(FReg21.quantidadeTrabalhadores,5,'0');
end;

end.
