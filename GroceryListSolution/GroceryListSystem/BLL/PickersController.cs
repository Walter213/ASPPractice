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
    public class PickersController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Picker> Picker_List()
        {
            using (var context = new GroceryListContext())
            {
                var results = from x in context.Pickers
                              select x;
                return results.ToList();
            }
        }
    }
}
