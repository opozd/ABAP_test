

REPORT  ZM716.


TABLES: BKPF, BSEG, MKPF, MSEG, EKPO, EKBE.


SELECTION-SCREEN BEGIN OF BLOCK 1 WITH FRAME TITLE TEXT-001.
PARAMETERS bupej LIKE bkpf-gjahr DEFAULT SY-DATUM(4).
SELECTION-SCREEN SKIP 1.
PARAMETERS mopej LIKE bkpf-monat DEFAULT SY-DATUM+4(2).
SELECTION-SCREEN SKIP 1.
SELECT-OPTIONS kbudat FOR bkpf-budat NO-EXTENSION.
SELECTION-SCREEN END OF BLOCK 1.


select-options nbelnr  for bkpf-belnr no-display no intervals.
select-options imsm    for bkpf-belnr no-display no intervals.
select-options iebeln  for ekpo-ebeln no-display no intervals.
select-options nebeln  for ekpo-ebeln no-display no intervals.
select-options ibelnr  for ekpo-ebeln no-display no intervals.


DATA: begin of SALIV occurs 100,
      bukrs(3),
      bschl(2),
      shkzg(2),
      belnr50(10),
      buzei(5),
      bwart(8),
      belnr51(10),
      buzei51(5),
      saknr(10),
      hkont(10),
      dat_prov(8),
      dat_vvod(8),
      dat_vdf(8),
      dat_vdf1(8),
      matnr(18),
      menge  type p DECIMALS 3,
      dmbtr  type p DECIMALS 2,
      bwtar(10),
      ebeln(10),
      ebelp(5),
      lifnr(10),
      lfgja(4),
end of SALIV.


data :
      FILENAME(128),
      rc type i,
      kol_l type i,
      kol_m type i,
      WAYP type STRING,
      pbukrs(3),
      pbelnr(10),
      pbelnr51(10),
      pmatnr(18),
      pdmbtr  type p DECIMALS 2,
      pmenge  type p DECIMALS 3,
      PLFBNR103(10),
      pshkzg(2),
      pbwart(3),
      pbwtar(10),
      pwaers(5),
      pbudat(8),
      pbudat1(8),
      pcpudt(8),
      pcpudt1(8),
      pbldat(8),
      pbuzei(5),
      pbuzei51(5),
      pbschl(2),
      psaknr(10),
      pbelnr103(10),
      phkont(10),
      pebeln(10),
      pebelp(5),
      plifnr(10),
      plfbnr(10),
      bupejp(4),
      PLFGJA(4).

data:  begin of tabdbf50 occurs 1,
       dbf_field(10) type c,
end of tabdbf50.
       move 'BUKRS'    to tabdbf50-dbf_field.
       append tabdbf50.
       move 'BSCHL' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'SHKZG' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'BELNR50' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'BUZEI' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'BWART' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'BELNR51' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'BUZEI51' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'SAKNR' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'HKONT' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'DAT_PROV' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'DAT_VVOD' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'DAT_VDF' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'DAT_VDF1' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'MATNR' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'MENGE' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'DMBTR' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'BWTAR' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'EBELN' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'EBELP' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'LIFNR' to tabdbf50-dbf_field.
       append tabdbf50.
       move 'LFGJA' to tabdbf50-dbf_field.
       append tabdbf50.


DATA : BEGIN OF IBKPF OCCURS 1000,
       BUKRS LIKE BKPF-BUKRS,
       BELNR LIKE BKPF-BELNR,
       BUDAT LIKE BKPF-BUDAT,
       CPUDT LIKE BKPF-CPUDT,
END OF IBKPF.


DATA: BEGIN OF IMKPF OCCURS 1000,
      MBLNR    TYPE  MKPF-MBLNR,   " Документ
      MJAHR    TYPE  MKPF-MJAHR,
      BUDAT    TYPE  MKPF-BUDAT,   " Дата проводки
      CPUDT    TYPE  MKPF-CPUDT,
END OF IMKPF.


DATA: BEGIN OF IEKKO OCCURS 1000,
      BUKRS    TYPE  EKKO-BUKRS,
      EBELN    TYPE  EKKO-EBELN,   " Номер заказа
      LIFNR    TYPE  EKKO-LIFNR,   " Поставщик
END OF IEKKO.


DATA: BEGIN OF BSEG51 OCCURS 1000,
      BUKRS LIKE BSEG-BUKRS,
      BELNR LIKE BSEG-BELNR,
      BUZEI LIKE BSEG-BUZEI,
      BSCHL LIKE BSEG-BSCHL,
      SHKZG LIKE BSEG-SHKZG,
      DMBTR LIKE BSEG-DMBTR,
      SAKNR LIKE BSEG-SAKNR,
      HKONT LIKE BSEG-HKONT,
      LIFNR LIKE BSEG-LIFNR,
END OF BSEG51.

DATA: BEGIN OF BSEG51P OCCURS 1000,
      BUKRS LIKE BSEG-BUKRS,
      BELNR LIKE BSEG-BELNR,
      BUZEI LIKE BSEG-BUZEI,
      BSCHL LIKE BSEG-BSCHL,
      SHKZG LIKE BSEG-SHKZG,
      DMBTR LIKE BSEG-DMBTR,
      SAKNR LIKE BSEG-SAKNR,
      HKONT LIKE BSEG-HKONT,
      LIFNR LIKE BSEG-LIFNR,
END OF BSEG51P.

DATA: BEGIN OF BSEG51Z OCCURS 1000,
      BELNR LIKE BSEG-BELNR,
      BUZEI LIKE BSEG-BUZEI,
      EBELN LIKE BSEG-EBELN,
      EBELP LIKE BSEG-EBELP,
      MATNR LIKE BSEG-MATNR,
      BWTAR LIKE BSEG-BWTAR,
END OF BSEG51Z.

DATA: BEGIN OF BSEGKA OCCURS 1000,
      BELNR LIKE BSEG-BELNR,
      EBELN LIKE BSEG-EBELN,
      EBELP LIKE BSEG-EBELP,
      MATNR LIKE BSEG-MATNR,
      BWTAR LIKE BSEG-BWTAR,
END OF BSEGKA.


DATA: BEGIN OF BSEGK OCCURS 1000,
      BUKRS  LIKE BSEG-BUKRS,
      GJAHR  LIKE BSEG-GJAHR,
      BELNR  LIKE BSEG-BELNR,
      BUZEI  LIKE BSEG-BUZEI,
      BSCHL  LIKE BSEG-BSCHL,
      SHKZG  LIKE BSEG-SHKZG,
      DMBTR  LIKE BSEG-DMBTR,
      SAKNR  LIKE BSEG-SAKNR,
      HKONT  LIKE BSEG-HKONT,
      LIFNR  LIKE BSEG-LIFNR,
END OF BSEGK.


DATA: BEGIN OF IBSEG OCCURS 1000,
      BELNR  LIKE BSEG-BELNR,
      BUZEI  LIKE BSEG-BUZEI,
      BSCHL  LIKE BSEG-BSCHL,
      BUDAT  LIKE BKPF-BUDAT,
      CPUDT  LIKE BKPF-CPUDT,
      WAERS  LIKE BKPF-WAERS,
      SHKZG  LIKE BSEG-SHKZG,
      DMBTR  LIKE BSEG-DMBTR,
      WRBTR  LIKE BSEG-WRBTR,
      SAKNR  LIKE BSEG-SAKNR,
      HKONT  LIKE BSEG-HKONT,
      LIFNR  LIKE BSEG-LIFNR,
      XBLNR  LIKE BKPF-XBLNR,
      STBLG  LIKE BKPF-STBLG,
END OF IBSEG.

DATA: BEGIN OF IRBKP OCCURS 1000,
      BUKRS  TYPE RBKP-BUKRS,
      BELNR  TYPE RBKP-BELNR,
      BUDAT  TYPE RBKP-BUDAT,
      CPUDT  TYPE RBKP-CPUDT,
      LIFNR  TYPE RBKP-LIFNR,
      STBLG  TYPE RBKP-STBLG,
END OF IRBKP.


*DATA: BEGIN OF IEKBE OCCURS 1000,
*      EBELN  TYPE EKBE-EBELN,
*      EBELP  TYPE EKBE-EBELP,
*      BELNR  TYPE EKBE-BELNR,
*      BUZEI  TYPE EKBE-BUZEI,
*      BUDAT  TYPE EKBE-BUDAT,
*      LFBNR  TYPE EKBE-LFBNR,
*      LFGJA  TYPE EKBE-LFGJA,
*END OF IEKBE.


DATA: BEGIN OF EKBE105 OCCURS 1000,
      EBELN  TYPE EKBE-EBELN,
      EBELP  TYPE EKBE-EBELP,
      BELNR  TYPE EKBE-BELNR,
      BUZEI  TYPE EKBE-BUZEI,
      BUDAT  TYPE EKBE-BUDAT,
      CPUDT  TYPE EKBE-CPUDT,
      BWART  TYPE EKBE-BWART,
      MENGE  TYPE EKBE-MENGE,
      DMBTR  TYPE EKBE-DMBTR,
      SHKZG  TYPE EKBE-SHKZG,
      BWTAR  TYPE EKBE-BWTAR,
      MATNR  TYPE EKBE-MATNR,
      LFBNR  TYPE EKBE-LFBNR,
      LFGJA  TYPE EKBE-LFGJA,
END OF EKBE105.


DATA: BEGIN OF EKBE122 OCCURS 1000,
      EBELN  TYPE EKBE-EBELN,
      EBELP  TYPE EKBE-EBELP,
      BELNR  TYPE EKBE-BELNR,
      BUZEI  TYPE EKBE-BUZEI,
      BUDAT  TYPE EKBE-BUDAT,
      CPUDT  TYPE EKBE-CPUDT,
      BWART  TYPE EKBE-BWART,
      MENGE  TYPE EKBE-MENGE,
      DMBTR  TYPE EKBE-DMBTR,
      SHKZG  TYPE EKBE-SHKZG,
      BWTAR  TYPE EKBE-BWTAR,
      MATNR  TYPE EKBE-MATNR,
      LFBNR  TYPE EKBE-LFBNR,
      LFGJA  TYPE EKBE-LFGJA,
END OF EKBE122.



DATA: BEGIN OF EKBE51 OCCURS 1000,
      EBELN  TYPE EKBE-EBELN,
      EBELP  TYPE EKBE-EBELP,
      BELNR  TYPE EKBE-BELNR,
      BUZEI  TYPE EKBE-BUZEI,
      BUDAT  TYPE EKBE-BUDAT,
      CPUDT  TYPE EKBE-CPUDT,
      MENGE  TYPE EKBE-MENGE,
      DMBTR  TYPE EKBE-DMBTR,
      SHKZG  TYPE EKBE-SHKZG,
      BWTAR  TYPE EKBE-BWTAR,
      MATNR  TYPE EKBE-MATNR,
      LFBNR  TYPE EKBE-LFBNR,
      LFGJA  TYPE EKBE-LFGJA,
END OF EKBE51.


DATA: BEGIN OF IMS2 OCCURS 1000,
      EBELN TYPE EKKO-EBELN,
END OF IMS2.


DATA: BEGIN OF IMS3 OCCURS 1000,
      MBLNR TYPE MSEG-MBLNR,
END OF IMS3.

DATA: BEGIN OF IMS4 OCCURS 1000,
      BELNR TYPE BSEG-BELNR,
END OF IMS4.



PERFORM DIRCR.


CONCATENATE 'D:\MAT_VIG\M' bupej mopej '.dbf' INTO WAYP.
CONCATENATE 'D:\MAT_VIG\A' bupej mopej '.dbf' INTO WAYP.


SELECT bukrs ebeln lifnr  INTO TABLE iekko FROM ekko.


SELECT bukrs belnr budat cpudt  INTO TABLE ibkpf FROM bkpf
              WHERE bukrs = '01'   AND
              gjahr = bupej  AND
              monat = mopej  AND
              budat >= kbudat-LOW and budat <= kbudat-HIGH  AND
              belnr LIKE '51%'.


  LOOP AT IBKPF.
       IMSM-LOW  =  IBKPF-BELNR.
       IMSM-OPTION = 'EQ'.
       IMSM-SIGN = 'I'.
       APPEND IMSM.
  ENDLOOP.

  SELECT ebeln ebelp belnr buzei budat cpudt menge dmbtr shkzg bwtar matnr lfbnr  lfgja INTO TABLE EKBE51
  FROM EKBE
  where  EBELN in IEBELN and belnr like '51%' and budat >= kbudat-low  and  budat <= kbudat-high.


 SELECT  bukrs gjahr belnr buzei bschl shkzg dmbtr saknr hkont lifnr
 INTO TABLE BSEGK
 FROM bseg  where bukrs = '01' and  gjahr = bupej and belnr like '51%' and  bschl = '21'.

 delete BSEGK where belnr not in IMSM.

* LOOP AT BSEGK.
*      IBELNR-LOW  =  BSEGK-BELNR.
*      IBELNR-OPTION = 'EQ'.
*      IBELNR-SIGN = 'I'.
*      APPEND IBELNR.
*ENDLOOP.

 bupejp = bupej - 1.

 describe table BSEGK  lines kol_l.

 SELECT belnr ebeln ebelp matnr bwtar
 INTO TABLE BSEGKA
 FROM bseg  where gjahr = bupej and belnr like '51%' and bschl = '96'.


 delete BSEGKA where belnr not in IMSM.
 delete BSEGKA where ebeln = ''.


 if kol_l <> 0.

    LOOP AT BSEGKA.
      IEBELN-LOW  =  BSEGKA-EBELN.
      IEBELN-OPTION = 'EQ'.
      IEBELN-SIGN = 'I'.
      APPEND IEBELN.
    ENDLOOP.

   delete iekko where ebeln not in iebeln.


   SELECT  ebeln ebelp belnr buzei budat cpudt bwart menge dmbtr shkzg bwtar matnr lfbnr lfgja
   INTO  TABLE EKBE122
   FROM EKBE
   where  belnr like '50%'  and  ( BWART = '122' or BWART = '123' ) and ebeln in IEBELN and
   budat >= kbudat-low  and  budat <= kbudat-high.

      PBUKRS = ''.
      PBELNR = ''.
      PBSCHL = ''.
      PBUZEI = ''.
      PSHKZG = ''.
      PDMBTR = 0.
      PBUDAT = ''.
      PBLDAT = ''.
      PCPUDT = ''.
      PCPUDT1 = ''.
      PBUDAT1 = ''.
      PMATNR = ''.
      PBWART = ''.
      PHKONT = ''.
      PSAKNR = ''.
      PEBELN = ''.
      PEBELP = ''.
      PLIFNR = ''.
      PLFBNR = ''.
      PBELNR51 = ''.
      PLFGJA = ''.


 LOOP AT EKBE122.
**50 документ******
                 PEBELN = EKBE122-EBELN.
                 PEBELP = EKBE122-EBELP.
                 PBELNR = EKBE122-BELNR.
                 PBUZEI = EKBE122-BUZEI.
                 PBUDAT = EKBE122-BUDAT.
                 PCPUDT = EKBE122-CPUDT.
                 PBWART = EKBE122-BWART.
                 PMATNR = EKBE122-MATNR.
                 PBWTAR = EKBE122-BWTAR.
              if PBWART = '122'.
                 PMENGE = EKBE122-MENGE.
                 PDMBTR = EKBE122-DMBTR.
              else.
                 PMENGE = ( EKBE122-MENGE ) * ( -1 ).
                 PDMBTR = ( EKBE122-DMBTR ) * ( -1 ).
              endif.
*                PSHKZG = EKBE122-SHKZG.
                 PLFBNR = EKBE122-LFBNR.
                 PLFGJA = EKBE122-LFGJA.

                 PBELNR51 = ''.
                 PBUZEI51 = ''.
                 PBUDAT1  = ''.
                 PCPUDT1  = ''.


                 Read table EKBE51 With Key ebeln = PEBELN  ebelp = PEBELP  MATNR = PMATNR
                 BWTAR = PBWTAR  DMBTR = PDMBTR SHKZG = 'H'.

                if SY-SUBRC = 0.
                 PBELNR51 = EKBE51-BELNR.
                 PBUZEI   = EKBE51-BUZEI.
                 PBUDAT1  = EKBE51-BUDAT.
                 PCPUDT1  = EKBE51-CPUDT.
                else.
                    Read table EKBE51 With Key ebeln = PEBELN  ebelp = PEBELP  MATNR = PMATNR
                    SHKZG = 'H'   DMBTR = PDMBTR.
                    if SY-SUBRC = 0.
                     PBELNR51 = EKBE51-BELNR.
                     PBUZEI   = '11111'.
                     PBUDAT1  = EKBE51-BUDAT.
                     PCPUDT1  = EKBE51-CPUDT.
                    else.
                     PBELNR51 = ''.
                     PBUZEI   = ''.
                     PBUDAT1  = ''.
                     PCPUDT1  = ''.
                   endif.
                 endif.

                 PBSCHL = ''.
                 PSAKNR = ''.
                 PHKONT = ''.
                 PLIFNR = ''.
                 PBUKRS = ''.
                 PSHKZG = ''.
                 PLFGJA = ''.
                 PBUZEI51 = ''.

                 Read table BSEGK  With Key belnr = PBELNR51  BUZEI = PBUZEI   DMBTR = PDMBTR.

                 if SY-SUBRC = 0.
                   PBUKRS = BSEGK-BUKRS.
                   PSHKZG = BSEGK-SHKZG.
                   PBSCHL = BSEGK-BSCHL.
                   PSAKNR = BSEGK-SAKNR.
                   PHKONT = BSEGK-HKONT.
                   PLIFNR = BSEGK-LIFNR.
                   PLFGJA = BSEGK-GJAHR.
                   PBUZEI51 = BSEGK-BUZEI.
                 else.
                    Read table BSEGK  With Key belnr = PBELNR51.
                   if  SY-SUBRC = 0.
                     PBUKRS = BSEGK-BUKRS.
                     PSHKZG = BSEGK-SHKZG.
                     PBSCHL = BSEGK-BSCHL.
                     PSAKNR = BSEGK-SAKNR.
                     PHKONT = BSEGK-HKONT.
                     PLIFNR = BSEGK-LIFNR.
                     PBUZEI = BSEGK-BUZEI.
                     PLFGJA = BSEGK-GJAHR.
                     PBUZEI51 = '11111'.
                   else.
                     Read table IEKKO  With Key ebeln = PEBELN.
                     PLIFNR = IEKKO-LIFNR.
                     PBUKRS = IEKKO-BUKRS.
                     PBSCHL = '21'.
                     PSHKZG = 'S'.
                   endif.
                endif.
                   PerForm SAPOL52.
                   Append SALIV.
ENDLOOP.


 perform VUGR51.
 close dataset WAYP.

endif.

***********105 вид движения**********************************
*************************************************************

  SELECT bukrs belnr buzei bschl shkzg dmbtr saknr hkont lifnr
  INTO TABLE BSEG51
  FROM bseg  where bukrs = '01' and  gjahr = bupej and belnr like '51%' and bschl = '31'.

  SELECT bukrs belnr buzei bschl shkzg dmbtr saknr hkont lifnr
  INTO TABLE BSEG51P
  FROM bseg  where bukrs = '01' and  gjahr = bupejp  and belnr like '51%' and bschl = '31'.

  delete BSEG51 where belnr not in IMSM.

  SELECT belnr buzei ebeln ebelp matnr bwtar
  INTO TABLE BSEG51Z
  FROM bseg  where gjahr = bupej and belnr like '51%' and bschl = '86'.

  delete BSEG51Z where belnr not in IMSM.
  SORT BSEG51Z BY BELNR EBELN.

  describe table BSEG51  lines kol_l.

  IBELNR[] = NBELNR[].
  IEBELN[] = NEBELN[].

 if kol_l <> 0.

    LOOP AT BSEG51.
      IBELNR-LOW  =  BSEG51-BELNR.
      IBELNR-OPTION = 'EQ'.
      IBELNR-SIGN = 'I'.
      APPEND IBELNR.
    ENDLOOP.


   LOOP AT BSEG51Z.
      IEBELN-LOW  =  BSEG51Z-EBELN.
      IEBELN-OPTION = 'EQ'.
      IEBELN-SIGN = 'I'.
      APPEND IEBELN.
   ENDLOOP.

    SELECT ebeln ebelp belnr buzei budat cpudt bwart menge dmbtr shkzg bwtar matnr lfbnr lfgja INTO  TABLE EKBE105
    FROM EKBE
    where  belnr like '50%' and ( BWART = '105' or BWART = 'A05' or BWART = 'I05' or  BWART = 'L05' or
    bwart = '106'  or BWART = 'A06'  or BWART = 'I06' or  BWART = 'L06'  or
    BWART = '101' or BWART = 'A01' or BWART = 'I01' or  BWART = 'L01' or
    bwart = '102'  or BWART = 'A02'  or BWART = 'I02' or  BWART = 'L02'  )
    and ( budat >= kbudat-LOW  and  budat <= kbudat-HIGH ) and DMBTR <> 0  and EBELN in IEBELN.


      PEBELN = ''.
      PEBELP = ''.
      PBELNR = ''.
      PBUZEI = ''.
      PBUDAT = ''.
      PBUDAT1 = ''.
      PCPUDT = ''.
      PCPUDT1 = ''.
      PBWART = ''.
      PMENGE = ''.
      PDMBTR = ''.
      PSHKZG = ''.
      PBWTAR = ''.
      PMATNR = ''.
      PLFBNR = ''.
      PLFGJA = ''.

 SORT EKBE105 BY EBELN  EBELP  BELNR  BUZEI.
 SORT EKBE51  BY EBELN  EBELP  BELNR  BUZEI.
 SORT BSEG51  BY BELNR  BUZEI.

 LOOP AT EKBE105.
**50 документ******
                 PEBELN = EKBE105-EBELN.
                 PEBELP = EKBE105-EBELP.
                 PBELNR = EKBE105-BELNR.
                 PBUZEI = EKBE105-BUZEI.
                 PBUDAT = EKBE105-BUDAT.
                 PCPUDT = EKBE105-CPUDT.
                 PBWART = EKBE105-BWART.
               if  ( PBWART = '102' OR PBWART = '106' OR
                     PBWART = 'I02' OR PBWART = 'A02' OR PBWART = 'L02' OR
                     PBWART = 'A06' OR PBWART = 'I06' OR PBWART = 'L06' ).

                     PMENGE = ( EKBE105-MENGE ) * ( -1 ).
                     PDMBTR = ( EKBE105-DMBTR ) * ( -1 ).
              else.
                     PMENGE =  EKBE105-MENGE.
                     PDMBTR =  EKBE105-DMBTR.

              endif.

                 PBWTAR = EKBE105-BWTAR.
                 PMATNR = EKBE105-MATNR.
                 PLFBNR = EKBE105-LFBNR.
                 PLFGJA = EKBE105-LFGJA.

                 PBELNR51 = ''.

                 READ TABLE EKBE51 WITH KEY  EBELN = PEBELN  EBELP = PEBELP  LFBNR = PLFBNR
                 LFGJA = PLFGJA  SHKZG = 'S'.
*                 MATNR = PMATNR   BWTAR = PBWTAR  DMBTR = PDMBTR

                  if SY-SUBRC = 0.
                    PBELNR51 = EKBE51-BELNR.
                  else.
                    select  single belnr into PBELNR51
                    from EKBE where lfbnr = PLFBNR and GJAHR = PLFGJA and
                    belnr like '51%' and EBELN = PEBELN and EBELP = PEBELP.


*                     READ TABLE EKBE51 WITH KEY  EBELN = PEBELN  EBELP = PEBELP  LFBNR = PLFBNR
*                     SHKZG = 'H'.
                  endif.

                 PBSCHL = ''.
                 PSHKZG = ''.
                 PSAKNR = ''.
                 PHKONT = ''.
                 PLIFNR = ''.
                 PBUKRS = ''.
                 PBUDAT1 = ''.
                 PCPUDT1 = ''.

                 Read table BSEG51  With Key belnr = PBELNR51.
*                 BUZEI = PBUZEI.
*                 DMBTR= PDMBTR.

                 if SY-SUBRC = 0.
                  PBUKRS = BSEG51-BUKRS.
                  PSHKZG = BSEG51-SHKZG.
                  PSAKNR = BSEG51-SAKNR.
                  PHKONT = BSEG51-HKONT.
                  PLIFNR = BSEG51-LIFNR.
                  PBUKRS = BSEG51-BUKRS.
                  PBSCHL = BSEG51-BSCHL.
                  PBUZEI = BSEG51-BUZEI.
                  PBUZEI51 = BSEG51-BUZEI.
                  Read table IBKPF with Key belnr = PBELNR51.
                  PBUDAT1  =  IBKPF-BUDAT.
                  PCPUDT1  =  IBKPF-CPUDT.
                 else.
                  Read table BSEG51P  With Key belnr = PBELNR51.
                  if SY-SUBRC = 0.
                    PBUKRS = BSEG51P-BUKRS.
                    PSHKZG = BSEG51P-SHKZG.
                    PSAKNR = BSEG51P-SAKNR.
                    PHKONT = BSEG51P-HKONT.
                    PLIFNR = BSEG51P-LIFNR.
                    PBUKRS = BSEG51P-BUKRS.
                    PBSCHL = BSEG51P-BSCHL.
                    PBUZEI = BSEG51P-BUZEI.
                    Read table IBKPF with Key belnr = PBELNR51.
                    PBUDAT1  =  IBKPF-BUDAT.
                    PCPUDT1  =  IBKPF-CPUDT.
                  else.
                    if PBELNR51 <> ''.
                      select  single shkzg saknr hkont lifnr bukrs bschl buzei  into
                      (PSHKZG, PSAKNR, PHKONT, PLIFNR, PBUKRS, PBSCHL, PBUZEI)
                      from bseg  where belnr = PBELNR51 and GJAHR = PLFGJA and BSCHL = '31'
                      and belnr like '51%'.
                    else.
                      Read table IEKKO  With Key ebeln = PEBELN.
                      PLIFNR = IEKKO-LIFNR.
                      PBUKRS = IEKKO-BUKRS.
                      PBSCHL = '99'.
                      PSHKZG = 'S'.
                    endif.
                 endif.
                 endif.

                 PerForm SAPOL52.
                 Append SALIV.
ENDLOOP.

 perform VUGR51.
 close dataset WAYP.

endif.

***************************************счета-фактуры
FREE SALIV. CLEAR SALIV.
FREE BSEG51. CLEAR BSEG51.
FREE BSEGK. CLEAR BSEGK.
FREE IBSEG. CLEAR IBSEG.
FREE IBKPF. CLEAR IBKPF.
FREE EKBE51. CLEAR EKBE51.
FREE EKBE105. CLEAR EKBE105.
FREE EKBE122. CLEAR EKBE122.

****************************************************************************
FORM SAPOL52.
    SALIV-BUKRS    = PBUKRS.
    SALIV-BSCHL    = PBSCHL.
    SALIV-SHKZG    = PSHKZG.
    SALIV-BELNR50  = PBELNR.
    SALIV-BUZEI    = PBUZEI.
    SALIV-BWART    = PBWART.
    SALIV-BELNR51  = PBELNR51.
    SALIV-BUZEI51  = PBUZEI51.
    SALIV-DAT_PROV = PBUDAT.
    SALIV-DAT_VVOD = PCPUDT.
    SALIV-DAT_VDF  = PBUDAT1.
    SALIV-DAT_VDF1 = PCPUDT1.
    SALIV-MATNR    = PMATNR.
    SALIV-MENGE    = PMENGE.
    SALIV-DMBTR    = PDMBTR.
    SALIV-BWTAR    = PBWTAR.
    SALIV-SAKNR    = PSAKNR.
    SALIV-HKONT    = PHKONT.
    SALIV-EBELN    = PEBELN.
    SALIV-EBELP    = PEBELP.
    SALIV-LIFNR    = PLIFNR.
    SALIV-LFGJA    = PLFGJA.
EndForm.
***************************************
***************************************
FORM VUGR51 .
  CALL FUNCTION 'GUI_DOWNLOAD'
           EXPORTING
                FILENAME        = WAYP
                FILETYPE        = 'DBF'
                codepage        = '1503'

           TABLES
                DATA_TAB        = SALIV
                fieldnames      = tabdbf50
            EXCEPTIONS
              FILE_WRITE_ERROR = 1
              OTHERS = 2.
  CASE SY-SUBRC.
    WHEN 1.
      WRITE 'Ошибка открытия файла документов'.
      EXIT.
    WHEN 2.
      WRITE 'Ошибка сохранения данных'.
      EXIT.
  ENDCASE.
ENDFORM.     " VUGR51
***************************************
******************************************************
FORM DIRCR.
 CALL METHOD cl_gui_frontend_services=>DIRECTORY_CREATE
    EXPORTING
      DIRECTORY                = 'D:\MAT_VIG\'             "Директорий для cохранения на диск D
    CHANGING
      rc                       = rc
    EXCEPTIONS
      DIRECTORY_CREATE_FAILED  = 1
      CNTL_ERROR               = 2
      ERROR_NO_GUI             = 3
      DIRECTORY_ACCESS_DENIED  = 4
      DIRECTORY_ALREADY_EXISTS = 5
      PATH_NOT_FOUND           = 6
      UNKNOWN_ERROR            = 7
      NOT_SUPPORTED_BY_GUI     = 8
      WRONG_PARAMETER          = 9.
ENDFORM.
*********************************************************************************************************
