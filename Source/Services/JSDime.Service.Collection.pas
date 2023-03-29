unit JSDime.Service.Collection;

interface

uses
  JSDime.DAO.Interfaces,
  JSDime.Service.Interfaces;

type
  TJSDimeServiceCollection = class(TInterfacedObject, IJSDimeDAOCollection)
  private
    [weak]
    FJSDimeService        : IJSDimeService;

    FDAORegistro20        : IJSDimeDAORegistro20;
    FDAORegistro22Quadro01: IJSDimeDAORegistro22Quadro01;
    FDAORegistro23Quadro02: IJSDimeDAORegistro23Quadro02;
    FDAORegistro25Quadro04: IJSDimeDAORegistro25Quadro04;
    FDAORegistro26Quadro05: IJSDimeDAORegistro26Quadro05;
    FDAORegistro30Quadro09: IJSDimeDAORegistro30Quadro09;
    FDAORegistro32Quadro11: IJSDimeDAORegistro32Quadro11;
    FDAORegistro33Quadro12: IJSDimeDAORegistro33Quadro12;
    FDAORegistro35Quadro14: IJSDimeDAORegistro35Quadro14;
    FDAORegistro36Quadro15: IJSDimeDAORegistro36Quadro15;
    FDAORegistro37Quadro16: IJSDimeDAORegistro37Quadro16;
    FDAORegistro46Quadro46: IJSDimeDAORegistro46Quadro46;
    FDAORegistro49Quadro49: IJSDimeDAORegistro49Quadro49;
    FDAORegistro50Quadro50: IJSDimeDAORegistro50Quadro50;
    FDAORegistro80Quadro80: IJSDimeDAORegistro80Quadro80;
    FDAORegistro81Quadro81: IJSDimeDAORegistro81Quadro81;
    FDAORegistro82Quadro82: IJSDimeDAORegistro82Quadro82;
    FDAORegistro83Quadro83: IJSDimeDAORegistro83Quadro83;
    FDAORegistro84Quadro84: IJSDimeDAORegistro84Quadro84;
    FDAORegistro85Quadro85: IJSDimeDAORegistro85Quadro85;
  public
    function AddRegistro20        (Value: IJSDimeDAORegistro20)        : IJSDimeDAOCollection;
    function AddRegistro22Quadro01(Value: IJSDimeDAORegistro22Quadro01): IJSDimeDAOCollection;
    function AddRegistro23Quadro02(Value: IJSDimeDAORegistro23Quadro02): IJSDimeDAOCollection;
    function AddRegistro25Quadro04(Value: IJSDimeDAORegistro25Quadro04): IJSDimeDAOCollection;
    function AddRegistro26Quadro05(Value: IJSDimeDAORegistro26Quadro05): IJSDimeDAOCollection;
    function AddRegistro30Quadro09(Value: IJSDimeDAORegistro30Quadro09): IJSDimeDAOCollection;
    function AddRegistro32Quadro11(Value: IJSDimeDAORegistro32Quadro11): IJSDimeDAOCollection;
    function AddRegistro33Quadro12(Value: IJSDimeDAORegistro33Quadro12): IJSDimeDAOCollection;
    function AddRegistro35Quadro14(Value: IJSDimeDAORegistro35Quadro14): IJSDimeDAOCollection;
    function AddRegistro36Quadro15(Value: IJSDimeDAORegistro36Quadro15): IJSDimeDAOCollection;
    function AddRegistro37Quadro16(Value: IJSDimeDAORegistro37Quadro16): IJSDimeDAOCollection;
    function AddRegistro46Quadro46(Value: IJSDimeDAORegistro46Quadro46): IJSDimeDAOCollection;
    function AddRegistro49Quadro49(Value: IJSDimeDAORegistro49Quadro49): IJSDimeDAOCollection;
    function AddRegistro50Quadro50(Value: IJSDimeDAORegistro50Quadro50): IJSDimeDAOCollection;
    function AddRegistro80Quadro80(Value: IJSDimeDAORegistro80Quadro80): IJSDimeDAOCollection;
    function AddRegistro81Quadro81(Value: IJSDimeDAORegistro81Quadro81): IJSDimeDAOCollection;
    function AddRegistro82Quadro82(Value: IJSDimeDAORegistro82Quadro82): IJSDimeDAOCollection;
    function AddRegistro83Quadro83(Value: IJSDimeDAORegistro83Quadro83): IJSDimeDAOCollection;
    function AddRegistro84Quadro84(Value: IJSDimeDAORegistro84Quadro84): IJSDimeDAOCollection;
    function AddRegistro85Quadro85(Value: IJSDimeDAORegistro85Quadro85): IJSDimeDAOCollection;

    function DAORegistro20        : IJSDimeDAORegistro20;
    function DAORegistro22Quadro01: IJSDimeDAORegistro22Quadro01;
    function DAORegistro23Quadro02: IJSDimeDAORegistro23Quadro02;
    function DAORegistro25Quadro04: IJSDimeDAORegistro25Quadro04;
    function DAORegistro26Quadro05: IJSDimeDAORegistro26Quadro05;
    function DAORegistro30Quadro09: IJSDimeDAORegistro30Quadro09;
    function DAORegistro32Quadro11: IJSDimeDAORegistro32Quadro11;
    function DAORegistro33Quadro12: IJSDimeDAORegistro33Quadro12;
    function DAORegistro35Quadro14: IJSDimeDAORegistro35Quadro14;
    function DAORegistro36Quadro15: IJSDimeDAORegistro36Quadro15;
    function DAORegistro37Quadro16: IJSDimeDAORegistro37Quadro16;
    function DAORegistro46Quadro46: IJSDimeDAORegistro46Quadro46;
    function DAORegistro49Quadro49: IJSDimeDAORegistro49Quadro49;
    function DAORegistro50Quadro50: IJSDimeDAORegistro50Quadro50;
    function DAORegistro80Quadro80: IJSDimeDAORegistro80Quadro80;
    function DAORegistro81Quadro81: IJSDimeDAORegistro81Quadro81;
    function DAORegistro82Quadro82: IJSDimeDAORegistro82Quadro82;
    function DAORegistro83Quadro83: IJSDimeDAORegistro83Quadro83;
    function DAORegistro84Quadro84: IJSDimeDAORegistro84Quadro84;
    function DAORegistro85Quadro85: IJSDimeDAORegistro85Quadro85;

    function &Begin: IJSDimeDAOCollection;
    function &End: IJSDimeService;


    constructor create(JSDimeService: IJSDimeService);
    class function New(JSDimeService: IJSDimeService): IJSDimeDAOCollection;
  end;



implementation

{ TJSDimeServiceCollection }

function TJSDimeServiceCollection.&End: IJSDimeService;
begin
  result := FJSDimeService;
end;

function TJSDimeServiceCollection.AddRegistro20(
  Value: IJSDimeDAORegistro20): IJSDimeDAOCollection;
begin
  result         := Self;
  FDAORegistro20 := Value;
end;

function TJSDimeServiceCollection.AddRegistro22Quadro01(
  Value: IJSDimeDAORegistro22Quadro01): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro22Quadro01 := Value;
end;

function TJSDimeServiceCollection.AddRegistro23Quadro02(
  Value: IJSDimeDAORegistro23Quadro02): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro23Quadro02 := Value;
end;

function TJSDimeServiceCollection.AddRegistro25Quadro04(
  Value: IJSDimeDAORegistro25Quadro04): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro25Quadro04 := Value;
end;

function TJSDimeServiceCollection.AddRegistro26Quadro05(
  Value: IJSDimeDAORegistro26Quadro05): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro26Quadro05 := Value;
end;

function TJSDimeServiceCollection.AddRegistro30Quadro09(
  Value: IJSDimeDAORegistro30Quadro09): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro30Quadro09 := Value;
end;

function TJSDimeServiceCollection.AddRegistro32Quadro11(
  Value: IJSDimeDAORegistro32Quadro11): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro32Quadro11 := Value;
end;

function TJSDimeServiceCollection.AddRegistro33Quadro12(
  Value: IJSDimeDAORegistro33Quadro12): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro33Quadro12 := Value;
end;

function TJSDimeServiceCollection.AddRegistro35Quadro14(
  Value: IJSDimeDAORegistro35Quadro14): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro35Quadro14 := Value;
end;

function TJSDimeServiceCollection.AddRegistro36Quadro15(
  Value: IJSDimeDAORegistro36Quadro15): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro36Quadro15 := Value;
end;

function TJSDimeServiceCollection.AddRegistro37Quadro16(
  Value: IJSDimeDAORegistro37Quadro16): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro37Quadro16 := Value;
end;

function TJSDimeServiceCollection.AddRegistro46Quadro46(
  Value: IJSDimeDAORegistro46Quadro46): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro46Quadro46 := Value;
end;

function TJSDimeServiceCollection.AddRegistro49Quadro49(
  Value: IJSDimeDAORegistro49Quadro49): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro49Quadro49 := Value;
end;

function TJSDimeServiceCollection.AddRegistro50Quadro50(
  Value: IJSDimeDAORegistro50Quadro50): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro50Quadro50 := Value;
end;

function TJSDimeServiceCollection.AddRegistro80Quadro80(
  Value: IJSDimeDAORegistro80Quadro80): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro80Quadro80 := Value;
end;

function TJSDimeServiceCollection.AddRegistro81Quadro81(
  Value: IJSDimeDAORegistro81Quadro81): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro81Quadro81 := Value;
end;

function TJSDimeServiceCollection.AddRegistro82Quadro82(
  Value: IJSDimeDAORegistro82Quadro82): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro82Quadro82 := Value;
end;

function TJSDimeServiceCollection.AddRegistro83Quadro83(
  Value: IJSDimeDAORegistro83Quadro83): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro83Quadro83 := Value;
end;

function TJSDimeServiceCollection.AddRegistro84Quadro84(
  Value: IJSDimeDAORegistro84Quadro84): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro84Quadro84 := Value;
end;

function TJSDimeServiceCollection.AddRegistro85Quadro85(
  Value: IJSDimeDAORegistro85Quadro85): IJSDimeDAOCollection;
begin
  result                 := Self;
  FDAORegistro85Quadro85 := Value;
end;

function TJSDimeServiceCollection.&Begin: IJSDimeDAOCollection;
begin
  result := Self;
end;

constructor TJSDimeServiceCollection.create(JSDimeService: IJSDimeService);
begin
  FJSDimeService := JSDimeService;
end;

function TJSDimeServiceCollection.DAORegistro20: IJSDimeDAORegistro20;
begin
  Result := FDAORegistro20;
end;

function TJSDimeServiceCollection.DAORegistro22Quadro01: IJSDimeDAORegistro22Quadro01;
begin
  Result := FDAORegistro22Quadro01;
end;

function TJSDimeServiceCollection.DAORegistro23Quadro02: IJSDimeDAORegistro23Quadro02;
begin
  Result := FDAORegistro23Quadro02;
end;

function TJSDimeServiceCollection.DAORegistro25Quadro04: IJSDimeDAORegistro25Quadro04;
begin
  Result := FDAORegistro25Quadro04;
end;

function TJSDimeServiceCollection.DAORegistro26Quadro05: IJSDimeDAORegistro26Quadro05;
begin
  Result := FDAORegistro26Quadro05;
end;

function TJSDimeServiceCollection.DAORegistro30Quadro09: IJSDimeDAORegistro30Quadro09;
begin
  Result := FDAORegistro30Quadro09;
end;

function TJSDimeServiceCollection.DAORegistro32Quadro11: IJSDimeDAORegistro32Quadro11;
begin
  Result := FDAORegistro32Quadro11;
end;

function TJSDimeServiceCollection.DAORegistro33Quadro12: IJSDimeDAORegistro33Quadro12;
begin
  Result := FDAORegistro33Quadro12;
end;

function TJSDimeServiceCollection.DAORegistro35Quadro14: IJSDimeDAORegistro35Quadro14;
begin
  Result := FDAORegistro35Quadro14;
end;

function TJSDimeServiceCollection.DAORegistro36Quadro15: IJSDimeDAORegistro36Quadro15;
begin
  Result := FDAORegistro36Quadro15;
end;

function TJSDimeServiceCollection.DAORegistro37Quadro16: IJSDimeDAORegistro37Quadro16;
begin
  Result := FDAORegistro37Quadro16;
end;

function TJSDimeServiceCollection.DAORegistro46Quadro46: IJSDimeDAORegistro46Quadro46;
begin
  Result := FDAORegistro46Quadro46;
end;

function TJSDimeServiceCollection.DAORegistro49Quadro49: IJSDimeDAORegistro49Quadro49;
begin
  Result := FDAORegistro49Quadro49;
end;

function TJSDimeServiceCollection.DAORegistro50Quadro50: IJSDimeDAORegistro50Quadro50;
begin
  Result := FDAORegistro50Quadro50;
end;

function TJSDimeServiceCollection.DAORegistro80Quadro80: IJSDimeDAORegistro80Quadro80;
begin
  Result := FDAORegistro80Quadro80;
end;

function TJSDimeServiceCollection.DAORegistro81Quadro81: IJSDimeDAORegistro81Quadro81;
begin
  Result := FDAORegistro81Quadro81;
end;

function TJSDimeServiceCollection.DAORegistro82Quadro82: IJSDimeDAORegistro82Quadro82;
begin
  Result := FDAORegistro82Quadro82;
end;

function TJSDimeServiceCollection.DAORegistro83Quadro83: IJSDimeDAORegistro83Quadro83;
begin
  Result := FDAORegistro83Quadro83;
end;

function TJSDimeServiceCollection.DAORegistro84Quadro84: IJSDimeDAORegistro84Quadro84;
begin
  Result := FDAORegistro84Quadro84;
end;

function TJSDimeServiceCollection.DAORegistro85Quadro85: IJSDimeDAORegistro85Quadro85;
begin
  Result := FDAORegistro85Quadro85;
end;

class function TJSDimeServiceCollection.New(
  JSDimeService: IJSDimeService): IJSDimeDAOCollection;
begin
  result := Self.Create(JSDimeService);
end;

end.
