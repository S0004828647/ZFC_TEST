CLASS zcl_demo_select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DEMO_SELECT IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: BEGIN OF ls_blogh_key,
            mandt TYPE mandt,
            vbeln TYPE c LENGTH 10,
            posnr TYPE n LENGTH 6,
          END OF ls_blogh_key.

    DATA: lv_start_time TYPE timestampl,
          lv_end_time   TYPE timestampl,
          lv_lines      TYPE int4,
          lt_blogh      TYPE STANDARD TABLE OF zsd_blogh,
          lt_blogh_key  LIKE STANDARD TABLE OF ls_blogh_key.


    DO 3 TIMES.
      GET TIME STAMP FIELD lv_start_time.

      SELECT FROM zsd_blogh
      FIELDS mandt, vbeln, posnr, erdat, auart     ,
  pstyv        ,
  kunnr ,
  matnr  ,
  bstkd     ,
  posex      ,
  kdmat   ,
  bname   ,
  kvgr3    ,
  amenge ,
  lmenge ,
  vrkme   ,
  adatum ,
  zzedatu ,
  netpr  ,
  waerk    ,
  kpein    ,
  mvgr1     ,
  parnri      ,
  parnre     ,
  parnrb       ,
  parnrj        ,
  parnrz2      ,
  parnrz3      ,
  parnrz4       ,
  kunnr_we      ,
  name1_we     ,
  land1_we      ,
  kunnr_zq     ,
  name1_zq      ,
  vkorg        ,
  vkbur         ,
  vtweg        ,
  matkl         ,
  prodh        ,
  plifz        ,
  marga       ,
  margp      ,
  rate      ,
  name1      ,
  werks      ,
  vstel         ,
  route         ,
  prsdt         ,
  bstdk        ,
  botext        ,
  datbi        ,
  zcst          ,
  zcst_waers    ,
  zcst_kpein   ,
  zzcstty      ,
  zzabc        ,
  mmsta         ,
  zzgpind       ,
  typ_id        ,
  ltb           ,
  lts           ,
  zzregnr       ,
  zzproject      ,
  zzkzwi7        ,
  zcst_act       ,
  zcst_act_waers ,
  zcst_act_kpein ,
  xrate_act_c    ,
  xrate_act_s    ,
  margin_act_pct ,
  ratediff       ,
  sell_xrate    ,
  freight       ,
  alnum         ,
  zzcf_flag     ,
  zzekwa        ,
  zzagrdxrt     ,
  zzacct_flag    ,
  mfr_name       ,
  nm_zcst        ,
  nm_margin     ,
  nm_margin_per  ,
  nm_margin_los  ,
  nm_block      ,
  nm_zcst_oc    ,
  devqual      ,
  botext_inc   ,
  datbi_inc    ,
  zzdpaitem    ,
  item_dpa      ,
  origin_dda
      WHERE vbeln NE @space
      INTO TABLE @lt_blogh.

      GET TIME STAMP FIELD lv_end_time.

      DATA(lv_duration2) = cl_abap_tstmp=>subtract(
          tstmp1 = lv_end_time
          tstmp2 = lv_start_time ).

      lv_lines = lines(  lt_blogh ).

      out->write( 'Duration for select all fields explicitly:' ).
      out->write( lv_duration2 ).
      out->write( 'Lines:' ).
      out->write( lv_lines ).
      out->write( '-' ).

      FREE lt_blogh.
      CLEAR: lv_duration2, lv_lines.
    ENDDO.

    out->write( '-------------------------------------' ).


    DO 3 TIMES.
      GET TIME STAMP FIELD lv_start_time.

      SELECT FROM zsd_blogh
      FIELDS *
      WHERE vbeln NE @space
      INTO TABLE @lt_blogh.

      GET TIME STAMP FIELD lv_end_time.

      DATA(lv_duration1) = cl_abap_tstmp=>subtract(
          tstmp1 = lv_end_time
          tstmp2 = lv_start_time ).

      lv_lines = lines(  lt_blogh ).

      out->write( 'Duration for select *:' ).
      out->write( lv_duration1 ).
      out->write( 'Lines:' ).
      out->write( lv_lines ).
      out->write( '-' ).

      FREE lt_blogh.
      CLEAR: lv_duration1, lv_lines.
    ENDDO.

    out->write( '-------------------------------------' ).



    DO 3 TIMES.
      GET TIME STAMP FIELD lv_start_time.

      SELECT FROM zsd_blogh
      FIELDS mandt, vbeln, posnr
      WHERE vbeln NE @space
      INTO TABLE @lt_blogh.

      GET TIME STAMP FIELD lv_end_time.

      DATA(lv_duration3) = cl_abap_tstmp=>subtract(
          tstmp1 = lv_end_time
          tstmp2 = lv_start_time ).

      lv_lines = lines(  lt_blogh ).

      out->write( 'Duration for select key fields explicitly:' ).
      out->write( lv_duration3 ).
      out->write( 'Lines:' ).
      out->write( lv_lines ).
      out->write( '-' ).

      FREE lt_blogh.
      CLEAR: lv_duration3, lv_lines.
    ENDDO.

    out->write( '-------------------------------------' ).



    DO 3 TIMES.
      GET TIME STAMP FIELD lv_start_time.

      SELECT FROM zsd_blogh
      FIELDS *
      WHERE vbeln NE @space
      INTO CORRESPONDING FIELDS OF TABLE @lt_blogh_key.

      GET TIME STAMP FIELD lv_end_time.

      DATA(lv_duration4) = cl_abap_tstmp=>subtract(
          tstmp1 = lv_end_time
          tstmp2 = lv_start_time ).

      lv_lines = lines(  lt_blogh_key ).

      out->write( 'Duration for select * into corresponding (key fields only):' ).
      out->write( lv_duration4 ).
      out->write( 'Lines:' ).
      out->write( lv_lines ).
      out->write( '-' ).

      FREE lt_blogh_key.
      CLEAR: lv_duration4, lv_lines.
    ENDDO.

    out->write( '-------------------------------------' ).


  ENDMETHOD.
ENDCLASS.
