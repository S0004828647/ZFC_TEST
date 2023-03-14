@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZFC_R_HEADERTP'
@ObjectModel.semanticKey: [ 'Zzfpa', 'Vkorg' ]
define root view entity ZFC_C_HEADERTP
  provider contract transactional_query
  as projection on ZFC_R_HEADERTP
{
  key Zzfpa,
  key Vkorg,
  Vtweg,
  BufDex,
  Consignment,
  Fcperiod,
  Fcastrecvddate,
  Contact,
  AccMan,
  Timestamp
  
}
