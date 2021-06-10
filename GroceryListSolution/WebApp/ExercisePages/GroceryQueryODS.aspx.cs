using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region AdditionalNameSpaces
using GroceryListSystem.BLL;
using GroceryList.Data.Entities;
#endregion

namespace WebApp.ExercisePages
{
    public partial class GroceryQueryODS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCategoryList();
        }

        protected void BindCategoryList()
        {
            CategoryController sysmgr = new CategoryController();

            List<Category> info = sysmgr.Category_List();

            info.Sort((x, y) => x.Description.CompareTo(y.Description));

            //CategoryList.DataSource = info;
            //CategoryList.DataTextField = nameof(Category.Description);
            //CategoryList.DataValueField = nameof(Category.CategoryID);

            //CategoryList.DataBind();
        }
    }
}