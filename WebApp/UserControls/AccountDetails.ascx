<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountDetails.ascx.cs" Inherits="UserControls_AccountDetails" %>
<asp:Panel ID="Panel1" runat="server" Height="26px" Width="274px">
    <asp:ImageButton ID="imgbtnNew" runat="server" ImageUrl="~/App_GlobalResources/new.gif" OnClick="imgbtnNew_Click" />
    <asp:ImageButton ID="imgbtnSave" runat="server" ImageUrl="~/App_GlobalResources/save.gif"
        OnClick="imgbtnSave_Click" />
    <asp:ImageButton ID="imgbtnDelete" runat="server" ImageUrl="~/App_GlobalResources/delete.gif" />
    <asp:ImageButton ID="imgbtnEdit" runat="server" ImageUrl="~/App_GlobalResources/edit.gif" OnClick="imgbtnEdit_Click" /></asp:Panel>
Parent Account<asp:TextBox ID="txtParentAccName" runat="server" ReadOnly="True"></asp:TextBox>
<br />
Account Name<asp:TextBox ID="txtAccountName" runat="server" BorderStyle="Dotted"
    ReadOnly="True"></asp:TextBox><br />
Category<asp:TextBox ID="txtAccCate" runat="server" ReadOnly="True">Expenses</asp:TextBox><br />
Current Balance<asp:TextBox ID="txtAccBal" runat="server" ReadOnly="True">0.0</asp:TextBox>&nbsp;
<br />
Total Transactions<asp:TextBox ID="txtTotalTrans" runat="server" ReadOnly="True">0</asp:TextBox>
<br />
Last Transaction<asp:TextBox ID="txtLastTrans" runat="server" ReadOnly="True">1 Apr 2008</asp:TextBox><br />
<br />
