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

public partial class Form_YearMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
       
            txtYear.Focus();
            if (!Page.IsPostBack)
            
            {
               
                btnUpdated.Enabled = false;
                fillgrid();
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
            bool m = bl_obj.Record_Exist("where Year='" + txtYear.Text + "'", "YearMaster");
            if (m == true)
            {

                lblMsg.Text = "Record Already Exists";
            }
            else
            {

                DataSet ds = new DataSet();
                List<string> para = new List<string>();
                para.Add("1");
                para.Add(txtYear.Text);
                para.Add("a");
                ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_YearMaster");
                lblMsg.Text = "record inserted";
                fillgrid();
                clearall();

            }

        }
        catch (Exception ex)
        {

        }
        

    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtYear);
        bl_obj.TextboxNull(plist);
    }

    public void fillgrid()
    {
        DataSet ds = new DataSet();
        ds = bl_obj.FillGrid("sp_Fill_YearMaster");
        //datagrid.DataSource = ds;
        //datagrid.DataBind();
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
    protected void btnUpdated_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(TextBox1.Text);
            para.Add(txtYear.Text);
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_YearMaster");
            lblMsg.Text = "record updeted";
            fillgrid();
            btnUpdated.Enabled = false;
            btnAdd.Enabled = true;
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


    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox1.Text = datagrid.SelectedItem.Cells[2].Text.ToString();
            txtYear.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
            btnAdd.Enabled = false;
            btndelete.Enabled = false;
            btnUpdated.Enabled = true;
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
                    Label2.Visible = false;

                    List<string> para = new List<string>();
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                    para.Add(datagrid.Items[i].Cells[3].Text.ToString());
                    para.Add("d");
                    lblMsg.Text = "record deleted";
                    DataSet ds = bl_obj.FillGridWithParameter(para, "sp_YearMaster");
                    
                }
                if (select == 0)
                {
                    Label2.Visible = true;
                    Label2.Text = "Select the option";
                }

            }
            fillgrid();

        }
        catch (Exception ex)
        
        { 
        
        }
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        clearall();
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
}
