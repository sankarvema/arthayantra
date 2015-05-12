<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TransactionGrid.ascx.cs" Inherits="UserControls_TransactionGrid" %>
<asp:Panel id="Panel3" runat="server">Edit
    <asp:DataGrid id="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="Vertical" CellPadding="3"
		BorderStyle="None" DataKeyField="empId" BorderWidth="1px" BorderColor="#999999"
		BackColor="White">

		<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
		<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
		<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
		<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
		<FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>

	    <Columns>
		    <asp:BoundColumn DataField="empId" ReadOnly="True" HeaderText="Emp ID"></asp:BoundColumn>
		    <asp:BoundColumn DataField="empName" HeaderText="Emp Name"></asp:BoundColumn>
		    <asp:BoundColumn DataField="salary" HeaderText="Salary"></asp:BoundColumn>
		    <asp:BoundColumn DataField="joiningDate" HeaderText="Joining Date "></asp:BoundColumn>
		    <asp:EditCommandColumn ButtonType="PushButton" UpdateText="Update" HeaderText="Edit" CancelText="Cancel"
			    EditText="Edit"></asp:EditCommandColumn>
		    <asp:ButtonColumn Text="Delete" ButtonType="PushButton" HeaderText="Delete" CommandName="Delete"></asp:ButtonColumn>
		    <asp:TemplateColumn HeaderText="Select">
			    <ItemTemplate>
				    <asp:CheckBox id="cbSelected" runat="server"></asp:CheckBox>
			    </ItemTemplate>
		    </asp:TemplateColumn>
	    </Columns>

		<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
	</asp:DataGrid>
	
	<asp:Button id="Button2" runat="server" Text="Delete All"></asp:Button>
</asp:Panel>