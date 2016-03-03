using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BussinessLayer;


public partial class Form_Village_Master : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {           
                ddlTaluka.Focus();  
                FillTaluka();
                fillGrid();                
                btnUpdated.Enabled = false;
            }
        }
            catch (Exception ex)
            {
                
            }
        
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            if (ddlAdiwasi.SelectedValue!="select")
            {
            para.Add("1");
            para.Add(txtvillage.Text);
            para.Add(ddlTaluka.SelectedValue);
            para.Add(txtLoksankhya.Text);
            para.Add(ddlAdiwasi.SelectedItem.Text);
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_GavMaster");                  
            lblMsg.Text = "record inserted";
            fillGrid();
            cearlall();
            }
            else
            {
            lblMsg.Text = "please select option";
            }
        }
        catch (Exception ex)
        {

        }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtLoksankhya);
        bl_obj.TextboxNull(plist);
    }
    public void FillTaluka()
    {
        DataSet ds = new DataSet();       
        List<string> para = new List<string>();
        ds = bl_obj.FillGridWithParameter(para, "sp_Taluka_fill_gav");
        ddlTaluka.Items.Clear();
        ddlTaluka.Items.Insert(0, (new ListItem("---Select---", "")));        
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {            
            ddlTaluka.Items.Add(new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
        }
    }  
    protected void btnUpdated_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            if (ddlAdiwasi.SelectedValue != "select")
            {
                para.Add(TextBox1.Text);
                para.Add(txtvillage.Text);
                para.Add(ddlTaluka.SelectedValue.ToString());
                para.Add(txtLoksankhya.Text);
                para.Add(ddlAdiwasi.SelectedItem.Text);
                para.Add("u");
                ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_GavMaster");
                lblMsg.Text = " Record Updated";
                fillGrid();
                cearlall();
            }
            else
            {
                lblMsg.Text = "please select option";
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox1.Text = datagrid.SelectedItem.Cells[2].Text.ToString();
            txtvillage.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
            ddlTaluka.Text = datagrid.SelectedItem.Cells[4].Text.ToString();
            txtLoksankhya.Text = datagrid.SelectedItem.Cells[6].Text.ToString();
            
            ddlAdiwasi.SelectedItem.Text = datagrid.SelectedItem.Cells[7].Text.ToString();
            btnAdd.Enabled = false;
            btndelete.Enabled = false;
            btnUpdated.Enabled = true;
        }
        catch (Exception ex)
        {
        }
    }
    public void fillGrid()
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(ddlTaluka.SelectedItem.Value);
            DataSet ds = bl_obj.FillGridWithParameter(para, "sp_GavMaster_fill");
            Cache.Insert("vill_mstr", ds);
            datagrid.DataSource = ds;
            datagrid.DataBind();
            TextBox1.Text = ds.Tables[0].Rows[0][0].ToString();           
        }
        catch (Exception ex)
        {
        }
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            for (int i = 0; i < datagrid.Items.Count; i++)              
            {
                CheckBox cb = (CheckBox)datagrid.Items[i].FindControl("CheckBox2");                
                    if (cb.Checked)
                    {
                        select = 1;
                        Label3.Visible = false;
                        List<string> para = new List<string>();
                        para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                        para.Add(datagrid.Items[i].Cells[3].Text.ToString());
                        para.Add(datagrid.Items[i].Cells[4].Text.ToString());
                        para.Add(datagrid.Items[i].Cells[6].Text.ToString());
                        para.Add(datagrid.Items[i].Cells[7].Text.ToString());
                        para.Add("d");
                        lblMsg.Text = "record deleted";
                        DataSet ds = bl_obj.FillGridWithParameter(para, "sp_GavMaster");
                    }
                    if (select == 0)
                    {
                        Label3.Visible = true;
                        Label3.Text = "Please select Checkbox";
                    }
                  }
            fillGrid();                       
        }
        catch (Exception ex)
        { 
        
        }
    }
    public void cearlall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);    
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("vill_mstr");
        Cache.Insert("vill_mstr", ds);
        datagrid.DataSource = ds;
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
    protected void ddlTaluka_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillGrid();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Taluka Master.aspx");
    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {

    }
}
