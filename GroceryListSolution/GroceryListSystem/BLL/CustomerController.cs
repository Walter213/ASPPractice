using GroceryList.Data.Entities;
using GroceryList.Data.POCOs;
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
    public class CustomerController
    {
        public Customer Customer_Get(int customerid)
        {
            using (var context = new GroceryListContext())
            {
                var info = context.Orders.Find(customerid);

                return info.Customer;
            }
        }
    }
}
