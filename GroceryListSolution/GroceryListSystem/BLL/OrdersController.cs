using GroceryList.Data.Entities;
using GroceryListSystem.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GroceryListSystem.BLL
{
    [DataObject]
    public class OrdersController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Order> Orders_UnDelieveredList()
        {
            using (var context = new GroceryListContext())
            {
                var results = from x in context.Orders
                              where x.PickedDate == null
                              select x;
                return results.ToList();
            }
        }
    }
}
