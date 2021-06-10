<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OLTPLastExercise.aspx.cs" Inherits="WebApp.ExercisePages.OLTPLastExercise" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <h1>Grocery List Solution</h1>
</div>
    <uc1:MessageUserControl runat="server" ID="messageUserControl" />

    <div class="d-flex justify-content-between">
        <asp:DropDownList ID="OrderDDL" runat="server" Width="100px"
            DataSourceID="OrderDDLODS"
            DataTextField="OrderID"
            DataValueField="OrderID">
        </asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:Button ID="OrderFetch" runat="server" Text="Fetch" OnClick="OrderFetch_Click" CausesValidation="false"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Customer" runat="server" Text=" "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Contact" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="PickerDDL" runat="server" Width="150px"
            DataSourceID="PickerDDLODS"
            DataTextField="FullName"
            DataValueField="PickerID">
        </asp:DropDownList>
    </div>
    <br />
    <asp:ValidationSummary ID="ValidationForForm" runat="server" HeaderText="Please fill in the field that are required" CssClass="alert alert-danger"/>
    <asp:Panel ID="ListPanel" runat="server" Visible="false">
        <div class="col-sm-12">
            <asp:GridView ID="PickerGridView" runat="server" AutoGenerateColumns="False" DataSourceID="PickerListODS" CssClass="table table-condensed table-hover">
                <Columns>
                    <asp:TemplateField HeaderText="OrderListID" SortExpression="OrderListID" Visible="False">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("OrderListID") %>' ID="OrderListID"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ProductName" SortExpression="ProductName">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ProductName") %>' ID="ProductName"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Quantity") %>' ID="Quantity"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Comment") %>' ID="Comment"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PickedQuantity" SortExpression="PickedQuantity">
                        <ItemTemplate>
                            <asp:Textbox runat="server" Text='<%# Bind("PickedQuantity") %>' ID="QtyPicked"></asp:Textbox>
                            <asp:RequiredFieldValidator ID="RequiredPicked" runat="server" 
                                ErrorMessage="Picked is required" Display="None" 
                                ControlToValidate="QtyPicked">
                            </asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="ComparePicked" runat="server" 
                                ErrorMessage="Picked must be 0 or greater and it cannot be a string" Display="None"
                                SetFocusOnError="true" ControlToValidate="QtyPicked"    
                                Type="Double" Operator="GreaterThanEqual" ValueToCompare="0.00">
                            </asp:CompareValidator>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PickIssue" SortExpression="PickIssue">
                        <ItemTemplate>
                            <asp:Textbox runat="server" Text='<%# Bind("PickIssue") %>' ID="PickIssue" MaxLength="100"></asp:Textbox>
                            <asp:RegularExpressionValidator ID="RegPickIssue" runat="server"
                                ErrorMessage="Pick Issue is limited to 100 characters" Display="None"
                                ControlToValidate="PickIssue" ValidationExpression="^.{0,100}$">
                        </asp:RegularExpressionValidator>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>
    <br />
    <div class="row">
        <asp:Button ID="SavePicker" runat="server" Text="Save" OnClick="SavePicker_Click" />
    </div>

    <asp:ObjectDataSource ID="OrderDDLODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Orders_UnDelieveredList" 
        TypeName="GroceryListSystem.BLL.OrdersController">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="PickerDDLODS" runat="server"
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Picker_List" 
        TypeName="GroceryListSystem.BLL.PickersController">
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="PickerListODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="OrderLists_OrderPickList" 
        TypeName="GroceryListSystem.BLL.OrderListsController">
        <SelectParameters>
            <asp:ControlParameter ControlID="OrderDDL" Name="orderid" Type="Int32" ConvertEmptyStringToNull="true"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>