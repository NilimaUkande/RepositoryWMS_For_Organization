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
public partial class Form_HeadMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    { try
        {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");

     if(!Page.IsPostBack)
     {
       
            
            txtHeadDescription.Focus();
            fillgrid();
            btnUpdated.Enabled = false;   
            clearall();
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
            para.Add("1");
            para.Add(txtHeadDescription.Text);
            para.Add(txtComputerId.Text);
            para.Add(txtGovernmentID.Text);
            para.Add(Session["officeid"].ToString());
            para.Add("a");           
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_HeadMaster");
           // lblMsg.Text = "Record Inserted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
            fillgrid();
            clearall();
        }
        catch (Exception ex)
        {         
        }
    }
    public void fillgrid()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = bl_obj.FillGrid("sp_Fill_HeadMaster");
            Cache.Insert("Head_mstr", ds);
            datagrid.DataSource = ds;
            datagrid.DataBind();
            HiddenField1.Value = ds.Tables[0].Rows[0][0].ToString();
        }
        catch (Exception ex)
        {         
        }    
    }
    protected void btnUpdated_Click(object sender, EventArgs e)
    {
        try       
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value);
            para.Add(txtHeadDescription.Text);
            para.Add(txtComputerId.Text);
            para.Add(txtGovernmentID.Text);
            para.Add(Session["officeid"].ToString());
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_HeadMaster");
            //lblMsg.Text = "record updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
               
            fillgrid();
            clearall();
        }
        catch (Exception ex)       
        {         
        }
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try       
        {
            btnUpdated.Enabled = true;
            btnAdd.Enabled = false;
            btndelete.Enabled = false;
            HiddenField1.Value = datagrid.SelectedItem.Cells[2].Text.ToString();
            txtHeadDescription.Text=datagrid.SelectedItem.Cells[3].Text.ToString();
            txtComputerId.Text=datagrid.SelectedItem.Cells[4].Text.ToString();
            txtGovernmentID.Text=datagrid.SelectedItem.Cells[5].Text.ToString();
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
                    List<string> para = new List<string>();
                    DataSet ds = new DataSet();
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                    para.Add(datagrid.Items[i].Cells[3].Text.ToString());
                    para.Add(datagrid.Items[i].Cells[4].Text.ToString());
                    para.Add(datagrid.Items[i].Cells[5].Text.ToString());
                    para.Add(datagrid.Items[i].Cells[6].Text.ToString());
                    para.Add("d");
                   // lblMsg.Text = "record deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
            
                    ds = bl_obj.FillGridWithParameter(para, "sp_HeadMaster");
                }
            }
            fillgrid();
                if(select==0)
                {
                  //  lblMsg.Text = "Please select record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }
   

            
            clearall();
        }
        catch (Exception ex)       
        {
        }
    }    
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("Head_mstr");
        fillgrid(ds);
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();

    }
    private void fillgrid(DataSet ds)
    {
        Cache.Insert("Head_mstr", ds);
        datagrid.DataSource = ds;
        datagrid.DataBind();
        // flag = 0;
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        clearall();
        btnAdd.Enabled = true;
        btnUpdated.Enabled = false;
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtHeadDescription);
        plist.Add(txtComputerId);
        plist.Add(txtGovernmentID);
        bl_obj.Textboxstring(plist);       
    }
}
