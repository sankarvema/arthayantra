using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class UserControls_AccountDetails : System.Web.UI.UserControl
{
    #region Private variables

    string constr = string.Empty;
    string accId;
    
    private AccountEntity currAcc
    {
        get { return (AccountEntity)Cache["CurrentAccount"]; }
        set { Cache["CurrentAccount"] = value; }
    }

    AccountEntity newAcc = null;

    private OperationMode opMode = OperationMode.None;
    #endregion

    private enum OperationMode
    {
        None,
        New,
        Edit,
        Delete
    }

    #region Properties


    public string DBConnectionString
    {
        get 
        { 
            return constr;
        }
        set
        {
            constr = value;
        }
    }

    public string AccountId
    {
        get 
        { 
            return accId;
        }
        set
        {
            accId = value;
            currAcc = new AccountEntity(accId);
        }
    }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (IsPostBack)
        //{
        //    if ((object)Cache["CurrentAccount"] != null) 
        //        currAcc = (Account) Cache["CurrentAccount"];
        //}
    }

    protected void imgbtnSave_Click(object sender, ImageClickEventArgs e)
    {
        opMode = (OperationMode) Cache["OpMode"];

        currAcc.AccountName = txtAccountName.Text;

        switch (opMode)
        { 
            case OperationMode.New:
                currAcc.CreateAccount();
                break;
            case OperationMode.Edit:
                currAcc.UpdateAccount();
                break;
        }
    }

    public void ShowAccount()
    {
        //txtParentAccName.Text = currAcc.AccountName;
        txtAccountName.Text = currAcc.AccountName;
        txtAccCate.Text = currAcc.AccountCategory;
    }

    protected void imgbtnNew_Click(object sender, ImageClickEventArgs e)
    {
        AccountEntity tempAcc = currAcc;
        currAcc = new AccountEntity();
        currAcc.ParentAccountId = tempAcc.AccountId;
        currAcc.AccountCategory = tempAcc.AccountCategory;

        txtParentAccName.Text = tempAcc.AccountName;
        txtAccCate.Text = currAcc.AccountCategory;
        txtAccountName.Text = "";
        txtAccountName.ReadOnly = false;

        opMode = OperationMode.New;
        Cache["OpMode"] = opMode;
    }

    protected void imgbtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        txtAccountName.ReadOnly = false;

        opMode = OperationMode.Edit;
        Cache["OpMode"] = opMode;
    }
}

