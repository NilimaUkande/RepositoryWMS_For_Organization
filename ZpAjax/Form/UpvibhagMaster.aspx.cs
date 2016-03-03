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

public partial class Form_UpvibhagMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
     {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");

        if (!IsPostBack)
        {
            
                ddlvibhag.Focus();
                clearall();
                ddlvibhag.Focus();
                fillddl();
                filltaluka();
                Button2.Enabled = false;
            }
        }
            catch (Exception ex)
            { }
    Button3.Enabled = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(ddlvibhag.SelectedValue.ToString());
            para.Add(txtupvibhag.Text);
            para.Add(DDLtaluka.SelectedValue.ToString());
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_Subdeptmaster");
            if (ds.Tables.Count != 0)
            {
                Label5.Text = "Record Already exist";
            }
            else
            {
               // Label5.Text = "Record Inserted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
                Session["grid"] = ddlvibhag.SelectedValue.ToString();
            }
            Button2.Enabled = false;
            fillGrid();
        }
        catch (Exception ex)
        {

        }
        clearall();
        Button3.Enabled = true;
    }
    protected void fillddl()
    {
        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        plist.Add(Session["officeid"].ToString());
        ds = bl_obj.FillGridWithParameter(plist, "sp_FillDepartment_ID");
        ddlvibhag.DataValueField = "deptid";
        ddlvibhag.DataTextField = "deptname";
        ddlvibhag.DataSource = ds.Tables[0];
        ddlvibhag.DataBind();
        ddlvibhag.Items.Insert(0, new ListItem("----select----", ""));
    }
    protected void filltaluka()
    { 
       DataSet ds2=new DataSet();
        List<string> plist = new List<string>();
        plist.Add(Session["District_id"].ToString());
        ds2 = bl_obj.FillGridWithParameter(plist, "sp_Filltaluka");
        DDLtaluka.DataValueField = "TalukaId";
        DDLtaluka.DataTextField = "TalukaName";
        DDLtaluka.DataSource = ds2.Tables[0];
        DDLtaluka.DataBind();
        DDLtaluka.Items.Insert(0, new ListItem("----select----", ""));
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(ddlvibhag.SelectedValue.ToString());
            para.Add(txtupvibhag.Text);
            para.Add(DDLtaluka.SelectedValue.ToString());
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_Subdeptmaster");
            if (ds.Tables.Count != 0)
            {
                Label5.Text = "Record Already exist";
            }
            else
            {
           // Label5.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
            }
            fillGrid();
            clearall();  
        }
        catch (Exception ex)
        {

        }
        Button3.Enabled = true;
    }
    protected void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    protected void fillGrid()
    {
        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        if (ddlvibhag.SelectedValue.ToString() == "")
        {
        }
        else
        {
            plist.Add(Session["grid_dept"].ToString());
            ds = bl_obj.FillGridWithParameter(plist, "sp_fillsubdeptmasterGrid");
            if (ds.Tables.Count != 0)
            {
                Cache.Insert("SubDept", ds);
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
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlvibhag.ClearSelection();
        DDLtaluka.ClearSelection();
        HiddenField1.Value = GridView1.SelectedItem.Cells[2].Text.ToString();
        ddlvibhag.Items.FindByText(GridView1.SelectedItem.Cells[4].Text.ToString()).Selected=true;
        txtupvibhag.Text = GridView1.SelectedItem.Cells[5].Text.ToString();
        DDLtaluka.Items.FindByText(GridView1.SelectedItem.Cells[6].Text.ToString()).Selected=true;        
        Button2.Enabled = true;
        Button1.Enabled = false;
        Button3.Enabled = false;
        ddlvibhag.Enabled = false;
    }
    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        Session["grid_dept"] = ddlvibhag.SelectedValue.ToString();
        DataSet ds = (DataSet)Cache.Get("SubDept");
        Cache.Insert("SubDept", ds);
        GridView1.DataSource = ds;
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
        Button3.Enabled = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    { int select = 0;
        try
        {
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
                DataSet ds = new DataSet();
                if (cb.Checked)
                {
                    select = 1;
                    List<string> para = new List<string>();
                    para.Add(GridView1.Items[i].Cells[2].Text.ToString());                  
                    bl_obj.FillGridWithParameter(para, "dlete_subdeptmaster");
                   
                }
            }
            fillGrid();
            if (select == 0)
                {
                   // Label5.Text = "Select Record To Delete";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                    Label5.Visible = true;
                }
        else{
           // Label5.Text = "record deleted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
        }
           
            
        }
        catch (Exception ex)
        {

        }
        Button3.Enabled = true;
        Button2.Enabled = false;
        Button1.Enabled = true;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        

        clearall();
        Button1.Enabled = true;
    }
    protected void ddlvibhag_SelectedIndexChanged1(object sender, EventArgs e)
    {
        UpvibhagInfo.Attributes.Add("style","visibility:visible");
       
        Session["grid_dept"] = ddlvibhag.SelectedValue.ToString();
        fillGrid();
        Button3.Enabled = true;
    }
    protected void Button4_Click1(object sender, EventArgs e)
    {
        ddlvibhag.ClearSelection();
        clearall();     
    }
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Dept Master.aspx");
    }
}

