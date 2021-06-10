using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GroceryList.Data.POCOs
{
    public class PickerList
    {
        public int OrderListID { get; set; }
        public string ProductName { get; set; }

        public double Quantity { get; set; }

        public string Comment { get; set; }

        public double PickedQuantity { get; set; }

        public string PickIssue { get; set; }
    }
}
