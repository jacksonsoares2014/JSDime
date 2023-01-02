unit JSDime.Service.Emitente;

interface

uses
  JSDime.Service.Interfaces,
  System.SysUtils;

type
  TJSDimeEmitente = class(TInterfacedObject, IJSDimeEmitente)
  private
    [Weak]
    FParent : IJSDimeService;

    FCNPJ             : string;
    FIncricaoEstadual : string;
    FNome             : string;

  protected
    function CNPJ             (Value: String): IJSDimeEmitente; overload;
    function IncricaoEstadual (Value: String): IJSDimeEmitente; overload;
    function Nome             (Value: string): IJSDimeEmitente; overload;

    function CNPJ             : string; overload;
    function IncricaoEstadual : string; overload;
    function Nome             : string; overload;

    function &End: IJSDimeService;

  public
    constructor create(Parent: IJSDimeService);
    class function New(Parent: IJSDimeService): IJSDimeEmitente;
end;

implementation

{ TJSDimeEmitente }

function TJSDimeEmitente.CNPJ(Value: String): IJSDimeEmitente;
begin
  Result := Self;
  FCNPJ  := Value;
end;

function TJSDimeEmitente.CNPJ: string;
begin
  Result := FCNPJ;
end;

constructor TJSDimeEmitente.create(Parent: IJSDimeService);
begin
  FParent := Parent;
end;

function TJSDimeEmitente.&End: IJSDimeService;
begin
  result := FParent;
end;

function TJSDimeEmitente.IncricaoEstadual: string;
begin
  Result := FIncricaoEstadual;
end;

function TJSDimeEmitente.IncricaoEstadual(Value: String): IJSDimeEmitente;
begin
  Result := Self;
  FIncricaoEstadual := Value;
end;

class function TJSDimeEmitente.New(Parent: IJSDimeService): IJSDimeEmitente;
begin
  result := Self.create(Parent);
end;

function TJSDimeEmitente.Nome(Value: string): IJSDimeEmitente;
begin
  Result := Self;
  FNome  := Value;
end;

function TJSDimeEmitente.Nome: string;
begin
  Result := FNome;
end;

end.
