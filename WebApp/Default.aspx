<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserControls/AccountDetails.ascx" TagName="AccountDetails" TagPrefix="uc2" %>
<%@ Register Src="UserControls/AccountTree.ascx" TagName="AccountTree" TagPrefix="uc1" %>
<%@ Register Src="UserControls/Ledger.ascx" TagName="AccountLedger" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        Accounting Software
        <br />
        <table>
            <tr>
                <td style="width: 100px">
                <uc1:AccountTree ID="accTree" runat="server"/>
                </td>
                <td style="width: 364px">
                <uc2:AccountDetails ID="accDetails" runat="server" />
                <hr />
                Ledger
                <uc3:AccountLedger ID="accLedger" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
