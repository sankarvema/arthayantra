<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountTree.ascx.cs" Inherits="AccountTree" %>
<asp:Panel ID="Panel1" runat="server" Height="30px" Width="250px">
    <asp:ImageButton ID="imgbtnCollapseAll" runat="server" OnClick="imgbtnCollapseAll_Click" ToolTip="Collapse All Nodes" />
    <asp:ImageButton ID="imgbtnExpandAll" runat="server" OnClick="imgbtnExpandAll_Click"
        ToolTip="Expand All Nodes" />
    <asp:ImageButton ID="imgbtnRefresh" runat="server" ImageUrl="~/App_GlobalResources/refresh.gif"
        OnClick="imgbtnRefresh_Click" /></asp:Panel>
<asp:Panel ID="Panel2" runat="server" Height="400px" ScrollBars="Both" Width="253px">
<asp:TreeView ID="AccTree" runat="server" ImageSet="Simple" NodeIndent="10" OnSelectedNodeChanged="AccTree_SelectedNodeChanged"
    ShowLines="True" Height="445px" Width="284px" BorderStyle="None">
    <ParentNodeStyle Font-Bold="False" />
    <HoverNodeStyle Font-Underline="True" ForeColor="#DD5555" />
    <SelectedNodeStyle Font-Underline="True" ForeColor="#DD5555" HorizontalPadding="0px"
        VerticalPadding="0px" />
    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="0px"
        NodeSpacing="0px" VerticalPadding="0px" />
</asp:TreeView>
</asp:Panel>
