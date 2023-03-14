@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED FC Test'
define root view entity ZFC_R_HEADERTP
  as select from zfc_tst_header as Header
{
  key zzfpa as Zzfpa,
  key vkorg as Vkorg,
  vtweg as Vtweg,
  buf_dex as BufDex,
  consignment as Consignment,
  fcperiod as Fcperiod,
  fcastrecvddate as Fcastrecvddate,
  contact as Contact,
  acc_man as AccMan,
  timestamp as Timestamp
  
}
