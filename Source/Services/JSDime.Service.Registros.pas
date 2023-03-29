unit JSDime.Service.Registros;

interface

uses
  JSDime.Model.Consts,
  JSDime.Model.Classes,
  JSDime.Model.Types,
  JSDime.Export.Interfaces,
  JSDime.Service.Interfaces,
  JSDime.DAO.Interfaces,
  System.Threading,
  System.DateUtils,
  System.Generics.Collections,
  System.Generics.Defaults,
  System.SysUtils,
  System.Classes;

type
  TJSDimeServiceRegistros = class(TInterfacedObject, IJSDimeServiceRegistros)
  private
    [Weak]
    FDimeService: IJSDimeService;

    FacadeExport: IJSDimeExportFacade;
    FArquivo    : TStrings;

    FValorDebitoSaidas                   : Currency;
    FValorCreditoEntradas                : Currency;
    FValorICMSCreditoSubtrair            : Currency;
    FSubTotalDebito                      : Currency;
    FSubTotalCredito                     : Currency;
    FImpostoArecolher                    : Currency;
    FCreditosDeclaradosDCIP              : Currency;
    FSegregCreditoPresumido              : Currency;
    FSegregCreditoPagtoAntecipado        : Currency;
    FSegregOutrosCreditos                : Currency;
    FSegregDebitosSaidasCreditoPresumido : Currency;


    FReg24List     : TObjectList<TJSDimeModelRegistro24>;
    FComparerReg24 : IComparer<TJSDimeModelRegistro24>;
    FComparerReg30 : IComparer<TJSDimeModelRegistro30>;
    FComparerReg35 : IComparer<TJSDimeModelRegistro35>;

    function validateInstance<T: TJSDimeModelRegistro, constructor>(AModel: TJSDimeModelRegistro): Boolean;
    procedure AddReg24(AModel: TJSDimeModelRegistro); overload;
    procedure AddReg24(Item: String; Valor: Currency); overload;

    procedure AddReg30(Item: String; Valor: Currency; ListaReg30: TObjectList<TJSDimeModelRegistro30>);
    procedure AddReg35(Item: String; Valor: Currency; ListaReg35: TObjectList<TJSDimeModelRegistro35>);
    function CalculaCreditoReg30(ListaReg30: TObjectList<TJSDimeModelRegistro30>): Currency;
    function CalculaDebitoReg30(ListaReg30: TObjectList<TJSDimeModelRegistro30>): Currency;
    function CalculaSaldoReg30(ListaReg30: TObjectList<TJSDimeModelRegistro30>): Currency;
    function CalculaImpostoReg30(ListaReg30: TObjectList<TJSDimeModelRegistro30>): Currency;
    function CalculaSaldoCredorReg30(ListaReg30: TObjectList<TJSDimeModelRegistro30>): Currency;
    function CalculaSaldoDevedorApropCredPreReg35(ListaReg35: TObjectList<TJSDimeModelRegistro35>): Currency;
    function CalculaTotalAntecipacoesReg35(ListaReg35: TObjectList<TJSDimeModelRegistro35>): Currency;
    function CalculaSaldoReg35(ListaReg35: TObjectList<TJSDimeModelRegistro35>): Currency;
    function CalculaSaldoFUMDESReg37(ListaReg37: TObjectList<TJSDimeModelRegistro37>): Currency;
    function CalculaSaldoFundoSocialReg37(ListaReg37: TObjectList<TJSDimeModelRegistro37>): Currency;
    procedure TransfSegregacaoReg35(Reg30: TJSDimeModelRegistro30);

    procedure OnAddRegistro(Registro: TJSDimeModelRegistro);
    procedure AdicionaLinhaDime(ARegistro: TJSDimeModelRegistro; AArquivo: TStrings);
    procedure GerarReg20;
    procedure GerarReg21Quadro00;
    procedure GerarReg22Quadro01;
    procedure GerarReg23Quadro02;
    procedure GerarReg24Quadro03(AlistReg24Quadro03: TStrings);
    procedure GerarReg25Quadro04(AlistReg25Quadro04: TStrings);
    procedure GerarReg26Quadro05;
    procedure GerarReg30Quadro09;
    procedure GerarReg33Quadro12;
    procedure GerarReg35Quadro14;
    procedure GerarReg36Quadro15(AlistReg36Quadro15: TStrings);
    procedure GerarReg37Quadro16(AlistReg37Quadro16: TStrings);
    procedure GerarReg46Quadro46(AlistReg46Quadro46: TStrings);
    procedure GerarReg49Quadro49;
    procedure GerarReg50Quadro50;
    procedure GerarReg80Quadro80;
    procedure GerarReg81Quadro81;
    procedure GerarReg82Quadro82;
    procedure GerarReg83Quadro83;
    procedure GerarReg84Quadro84;
    procedure GerarReg85Quadro85;
    procedure GerarReg49Quadro98;
    procedure GerarReg50Quadro99;

  protected
    function Execute: TStrings;
    function &End: IJSDimeService;
  public
    constructor create(Parent: IJSDimeService);
    class function New(Parent: IJSDimeService): IJSDimeServiceRegistros;
    destructor Destroy; override;
  end;

implementation

{ TJSDimeServiceRegistros }

procedure TJSDimeServiceRegistros.AddReg24(AModel: TJSDimeModelRegistro);
begin
  if validateInstance<TJSDimeModelRegistro22>(AModel) then
  begin
    AddReg24(itemQuadro03EntradasValorContabil              , TJSDimeModelRegistro22(AModel).valorContabil);
    AddReg24(itemQuadro03EntradasBaseCalculo                , TJSDimeModelRegistro22(AModel).baseCalculo);
    AddReg24(itemQuadro03EntradasImpostoCreditado           , TJSDimeModelRegistro22(AModel).impostoCreditado);
    AddReg24(itemQuadro03EntradasOperacoesIsentas           , TJSDimeModelRegistro22(AModel).isentasNaoTributadas);
    AddReg24(itemQuadro03EntradasOutras                     , TJSDimeModelRegistro22(AModel).outras);
    AddReg24(itemQuadro03EntradasBaseCalculoImpostoRetido   , TJSDimeModelRegistro22(AModel).baseCalculoImpostoRetido);
    AddReg24(itemQuadro03EntradasImpostoRetido              , TJSDimeModelRegistro22(AModel).impostoRetido);
    AddReg24(itemQuadro03EntradasImpostoDiferencialAliquota , TJSDimeModelRegistro22(AModel).diferencaAliquota);

    if (TJSDimeModelRegistro22(AModel).impostoCreditado > 0) then
      FValorCreditoEntradas := FValorCreditoEntradas + TJSDimeModelRegistro22(AModel).impostoCreditado;
  end;

  if validateInstance<TJSDimeModelRegistro23>(AModel) then
  begin
    AddReg24(itemQuadro03SaidasValorContabil            , TJSDimeModelRegistro23(AModel).valorContabil);
    AddReg24(itemQuadro03SaidasBaseCalculo              , TJSDimeModelRegistro23(AModel).baseCalculo);
    AddReg24(itemQuadro03SaidasImpostoDebitado          , TJSDimeModelRegistro23(AModel).impostoDebitado);
    AddReg24(itemQuadro03SaidasOperacoesIsentas         , TJSDimeModelRegistro23(AModel).isentasNaoTributadas);
    AddReg24(itemQuadro03SaidasOutras                   , TJSDimeModelRegistro23(AModel).outras);
    AddReg24(itemQuadro03SaidasBaseCalculoImpostoRetido , TJSDimeModelRegistro23(AModel).baseCalculoImpostoRetido);
    AddReg24(itemQuadro03SaidasImpostoRetido            , TJSDimeModelRegistro23(AModel).impostoRetido);

    if (TJSDimeModelRegistro23(AModel).impostoDebitado > 0) then
      FValorDebitoSaidas := FValorDebitoSaidas + TJSDimeModelRegistro23(AModel).impostoDebitado;
  end;

  if validateInstance<TJSDimeModelRegistro25>(AModel) then
  begin
    if TJSDimeModelRegistro25(AModel).item = itemQuadro04DebitoDifalAtivoPemanente then
      AddReg24(itemQuadro03EntradasImpostoDiferencialAliquota , TJSDimeModelRegistro25(AModel).valor);

    if TJSDimeModelRegistro25(AModel).item = itemQuadro04DebitoDifalUsoConsumo then
      AddReg24(itemQuadro03EntradasImpostoDiferencialAliquota , TJSDimeModelRegistro25(AModel).valor);
  end;
end;

procedure TJSDimeServiceRegistros.TransfSegregacaoReg35(
  Reg30: TJSDimeModelRegistro30);
begin
  if Reg30.item = itemQuadro09SegregCreditoPresumido then
    FSegregCreditoPresumido := Reg30.valor;

  if Reg30.item = itemQuadro09SegregCreditoPagtoAntecipado then
    FSegregCreditoPagtoAntecipado := Reg30.valor;

  if Reg30.item = itemQuadro09SegregOutrosCreditos then
    FSegregOutrosCreditos := Reg30.valor;

  if Reg30.item = itemQuadro09SegregDebitosSaidasCreditoPresumido then
    FSegregDebitosSaidasCreditoPresumido := Reg30.valor;
end;

procedure TJSDimeServiceRegistros.AddReg24(Item: String; Valor: Currency);
var
  FReg24: TJSDimeModelRegistro24;
  I : Integer;
begin
  if not Assigned(FReg24List) then
    FReg24List := TObjectList<TJSDimeModelRegistro24>.Create;

  if valor > 0 then
  begin
    FReg24 := TJSDimeModelRegistro24.create;
    FReg24.item  := Item;
    FReg24.valor := Valor;

    if not FReg24List.BinarySearch(FReg24, I, FComparerReg24) then
      FReg24List.Insert(I, FReg24)
    else
    begin
      FreeAndNil(FReg24);
      FReg24List[I].valor := FReg24List[I].valor + Valor;
    end;
  end;
end;

procedure TJSDimeServiceRegistros.AddReg30(Item: String; Valor: Currency;
  ListaReg30: TObjectList<TJSDimeModelRegistro30>);
var
  i     : Integer;
  reg30 : TJSDimeModelRegistro30;
begin
  if valor > 0 then
  begin
    reg30 := TJSDimeModelRegistro30.create;
    reg30.item  := Item;
    reg30.valor := Valor;

    if not ListaReg30.BinarySearch(reg30, I, FComparerReg30) then
      ListaReg30.Insert(I, Reg30)
    else
    begin
      FreeAndNil(reg30);
      ListaReg30[I].valor := ListaReg30[I].valor + Valor;
    end;
  end;
end;

procedure TJSDimeServiceRegistros.AddReg35(Item: String; Valor: Currency;
  ListaReg35: TObjectList<TJSDimeModelRegistro35>);
var
  i     : Integer;
  reg35 : TJSDimeModelRegistro35;
begin
  if valor > 0 then
  begin
    reg35 := TJSDimeModelRegistro35.create;
    reg35.item  := Item;
    reg35.valor := Valor;

    if not ListaReg35.BinarySearch(reg35, I, FComparerReg35) then
      ListaReg35.Insert(I, Reg35)
    else
    begin
      FreeAndNil(reg35);
      ListaReg35[I].valor := ListaReg35[I].valor + Valor;
    end;
  end;
end;

procedure TJSDimeServiceRegistros.AdicionaLinhaDime(ARegistro: TJSDimeModelRegistro; AArquivo: TStrings);
var
  linhaDime: string;
begin
  linhaDime := FacadeExport.linhaDime(ARegistro);
  AArquivo.Add(linhaDime);
//  Counter.AddCounter(ARegistro);
  OnAddRegistro(ARegistro);
end;

function TJSDimeServiceRegistros.CalculaCreditoReg30(
  ListaReg30: TObjectList<TJSDimeModelRegistro30>): Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(ListaReg30.Count) do
  begin
    if ListaReg30[i].item = itemQuadro09SubtotalCreditos then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09SaldosCredoresEstabConsolidados then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09CreditosTransfOutrosContribuintes then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09CreditosDCIP then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09SegregDebitosSaidasCreditoPresumido then
      Result := Result + ListaReg30[i].valor;
  end;
end;

function TJSDimeServiceRegistros.CalculaDebitoReg30(
  ListaReg30: TObjectList<TJSDimeModelRegistro30>): Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(ListaReg30.Count) do
  begin
    if ListaReg30[i].item = itemQuadro09SubtotalDebitos then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09ComplementoDebitoMudançaRegimeApu then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09SaldosDevRecebidosEstabConsolidados then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09DebitoReservaCreditoAcumulado then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09SegregCreditoPresumido then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09SegregCreditoPagtoAntecipado then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09SegregOutrosCreditos then
      Result := Result + ListaReg30[i].valor;
  end;
end;

function TJSDimeServiceRegistros.CalculaImpostoReg30(
  ListaReg30: TObjectList<TJSDimeModelRegistro30>): Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(ListaReg30.Count) do
  begin
    if ListaReg30[i].item = itemQuadro09SaldoDevedor then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09SaldoDevedorTransfEstabConsolidador then
      Result := Result - ListaReg30[i].valor;
  end;
end;

function TJSDimeServiceRegistros.CalculaSaldoCredorReg30(
  ListaReg30: TObjectList<TJSDimeModelRegistro30>): Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(ListaReg30.Count) do
  begin
    if ListaReg30[i].item = itemQuadro09SaldoCredor then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09SaldoCredorTransfEstabConsolidador then
      Result := Result - ListaReg30[i].valor;
  end;
end;

function TJSDimeServiceRegistros.CalculaSaldoReg30(
  ListaReg30: TObjectList<TJSDimeModelRegistro30>): Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(ListaReg30.Count) do
  begin
    if ListaReg30[i].item = itemQuadro09TotalDebitos then
      Result := Result + ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09TotalCreditos then
      Result := Result - ListaReg30[i].valor;

    if ListaReg30[i].item = itemQuadro09TotalAjustesApuracaoDecendial then
      Result := Result - ListaReg30[i].valor;
  end;
end;

function TJSDimeServiceRegistros.CalculaSaldoReg35(
  ListaReg35: TObjectList<TJSDimeModelRegistro35>): Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(ListaReg35.Count) do
  begin
    if ListaReg35[i].item = itemQuadro14SldDevApropCredPre then
      Result := Result + ListaReg35[i].valor;

    if ListaReg35[i].item = itemQuadro14DebUtilCredPreReceb then
      Result := Result + ListaReg35[i].valor;

    if ListaReg35[i].item = itemQuadro14DebExtCredPre then
      Result := Result + ListaReg35[i].valor;

    if ListaReg35[i].item = itemQuadro14TotalAntecipacoes then
      Result := Result - ListaReg35[i].valor;
  end;
end;

function TJSDimeServiceRegistros.CalculaTotalAntecipacoesReg35(
  ListaReg35: TObjectList<TJSDimeModelRegistro35>): Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(ListaReg35.Count) do
  begin
    if ListaReg35[i].item = itemQuadro14SldCredorMesAnt then
      Result := Result + ListaReg35[i].valor;

    if ListaReg35[i].item = itemQuadro14CredPagAntecipadoIcms then
      Result := Result + ListaReg35[i].valor;
  end;
end;

function TJSDimeServiceRegistros.CalculaSaldoDevedorApropCredPreReg35(
  ListaReg35: TObjectList<TJSDimeModelRegistro35>): Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(ListaReg35.Count) do
  begin
    if ListaReg35[i].item = itemQuadro14DebSaiCredPreSubstCredEnt then
      Result := Result + ListaReg35[i].valor;

    if ListaReg35[i].item = itemQuadro14CredPreUtilSubstituicaoCreditosEnt then
      Result := Result - ListaReg35[i].valor;

    if ListaReg35[i].item = itemQuadro14CredCompDebUtilCredPre then
      Result := Result - ListaReg35[i].valor;
  end;
end;

function TJSDimeServiceRegistros.CalculaSaldoFUMDESReg37(
  ListaReg37: TObjectList<TJSDimeModelRegistro37>): Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(ListaReg37.Count) do
  begin
    if ListaReg37[i].item = itemQuadro16SomaValorDevidoFUMDES then
      Result := Result + ListaReg37[i].valor;

    if ListaReg37[i].item = itemQuadro16SaldoCredorFUMDESMesAnterior then
      Result := Result - ListaReg37[i].valor;

    if ListaReg37[i].item = itemQuadro16SomaValorFUMDESDevolucao then
      Result := Result - ListaReg37[i].valor;
  end;
end;

function TJSDimeServiceRegistros.CalculaSaldoFundoSocialReg37(
  ListaReg37: TObjectList<TJSDimeModelRegistro37>): Currency;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Pred(ListaReg37.Count) do
  begin
    if ListaReg37[i].item = itemQuadro16SomaValorDevidoFUNDOSOCIAL then
      Result := Result + ListaReg37[i].valor;

    if ListaReg37[i].item = itemQuadro16SaldoCredorFUNDOSOCIALMesAnterior then
      Result := Result - ListaReg37[i].valor;

    if ListaReg37[i].item = itemQuadro16SomaValoresFUNDOSOCIALDevolucao then
      Result := Result - ListaReg37[i].valor;
  end;
end;

constructor TJSDimeServiceRegistros.create(Parent: IJSDimeService);
begin
  FDimeService   := Parent;
  FArquivo       := TStringList.Create;
  FComparerReg24 := TJSDimeModelRegistro24.getComparer;
  FComparerReg30 := TJSDimeModelRegistro30.getComparer;
  FComparerReg35 := TJSDimeModelRegistro35.getComparer;

  FacadeExport   := JSDime.Export.Interfaces
                      .FacadeExport(FDimeService.Emitente, FDimeService.Config);
end;

destructor TJSDimeServiceRegistros.Destroy;
begin
  if Assigned(FReg24List) then
    FReg24List.Free;

  inherited;
end;

function TJSDimeServiceRegistros.&End: IJSDimeService;
begin
  result := FDimeService;
end;

function TJSDimeServiceRegistros.Execute: TStrings;
var
  listReg24Quadro03 : TStringList;
  listReg25Quadro04 : TStringList;
  listReg36Quadro15 : TStringList;
  listReg37Quadro16 : TStringList;
  listReg46Quadro46 : TStringList;

  procedure addDime(AReg: TStrings);
  var
    i : Integer;
  begin
    for i := 0 to Pred(AReg.Count) do
      FArquivo.Add(AReg[i]);
  end;
begin
  FValorCreditoEntradas                := 0;
  FValorDebitoSaidas                   := 0;
  FValorICMSCreditoSubtrair            := 0;
  FSubTotalDebito                      := 0;
  FSubTotalCredito                     := 0;
  FImpostoArecolher                    := 0;
  FCreditosDeclaradosDCIP              := 0;
  FSegregCreditoPresumido              := 0;
  FSegregCreditoPagtoAntecipado        := 0;
  FSegregOutrosCreditos                := 0;
  FSegregDebitosSaidasCreditoPresumido := 0;

  listReg24Quadro03 := TStringList.Create;
  listReg25Quadro04 := TStringList.Create;
  listReg36Quadro15 := TStringList.Create;
  listReg37Quadro16 := TStringList.Create;
  listReg46Quadro46 := TStringList.Create;

  try
    try
      GerarReg20;
      GerarReg21Quadro00;
      GerarReg22Quadro01;
      GerarReg23Quadro02;

      GerarReg25Quadro04(listReg25Quadro04);
      GerarReg24Quadro03(listReg24Quadro03);
      GerarReg46Quadro46(listReg46Quadro46);

      addDime(listReg24Quadro03);
      addDime(listReg25Quadro04);

      GerarReg36Quadro15(listReg36Quadro15);
      GerarReg37Quadro16(listReg37Quadro16);

      GerarReg26Quadro05;
      GerarReg30Quadro09;
      GerarReg33Quadro12;
      GerarReg35Quadro14;

      addDime(listReg36Quadro15);
      addDime(listReg37Quadro16);

      addDime(listReg46Quadro46);

      GerarReg49Quadro49;
      GerarReg50Quadro50;

      GerarReg80Quadro80;
      GerarReg81Quadro81;
      GerarReg82Quadro82;
      GerarReg83Quadro83;
      GerarReg84Quadro84;
      GerarReg85Quadro85;

      GerarReg49Quadro98;
      GerarReg50Quadro99;

      result := FArquivo;
    except
      on e: Exception Do
      begin
        FArquivo.Free;
        //OnLogErro('Houve erro na geração da DIME: ' + e.Message);
        Raise;
      end;
    end;
  finally
    listReg24Quadro03.Free;
    listReg25Quadro04.Free;
    listReg36Quadro15.Free;
    listReg37Quadro16.Free;
    listReg46Quadro46.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg20;
var
  reg20: TJSDimeModelRegistro20;
  dao  : IJSDimeDAORegistro20;
begin
  dao := FDimeService.DAO.DAORegistro20;
  if not Assigned(dao) then
    Exit;

  reg20 := dao.load;
  try
    AdicionaLinhaDime(reg20, FArquivo);
  finally
    reg20.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg21Quadro00;
var
  Reg21Quadro00 : TJSDimeModelRegistro21;
begin
  Reg21Quadro00 := TJSDimeModelRegistro21.create;
  try
    Reg21Quadro00.numeroInscricao              := FDimeService.Emitente.IncricaoEstadual;
    Reg21Quadro00.nomeContribuinte             := FDimeService.Emitente.Nome;
    Reg21Quadro00.periodoReferencia            := FormatDateTime('mmyyyy',FDimeService.Config.DataInicial);
    Reg21Quadro00.tipoDeclaracao               := FDimeService.Config.TipoDeclaracao;
    Reg21Quadro00.regimeApuracao               := FDimeService.Config.RegimeApuracao;
    Reg21Quadro00.porteEmpresa                 := naoSeAplica;
    Reg21Quadro00.apuracaoConsolidada          := FDimeService.Config.ApuracaoConsolidada;
    Reg21Quadro00.apuracaoCentralizada         := naoSeAplica;
    Reg21Quadro00.transfCreditos               := FDimeService.Config.TranferenciaCredito;
    Reg21Quadro00.temCreditosPresumidos        := naoSeAplica;
    Reg21Quadro00.temCreditosIncentivosFiscais := naoSeAplica;
    Reg21Quadro00.movimento                    := FDimeService.Config.Movimento;
    Reg21Quadro00.substitutoTributario         := FDimeService.Config.SubstitutoTributario;
    Reg21Quadro00.temEscritaContabil           := FDimeService.Config.TemEscritaContabil;
    Reg21Quadro00.quantidadeTrabalhadores      := FDimeService.Config.NumeroTrabalhadores;

    AdicionaLinhaDime(Reg21Quadro00, FArquivo);
  finally
    Reg21Quadro00.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg22Quadro01;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro22Quadro01;
  reg22     : TJSDimeModelRegistro22;
  reg22List : TObjectList<TJSDimeModelRegistro22>;
begin
  dao := FDimeService.DAO.DAORegistro22Quadro01;
  if not Assigned(dao) then
    Exit;

  reg22List := dao.listReg22(FDimeService.Config.DataInicial, FDimeService.Config.DataFinal);
  try
    for i := 0 to Pred(reg22List.Count) do
    begin
      reg22 := reg22List[i];
      AdicionaLinhaDime(reg22, FArquivo);
      AddReg24(reg22);

      if (Pos(reg22.cfop, cCfopCredRessarcimentos) > 0) or
         (Pos(reg22.cfop, cCfopOpAtivoImob) > 0) or
         (Pos(reg22.cfop, cCfopEntExterior) > 0) or
         (Pos(reg22.cfop, cCfopMatUsoCons) > 0) then
        FValorICMSCreditoSubtrair := FValorICMSCreditoSubtrair + Reg22.impostoCreditado;
    end;
  finally
    reg22List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg23Quadro02;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro23Quadro02;
  reg23     : TJSDimeModelRegistro23;
  reg23List : TObjectList<TJSDimeModelRegistro23>;
begin
  dao := FDimeService.DAO.DAORegistro23Quadro02;
  if not Assigned(dao) then
    Exit;

  reg23List := dao.listReg23(FDimeService.Config.DataInicial, FDimeService.Config.DataFinal);
  try
    for i := 0 to Pred(reg23List.Count) do
    begin
      reg23 := reg23List[i];
      AdicionaLinhaDime(reg23, FArquivo);
      AddReg24(reg23);
    end;
  finally
    reg23List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg24Quadro03(AlistReg24Quadro03: TStrings);
var
  i     : Integer;
  reg24 : TJSDimeModelRegistro24;
begin
  if not Assigned(FReg24List) then
    Exit;

  for i:= 0 to Pred(FReg24List.Count) do
  begin
    reg24 := FReg24List[i];
    AdicionaLinhaDime(reg24, AlistReg24Quadro03);
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg25Quadro04(AlistReg25Quadro04: TStrings);
var
  i         : Integer;
  dao       : IJSDimeDAORegistro25Quadro04;
  reg25     : TJSDimeModelRegistro25;
  reg25List : TObjectList<TJSDimeModelRegistro25>;
  Comparer  : IComparer<TJSDimeModelRegistro25>;
  total     : Currency;
begin
  total               := 0;

  dao := FDimeService.DAO.DAORegistro25Quadro04;
  if not Assigned(dao) then
    reg25List := TObjectList<TJSDimeModelRegistro25>.Create
  else
    reg25List := dao.list(FDimeService.Config.DataInicial);

  try
    Comparer  := TJSDimeModelRegistro25.getComparer;

    if FValorDebitoSaidas > 0 then
    begin
      reg25List.Add(TJSDimeModelRegistro25.create);
      reg25List.Last.item  := itemQuadro04DebitoSaidas;
      reg25List.Last.valor := FValorDebitoSaidas;
    end;

    for i:= 0 to Pred(reg25List.Count) do
      total := total + reg25List[i].valor;

    if total > 0 then
    begin
      reg25List.Add(TJSDimeModelRegistro25.create);
      reg25List.Last.item  := itemQuadro04SubTotalDebitos;
      reg25List.Last.valor := total;
      FSubTotalDebito      := total;
    end;

    reg25List.Sort(Comparer);
    for i:= 0 to Pred(reg25List.Count) do
    begin
      reg25 := reg25List[i];
      AdicionaLinhaDime(reg25, AlistReg25Quadro04);
      AddReg24(reg25);
    end;
  finally
    reg25List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg26Quadro05;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro26Quadro05;
  reg26     : TJSDimeModelRegistro26;
  reg26List : TObjectList<TJSDimeModelRegistro26>;
  Comparer  : IComparer<TJSDimeModelRegistro26>;
  total     : Currency;
begin
  total := 0;

  if FDimeService.Config.UtilizaSoCredDCIP then
    Exit;

  dao := FDimeService.DAO.DAORegistro26Quadro05;
  if not Assigned(dao) then
    reg26List := TObjectList<TJSDimeModelRegistro26>.Create
  else
    reg26List := dao.list(FDimeService.Config.DataInicial);

  try
    Comparer  := TJSDimeModelRegistro26.getComparer;

    if (FValorCreditoEntradas - FValorICMSCreditoSubtrair) > 0 then
    begin
      reg26List.Add(TJSDimeModelRegistro26.create);
      reg26List.Last.item  := itemQuadro05CreditoEntradas;
      reg26List.Last.valor := FValorCreditoEntradas - FValorICMSCreditoSubtrair;
    end;

    for i:= 0 to Pred(reg26List.Count) do
      total := total + reg26List[i].valor;

    if total > 0 then
    begin
      reg26List.Add(TJSDimeModelRegistro26.create);
      reg26List.Last.item  := itemQuadro05SubtotalCreditos;
      reg26List.Last.valor := total;
      FSubTotalCredito     := total;
    end;

    reg26List.Sort(Comparer);
    for i:= 0 to Pred(reg26List.Count) do
    begin
      reg26 := reg26List[i];
      AdicionaLinhaDime(reg26, FArquivo);
    end;
  finally
    reg26List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg30Quadro09;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro30Quadro09;
  reg30     : TJSDimeModelRegistro30;
  reg30List : TObjectList<TJSDimeModelRegistro30>;
  FSaldo    : Currency;
begin
  dao := FDimeService.DAO.DAORegistro30Quadro09;
  if not Assigned(dao) then
  begin
    if (FSubTotalDebito + FSubTotalCredito = 0) then
      Exit
    else
      reg30List := TObjectList<TJSDimeModelRegistro30>.Create;
  end
  else
    reg30List := dao.list(FDimeService.Config.DataInicial);

  try
    AddReg30(itemQuadro09SubtotalDebitos , FSubTotalDebito, reg30List);
    AddReg30(itemQuadro09SubtotalCreditos, FSubTotalCredito, reg30List);
    AddReg30(itemQuadro09CreditosDCIP    , FCreditosDeclaradosDCIP, reg30List);
    AddReg30(itemQuadro09TotalDebitos    , CalculaDebitoReg30(reg30List), reg30List);
    AddReg30(itemQuadro09TotalCreditos   , CalculaCreditoReg30(reg30List), reg30List);

    FSaldo := CalculaSaldoReg30(reg30List);
    if FSaldo > 0 then
    begin
      AddReg30(itemQuadro09SaldoDevedor, FSaldo, reg30List);
      FImpostoArecolher := CalculaImpostoReg30(reg30List);
      AddReg30(itemQuadro09ImpostoRecolher, FImpostoArecolher, reg30List);
    end
    else
    begin
      AddReg30(itemQuadro09SaldoCredor, Abs(FSaldo), reg30List);
      AddReg30(itemQuadro09SaldoCredorParaMesSeguinte, CalculaSaldoCredorReg30(reg30List), reg30List);
    end;

    for i:= 0 to Pred(reg30List.Count) do
    begin
      reg30 := reg30List[i];
      AdicionaLinhaDime(reg30, FArquivo);
      TransfSegregacaoReg35(reg30);
    end;
  finally
    reg30List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg33Quadro12;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro33Quadro12;
  reg33     : TJSDimeModelRegistro33;
  reg33List : TObjectList<TJSDimeModelRegistro33>;
  FSaldo    : Currency;
begin
  dao := FDimeService.DAO.DAORegistro33Quadro12;
  if not Assigned(dao) then
  begin
    if (FImpostoArecolher = 0) then
      Exit
    else
      reg33List := TObjectList<TJSDimeModelRegistro33>.Create;
  end
  else
    reg33List := dao.list(FDimeService.Config.DataInicial);

  try
    for i:= 0 to Pred(reg33List.Count) do
    begin
      reg33 := reg33List[i];
      if reg33._id.IsEmpty then
        reg33.valor := FImpostoArecolher;

      if reg33.valor > 0 then
        AdicionaLinhaDime(reg33, FArquivo);
    end;
  finally
    reg33List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg35Quadro14;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro35Quadro14;
  reg35     : TJSDimeModelRegistro35;
  reg35List : TObjectList<TJSDimeModelRegistro35>;
  FSaldo    : Currency;
begin
  dao := FDimeService.DAO.DAORegistro35Quadro14;
  if not Assigned(dao) then
  begin
    if (FSegregCreditoPresumido +
        FSegregCreditoPagtoAntecipado +
        FSegregOutrosCreditos +
        FSegregDebitosSaidasCreditoPresumido = 0) then
      Exit
    else
      reg35List := TObjectList<TJSDimeModelRegistro35>.Create;
  end
  else
    reg35List := dao.list(FDimeService.Config.DataInicial);

  try
    AddReg35(itemQuadro14DebSaiCredPreSubstCredEnt,           FSegregDebitosSaidasCreditoPresumido, reg35List);  //itemQuadro09SegregDebitosSaidasCreditoPresumido 076
    AddReg35(itemQuadro14CredPreUtilSubstituicaoCreditosEnt,  FSegregCreditoPresumido             , reg35List);  //itemQuadro09SegregCreditoPresumido              036
    AddReg35(itemQuadro14CredCompDebUtilCredPre,              FSegregOutrosCreditos               , reg35List);  //itemQuadro09SegregOutrosCreditos                038
    AddReg35(itemQuadro14CredPagAntecipadoIcms,               FSegregCreditoPagtoAntecipado       , reg35List);  //itemQuadro09SegregCreditoPagtoAntecipado        037

    AddReg35(itemQuadro14SldDevApropCredPre, CalculaSaldoDevedorApropCredPreReg35(reg35List), reg35List);
    AddReg35(itemQuadro14TotalAntecipacoes,  CalculaTotalAntecipacoesReg35(reg35List), reg35List);

    FSaldo := CalculaSaldoReg35(reg35List);
    if FSaldo >= 0 then
      AddReg35(itemQuadro14ImpostoRecolherUtilCredPre, FSaldo, reg35List);

    if FSaldo < 0 then
    begin
      reg35List.Add(TJSDimeModelRegistro35.create);
      reg35List.Last.item  := itemQuadro14ImpostoRecolherUtilCredPre;
      reg35List.Last.valor := 0;

      AddReg35(itemQuadro14SaldoCredorAntecipacoesMesSeguinte, Abs(FSaldo), reg35List);
    end;

    for i:= 0 to Pred(reg35List.Count) do
    begin
      reg35 := reg35List[i];
      AdicionaLinhaDime(reg35, FArquivo);
    end;
  finally
    reg35List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg36Quadro15(AlistReg36Quadro15: TStrings);
var
  i         : Integer;
  dao       : IJSDimeDAORegistro36Quadro15;
  reg36     : TJSDimeModelRegistro36;
  reg36List : TObjectList<TJSDimeModelRegistro36>;
  reg36Total: TJSDimeModelRegistro36;
begin
  dao := FDimeService.DAO.DAORegistro36Quadro15;
  if not Assigned(dao) then
    reg36List := TObjectList<TJSDimeModelRegistro36>.Create
  else
    reg36List := dao.listReg36(FDimeService.Config.DataInicial);

  reg36Total := TJSDimeModelRegistro36.Create;
  try
    reg36Total.sequencia                     := 999;
    reg36Total.codigoBeneficioTTD            := '9999';
    reg36Total.numeroConcessaoTTD            := '999999999999999';
    reg36Total.subtipoDCIPsemExigenciaTTD    := '9999';
    reg36Total.codigoCalculoFUMDES           := ccfNenhum;
    reg36Total.codigoCalculoFundoSocial      := ccfsNenhum;
    reg36Total.valorBaseCalculoICMS          := 0;
    reg36Total.valorICMSExonerado            := 0;
    reg36Total.valorFUMDES                   := 0;
    reg36Total.valorFundoSocial              := 0;
    reg36Total.valorBaseCalculoICMSDevolucao := 0;
    reg36Total.valorICMSExoneradoDevolucao   := 0;
    reg36Total.valorFUMDESDevolucao          := 0;
    reg36Total.valorFundoSocialDevolucao     := 0;

    for i:= 0 to Pred(reg36List.Count) do
    begin
      reg36Total.valorBaseCalculoICMS          := reg36Total.valorBaseCalculoICMS          + reg36List[i].valorBaseCalculoICMS;
      reg36Total.valorICMSExonerado            := reg36Total.valorICMSExonerado            + reg36List[i].valorICMSExonerado           ;
      reg36Total.valorFUMDES                   := reg36Total.valorFUMDES                   + reg36List[i].valorFUMDES                  ;
      reg36Total.valorFundoSocial              := reg36Total.valorFundoSocial              + reg36List[i].valorFundoSocial             ;
      reg36Total.valorBaseCalculoICMSDevolucao := reg36Total.valorBaseCalculoICMSDevolucao + reg36List[i].valorBaseCalculoICMSDevolucao;
      reg36Total.valorICMSExoneradoDevolucao   := reg36Total.valorICMSExoneradoDevolucao   + reg36List[i].valorICMSExoneradoDevolucao  ;
      reg36Total.valorFUMDESDevolucao          := reg36Total.valorFUMDESDevolucao          + reg36List[i].valorFUMDESDevolucao         ;
      reg36Total.valorFundoSocialDevolucao     := reg36Total.valorFundoSocialDevolucao     + reg36List[i].valorFundoSocialDevolucao    ;
    end;

    if reg36List.Count > 0 then
      reg36List.Add(reg36Total);

    for i:= 0 to Pred(reg36List.Count) do
    begin
      reg36 := reg36List[i];
      AdicionaLinhaDime(reg36, AlistReg36Quadro15);
    end;
  finally
    reg36List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg37Quadro16(AlistReg37Quadro16: TStrings);
var
  i         : Integer;
  dao       : IJSDimeDAORegistro37Quadro16;
  reg37     : TJSDimeModelRegistro37;
  reg37List : TObjectList<TJSDimeModelRegistro37>;
  Comparer  : IComparer<TJSDimeModelRegistro37>;
  FSaldoFUMDES,
  FSaldoFundoSocial : Currency;
begin
  dao := FDimeService.DAO.DAORegistro37Quadro16;
  if not Assigned(dao) then
    reg37List := TObjectList<TJSDimeModelRegistro37>.Create
  else
    reg37List := dao.listReg37;

  try
    FSaldoFUMDES      := CalculaSaldoFUMDESReg37(reg37List);

    if FSaldoFUMDES >= 0 then
    begin
      reg37List.Add(TJSDimeModelRegistro37.create);
      reg37List.Last.item  := itemQuadro16FUMDESRecolher;
      reg37List.Last.valor := FSaldoFUMDES;
    end;

    if FSaldoFUMDES < 0 then
    begin
      reg37List.Add(TJSDimeModelRegistro37.create);
      reg37List.Last.item  := itemQuadro16SaldoCredorMesSeguinteFUMDES;
      reg37List.Last.valor := Abs(FSaldoFUMDES);
    end;

    FSaldoFundoSocial := CalculaSaldoFundoSocialReg37(reg37List);

    if FSaldoFundoSocial >= 0 then
    begin
      reg37List.Add(TJSDimeModelRegistro37.create);
      reg37List.Last.item  := itemQuadro16FUNDOSOCIALRecolher;
      reg37List.Last.valor := FSaldoFundoSocial;
    end;

    if FSaldoFundoSocial < 0 then
    begin
      reg37List.Add(TJSDimeModelRegistro37.create);
      reg37List.Last.item  := itemQuadro16SaldoCredorMesSeguinteFUNDOSOCIAL;
      reg37List.Last.valor := Abs(FSaldoFundoSocial);
    end;

    Comparer := TJSDimeModelRegistro37.getComparer;
    reg37List.Sort(Comparer);

    for i:= 0 to Pred(reg37List.Count) do
    begin
      reg37 := reg37List[i];
      AdicionaLinhaDime(reg37, AlistReg37Quadro16);
    end;
  finally
    reg37List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg46Quadro46(AlistReg46Quadro46: TStrings);
var
  i         : Integer;
  dao       : IJSDimeDAORegistro46Quadro46;
  reg46List : TObjectList<TJSDimeModelRegistro46>;
  reg46     : TJSDimeModelRegistro46;
begin
  dao := FDimeService.DAO.DAORegistro46Quadro46;
  if not Assigned(dao) then
    Exit;

  reg46List := dao.list(FDimeService.Config.DataInicial);
  try
    for i:= 0 to Pred(reg46List.Count) do
    begin
      reg46 := reg46List[i];
      AdicionaLinhaDime(reg46, AlistReg46Quadro46);
      FCreditosDeclaradosDCIP := FCreditosDeclaradosDCIP + reg46.valor;
    end;

    if FCreditosDeclaradosDCIP > 0 then
    begin
      reg46 := TJSDimeModelRegistro46.create;
      try
        reg46.sequencia := 990;
        reg46.valor     := FCreditosDeclaradosDCIP;
        AdicionaLinhaDime(reg46, AlistReg46Quadro46);
      finally
        reg46.Free;
      end;
    end;

  finally
    reg46List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg49Quadro49;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro49Quadro49;
  reg49     : TJSDimeModelRegistro49;
  reg49List : TObjectList<TJSDimeModelRegistro49>;
begin
  dao := FDimeService.DAO.DAORegistro49Quadro49;
  if not Assigned(dao) then
    Exit;

  reg49List := dao.listReg49;
  try
    for i := 0 to Pred(reg49List.Count) do
    begin
      reg49 := reg49List[i];
      AdicionaLinhaDime(reg49, FArquivo);
    end;
  finally
    reg49List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg49Quadro98;
var
  Reg98 : TJSDimeModelRegistro98;
begin
  Reg98 := TJSDimeModelRegistro98.create;
  try
    Reg98.qtdReg := FArquivo.Count;
    AdicionaLinhaDime(reg98, FArquivo);
  finally
    Reg98.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg50Quadro50;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro50Quadro50;
  reg50     : TJSDimeModelRegistro50;
  reg50List : TObjectList<TJSDimeModelRegistro50>;
begin
  dao := FDimeService.DAO.DAORegistro50Quadro50;
  if not Assigned(dao) then
    Exit;

  reg50List := dao.listReg50;
  try
    for i := 0 to Pred(reg50List.Count) do
    begin
      reg50 := reg50List[i];
      AdicionaLinhaDime(reg50, FArquivo);
    end;
  finally
    reg50List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg50Quadro99;
var
  Reg99 : TJSDimeModelRegistro99;
begin
  Reg99 := TJSDimeModelRegistro99.create;
  try
    Reg99.qtdReg := FArquivo.Count + 1  ;
    Reg99.qtdDeclaracoes := 1;
    AdicionaLinhaDime(reg99, FArquivo);
  finally
    Reg99.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg80Quadro80;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro80Quadro80;
  reg80     : TJSDimeModelRegistro80;
  reg80List : TObjectList<TJSDimeModelRegistro80>;
begin
  dao := FDimeService.DAO.DAORegistro80Quadro80;
  if not Assigned(dao) then
    Exit;

  reg80List := dao.listReg80(YearOf(FDimeService.Config.DataInicial), FormatDateTime('MM',FDimeService.Config.DataInicial));
  try
    for i := 0 to Pred(reg80List.Count) do
    begin
      reg80 := reg80List[i];
      AdicionaLinhaDime(reg80, FArquivo);
    end;
  finally
    reg80List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg81Quadro81;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro81Quadro81;
  reg81     : TJSDimeModelRegistro81;
  reg81List : TObjectList<TJSDimeModelRegistro81>;
begin
  dao := FDimeService.DAO.DAORegistro81Quadro81;
  if not Assigned(dao) then
    Exit;

  reg81List := dao.listReg81(YearOf(FDimeService.Config.DataInicial), FormatDateTime('MM',FDimeService.Config.DataInicial));
  try
    for i := 0 to Pred(reg81List.Count) do
    begin
      reg81 := reg81List[i];
      AdicionaLinhaDime(reg81, FArquivo);
    end;
  finally
    reg81List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg82Quadro82;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro82Quadro82;
  reg82     : TJSDimeModelRegistro82;
  reg82List : TObjectList<TJSDimeModelRegistro82>;
begin
  dao := FDimeService.DAO.DAORegistro82Quadro82;
  if not Assigned(dao) then
    Exit;

  reg82List := dao.listReg82(YearOf(FDimeService.Config.DataInicial), FormatDateTime('MM',FDimeService.Config.DataInicial));
  try
    for i := 0 to Pred(reg82List.Count) do
    begin
      reg82 := reg82List[i];
      AdicionaLinhaDime(reg82, FArquivo);
    end;
  finally
    reg82List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg83Quadro83;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro83Quadro83;
  reg83     : TJSDimeModelRegistro83;
  reg83List : TObjectList<TJSDimeModelRegistro83>;
begin
  dao := FDimeService.DAO.DAORegistro83Quadro83;
  if not Assigned(dao) then
    Exit;

  reg83List := dao.listReg83(YearOf(FDimeService.Config.DataInicial), FormatDateTime('MM',FDimeService.Config.DataInicial));
  try
    for i := 0 to Pred(reg83List.Count) do
    begin
      reg83 := reg83List[i];
      AdicionaLinhaDime(reg83, FArquivo);
    end;
  finally
    reg83List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg84Quadro84;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro84Quadro84;
  reg84     : TJSDimeModelRegistro84;
  reg84List : TObjectList<TJSDimeModelRegistro84>;
begin
  dao := FDimeService.DAO.DAORegistro84Quadro84;
  if not Assigned(dao) then
    Exit;

  reg84List := dao.listReg84(YearOf(FDimeService.Config.DataInicial), FormatDateTime('MM',FDimeService.Config.DataInicial));
  try
    for i := 0 to Pred(reg84List.Count) do
    begin
      reg84 := reg84List[i];
      AdicionaLinhaDime(reg84, FArquivo);
    end;
  finally
    reg84List.Free;
  end;
end;

procedure TJSDimeServiceRegistros.GerarReg85Quadro85;
var
  i         : Integer;
  dao       : IJSDimeDAORegistro85Quadro85;
  reg85     : TJSDimeModelRegistro85;
  reg85List : TObjectList<TJSDimeModelRegistro85>;
begin
  dao := FDimeService.DAO.DAORegistro85Quadro85;
  if not Assigned(dao) then
    Exit;

  reg85List := dao.listReg85(YearOf(FDimeService.Config.DataInicial), FormatDateTime('MM',FDimeService.Config.DataInicial));
  try
    for i := 0 to Pred(reg85List.Count) do
    begin
      reg85 := reg85List[i];
      AdicionaLinhaDime(reg85, FArquivo);
    end;
  finally
    reg85List.Free;
  end;
end;

class function TJSDimeServiceRegistros.New(
  Parent: IJSDimeService): IJSDimeServiceRegistros;
begin
  Result := Self.create(Parent);
end;

procedure TJSDimeServiceRegistros.OnAddRegistro(Registro: TJSDimeModelRegistro);
var
  onAddRegistro: TOnDimeAddRegistro;
begin
  onAddRegistro := FDimeService.Config.OnAddRegistro;

  if Assigned(onAddRegistro) then
    onAddRegistro(Registro);
end;

function TJSDimeServiceRegistros.validateInstance<T>(
  AModel: TJSDimeModelRegistro): Boolean;
var
  model: T;
begin
  model := T.create;
  try
    Result := (AModel is T);
  finally
    model.free;
  end;
end;

end.
