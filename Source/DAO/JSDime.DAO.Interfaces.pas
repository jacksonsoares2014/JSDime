unit JSDime.DAO.Interfaces;

interface

uses
  System.Generics.Collections,
  JSDime.Model.Classes;

type
  IJSDimeDAORegistro20 = interface
    ['{AB3235D1-7F21-46E0-9FAD-87FA75A22A1D}']
    function load: TJSDimeModelRegistro20;
  end;

  IJSDimeDAORegistro22Quadro01 = interface
    ['{AD5A0600-F888-4A7C-9C47-8A4CBDA9ABC9}']
    function listReg22(DataInicial, DataFinal: TDateTime): TObjectList<TJSDimeModelRegistro22>;
  end;

  IJSDimeDAORegistro23Quadro02 = interface
    ['{7FDE203B-19C0-4D08-BAD5-315C7AE5EF63}']
    function listReg23(DataInicial, DataFinal: TDateTime): TObjectList<TJSDimeModelRegistro23>;
  end;

  IJSDimeDAORegistro25Quadro04 = interface
    ['{EF2CBBC9-F11E-466F-B3B5-29867E2C64DD}']
    function list(DataInicial: TDateTime): TObjectList<TJSDimeModelRegistro25>;
  end;

  IJSDimeDAORegistro26Quadro05 = interface
    ['{33071381-EE2D-4C07-AF06-3730D6D6575D}']
    function list(DataInicial: TDateTime): TObjectList<TJSDimeModelRegistro26>;
  end;

  IJSDimeDAORegistro30Quadro09 = interface
    ['{48CD400D-FA43-4DB1-A0A7-061B20456D53}']
    function list(DataInicial: TDateTime): TObjectList<TJSDimeModelRegistro30>;
  end;

  IJSDimeDAORegistro32Quadro11 = interface
    ['{B9307831-C772-48B7-A407-9FE6F88FC9BC}']
  end;

  IJSDimeDAORegistro33Quadro12 = interface
    ['{A00E267B-F44A-4397-8C4E-D93BB0C089DA}']
    function list(DataInicial: TDateTime): TObjectList<TJSDimeModelRegistro33>;
  end;

  IJSDimeDAORegistro35Quadro14 = interface
    ['{70AB9447-B02E-402A-A7AE-9211B6F24703}']
    function list(DataInicial: TDateTime): TObjectList<TJSDimeModelRegistro35>;
  end;

  IJSDimeDAORegistro36Quadro15 = interface
    ['{510E66FA-D5AF-4B54-84A3-4AF59E94C755}']
    function listReg36(DataInicial: TDateTime): TObjectList<TJSDimeModelRegistro36>;
  end;

  IJSDimeDAORegistro37Quadro16 = interface
    ['{99C91ED5-1550-445F-A5E5-4CA0BEC3906F}']
    function listReg37: TObjectList<TJSDimeModelRegistro37>;
  end;

  IJSDimeDAORegistro46Quadro46 = interface
    ['{ADF435BD-2204-409B-A8A4-FE3BE56289C4}']
    function list(DataInicial: TDateTime): TObjectList<TJSDimeModelRegistro46>;
  end;

  IJSDimeDAORegistro49Quadro49 = interface
    ['{89F3D397-F9DB-4E10-B7CE-114A2D60BF7B}']
    function listReg49: TObjectList<TJSDimeModelRegistro49>;
  end;

  IJSDimeDAORegistro50Quadro50 = interface
    ['{4D4C64B5-7D5F-4545-92E2-ABA2AC06C387}']
    function listReg50: TObjectList<TJSDimeModelRegistro50>;
  end;

  IJSDimeDAORegistro80Quadro80 = interface
    ['{5ADC14DC-A172-4FE8-94F5-25D299D6E3B4}']
    function listReg80(Ano: Integer; Mes: String): TObjectList<TJSDimeModelRegistro80>;
  end;

  IJSDimeDAORegistro81Quadro81 = interface
    ['{403BBE3C-65F5-4267-AC02-514F9F602CD1}']
    function listReg81(Ano: Integer; Mes: String): TObjectList<TJSDimeModelRegistro81>;
  end;

  IJSDimeDAORegistro82Quadro82 = interface
    ['{B050C03F-0D65-4A01-9563-3453E8D084C9}']
    function listReg82(Ano: Integer; Mes: String): TObjectList<TJSDimeModelRegistro82>;
  end;

  IJSDimeDAORegistro83Quadro83 = interface
    ['{20EE2C7C-22F4-4706-8F2F-2A2755F17D4C}']
    function listReg83(Ano: Integer; Mes: String): TObjectList<TJSDimeModelRegistro83>;
  end;

  IJSDimeDAORegistro84Quadro84 = interface
    ['{16BBDCB9-3BDB-4EAE-801F-1F1ED1CF9B80}']
    function listReg84(Ano: Integer; Mes: String): TObjectList<TJSDimeModelRegistro84>;
  end;

  IJSDimeDAORegistro85Quadro85 = interface
    ['{B894D6AD-2CFF-4F2E-BEC3-0F0E4745D23A}']
    function listReg85(Ano: Integer; Mes: String): TObjectList<TJSDimeModelRegistro85>;
  end;

implementation

end.
