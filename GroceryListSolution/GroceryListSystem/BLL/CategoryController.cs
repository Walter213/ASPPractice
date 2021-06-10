using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region AdditionalNameSpaces
using GroceryList.Data.Entities;
using System.ComponentModel;
using GroceryListSystem.DAL;
#endregion

namespace GroceryListSystem.BLL
{
    [DataObject]
    public class CategoryController
    {

        #region Queries

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Category> Category_List()
        {
            using (var context = new GroceryListContext())
            {
                return context.Categories.ToList();
            }
        }

        public Category Category_Get(int categoryid)
        {
            using (var context = new GroceryListContext())
            {
                return context.Categories.Find(categoryid);
            }
        }

        #endregion
    }
}
