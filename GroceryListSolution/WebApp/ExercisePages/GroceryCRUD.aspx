<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GroceryCRUD.aspx.cs" Inherits="WebApp.ExercisePages.GroceryCRUD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Query: ODS</h1>

    <div class="col-md-offset-1">

        <br />
        <br />
        <br />

        <asp:ValidationSummary ID="ValidationSummaryInsert" runat="server"
        HeaderText="Correct the following concerns on the insert record"
        ValidationGroup="IGroup"/>
        <asp:ValidationSummary ID="ValidationSummaryEdit" runat="server"
        HeaderText="Correct the following concerns on the insert edit"
        ValidationGroup="EGroup"/>

        <asp:ListView runat="server" DataSourceID="ProductListODS" InsertItemPosition="LastItem" DataKeyNames="ProductID">

            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF; color: #284775;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" OnClientClick="return confirm('Are you sure you wish to remove?')"
                            CausesValidation="false"/>
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" width="50px" readonly="true"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" width="300px"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# String.Format("{0:0.00}", Eval("Price")) %>' runat="server" ID="PriceLabel" width="80px"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# String.Format("{0:0.00}", Eval("Discount")) %>' runat="server" ID="DiscountLabel" width="80px"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" width="90px"/>
                    </td>
                    <%--<td>
                        <asp:Label Text='<%# Eval("CategoryID") %>' runat="server" ID="CategoryIDLabel" width="50px"/>
                    </td>--%>
                    <td>
                        <asp:DropDownList ID="CategoryList" runat="server" 
                            DataSourceID="CategoryListODS" 
                            DataTextField="Description" 
                            DataValueField="CategoryID"
                            SelectedValue='<%# Eval("CategoryID") %>'
                            Width="200px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="TaxableCheckBox" Enabled="false" width="50px"/>
                    </td>
                    <%--<td>
                        <asp:Label Text='<%# Eval("OrderLists") %>' runat="server" ID="OrderListsLabel" />
                    </td>--%>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <asp:RequiredFieldValidator ID="RequiredDescription" runat="server" 
                    ErrorMessage="Description is required" Display="None"
                    ControlToValidate="DescriptionTextBoxE" ValidationGroup="EGroup">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExDescriptionTextBoxE" runat="server"
                    ErrorMessage="Description is limited to 140 characters" Display="None"
                    ControlToValidate="DescriptionTextBoxE" ValidationGroup="EGroup"
                    ValidationExpression="^.{1,140}$">
                </asp:RegularExpressionValidator>

                <asp:RequiredFieldValidator ID="RequiredPrice" runat="server" 
                    ErrorMessage="Price is required" Display="None"
                    ControlToValidate="PriceTextBoxE" ValidationGroup="EGroup">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="ComparePrice" runat="server" ValidationGroup="EGroup"
                    ErrorMessage="Price cannot be lower then the discount value and
                    the price must be 0.00 or greater also cannot be a string" Display="None" 
                    SetFocusOnError="true" ControlToValidate="PriceTextBoxE"
                    Type="Double" Operator="GreaterThanEqual" ValueToCompare="0.00"
                    ControlToCompare="DiscountTextBoxE">
                </asp:CompareValidator>

                <asp:RequiredFieldValidator ID="RequiredDiscount" runat="server" 
                    ErrorMessage="Discount is required" Display="None"
                    ControlToValidate="DiscountTextBoxE" ValidationGroup="EGroup">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareDiscount" runat="server" ValidationGroup="EGroup"
                    ErrorMessage="Discount must be 0.00 or greater and it cannot be a string" Display="None"
                    SetFocusOnError="true" ControlToValidate="DiscountTextBoxE"
                    Type="Double" Operator="GreaterThanEqual" ValueToCompare="0.00">
                </asp:CompareValidator>

                <asp:RequiredFieldValidator ID="RequiredUnitSize" runat="server" 
                    ErrorMessage="Unit Size is required" Display="None"
                    ControlToValidate="UnitSizeTextBoxE" ValidationGroup="EGroup">
                </asp:RequiredFieldValidator>

                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" ValidationGroup="EGroup"/>
                        <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("ProductID") %>' runat="server" ID="ProductIDTextBox" width="50px" readonly="true"/>
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBoxE" width="300px"/>
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("Price") %>' runat="server" ID="PriceTextBoxE" width="80px"/>
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("Discount") %>' runat="server" ID="DiscountTextBoxE" width="80px"/>
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("UnitSize") %>' runat="server" ID="UnitSizeTextBoxE" width="90px"/>
                    </td>
                    <%--<td>
                        <asp:TextBox Text='<%# Bind("CategoryID") %>' runat="server" ID="CategoryIDTextBox" width="50px"/>
                    </td>--%>
                    <td>
                        <asp:DropDownList ID="CategoryList" runat="server" 
                            DataSourceID="CategoryListODS" 
                            DataTextField="Description" 
                            DataValueField="CategoryID"
                            SelectedValue='<%# Bind("CategoryID") %>'
                            Width="200px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CheckBox Checked='<%# Bind("Taxable") %>' runat="server" ID="TaxableCheckBox" width="50px"/>
                    </td>
                    <%--<td>
                        <asp:TextBox Text='<%# Bind("OrderLists") %>' runat="server" ID="OrderListsTextBox" />
                    </td>--%>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <asp:RequiredFieldValidator ID="RequiredDescription" runat="server" 
                    ErrorMessage="Description is required" Display="None"
                    ControlToValidate="DescriptionTextBoxI" ValidationGroup="IGroup">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExDescriptionTextBoxE" runat="server"
                    ErrorMessage="Description is limited to 140 characters" Display="None"
                    ControlToValidate="DescriptionTextBoxI" ValidationGroup="IGroup"
                    ValidationExpression="^.{1,140}$">
                </asp:RegularExpressionValidator>

                <asp:RequiredFieldValidator ID="RequiredPrice" runat="server" 
                    ErrorMessage="Price is required" Display="None"
                    ControlToValidate="PriceTextBoxI" ValidationGroup="IGroup">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="ComparePrice" runat="server" ValidationGroup="IGroup"
                    ErrorMessage="Price cannot be lower then the discount value and
                    the price must be 0.00 or greater also cannot be a string" Display="None" 
                    SetFocusOnError="true" ControlToValidate="PriceTextBoxI"
                    Type="Double" Operator="GreaterThanEqual" ValueToCompare="0.00"
                    ControlToCompare="DiscountTextBoxI">
                </asp:CompareValidator>

                <asp:RequiredFieldValidator ID="RequiredDiscount" runat="server" 
                    ErrorMessage="Discount is required" Display="None"
                    ControlToValidate="DiscountTextBoxI" ValidationGroup="IGroup">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareDiscount" runat="server" ValidationGroup="IGroup"
                    ErrorMessage="Discount must be 0.00 or greater and it cannot be a string" Display="None"
                    SetFocusOnError="true" ControlToValidate="DiscountTextBoxI"
                    Type="Double" Operator="GreaterThanEqual" ValueToCompare="0.00">
                </asp:CompareValidator>

                <asp:RequiredFieldValidator ID="RequiredUnitSize" runat="server" 
                    ErrorMessage="Unit Size is required" Display="None"
                    ControlToValidate="UnitSizeTextBoxI" ValidationGroup="IGroup">
                </asp:RequiredFieldValidator>

                <tr style="">
                    <td>
                        <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" ValidationGroup="IGroup"/>
                        <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("ProductID") %>' runat="server" ID="ProductIDTextBoxI" width="50px" readonly="true"/>
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBoxI" width="300px"/>
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("Price") %>' runat="server" ID="PriceTextBoxI" width="80px"/>
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("Discount") %>' runat="server" ID="DiscountTextBoxI" width="80px"/>
                    </td>
                    <td>
                        <asp:TextBox Text='<%# Bind("UnitSize") %>' runat="server" ID="UnitSizeTextBoxI" width="90px"/>
                    </td>
                    <%--<td>
                        <asp:TextBox Text='<%# Bind("CategoryID") %>' runat="server" ID="CategoryIDTextBox" width="50px"/>
                    </td>--%>
                    <td>
                        <asp:DropDownList ID="CategoryList" runat="server" 
                            DataSourceID="CategoryListODS" 
                            DataTextField="Description" 
                            DataValueField="CategoryID"
                            SelectedValue='<%# Bind("CategoryID") %>'
                            Width="200px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CheckBox Checked='<%# Bind("Taxable") %>' runat="server" ID="TaxableCheckBox" width="50px"/>
                    </td>
                    <%--<td>
                        <asp:TextBox Text='<%# Bind("OrderLists") %>' runat="server" ID="OrderListsTextBox" />
                    </td>--%>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" OnClientClick="return confirm('Are you sure you wish to remove?')"
                            CausesValidation="false"/>
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" width="50px" readonly="true"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" width="300px"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# String.Format("{0:0.00}", Eval("Price")) %>' runat="server" ID="PriceLabel" width="80px"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# String.Format("{0:0.00}", Eval("Discount")) %>' runat="server" ID="DiscountLabel" width="80px"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" width="90px"/>
                    </td>
                    <%--<td>
                        <asp:Label Text='<%# Eval("CategoryID") %>' runat="server" ID="CategoryIDLabel" width="50px"/>
                    </td>--%>
                    <td>
                        <asp:DropDownList ID="CategoryList" runat="server" 
                            DataSourceID="CategoryListODS" 
                            DataTextField="Description" 
                            DataValueField="CategoryID"
                            SelectedValue='<%# Eval("CategoryID") %>'
                            Width="200px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="TaxableCheckBox" Enabled="false" width="50px"/>
                    </td>
                    <%--<td>
                        <asp:Label Text='<%# Eval("OrderLists") %>' runat="server" ID="OrderListsLabel" />
                    </td>--%>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">ID</th>
                                    <th runat="server">Description</th>
                                    <th runat="server">Price</th>
                                    <th runat="server">Discount</th>
                                    <th runat="server">UnitSize</th>
                                    <%--<th runat="server">CategoryID</th>--%>
                                    <th runat="server">Category</th>
                                    <th runat="server">Taxable</th>
                                    <%--<th runat="server">OrderLists</th>--%>
                                </tr>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                            <asp:DataPager runat="server" ID="DataPager1">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" OnClientClick="return confirm('Are you sure you wish to remove?')"
                            CausesValidation="false"/>
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" width="50px" readonly="true"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" width="300px"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# String.Format("{0:0.00}", Eval("Price")) %>' runat="server" ID="PriceLabel" width="80px"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# String.Format("{0:0.00}", Eval("Discount")) %>' runat="server" ID="DiscountLabel" width="80px"/>
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" width="90px"/>
                    </td>
                    <%--<td>
                        <asp:Label Text='<%# Eval("CategoryID") %>' runat="server" ID="CategoryIDLabel" width="50px"/>
                    </td>--%>
                    <td>
                        <asp:DropDownList ID="CategoryList" runat="server" 
                            DataSourceID="CategoryListODS" 
                            DataTextField="Description" 
                            DataValueField="CategoryID"
                            SelectedValue='<%# Eval("CategoryID") %>'
                            Width="200px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="TaxableCheckBox" Enabled="false" width="50px"/>
                    </td>
                    <%--<td>
                        <asp:Label Text='<%# Eval("OrderLists") %>' runat="server" ID="OrderListsLabel" />
                    </td>--%>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    <asp:ObjectDataSource ID="ProductListODS" runat="server" 
        DataObjectTypeName="GroceryList.Data.Entities.Product" 
        DeleteMethod="Product_Delete" 
        InsertMethod="Product_Add" 
        UpdateMethod="Product_Update"
        SelectMethod="Product_List"
        OldValuesParameterFormatString="original_{0}" 
        TypeName="GroceryListSystem.BLL.ProductController">
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="CategoryListODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Category_List" 
        TypeName="GroceryListSystem.BLL.CategoryController">
    </asp:ObjectDataSource>
</asp:Content>