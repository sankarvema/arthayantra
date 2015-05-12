using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Account
/// </summary>

public class Account
{
    private string constr = ConfigurationManager.ConnectionStrings["fasdb"].ConnectionString;

    private string accountId;
    public string AccountId
    {
        get { return accountId; }
        set { accountId = value; }
    }

    private string parentAccountId;
    public string ParentAccountId
    {
        get { return parentAccountId; }
        set { parentAccountId = value; }
    }

    private string accountName;
    public string AccountName
    {
        get { return accountName; }
        set { accountName = value; }
    }

    private string accountCategory;
    public string AccountCategory
    {
        get { return accountCategory; }
        set { accountCategory = value; }
    }

    private double accountBalance;
    public double AccountBalance
    {
        get { return accountBalance; }
    }

    private int totalTransactions;
    public int TotalTransactions
    {
        get { return totalTransactions; }
    }

    private DateTime lastTransactionDate;
    public DateTime LastTransactionDate
    {
        get { return lastTransactionDate; }
    }

    private bool isDirty = true;

    public Account()
    {
        isDirty = true;
    }

    public Account(string accId)
    {
        accountId = accId;
        ReadAccount();
    }

    public void ReadAccount()
    {
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = constr;

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select acName, acCate, pacId from AccMast where acId=@acId";

        SqlParameter paramAccId = new SqlParameter("acId", SqlDbType.Char);
        paramAccId.Value = accountId;
        cmd.Parameters.Add(paramAccId);

        cmd.Connection = cn;

        cn.Open();
        SqlDataReader rdr = cmd.ExecuteReader();

        //int? id = row.GetValue<int>("Id");
        //string name = row.GetText("Name");
        //double? price = row.GetValue<double>("Price");

        if (rdr.Read())
        {
            accountName = rdr.GetText("acName");
            accountCategory = rdr.GetText("acCate");
            parentAccountId = rdr.GetText("pacId");
        }

        rdr.Close();
        rdr.Dispose();
        cmd.Dispose();
        cn.Close();
        cn.Dispose();

        isDirty = false;
    }

    public Account GetAccount(string accId)
    {
        if (isDirty)
        {
            accountId = accId;
            ReadAccount();
        }

        return this;
    }

    public Account GetParentAccount()
    {
        return (new Account(this.parentAccountId));
    }

    public void CreateAccount()
    {
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = constr;

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into AccountMast (acName, pacId, acCate) values (@acName,@pacId,@acCate)";

        SqlParameter paramAccName = new SqlParameter("acName", SqlDbType.NVarChar);
        SqlParameter paramParentAccId = new SqlParameter("pacId", SqlDbType.Int);
        SqlParameter paramAccCate = new SqlParameter("acCate", SqlDbType.NVarChar);

        paramAccName.Value = accountName;
        paramAccCate.Value = accountCategory;
        paramParentAccId.Value = parentAccountId;

        cmd.Parameters.Add(paramAccName);
        cmd.Parameters.Add(paramParentAccId);
        cmd.Parameters.Add(paramAccCate);

        cmd.Connection = cn;

        cn.Open();

        cmd.ExecuteNonQuery();

        cmd.Dispose();

        cn.Close();
        cn.Dispose();
    }

    public void UpdateAccount()
    {
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = constr;

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update AccountMast set acName=?, acCate=?, pacId=? where acId = ?";

        SqlParameter paramAccId = new SqlParameter("acName", SqlDbType.Int);
        SqlParameter paramAccName = new SqlParameter("acName", SqlDbType.NVarChar);
        SqlParameter paramParentAccId = new SqlParameter("pacId", SqlDbType.Int);
        SqlParameter paramAccCate = new SqlParameter("acCate", SqlDbType.NVarChar);

        paramAccId.Value = accountId;
        paramAccName.Value = accountName;
        paramAccCate.Value = accountCategory;
        paramParentAccId.Value = parentAccountId;

        cmd.Parameters.Add(paramAccId);
        cmd.Parameters.Add(paramAccName);
        cmd.Parameters.Add(paramParentAccId);
        cmd.Parameters.Add(paramAccCate);

        cmd.Connection = cn;

        cn.Open();

        cmd.ExecuteNonQuery();

        cmd.Dispose();

        cn.Close();
        cn.Dispose();
    }

    public void DeleteAccount()
    {
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = constr;

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "delete AccountMast where acId = ?";

        SqlParameter paramAccId = new SqlParameter("acName", SqlDbType.Int);

        paramAccId.Value = accountId;

        cmd.Parameters.Add(paramAccId);

        cmd.Connection = cn;

        cn.Open();

        cmd.ExecuteNonQuery();

        cmd.Dispose();

        cn.Close();
        cn.Dispose();
    }
}
