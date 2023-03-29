unit JSDime.Model.Types;

interface

uses
  System.sysutils;

type
  TJSDimeApuracaoConsolidada = (acNao, acConsolidador, acConsolidado);

  TJSDimeCodigoCalculoFUMDES = (ccfNaoExigido, ccfICMSExonerado2, ccfNenhum);

  TJSDimeCodigoCalculoFundoSocial = (ccfsNaoExigido, ccfsICMSExonerado25, ccfsBcICMSFUMDES04, ccfsBcICMSFundoSocialFUMDES04, ccfsICMSExonerado45, ccfsNenhum);

  TJSDimeEscritaContabil = (ecSimEstabelecimentoPrincipal, ecNao, ecSimDadosInformadosEstabelecimentoPrincipal);

  TJSDimeMovimento = (mSemMovimentoSemSaldos, mSemMovimentoComSaldos, mComMovimento);

  TJSDimeNaoSeAplica = (naoSeAplica);

  TJSDimeRegimeApuracao = (raNormal, raProdutorPrimario);

  TJSDimeSubstitutoTributario = (stSim, stNao, stSubstituido);

  TJSDimeTipoDeclaracao = (tdNormal, tdEncerramento, tdSimplesNacional);

  TJSDimeTransferenciaCredito = (tcNao,
                                 tcApurouOuReservouCreditos,
                                 tcRecebeuCreditos,
                                 tcApurouOuReservouErecebeuCreditos,
                                 tcApuracaoEreservaCreditoAgropecuario);

  TJSDimeApuracaoConsolidadaHelper = record helper for TJSDimeApuracaoConsolidada
  public
    function toString: string;
    procedure fromString(s: string);
    function Caption: string;
  end;

  TJSDimeCodigoCalculoFUMDESHelper = record helper for TJSDimeCodigoCalculoFUMDES
  public
    function toString: string;
    procedure fromString(s: string);
    function Caption: string;
  end;

  TJSDimeCodigoCalculoFundoSocialHelper = record helper for TJSDimeCodigoCalculoFundoSocial
  public
    function toString: string;
    procedure fromString(s: string);
    function Caption: string;
  end;

  TJSDimeEscritaContabilHelper = record helper for TJSDimeEscritaContabil
  public
    function toString: string;
    procedure fromString(s: string);
    function Caption: string;
  end;

  TJSDimeMovimentoHelper = record helper for TJSDimeMovimento
  public
    function toString: string;
    procedure fromString(s: string);
    function Caption: string;
  end;

  TJSDimeNaoSeAplicaHelper = record helper for TJSDimeNaoSeAplica
  public
    function toString: string;
    function Caption: string;
  end;

  TJSDimeRegimeApuracaoHelper = record helper for TJSDimeRegimeApuracao
  public
    function toString: string;
    procedure fromString(s: string);
    function Caption: string;
  end;

  TJSDimeSubstitutoTributarioHelper = record helper for TJSDimeSubstitutoTributario
  public
    function toString: string;
    procedure fromString(s: string);
    function Caption: string;
  end;

  TJSDimeTipoDeclaracaoHelper = record helper for TJSDimeTipoDeclaracao
  public
    function toString: string;
    procedure fromString(s: string);
    function Caption: string;
  end;

  TJSDimeTransferenciaCreditoHelper = record helper for TJSDimeTransferenciaCredito
  public
    function toString: string;
    procedure fromString(s: string);
    function Caption: string;
  end;



implementation

{ TJSDimeTipoDeclaracaoHelper }

function TJSDimeTipoDeclaracaoHelper.Caption: string;
begin
  case Self of
    tdNormal          : result := 'Normal';
    tdEncerramento    : result := 'Encerramento de Atividades';
    tdSimplesNacional : result := 'Enquadramento no Simples Nacional';
  end;
end;

procedure TJSDimeTipoDeclaracaoHelper.fromString(s: string);
begin
  Self := TJSDimeTipoDeclaracao(0);
  if (s = '2') then
    Self := TJSDimeTipoDeclaracao(1)
  else if (s = '4') then
    Self := TJSDimeTipoDeclaracao(2);
end;

function TJSDimeTipoDeclaracaoHelper.toString: string;
begin
  case Self of
    tdNormal            : Result := '1';
    tdEncerramento      : Result := '2';
    tdSimplesNacional   : Result := '4';
  end;
end;

{ TJSDimeRegimeApuracaoHelper }

function TJSDimeRegimeApuracaoHelper.Caption: string;
begin
  case Self of
    raNormal            : result := 'Normal';
    raProdutorPrimario  : result := 'Produtor Primário';
  end;
end;

procedure TJSDimeRegimeApuracaoHelper.fromString(s: string);
begin
  Self := TJSDimeRegimeApuracao(0);
  if (s = '9') then
    Self := TJSDimeRegimeApuracao(1);
end;

function TJSDimeRegimeApuracaoHelper.toString: string;
begin
  case Self of
    raNormal            : Result := '2';
    raProdutorPrimario  : Result := '9';
  end;
end;

{ TJSDimeApuracaoConsolidadaHelper }

function TJSDimeApuracaoConsolidadaHelper.Caption: string;
begin
  case Self of
    acNao          : result := 'Não é apuração consolidada';
    acConsolidador : result := 'É estabelecimento consolidador';
    acConsolidado  : result := 'É estabelecimento consolidado';
  end;
end;

procedure TJSDimeApuracaoConsolidadaHelper.fromString(s: string);
var i: Integer;
begin
  Self := TJSDimeApuracaoConsolidada(0);

  for I := 1 to 3 do
    if IntToStr(I) = s then
      Self := TJSDimeApuracaoConsolidada(I-1);
end;

function TJSDimeApuracaoConsolidadaHelper.toString: string;
begin
  case self of
    acNao          : Result := '1';
    acConsolidador : Result := '2';
    acConsolidado  : Result := '3';
  end;
end;

{ TJSDimeTransferenciaCreditoHelper }

function TJSDimeTransferenciaCreditoHelper.Caption: string;
begin
  case Self of
    tcNao                                 : result := 'Não apurou ou reservou nem recebeu créditos';
    tcApurouOuReservouCreditos            : result := 'Apurou ou reservou créditos';
    tcRecebeuCreditos                     : result := 'Recebeu créditos';
    tcApurouOuReservouErecebeuCreditos    : result := 'Apurou ou recervor e recebeu créditos';
    tcApuracaoEreservaCreditoAgropecuario : result := 'Apuração e reserva crédito sistema cooperativo agropecuário'
  end;
end;

procedure TJSDimeTransferenciaCreditoHelper.fromString(s: string);
var i: Integer;
begin
  Self := TJSDimeTransferenciaCredito(0);

  for I := 1 to 5 do
    if IntToStr(I) = s then
      Self := TJSDimeTransferenciaCredito(I-1);
end;

function TJSDimeTransferenciaCreditoHelper.toString: string;
begin
  case Self of
    tcNao                                 : Result := '1';
    tcApurouOuReservouCreditos            : Result := '2';
    tcRecebeuCreditos                     : Result := '3';
    tcApurouOuReservouErecebeuCreditos    : Result := '4';
    tcApuracaoEreservaCreditoAgropecuario : Result := '5';
  end;
end;

{ TJSDimeMovimentoHelper }

function TJSDimeMovimentoHelper.Caption: string;
begin
  case Self of
    mSemMovimentoSemSaldos : result := 'Sem movimento e sem saldos';
    mSemMovimentoComSaldos : result := 'Sem movimento e com saldos';
    mComMovimento          : result := 'Com movimento';
  end;
end;

procedure TJSDimeMovimentoHelper.fromString(s: string);
var I : Integer;
begin
  Self := TJSDimeMovimento(0);

  for I := 1 to 3 do
    if IntToStr(I) = s then
      Self := TJSDimeMovimento(I-1);
end;

function TJSDimeMovimentoHelper.toString: string;
begin
  case Self of
    mSemMovimentoSemSaldos  : Result := '1';
    mSemMovimentoComSaldos  : Result := '2';
    mComMovimento           : Result := '3';
  end;
end;

{ TJSDimeSubstitutoTributarioHelper }

function TJSDimeSubstitutoTributarioHelper.Caption: string;
begin
  case Self of
    stSim         : result := 'Sim';
    stNao         : result := 'Não';
    stSubstituido : result := 'Substituído solidário';
  end;
end;

procedure TJSDimeSubstitutoTributarioHelper.fromString(s: string);
var i: Integer;
begin
  Self := TJSDimeSubstitutoTributario(0);

  for I := 1 to 3 do
    if IntToStr(I) = s then
      Self := TJSDimeSubstitutoTributario(I-1);
end;

function TJSDimeSubstitutoTributarioHelper.toString: string;
begin
  case Self of
    stSim         : Result := '1';
    stNao         : Result := '2';
    stSubstituido : Result := '3';
  end;
end;

{ TJSDimeEscritaContabilHelper }

function TJSDimeEscritaContabilHelper.Caption: string;
begin
  case Self of
    ecSimEstabelecimentoPrincipal                : result := 'Sim é o estabelecimento principal';
    ecNao                                        : result := 'Não';
    ecSimDadosInformadosEstabelecimentoPrincipal : result := 'Sim, dados informados no estabelecimento principal';
  end;
end;

procedure TJSDimeEscritaContabilHelper.fromString(s: string);
var I : Integer;
begin
  Self := TJSDimeEscritaContabil(0);

  for I := 1 to 3 do
    if IntToStr(I) = s then
      Self := TJSDimeEscritaContabil(I-1);
end;

function TJSDimeEscritaContabilHelper.toString: string;
begin
  case Self of
    ecSimEstabelecimentoPrincipal                : Result := '1';
    ecNao                                        : Result := '2';
    ecSimDadosInformadosEstabelecimentoPrincipal : Result := '3';
  end;
end;

{ TJSDimeNaoSeAplicaHelper }

function TJSDimeNaoSeAplicaHelper.Caption: string;
begin
  Result := 'Não se aplica';
end;

function TJSDimeNaoSeAplicaHelper.toString: string;
begin
  Result := '1';
end;

{ TJSDimeCodigoCalculoFUMDESHelper }

function TJSDimeCodigoCalculoFUMDESHelper.Caption: string;
begin
  case Self of
    ccfNaoExigido     : result := 'Não exigido na Portaria SEF 143/22';
    ccfICMSExonerado2 : result := '2% do ICMS Exonerado';
    ccfNenhum         : result := 'Nenhum';
  end;
end;

procedure TJSDimeCodigoCalculoFUMDESHelper.fromString(s: string);
begin
  if s = '0' then
    Self := ccfNaoExigido
  else if s = '1' then
    Self := ccfICMSExonerado2
  else
    Self := ccfNenhum;
end;

function TJSDimeCodigoCalculoFUMDESHelper.toString: string;
begin
  case self of
    ccfNaoExigido     : Result := '0';
    ccfICMSExonerado2 : Result := '1';
    ccfNenhum         : Result := '9';
  end;
end;

{ TJSDimeCodigoCalculoFundoSocialHelper }

function TJSDimeCodigoCalculoFundoSocialHelper.Caption: string;
begin
  case Self of
    ccfsNaoExigido                : result := 'Não exigido na Portaria SEF 143/22';
    ccfsICMSExonerado25           : result := '2,5% do ICMS Exonerado';
    ccfsBcICMSFUMDES04            : result := '0,4% da BC ICMS - FUMDES';
    ccfsBcICMSFundoSocialFUMDES04 : result := '0,4% da BC ICMS - (Fundo Social + FUMDES)';
    ccfsICMSExonerado45           : result := '4,5% do ICMS Exonerado';
    ccfsNenhum                    : result := 'Nenhum';
  end;
end;

procedure TJSDimeCodigoCalculoFundoSocialHelper.fromString(s: string);
begin
  if s = '0' then
    Self := ccfsNaoExigido
  else if s = '1' then
    Self := ccfsICMSExonerado25
  else if s = '2' then
    Self := ccfsBcICMSFUMDES04
  else if s = '3' then
    Self := ccfsBcICMSFundoSocialFUMDES04
  else if s = '4' then
    Self := ccfsICMSExonerado45
  else
    Self := ccfsNenhum;
end;

function TJSDimeCodigoCalculoFundoSocialHelper.toString: string;
begin
  case self of
    ccfsNaoExigido                : Result := '0';
    ccfsICMSExonerado25           : Result := '1';
    ccfsBcICMSFUMDES04            : Result := '2';
    ccfsBcICMSFundoSocialFUMDES04 : Result := '3';
    ccfsICMSExonerado45           : Result := '4';
    ccfsNenhum                    : Result := '9';
  end;
end;

end.
