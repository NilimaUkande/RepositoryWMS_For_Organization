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

public partial class Form_LoksabhaMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {

                txtLoksabhacode.Focus();
                fillgrid();
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
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(txtLoksabhacode.Text);
            para.Add(txtLoksabhName.Text);
            para.Add(txtmembername.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(RadioButtonList1.SelectedValue.ToString());
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_Tbl_LoksabhaMaster");
            if (ds.Tables[0].Rows[0][0].ToString() != "")
            {
                lblMsg.Text = "record Already Exist";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

            }
            else
            {
                lblMsg.Text = "record inserted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
            }
            fillgrid();
            clearall();
            btnUpdated.Enabled = false;
        }
        catch (Exception ex)
        {

        }
    }
    public void fillgrid()
    {
        DataSet ds = new DataSet();
        ds = bl_obj.FillGrid("sp_Fill_Tbl_LoksabhaMaster");
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
    protected void btnUpdated_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(txtLoksabhacode.Text);
            para.Add(txtLoksabhName.Text);
            para.Add(txtmembername.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(RadioButtonList1.SelectedValue.ToString());
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_Tbl_LoksabhaMaster");
            if (ds.Tables[0].Rows[0][0].ToString() != "")
            {
                lblMsg.Text = "Record Already Exist";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

            }
            else
            {
                lblMsg.Text = "record updated";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
               
            }
            fillgrid();
            clearall();
            btnUpdated.Enabled = false;
            btnAdd.Enabled = true;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message.ToString();
        }
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            HiddenField1.Value = datagrid.SelectedItem.Cells[2].Text.ToString();
            txtLoksabhacode.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
            txtLoksabhName.Text = datagrid.SelectedItem.Cells[4].Text.ToString();
            txtmembername.Text = datagrid.SelectedItem.Cells[5].Text.ToString();
            RadioButtonList1.ClearSelection();
            RadioButtonList1.Items.FindByValue(datagrid.SelectedItem.Cells[7].Text.ToString()).Selected = true;
            btnUpdated.Enabled = true;
            btnAdd.Enabled = false;
            btndelete.Enabled = false;
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
                DataSet ds = new DataSet();
                if (cb.Checked)
                {
                    select=1;
                    List<string> para = new List<string>();
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                    lblMsg.Text = "record deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
            ds = bl_obj.FillGridWithParameter(para, "sp_Del_LoksabhaMaster");
                }
            }

            fillgrid();
                if (select == 0)
                {
                    lblMsg.Text = "Select record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }
          
        }
        catch (Exception ex)
        {

        }
        btnUpdated.Enabled = false;
        btnAdd.Enabled = true;
        btndelete.Enabled = true;
    }
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }  
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        clearall();
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
        plist.Add(txtLoksabhacode);
        plist.Add(txtmembername);
        bl_obj.Textboxstring(plist);
      
    }
}
