unit JSDime.Model.Consts;

interface

const
  cLogErrCampoObrigatorio = 'Linha %d: Reg. %s Quadro %s - O campo %s é obrigatório e não teve seu valor informado.';
  cLogErrValorPositivo    = 'Linha %d: Reg. %s Quadro %s - O campo %s deve ser maior ou igual a 0.';

  cfopNaoContribuinte     = '6107_6108_5258_6258_5307_6307_5357_6357';
  cCfopCredRessarcimentos = '1601_1602_1603_1605_2603';
  cCfopOpAtivoImob        = '1406_1551_1552_1553_1554_1555_1604_2406_2551_2552_2553_2554_2555_3551_3553';
  cCfopEntExterior        = '3101_3102_3126_3127_3201_3202_3205_3206_3207_3211_3251_3301_3351_3352_3353_3354_3355_3356_3556_3651_3652_3653_3949';
  cCfopMatUsoCons         = '1407_1556_1557_2407_2556_2557';

  itemQuadro03EntradasValorContabil               = '010';
  itemQuadro03EntradasBaseCalculo                 = '020';
  itemQuadro03EntradasImpostoCreditado            = '030';
  itemQuadro03EntradasOperacoesIsentas            = '040';
  itemQuadro03EntradasOutras                      = '050';
  itemQuadro03EntradasBaseCalculoImpostoRetido    = '053';
  itemQuadro03EntradasImpostoRetido               = '054';
  itemQuadro03EntradasImpostoDiferencialAliquota  = '057';

  itemQuadro03SaidasValorContabil                 = '060';
  itemQuadro03SaidasBaseCalculo                   = '070';
  itemQuadro03SaidasImpostoDebitado               = '080';
  itemQuadro03SaidasOperacoesIsentas              = '090';
  itemQuadro03SaidasOutras                        = '100';
  itemQuadro03SaidasBaseCalculoImpostoRetido      = '103';
  itemQuadro03SaidasImpostoRetido                 = '104';

  itemQuadro04DebitoSaidas                        = '010';
  itemQuadro04DebitoDifalAtivoPemanente           = '020';
  itemQuadro04DebitoDifalUsoConsumo               = '030';
  itemQuadro04DebitoMaquinasEquipamentos          = '040';
  itemQuadro04DebitoDifal                         = '045';
  itemQuadro04EstornoCredito                      = '050';
  itemQuadro04OutrosEstornosCredito               = '060';
  itemQuadro04EstornoCreditoPredumido             = '065';
  itemQuadro04OutrosDebitos                       = '070';
  itemQuadro04SubTotalDebitos                     = '990';

  itemQuadro05SaldoCredorMesAnterior              = '010';
  itemQuadro05CreditoEntradas                     = '020';
  itemQuadro05CreditoAtivoPermanente              = '030';
  itemQuadro05CreditoDifalUsoConsumo              = '040';
  itemQuadro05CreditoDifal                        = '045';
  itemQuadro05CreditoICMSRetidoSubstTrib          = '050';
  itemQuadro05SubtotalCreditos                    = '990';

  itemQuadro09SubtotalDebitos                     = '010';
  itemQuadro09ComplementoDebitoMudançaRegimeApu   = '011';
  itemQuadro09SaldosDevRecebidosEstabConsolidados = '020';
  itemQuadro09DebitoReservaCreditoAcumulado       = '030';
  itemQuadro09SegregCreditoPresumido              = '036';
  itemQuadro09SegregCreditoPagtoAntecipado        = '037';
  itemQuadro09SegregOutrosCreditos                = '038';
  itemQuadro09TotalDebitos                        = '040';

  itemQuadro09SubtotalCreditos                    = '050';
  itemQuadro09SaldosCredoresEstabConsolidados     = '060';
  itemQuadro09CreditosTransfOutrosContribuintes   = '070';
  itemQuadro09CreditosDCIP                        = '075';
  itemQuadro09SegregDebitosSaidasCreditoPresumido = '076';
  itemQuadro09TotalCreditos                       = '080';

  itemQuadro09Imposto1Decendio                    = '090';
  itemQuadro09Imposto2Decendio                    = '100';
  itemQuadro09AntecipacoesCombustiveis            = '105';
  itemQuadro09TotalAjustesApuracaoDecendial       = '110';

  itemQuadro09SaldoDevedor                        = '120';
  itemQuadro09SaldoDevedorTransfEstabConsolidador = '130';
  itemQuadro09ImpostoRecolher                     = '999';

  itemQuadro09SaldoCredor                         = '140';
  itemQuadro09SaldoCredorTransfEstabConsolidador  = '150';
  itemQuadro09SaldoCredorParaMesSeguinte          = '998';

  itemQuadro09SaldoCredorTransfExportacao         = '160';
  itemQuadro09SaldoCredorTransfSaidasIsentas      = '170';
  itemQuadro09SaldoCredorTransfSaidasDiferidas    = '180';
  itemQuadro09SaldoCredorOutrosCreditos           = '190';

  itemQuadro14BaseSaidaCredPre                    = '010';
  itemQuadro14DebSaiCredPreSubstCredEnt           = '020';
  itemQuadro14CredPreUtilSubstituicaoCreditosEnt  = '030';
  itemQuadro14CredCompDebUtilCredPre              = '031';
  itemQuadro14SldDevApropCredPre                  = '040';
  itemQuadro14DebUtilCredPreReceb                 = '045';
  itemQuadro14DebExtCredPre                       = '050';
  itemQuadro14SldCredorMesAnt                     = '110';
  itemQuadro14CredPagAntecipadoIcms               = '120';
  itemQuadro14TotalAntecipacoes                   = '130';
  itemQuadro14DebUtilCredPreTransf                = '150';
  itemQuadro14SaldoCredorAntecipacoesMesSeguinte  = '198';
  itemQuadro14ImpostoRecolherUtilCredPre          = '199';

  itemQuadro16SomaValorDevidoFUMDES               = '010';
  itemQuadro16SaldoCredorFUMDESMesAnterior        = '020';
  itemQuadro16SomaValorFUMDESDevolucao            = '030';
  itemQuadro16SaldoCredorMesSeguinteFUMDES        = '098';
  itemQuadro16FUMDESRecolher                      = '099';
  itemQuadro16SomaValorDevidoFUNDOSOCIAL          = '110';
  itemQuadro16SaldoCredorFUNDOSOCIALMesAnterior   = '120';
  itemQuadro16SomaValoresFUNDOSOCIALDevolucao     = '130';
  itemQuadro16SaldoCredorMesSeguinteFUNDOSOCIAL   = '198';
  itemQuadro16FUNDOSOCIALRecolher                 = '199';


implementation

end.
