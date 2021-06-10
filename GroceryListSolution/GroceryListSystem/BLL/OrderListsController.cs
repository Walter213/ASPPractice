using GroceryList.Data.Entities;
using GroceryList.Data.POCOs;
using GroceryListSystem.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GroceryListSystem.BLL
{
    [DataObject]
    public class OrderListsController
    {
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<PickerList> OrderLists_OrderPickList(int orderid)
        {
            using (var context = new GroceryListContext())
            {
                var results = from x in context.OrderLists
                              where orderid == x.Order.OrderID &&
                              x.Order.PickedDate == null
                              select new PickerList
                              {
                                  OrderListID = x.OrderListID,
                                  ProductName = x.Product.Description,
                                  Quantity = x.QtyOrdered,
                                  Comment = x.CustomerComment,
                                  PickedQuantity = x.QtyPicked,
                                  PickIssue = x.PickIssue
                              };
                return results.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void OrderLists_Picking(int pickerid, int ordered, List<PickerList> picklist)
        {
            double taxableSubTotal = 0;
            double subtotal = 0;

            using (var context = new GroceryListContext())
            {
                var ordergoingthrough = context.Orders.Find(ordered);
                ordergoingthrough.PickedDate = DateTime.Now;
                ordergoingthrough.PickerID = pickerid;

                foreach (var pick in picklist)
                {
                    var OrderListItem = context.OrderLists.Find(pick.OrderListID);
                    OrderListItem.QtyPicked = pick.PickedQuantity;
                    OrderListItem.PickIssue = pick.PickIssue;


                    if (OrderListItem.Product.Taxable == true)
                    {
                        taxableSubTotal += OrderListItem.QtyPicked * ((double)OrderListItem.Price - (double)OrderListItem.Discount);
                    }
                    else
                    {
                        subtotal += OrderListItem.QtyPicked * ((double)OrderListItem.Price - (double)OrderListItem.Discount);
                    }
                }

                ordergoingthrough.SubTotal = Math.Round((decimal)subtotal + (decimal)taxableSubTotal,2);
                ordergoingthrough.GST = Math.Round((decimal)taxableSubTotal * (decimal)0.05,2);

                context.Entry(ordergoingthrough).State = EntityState.Modified;
                context.SaveChanges();
            }
        }
    }
}
