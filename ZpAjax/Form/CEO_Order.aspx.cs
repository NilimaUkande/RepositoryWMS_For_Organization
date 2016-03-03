using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using BussinessLayer;
public partial class Form_CEO_Order : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

            }
        }
        catch (Exception ex)
        { }
    }
    protected void Button1_Click(object sender, EventArgs e)
    { 
        List<string> list = new List<string>();
        list.Add("1");
        list.Add(TextBox1.Text);
        list.Add(TextBox2.Text);
        list.Add(TextBox3.Text);
        bl.FillGridWithParameter(list, "sp_CEOOrder");
        Label5.Text = "Record Inserted";
    }
}
