using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AccountTree : System.Web.UI.UserControl
{
    private DataSet ds = new DataSet();

    public event AccountNodeSelected AccountNodeSelected;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            InitializeTree();
    }

    protected void AccTree_SelectedNodeChanged(object sender, EventArgs e)
    {
        AccountNodeEventArgs args = new AccountNodeEventArgs(AccTree.SelectedValue);
        if (AccountNodeSelected != null)
            AccountNodeSelected(this, args);
    }

    protected void InitializeTree()
    {
        string constr = ConfigurationManager.ConnectionStrings["fasdb"].ConnectionString;
        //Response.Write(constr);

        SqlDataAdapter adp = new SqlDataAdapter("select acId, pacId, acName, acCate from AccMast", constr);
        adp.Fill(ds);

        AccTree.Nodes.Clear();
        AccTree.ExpandDepth = 3;
        
        TreeNode node = new TreeNode("Accounts", "-1");
        AccTree.Nodes.Add(node);
        PopulateTree(node, "-1");
    }

    protected void PopulateTree(TreeNode parentNode, string parentId)
    {
        //DataView dv = new DataView(ds.Tables[0]);
        DataRow[] foundRows = ds.Tables[0].Select("pacId = '" + parentId + "'");

           // dv.RowFilter = "pacId = '"+ parentId + "'";


        foreach (DataRow drow in foundRows)
        {
            string rowId = drow["acId"].ToString();

            TreeNode node = new TreeNode(drow[2].ToString(), drow[0].ToString());
            parentNode.ChildNodes.Add(node);

            PopulateTree(node, rowId);

        }
    }

    protected void imgbtnCollapseAll_Click(object sender, ImageClickEventArgs e)
    {
        AccTree.CollapseAll();
    }

    protected void imgbtnExpandAll_Click(object sender, ImageClickEventArgs e)
    {
        AccTree.ExpandAll();
    }

    public string SelectedAccountId
    {
        get
        {
            return AccTree.SelectedNode.Value;
        }
    }

    protected void imgbtnRefresh_Click(object sender, ImageClickEventArgs e)
    {
        InitializeTree();
    }
}

public class AccountNodeEventArgs : EventArgs
{
    private string accountId;

    public string AccountId
    {
        get { return accountId; }
        set { accountId = value; }
    }

    public AccountNodeEventArgs(string accId)
    {
        this.accountId = accId;
    }
}

public delegate void AccountNodeSelected(object sender, AccountNodeEventArgs e);
