<%@ Page Title="GroceryQueryODS" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GroceryQueryODS.aspx.cs" Inherits="WebApp.ExercisePages.GroceryQueryODS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Query: ODS</h1>

    <div class="col-md-offset-1">
        <br />

        <asp:Label ID="label1" runat="server" Text="Select a category:"></asp:Label>
        &nbsp;&nbsp;
        <asp:DropDownList ID="CategoryList" runat="server" DataSourceID="CategoryListODS" DataTextField="Description" DataValueField="CategoryID"></asp:DropDownList>
        &nbsp;&nbsp;
        <asp:LinkButton ID="FetchAlbums" runat="server">Fetch</asp:LinkButton>
        <br />
        <asp:GridView ID="ProductList" runat="server" AutoGenerateColumns="False" AllowPaging="True"
            PageSize="10" CssClass="table table-striped" GridLines="Horizontal" BorderStyle="None" DataSourceID="ProductODS">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID"></asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"></asp:BoundField>
                <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount"></asp:BoundField>
                <asp:BoundField DataField="UnitSize" HeaderText="UnitSize" SortExpression="UnitSize"></asp:BoundField>
                <asp:CheckBoxField DataField="Taxable" HeaderText="Taxable" SortExpression="Taxable"></asp:CheckBoxField>
            </Columns>
        </asp:GridView>
    </div>

    <asp:ObjectDataSource ID="ProductODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Product_FindByCategory" 
        TypeName="GroceryListSystem.BLL.ProductController">
        <SelectParameters>
            <asp:ControlParameter ControlID="CategoryList" PropertyName="SelectedValue" DefaultValue="0" Name="categoryid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="CategoryListODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Category_List" 
        TypeName="GroceryListSystem.BLL.CategoryController">
    </asp:ObjectDataSource>
</asp:Content>