using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region AdditionalNamespaces
using GroceryList.Data.Entities;
using System.ComponentModel;
using GroceryListSystem.DAL;
#endregion

namespace GroceryListSystem.BLL
{
    [DataObject]
    public class ProductController
    {
        #region Queries

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Product> Product_List()
        {
            using (var context = new GroceryListContext())
            {
                return context.Products.ToList();
            }
        }

        public Product Product_Get(int productid)
        {
            using (var context = new GroceryListContext())
            {
                return context.Products.Find(productid);
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Product> Product_FindByCategory(int categoryid)
        {
            using (var context = new GroceryListContext())
            {
                var results = from x in context.Products
                              where x.CategoryID == categoryid
                              select x;

                return results.ToList();
            }
        }

        #endregion

        #region Add, Update, Delete, Delete

        [DataObjectMethod(DataObjectMethodType.Insert, false)]

        public int Product_Add(Product item)
        {
            using (var context = new GroceryListContext())
            {
                context.Products.Add(item);

                context.SaveChanges();

                return item.ProductID;
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]

        public int Product_Update(Product item)
        {
            using (var context = new GroceryListContext())
            {
                context.Entry(item).State = System.Data.Entity.EntityState.Modified;

                return context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Delete, false)]

        public int Product_Delete(Product item)
        {
            return Product_Delete(item.ProductID);
        }

        public int Product_Delete(int productid)
        {
            using (var context = new GroceryListContext())
            {
                var existing = context.Products.Find(productid);

                if(existing == null)
                {
                    throw new Exception("Product not found, Delete not needed");
                }
                else
                {
                    context.Products.Remove(existing);

                    return context.SaveChanges();
                }
            }
        }

        #endregion
    }
}
