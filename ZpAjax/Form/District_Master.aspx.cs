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

public partial class Form_District_Master : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_Obj = new BussinessLayer.BusinessLayerclass();
         protected void Page_Load(object sender, EventArgs e)
      {
             try
            {
          if (Session["Group_Id"] == null)
              Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {
            
               
                if (Convert.ToString(Session["username"]) == "")
                {
                    Response.Redirect("Index.aspx");

                }
                txtDistrictName.Focus();
                FillGrid();

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
          
            List<string> Para = new List<string>();
            Para.Add("1");
            Para.Add(txtDistrictName.Text.Trim());
            Para.Add("a");
            ds = bl_Obj.ExecuteStoredFunctionWithParameters(Para,"sp_DistrictMaster");
            if (ds.Tables.Count != 0)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Label2.Visible = true;
                    Label2.Text = "Record Already Exists";
                }

                else
                {

                    Label2.Visible = true;
                    Label2.Text = "Record Inserted";
                }
            }
                        
        }
        catch (Exception ex)
        {
           
            
            ex.GetBaseException();
        }
         FillGrid();
         clearall();
         Label2.Visible = true;  
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtDistrictName);
        bl_Obj.TextboxNull(plist);
    }
    
    public void FillGrid()
    {
        DataSet ds = bl_Obj.FillGrid("sp_DistrictMaster_fill");
     
        TextBox1.Text = ds.Tables[0].Rows[0][0].ToString();
        int id = (ds.Tables[0].Rows.Count) % 10;
        if (id == 0)
        {
            if (datagrid.CurrentPageIndex > 0)
            {

                datagrid.DataSource = ds;
                datagrid.CurrentPageIndex--;
                datagrid.DataBind();

            }
            else
            {
                datagrid.DataSource = ds;
                datagrid.DataBind();
            }
        }
        else
        {
            datagrid.DataSource = ds;
            datagrid.DataBind();
        }
    }
  protected void btndelete_Click1(object sender, EventArgs e)
    {

        try
        {
            CheckBox cb;
            DataSet ds = new DataSet();
            int select = 0;
            for (int i = 0; i < datagrid.Items.Count; i++)
            {
                List<string> para = new List<string>();
                cb = (CheckBox)datagrid.Items[i].FindControl("CheckBox2");
                if (cb.Checked)
                {                
                    Label2.Visible = true;
                    select = 1;
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                    para.Add(datagrid.Items[i].Cells[3].Text.ToString());
                    para.Add("d");
                    ds = bl_Obj.FillGridWithParameter(para, "sp_DistrictMaster");
                    Label2.Text = "Record Deleted";
                }               
            }
            if (select == 0)
            {
                Label2.Visible = true;
                Label2.Text = "Please Select Record to Delete";
            }
            FillGrid();
        }
        catch (Exception ex)
        {
            
        }
    }
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);    

     }
   protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(TextBox1.Text);
            para.Add(txtDistrictName.Text);
            para.Add("u");
            ds = bl_Obj.ExecuteStoredFunctionWithParameters(para, "sp_DistrictMaster");
            FillGrid();
            clearall();           
            Label2.Visible = true;
            Label2.Text = "Record Updated";
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
            txtDistrictName.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
            btnAdd.Enabled = false;
            btnUpdate.Enabled = true;
            btndelete.Enabled = false;
        }
        catch (Exception)
        { 
   
        }
    }

    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        FillGrid();
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();

    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        btnAdd.Enabled = true;
        btnUpdate.Enabled = false;
        btndelete.Enabled = true;
        txtDistrictName.Text = "";
    }
}




