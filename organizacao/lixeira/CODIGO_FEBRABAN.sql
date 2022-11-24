/*****************************************************************************************************************
*                                        CRIA TABELA COM BANCOS FEBRABAN                                         *
*                                                                                                                *
*  SCRIPT PARA CRIAR TABELA COM OS BANCOS FEBRABAN                                                               *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA : GENERICO                                                                                       *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
******************************************************************************************************************/

select id = ROW_NUMBER() OVER ( ORDER BY banco), codigo_str = right('00' + convert(varchar(5), codigo),3), banco
into bancos_banco
from (
 select banco = 'Advanced Corretora de C�mbio Ltda.', codigo =	117
union select banco = 'Albatross Corretora de C�mbio e Valores S.A', codigo =	172
union select banco = 'Ativa Investimentos S.A. Corretora de T�tulos C�mbio e Valores', codigo =	188
union select banco = 'Banco A.J. Renner S.A.', codigo =	654
union select banco = 'Banco ABC Brasil S.A.', codigo =	246
union select banco = 'Banco ABN Amro S.A.', codigo =	75
union select banco = 'Banco Agibank S.A.', codigo =	121
union select banco = 'Banco Alfa S.A.', codigo =	25
union select banco = 'Banco Alvorada S.A.', codigo =	641
union select banco = 'Banco Andbank (Brasil) S.A.', codigo =	65
union select banco = 'Banco Arbi S.A.', codigo =	213
union select banco = 'Banco Bandepe S.A.', codigo =	24
union select banco = 'Banco Barclays S.A.', codigo =	740
union select banco = 'Banco BM&FBovespa', codigo =	96
union select banco = 'Banco BMG S.A.', codigo =	318
union select banco = 'Banco BNP Paribas Brasil S.A.', codigo =	752
union select banco = 'Banco Boavista Interatl�ntico S.A.', codigo =	248
union select banco = 'Banco Bocom BBM S.A.', codigo =	107
union select banco = 'Banco Bradescard S.A.', codigo =	63
union select banco = 'Banco Bradesco BBI S.A.', codigo =	36
union select banco = 'Banco Bradesco BERJ S.A.', codigo =	122
union select banco = 'Banco Bradesco Cart�es S.A.', codigo =	204
union select banco = 'Banco Bradesco Financiamentos S.A.', codigo =	394
union select banco = 'Banco Bradesco S.A.', codigo =	237
union select banco = 'Banco Brasil Plural S.A. � Banco M�ltiplo', codigo =	125
union select banco = 'Banco Brasileiro de Neg�cios S.A. � BBN', codigo =	81
union select banco = 'Banco BS2 S.A.', codigo =	218
union select banco = 'Banco BTG Pactual S.A.', codigo =	208
union select banco = 'Banco Caixa Geral � Brasil S.A.', codigo =	473
union select banco = 'Banco Capital S.A.', codigo =	412
union select banco = 'Banco Cargill S.A.', codigo =	40
union select banco = 'Banco C�dula S.A.', codigo =	266
union select banco = 'Banco Cetelem S.A.', codigo =	739
union select banco = 'Banco Cifra S.A.', codigo =	233
union select banco = 'Banco Citibank S.A.', codigo =	745
union select banco = 'Banco Cl�ssico S.A.', codigo =	241
union select banco = 'Banco Confidence de C�mbio S.A.', codigo =	95
union select banco = 'Banco Cooperativo do Brasil S.A. � Bancoob', codigo =	756
union select banco = 'Banco Cooperativo Sicredi S.A.', codigo =	748
union select banco = 'Banco Credit Agricole Brasil S.A.', codigo =	222
union select banco = 'Banco Credit Suisse (Brasil) S.A.', codigo =	505
union select banco = 'Banco Crefisa S.A.', codigo =	69
union select banco = 'Banco da Amaz�nia S.A.', codigo =	3
union select banco = 'Banco da China Brasil S.A.', codigo =	83
union select banco = 'Banco Daycoval S.A.', codigo =	707
union select banco = 'Banco de Bras�lia S.A. (BRB)', codigo =	70
union select banco = 'Banco de Cr�dito e Varejo S.A. � BCV', codigo =	250
union select banco = 'Banco de Investimento Credit Suisse (Brasil) S.A.', codigo =	505
union select banco = 'Banco de La Nacion Argentina', codigo =	300
union select banco = 'Banco de La Provincia de Buenos Aires', codigo =	495
union select banco = 'Banco de La Republica Oriental del Uruguay', codigo =	494
union select banco = 'Banco do Brasil S.A.', codigo =	1
union select banco = 'Banco do Estado de Sergipe S.A.', codigo =	47
union select banco = 'Banco do Estado do Esp�rito Santo � Baneste S.A.', codigo =	21
union select banco = 'Banco do Estado do Par� S.A.', codigo =	37
union select banco = 'Banco do Estado do Rio Grande do Sul S.A.', codigo =	41
union select banco = 'Banco do Nordeste do Brasil S.A.', codigo =	4
union select banco = 'Banco Fator S.A.', codigo =	265
union select banco = 'Banco Fibra S.A.', codigo =	224
union select banco = 'Banco Ficsa S.A.', codigo =	626
union select banco = 'Banco Finaxis S.A.', codigo =	94
union select banco = 'Banco Guanabara S.A.', codigo =	612
union select banco = 'Banco Inbursa S.A.', codigo =	12
union select banco = 'Banco Industrial do Brasil S.A.', codigo =	604
union select banco = 'Banco Indusval S.A.', codigo =	653
union select banco = 'Banco Inter S.A.', codigo =	77
union select banco = 'Banco Intercap S.A.', codigo =	630
union select banco = 'Banco Internacional do Funchal (Brasil) S.A. � Banif', codigo =	719
union select banco = 'Banco Investcred Unibanco S.A.', codigo =	249
union select banco = 'Banco Ita� BBA S.A.', codigo =	184
union select banco = 'Banco Ita� Consignado S.A.', codigo =	29
union select banco = 'Banco Ita� Unibanco Holding S.A.', codigo =	652
union select banco = 'Banco Ita� Unibanco S.A.', codigo =	341
union select banco = 'Banco ItauBank S.A', codigo =	479
union select banco = 'Banco J. P. Morgan S.A.', codigo =	376
union select banco = 'Banco J. Safra S.A.', codigo =	74
union select banco = 'Banco John Deere S.A.', codigo =	217
union select banco = 'Banco KDB S.A.', codigo =	76
union select banco = 'Banco Keb Hana do Brasil S.A.', codigo =	757
union select banco = 'Banco Luso Brasileiro S.A.', codigo =	600
union select banco = 'Banco M�xima S.A.', codigo =	243
union select banco = 'Banco Mercantil do Brasil S.A.', codigo =	389
union select banco = 'Banco Mizuho do Brasil S.A.', codigo =	370
union select banco = 'Banco Modal S.A.', codigo =	746
union select banco = 'Banco Morgan Stanley S.A.', codigo =	66
union select banco = 'Banco MUFG Brasil S.A.', codigo =	456
union select banco = 'Banco Nacional de Desenvolvimento E. e Social � BNDES', codigo =	7
union select banco = 'Banco Neon S.A.', codigo =	735
union select banco = 'Banco Ol� Bonsucesso Consignado S.A.', codigo =	169
union select banco = 'Banco Original do Agroneg�cio S.A.', codigo =	79
union select banco = 'Banco Original S.A.', codigo =	212
union select banco = 'Banco Ourinvest S.A.', codigo =	712
union select banco = 'Banco Pan S.A.', codigo =	623
union select banco = 'Banco Paulista S.A.', codigo =	611
union select banco = 'Banco Pine S.A.', codigo =	643
union select banco = 'Banco Rabobank International Brasil S.A.', codigo =	747
union select banco = 'Banco Randon S.A.', codigo =	88
union select banco = 'Banco Rendimento S.A.', codigo =	633
union select banco = 'Banco Ribeir�o Preto S.A.', codigo =	741
union select banco = 'Banco Rodobens S.A.', codigo =	120
union select banco = 'Banco Safra S.A.', codigo =	422
union select banco = 'Banco Santander (Brasil) S.A.', codigo =	33
union select banco = 'Banco Semear S.A.', codigo =	743
union select banco = 'Banco Sistema S.A.', codigo =	754
union select banco = 'Banco Soci�t� G�n�rale Brasil S.A.', codigo =	366
union select banco = 'Banco Sofisa S.A.', codigo =	637
union select banco = 'Banco Sumitomo Mitsui Brasileiro S.A.', codigo =	464
union select banco = 'Banco Top�zio S.A.', codigo =	82
union select banco = 'Banco Tri�ngulo S.A.', codigo =	634
union select banco = 'Banco Tricury S.A.', codigo =	18
union select banco = 'Banco Votorantim S.A.', codigo =	655
union select banco = 'Banco VR S.A.', codigo =	610
union select banco = 'Banco Western Union do Brasil S.A.', codigo =	119
union select banco = 'Banco Woori Bank do Brasil S.A.', codigo =	124
union select banco = 'Bank of America Merrill Lynch Banco M�ltiplo S.A.', codigo =	755
union select banco = 'Barigui Companhia Hipotec�ria', codigo =	268
union select banco = 'Bexs Banco de C�mbio S.A.', codigo =	144
union select banco = 'Bexs Corretora de C�mbio S.A.', codigo =	253
union select banco = 'BGC Liquidez Distribuidora de T. e Valores Mobili�rios Ltda.', codigo =	134
union select banco = 'BNY Mellon Banco S.A.', codigo =	17
union select banco = 'BR Partners Banco de Investimento S.A.', codigo =	126
union select banco = 'Brickell (BRK) S.A. Cr�dito, Financiamento e Investimento', codigo =	92
union select banco = 'BRL Trust Distribuidora de T�tulos e Valores Mobili�rios S.A.', codigo =	173
union select banco = 'Broker Brasil Corretora de C�mbio Ltda.', codigo =	142
union select banco = 'BT Corretora de C�mbio Ltda.', codigo =	80
union select banco = 'Caixa Econ�mica Federal', codigo =	104
union select banco = 'Caruana S.A. Sociedade de Cr�dito, Financiamento e Investimento', codigo =	130
union select banco = 'Casa do Cr�dito S.A. Sociedade de Cr�dito ao Microempreendedor', codigo =	159
union select banco = 'Central Cooperativa de Cr�dito no Estado do Esp�rito Santo � CECOOP', codigo =	114
union select banco = 'Central de Cooperativas de Economia e Cr�dito M�tuo do Estado RS � Unicred', codigo =	91
union select banco = 'China Construction Bank (Brasil) Banco M�ltiplo S.A.', codigo =	320
union select banco = 'Citibank N.A.', codigo =	477
union select banco = 'Codepe Corretora de Valores e C�mbio S.A.', codigo =	127
union select banco = 'Commerzbank Brasil S.A. � Banco M�ltiplo', codigo =	163
union select banco = 'Confedera��o Nacional das Cooperativas Centrais Unicred Ltda (Unicred do Brasil)', codigo =	136
union select banco = 'Confidence Corretora de C�mbio S.A.', codigo =	60
union select banco = 'Cooperativa Central de Cr�dito Noroeste Brasileiro Ltda. (CentralCredi)', codigo =	97
union select banco = 'Cooperativa Central de Cr�dito Urbano � Cecred', codigo =	85
union select banco = 'Cooperativa de Cr�dito M�tuo dos Despachantes de Tr�nsito de Sta.Catarina e RS', codigo =	16
union select banco = 'Cooperativa de Cr�dito Rural da Regi�o da Mogiana', codigo =	89
union select banco = 'Credicoamo Cr�dito Rural Cooperativa', codigo =	10
union select banco = 'Credit Suisse Hedging-Griffo Corretora de Valores S.A.', codigo =	11
union select banco = 'Cresol � Confedera��o Nacional Cooperativas Centrais de Cr�dito e Econ Familiar', codigo =	133
union select banco = 'Dacasa Financeira S/A � Sociedade de Cr�dito, Financiamento e Investimento', codigo =	182
union select banco = 'Deutsche Bank S.A. � Banco Alem�o', codigo =	487
union select banco = 'Easynvest � T�tulo Corretora de Valores SA', codigo =	140
union select banco = 'Facta Financeira S.A. � Cr�dito Financiamento e Investimento', codigo =	149
union select banco = 'Fair Corretora de C�mbio S.A.', codigo =	196
union select banco = 'Get Money Corretora de C�mbio S.A.', codigo =	138
union select banco = 'Goldman Sachs do Brasil Banco M�ltiplo S.A.', codigo =	64
union select banco = 'Gradual Corretora de C�mbio, T�tulos e Valores Mobili�rios S.A.', codigo =	135
union select banco = 'Guide Investimentos S.A. Corretora de Valores', codigo =	177
union select banco = 'Guitta Corretora de C�mbio Ltda.', codigo =	146
union select banco = 'Haitong Banco de Investimento do Brasil S.A.', codigo =	78
union select banco = 'Hipercard Banco M�ltiplo S.A.', codigo =	62
union select banco = 'HS Financeira S/A Cr�dito, Financiamento e Investimentos', codigo =	189
union select banco = 'HSBC Brasil S.A. Banco de Investimento', codigo =	269
union select banco = 'IB Corretora de C�mbio, T�tulos e Valores Mobili�rios Ltda.', codigo =	271
union select banco = 'ICAP do Brasil Corretora de T�tulos e Valores Mobili�rios Ltda.', codigo =	157
union select banco = 'ICBC do Brasil Banco M�ltiplo S.A.', codigo =	132
union select banco = 'ING Bank N.V.', codigo =	492
union select banco = 'Intesa Sanpaolo Brasil S.A. � Banco M�ltiplo', codigo =	139
union select banco = 'JPMorgan Chase Bank, National Association', codigo =	488
union select banco = 'Kirton Bank S.A. (Banco M�ltiplo)', codigo =	399
union select banco = 'Lecca Cr�dito, Financiamento e Investimento S/A', codigo =	105
union select banco = 'Levycam � Corretora de C�mbio e Valores Ltda.', codigo =	145
union select banco = 'Magliano S.A. Corretora de Cambio e Valores Mobiliarios', codigo =	113
union select banco = 'MS Bank S.A. Banco de C�mbio', codigo =	128
union select banco = 'Multimoney Corretora de C�mbio Ltda', codigo =	137
union select banco = 'Natixis Brasil S.A. Banco M�ltiplo', codigo =	14
union select banco = 'Nova Futura Corretora de T�tulos e Valores Mobili�rios Ltda.', codigo =	191
union select banco = 'Novo Banco Continental S.A. � Banco M�ltiplo', codigo =	753
union select banco = 'Nu Pagamentos S.A', codigo =	260
union select banco = 'Oliveira Trust Distribuidora de T�tulos e Valores Mobili�rios S.A.', codigo =	111
union select banco = 'Omni Banco S.A.', codigo =	613
union select banco = 'Paran� Banco S.A.', codigo =	254
union select banco = 'Parmetal Distribuidora de T�tulos e Valores Mobili�rios Ltda.', codigo =	194
union select banco = 'Pernambucanas Financiadora S.A. Cr�dito, Financiamento e Investimento', codigo =	174
union select banco = 'Planner Corretora de Valores S.A.', codigo =	100
union select banco = 'P�locred Sociedade de Cr�dito ao Microempreendedor e Empresa de Pequeno Porte', codigo =	93
union select banco = 'PortoCred S.A. Cr�dito, Financiamento e Investimento', codigo =	108
union select banco = 'Renascen�a Distribuidora de T�tulos e Valores Mobili�rios Ltda.', codigo =	101
union select banco = 'Scotiabank Brasil S.A. Banco M�ltiplo', codigo =	751
union select banco = 'Senso Corretora de C�mbio e Valores Mobili�rios S.A.', codigo =	545
union select banco = 'Servicoop � Cooperativa de Economia e Cr�dito M�tuo dos Servidores Estaduais do Rio', codigo =	190
union select banco = 'Socred S.A. � Sociedade de Cr�dito ao Microempreendedor', codigo =	183
union select banco = 'Standard Chartered Bank (Brasil) S.A. Banco de Investimento', codigo =	118
union select banco = 'Stone Pagamentos S.A.', codigo =	197
union select banco = 'Treviso Corretora de C�mbio S.A.', codigo =	143
union select banco = 'Tullett Prebon Brasil Corretora de Valores e C�mbio Ltda.', codigo =	131
union select banco = 'UBS Brasil Banco de Investimento S.A.', codigo =	129
union select banco = 'UBS Brasil Corretora de C�mbio, T�tulos e Valores Mobili�rios S.A.', codigo =	15
union select banco = 'Uniprime Central � Central Interestadual de Cooperativas de Cr�dito Ltda.', codigo =	99
union select banco = 'Uniprime Norte do Paran� � Cooperativa de Cr�dito Ltda.', codigo =	84
union select banco = 'XP Investimentos Corretora de C�mbio, T�tulos e Valores Mobili�rios S/A', codigo =	102) as tab
order by banco