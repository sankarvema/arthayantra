using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserControls_Ledger : System.Web.UI.UserControl
{
    public string AccountId;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void ShowAccount()
    {
        DataTable ledger = LedgerEntity.GetLedgerByAccount(AccountId);

        GridView1.DataSource = ledger;
        GridView1.DataBind();
    }
}