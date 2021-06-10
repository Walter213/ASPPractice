using DMIT2018Common.UserControls;
using GroceryList.Data.Entities;
using GroceryList.Data.POCOs;
using GroceryListSystem.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.ExercisePages
{
    public partial class OLTPLastExercise : System.Web.UI.Page
    {
        List<string> errors = new List<String>();
        int errorscount = 0;
        //int errorcount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OrderFetch_Click(object sender, EventArgs e)
        {
            if (OrderDDL.SelectedValue == null)
            {
                messageUserControl.ShowInfo("Select A Order from the dropdownlist");
            }
            else
            {
                messageUserControl.TryRun(() =>
                {
                    ListPanel.Visible = true;

                    CustomerController sysmgr = new CustomerController();
                    var info = sysmgr.Customer_Get(int.Parse(OrderDDL.SelectedValue));

                    Customer.Text = "Customer Name: " + info.FullName;
                    Contact.Text = "Contact: " + info.Phone;

                    //OrderListsController orderlists = new OrderListsController();
                    //PickerGridView.DataSource = orderlists.OrderLists_OrderPickList(int.Parse(OrderDDL.SelectedValue));
                    //PickerGridView.DataBind();
                }, "List Search", "Selected Order, here is a list");
            }
        }

        protected void SavePicker_Click(object sender, EventArgs e)
        {
            var Picker = new List<PickerList>();
            var pickerDDL = int.Parse(PickerDDL.SelectedValue);
            var OrderID = int.Parse(OrderDDL.SelectedValue);

            if (OrderID == 0 && pickerDDL == 0)
            {
                messageUserControl.ShowInfo("Must Choose a Order From the Drop Down List And A Picker");
            }
            else
            {
                foreach (GridViewRow row in PickerGridView.Rows)
                {
                    var picker = new PickerList();

                    var OrderListId = row.FindControl("OrderListID") as Label;
                    var QtyOrdered = row.FindControl("Quantity") as Label;
                    var QtyPicked = row.FindControl("QtyPicked") as TextBox;
                    var PickIssue = row.FindControl("PickIssue") as TextBox;

                    picker.OrderListID = int.Parse(OrderListId.Text);
                    picker.PickedQuantity = double.Parse(QtyPicked.Text);
                    picker.Quantity = double.Parse(QtyOrdered.Text);
                    picker.PickIssue = PickIssue.Text;
                     
                    // This is not required for this code
                    //if (picker.PickedQuantity > picker.Quantity)
                    //{
                    //    if (errorscount < 1)
                    //    {
                    //        errors.Add("You Picked More Items Than What Was Ordered " + picker.Quantity + " Exceeds " + picker.PickedQuantity);
                    //        errorscount++;
                    //    }
                    //}

                    // We need to do something like this as well
                    //if (picker.PickedQuantity > picker.Quantity || picker.Quantity > picker.PickedQuantity && picker.PickIssue == "")
                    //{
                        
                    //}

                    if (picker.PickedQuantity == 0 && picker.PickIssue == "")
                    {
                        if (errorscount < 1)
                        {
                            errors.Add("If Quantity Picked is 0 you must provide a pick issue");
                            errorscount++;
                        }
                    }

                    Picker.Add(picker);
                }

                if (errorscount == 0)
                {
                    messageUserControl.TryRun(() =>
                    {
                        var orderlistcontrol = new OrderListsController();
                        orderlistcontrol.OrderLists_Picking(pickerDDL, OrderID, Picker);

                        ListPanel.Visible = false;

                        Customer.Text = "";
                        Contact.Text = "";

                        OrderDDL.DataBind();
                        PickerDDL.DataBind();
                    }, "Order has been saved", "Picking Complete");
                }
                else
                {
                    messageUserControl.TryRun(() =>
                    {
                        throw new BusinessRuleException("Input Data Errors", errors);
                    });
                }
            }
        }
    }
}