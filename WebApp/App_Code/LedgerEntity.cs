using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Ledger
/// </summary>
public class LedgerEntity
{
    public AccountEntity Account;
    public Double DebitValue;
    public Double CreditValue;

    public Double LedgerBalance;
    public AccountTransMode TransMode;

    public LedgerEntity()
	{
	}

    public static DataTable GetLedgerByAccount(string accountId)
    {
        DataTable formattedLedger = new DataTable();

        formattedLedger.Columns.Add("TransDate");
        formattedLedger.Columns.Add("AccountId");
        formattedLedger.Columns.Add("Account");
        formattedLedger.Columns.Add("AcInTrans");
        formattedLedger.Columns.Add("Debit");
        formattedLedger.Columns.Add("Credit");

        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["fasdb"].ConnectionString;

        string query = DbStatements.LedgerByAccountForPeriod;
        query = query.Replace(@"[{ledgerAccId}]", accountId);
        query = query.Replace(@"[{periodStartDate}]", SessionManager.TransactionStartDate.ToString());
        query = query.Replace(@"[{periodEndDate}]", SessionManager.TransactionEndDate.ToString());

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = query;

        cmd.Connection = cn;

        cn.Open();
        SqlDataReader rdr = cmd.ExecuteReader();

        while (rdr.Read())
        {
            DataRow newRow = formattedLedger.NewRow();

            string transFlag = rdr.GetText("AcInTrans").ToUpper();

            newRow["TransDate"] = rdr.GetText("transDate");
            newRow["AccountId"] = rdr.GetText("trAcId");
            newRow["Account"] = rdr.GetText("trAcName");
            if(transFlag == "D")
                newRow["Debit"] = rdr.GetText("drAmt");
            else
                newRow["Credit"] = rdr.GetText("crAmt");

            formattedLedger.Rows.Add(newRow);
        }

        rdr.Close();
        rdr.Dispose();
        cmd.Dispose();
        cn.Close();
        cn.Dispose();

        return formattedLedger;
    }
}