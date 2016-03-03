using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BussinessLayer;

public partial class Form_GramPanchayatNivida : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        
            if (!IsPostBack)
            {
                TextBox1.Focus();
                clearall();
            }
        }
        catch (Exception ex)
        { }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds =new DataSet();
            List<string> para =new List<string>();
            para.Add("1");
            para.Add(TextBox1.Text);
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add("1");
            para.Add("1");
            para.Add("a");
            ds = bl.FillGridWithParameter(para, "sp_grampanchayatnivida");
            if (ds.Tables.Count != 0)
            {
                Label5.Text = "Record Already Exist";
            }
            else
            {
                Label5.Text = "Record Inserted";
            }
            Button1.Enabled = true;
            Button2.Enabled = false;
            clearall();

        }
        catch (Exception ex)
        {

        }
    }
    public void clearall()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";    
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(TextBox1.Text);
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add("1");
            para.Add("1");
            para.Add("u");
            ds = bl.FillGridWithParameter(para, "sp_grampanchayatnivida");
            if (ds.Tables.Count != 0)
            {
                Label5.Text = "Record Already Exist";
            }
            else
            {
                Label5.Text = "Record Updated";
            }
            Button1.Enabled = false;
            Button2.Enabled = true;
            clearall();

        }
        catch (Exception ex)
        {

        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        clearall();
        Button1.Enabled = true;
        Button2.Enabled = false;
    }
}
