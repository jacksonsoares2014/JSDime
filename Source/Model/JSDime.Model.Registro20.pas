unit JSDime.Model.Registro20;

interface

uses
  JSDime.Model.Registro;

type
  TJSDimeModelRegistro20 = class(TJSDimeModelRegistro)
  private
    Fcpf             : String;
    FnomeContabilista: String;
    FdataHora        : String;
  public
    property cpf              : String    read Fcpf              write Fcpf;
    property nomeContabilista : String    read FnomeContabilista write FnomeContabilista;
    property dataHora         : String    read FdataHora         write FdataHora;

    constructor create; override;
  end;

implementation

{ TJSDimeModelRegistro20 }

constructor TJSDimeModelRegistro20.create;
begin
  inherited;
  reg    := '20';
  quadro := '  ';
end;

//class function TJSDimeModelRegistro20.getComparer: IComparer<TGBSpedModelRegistroNomeDoModel>;
//begin
//  result := TComparer<TGBSpedModelRegistroNomeDoModel>.Construct(
//    function(const Left, Right: TGBSpedModelRegistroNomeDoModel): Integer
//    var LChave, RChave: string;
//    begin
//      LChave := '';
//
//      RChave := '';
//
//      if LChave < RChave then
//        Result := -1
//      else if LChave > RChave then
//        Result := 1
//      else
//        Result := 0;
//    end);
//end;

end.
