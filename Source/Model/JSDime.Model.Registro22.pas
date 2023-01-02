unit JSDime.Model.Registro22;

interface

uses
  JSDime.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;


type
  TJSDimeModelRegistro22 = class(TJSDimeModelRegistro)
  private
    Fcfop                          : string;
    FvalorContabil                 : Currency;
    FbaseCalculo                   : Currency;
    FimpostoCreditado              : Currency;
    FisentasNaoTributadas          : Currency;
    Foutras                        : Currency;
    FbaseCalculoImpostoRetido      : Currency;
    FimpostoRetido                 : Currency;
    FdiferencaAliquota             : Currency;
  public
    property cfop                          : string    read Fcfop                      write Fcfop;
    property valorContabil                 : Currency  read FvalorContabil             write FvalorContabil;
    property baseCalculo                   : Currency  read FbaseCalculo               write FbaseCalculo;
    property impostoCreditado              : Currency  read FimpostoCreditado          write FimpostoCreditado;
    property isentasNaoTributadas          : Currency  read FisentasNaoTributadas      write FisentasNaoTributadas;
    property outras                        : Currency  read Foutras                    write Foutras;
    property baseCalculoImpostoRetido      : Currency  read FbaseCalculoImpostoRetido  write FbaseCalculoImpostoRetido;
    property impostoRetido                 : Currency  read FimpostoRetido             write FimpostoRetido;
    property diferencaAliquota             : Currency  read FdiferencaAliquota         write FdiferencaAliquota;

    class function getComparer: IComparer<TJSDimeModelRegistro22>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSDimeModelRegistro22 }

constructor TJSDimeModelRegistro22.create;
begin
  inherited;
  reg    := '22';
  quadro := '01';
end;

destructor TJSDimeModelRegistro22.Destroy;
begin

  inherited;
end;

class function TJSDimeModelRegistro22.getComparer: IComparer<TJSDimeModelRegistro22>;
begin
  result := TComparer<TJSDimeModelRegistro22>.Construct(
    function(const Left, Right: TJSDimeModelRegistro22): Integer
    begin
      if Left.cfop < Right.cfop then
        Result := -1
      else if Left.cfop > Right.cfop then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
