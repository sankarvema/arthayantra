<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transaction.aspx.cs" Inherits="Transaction" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>
    <form id="Form1" runat="server">
        <asp:Panel id="pnlTransaction" runat="server">
            <asp:DataGrid id="dgrdTrans" runat="server" AutoGenerateColumns="False" GridLines="Vertical" 
                CellPadding="3" BorderStyle="None" DataKeyField="transId" BorderWidth="1px" BorderColor="#999999"
		        BackColor="White">

		        <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
		        <AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
		        <ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
		        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
		        <FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>

	            <Columns>
		            <asp:BoundColumn DataField="transId" ReadOnly="True" HeaderText="Sl.No"></asp:BoundColumn>
		            <asp:BoundColumn DataField="currency" HeaderText="Emp Name"></asp:BoundColumn>
		            <asp:BoundColumn DataField="salary" HeaderText="Salary"></asp:BoundColumn>
		            <asp:BoundColumn DataField="joiningDate" HeaderText="Joining Date "></asp:BoundColumn>
		            <asp:EditCommandColumn ButtonType="PushButton" UpdateText="Update" HeaderText="Edit" CancelText="Cancel"
			            EditText="Edit"></asp:EditCommandColumn>
		            <asp:ButtonColumn Text="Delete" ButtonType="PushButton" HeaderText="Delete" CommandName="Delete"></asp:ButtonColumn>
		            <asp:TemplateColumn HeaderText="Select">
			            <ItemTemplate>
				            <asp:CheckBox id="cbSelected" runat="server"></asp:CheckBox>
			            </ItemTemplate>
                        <EditItemTemplate>
                            Edsit
                        </EditItemTemplate>
		            </asp:TemplateColumn>
	            </Columns>

		        <PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
	        </asp:DataGrid>
        	
	        <asp:Button id="btnDeleteAll" runat="server" Text="Delete All"></asp:Button>
	        <asp:Button id="btnNewItem" runat="server" Text="New"></asp:Button>
        </asp:Panel>    
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                Paid
            </ItemTemplate>
            <EditItemTemplate>
                Paid
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>&nbsp;<asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:DataList>
    </form>
</body>
</html>
