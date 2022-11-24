/*****************************************************************************************************************
*                                                CAST PARA DATAS                                                 *
*                                                                                                                *
*  TIPOS DE CAST PARA DATAS                                                                                      *
*                                                                                                                *
*                                                                                                                *
* BANCO_SISTEMA : GENERICO                                                                                       *
* CRIADO POR    : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
* ALTERADO POR  : WEMERSON BITTORI MADURO                                                        DATA:08/12/2021 *
******************************************************************************************************************/

SELECT   
     CAST('2007-05-08 12:35:29. 1234567 +12:15' AS time(7)) AS 'time'   
    , CAST('2007-05-08 12:35:29. 1234567 +12:15' AS time(0)) AS 'time curto'   
    ,CAST('2007-05-08 12:35:29. 1234567 +12:15' AS date) AS 'date'   
    ,CAST('2007-05-08 12:35:29.123' AS smalldatetime) AS   
        'smalldatetime'   
    ,CAST('2007-05-08 12:35:29.123' AS datetime) AS 'datetime'   
    ,CAST('2007-05-08 12:35:29. 1234567 +12:15' AS datetime2(7)) AS   
        'datetime2'  
    ,CAST('2007-05-08 12:35:29.1234567 +12:15' AS datetimeoffset(7)) AS   
        'datetimeoffset';  

