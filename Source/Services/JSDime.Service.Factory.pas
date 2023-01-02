unit JSDime.Service.Factory;

interface

uses
  JSDime.Service.Interfaces,
  JSDime.Service.Base;

type TJSDimeServiceFactory = class(TInterfacedObject, IJSDimeServiceFactory)

  public
    function createService: IJSDimeService;

    class function New: IJSDimeServiceFactory;
end;

implementation

{ TJSDimeServiceFactory }

function TJSDimeServiceFactory.createService: IJSDimeService;
begin
  result := TJSDimeService.New;
end;

class function TJSDimeServiceFactory.New: IJSDimeServiceFactory;
begin
  result := Self.Create;
end;

end.
