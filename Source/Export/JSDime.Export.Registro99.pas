unit JSDime.Export.Registro99;

interface

uses
  JSDime.Export.Interfaces,
  JSDime.Export.Base,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSDimeExportRegistro99 = class(TJSDimeExportBase, IJSDimeExport)

  private
    FReg99: TJSDimeModelRegistro99;

  protected
    function linhaDime(AModel: TJSDimeModelRegistro): string; override;

end;

implementation

{ TJSDimeExportRegistro99 }

function TJSDimeExportRegistro99.linhaDime(AModel: TJSDimeModelRegistro): string;

begin
  validateInstance<TJSDimeModelRegistro99>(AModel, FReg99);

  Result := FReg99.reg +
            FReg99.quadro +
            JSDF.PadL(FReg99.qtdReg,5,'0') +
            JSDF.PadL(FReg99.qtdDeclaracoes,5,'0');
end;

end.
