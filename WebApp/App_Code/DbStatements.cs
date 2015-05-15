using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DbStatements
/// </summary>
public class DbStatements
{
	public DbStatements()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string LedgerByAccountForPeriod =
        @"SELECT  
	        transDate, trAcId, trAcName, drAmt, crAmt, trFlg as AcInTrans, crFlg
            FROM [fas].[dbo].[Ledger]
            where ledAcId = '[{ledgerAccId}]' and transDate BETWEEN '[{periodStartDate}]' AND '[{periodEndDate}]'
            order by transDate";
}