unit JSDime.Export.Registro20;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.SysUtils;

type TJSDimeExportRegistro20 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg20: TJSDimeModelRegistro20;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro20 }

function TJSDimeExportRegistro20.linhaDime(
  AModel: TJSDimeModelRegistro): string;
begin
  validateInstance<TJSDimeModelRegistro20>(AModel, FReg20);

  Result := FReg20.reg +
            FReg20.quadro +
            JSDF.PadR(FReg20.cpf,11,'0') +
            JSDF.PadR(FReg20.nomeContabilista,50,' ') +
            FReg20.dataHora;
end;

end.
