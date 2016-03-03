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

public partial class Form_AddAbhiyanta : System.Web.UI.Page
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
                DropDownList1.Focus();
                fillddl();
                fillgrid();
                clearall();
                Button2.Enabled = false;
            }
        }
        catch (Exception ex)
        { }
    }
    protected void fillddl()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["officeid"].ToString());
        ds = bl.FillGridWithParameter(list, "sp_filladdAbhiyanta");
        DropDownList1.DataValueField = "engid";
        DropDownList1.DataTextField = "engname";
        DropDownList1.DataSource = ds.Tables[0];
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, new ListItem("----select----", ""));
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
       
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(Session["Work_ID"].ToString());//work id

            para.Add(DropDownList1.SelectedValue.ToString());
            para.Add(bl.convertDate(TextBox1.Text));
            para.Add("a");
            bl.FillGridWithParameter(para, "sp_addAbhiyanta");
            Label4.Text = "Record Inserted";
            clearall();
            fillgrid();
            Button2.Enabled = false;
        }
        catch (Exception ex)
        { 
        
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(Session["Work_ID"].ToString());//work id

            para.Add(DropDownList1.SelectedValue.ToString());
            para.Add(bl.convertDate(TextBox1.Text));
            para.Add("u");
            bl.FillGridWithParameter(para, "sp_addAbhiyanta");    
            Label4.Text = "Record Updated";          
            
            fillgrid();
            clearall();
            Button2.Enabled = false;
            Button1.Enabled = true;
        }
        catch (Exception ex)
        {
        
        }
    }
    protected void fillgrid()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());
            ds = bl.FillGridWithParameter(para, "sp_fillgridAddeng");
            int id = (ds.Tables[0].Rows.Count) % 10;
            if (id == 0)
            {
                if (GridView1.CurrentPageIndex > 0)
                {

                    GridView1.DataSource = ds;
                    GridView1.CurrentPageIndex--;
                    GridView1.DataBind();

                }
                else
                {

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
            else
            {

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
        catch(Exception ex)
        { 
        
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        DropDownList1.Focus();
        clearall();
        Button1.Enabled = true;
        Button2.Enabled = false;
        Button4.Enabled = true;
    }
    protected void clearall()
    {
        DropDownList1.ClearSelection();
        TextBox1.Text = "";
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
                DataSet ds = new DataSet();
                if (cb.Checked)
                {

                    List<string> para = new List<string>();
                    para.Add(GridView1.Items[i].Cells[2].Text.ToString());
                    para.Add("1");
                    para.Add("1");
                    para.Add(GridView1.Items[i].Cells[5].Text.ToString());
                    para.Add("d");
                    ds = bl.FillGridWithParameter(para, "sp_addAbhiyanta");
                    Label4.Text = "Record Deleted";
                    Label4.Visible = true;
                }
            }
            fillgrid();

        }


        catch (Exception ex)
        {

        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenField1.Value = GridView1.SelectedItem.Cells[2].Text.ToString();        
        DropDownList1.ClearSelection();
        DropDownList1.Items.FindByValue(GridView1.SelectedItem.Cells[3].Text.ToString()).Selected = true;
        TextBox1.Text = GridView1.SelectedItem.Cells[5].Text.ToString();
        Button2.Enabled = true;
        Button1.Enabled = false;
    }
    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/AbhiyantaMaster.aspx");
    }
}
