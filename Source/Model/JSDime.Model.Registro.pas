unit JSDime.Model.Registro;

interface

uses
  System.SysUtils;

type
  TJSDimeModelRegistro = class
  private
    Fquadro: String;
    Freg   : String;
    F_id   : String;

  public
    property _id   : String read F_id    write F_id;
    property reg   : String read Freg    write Freg;
    property quadro: String read Fquadro write Fquadro;

    constructor create; virtual; abstract;
  end;

implementation

end.
