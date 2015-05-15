<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Ledger.ascx.cs" Inherits="UserControls_Ledger" %>

Ledger
Account: 
<asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="TransDate" HeaderText="Date" ItemStyle-Width="150" />
        <asp:BoundField DataField="Account" HeaderText="Account" ItemStyle-Width="250" />
        <asp:BoundField DataField="Debit" HeaderText="Debit" ItemStyle-Width="100" />
        <asp:BoundField DataField="Credit" HeaderText="Credit" ItemStyle-Width="100" />
    </Columns>
</asp:GridView>
