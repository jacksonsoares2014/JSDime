unit JSDime.Export.Registro33;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro33 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg33: TJSDimeModelRegistro33;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro33 }

function TJSDimeExportRegistro33.linhaDime(AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro33>(AModel, FReg33);

  Result := FReg33.reg +
            FReg33.quadro +
            FReg33.origemRecolhimento +
            FReg33.codigoReceita +
            JSDF.formatData(FReg33.dataVencimento) +
            JSDF.formatCurrency(FReg33.valor) +
            JSDF.PadL(FReg33.classeVencimento,5,'0') +
            JSDF.PadL(FReg33.numeroAcordo,15,'0');
end;

end.
