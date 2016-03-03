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


public partial class Form_UnitMaster : System.Web.UI.Page
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

                txtUnit.Focus();
                //fillddlwork();
                fillgrid();
                clearall();
            }
        }
        catch (Exception ex)

        { }

    }



    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenField1.Value = datagrid.SelectedItem.Cells[2].Text.ToString();
        txtUnit.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
        btnAdd.Enabled = false;
        btnUpdate.Enabled = true;
        btnDelete.Enabled = false;
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("Unit");
        Cache.Insert("Unit", ds);
        datagrid.DataSource = ds;
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
    public void fillgrid()
    {
        DataSet ds = new DataSet();
        ds = bl.FillGrid("sp_fillUnitMaster");
        Cache.Insert("Unit", ds);
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


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(txtUnit.Text);
            // para.Add(DropDownList1.SelectedItem.ToString());
            para.Add("a");
            ds = bl.ExecuteStoredFunctionWithParameters(para, "sp_UnitMaster");
            if (ds.Tables.Count != 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkRecord();", true);
               // Label4.Text = "Record Already Exist";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               // Label4.Text = "Record Inserted";
            }
            clearall();
            fillgrid();
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        List<string> para1 = new List<string>();
        para1.Add(HiddenField1.Value.ToString());
        para1.Add(txtUnit.Text);
        //para1.Add(DropDownList1.SelectedItem.ToString());
        para1.Add("u");
        ds1 = bl.ExecuteStoredFunctionWithParameters(para1, "sp_UnitMaster");
        if (ds1.Tables.Count != 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkRecord();", true);
           // Label4.Text = "Record Already Exist";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
           // Label4.Text = "Record Updated";
        }

        clearall();
        fillgrid();
        btnUpdate.Enabled = true;
        btnAdd.Enabled = false;
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        clearall();
        btnAdd.Enabled = true;
        btnUpdate.Enabled = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            for (int i = 0; i < datagrid.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)datagrid.Items[i].FindControl("CheckBox1");
                if (cb.Checked)
                {
                    select = 1;

                    List<string> para = new List<string>();
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                   // Label4.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
                    DataSet ds = bl.FillGridWithParameter(para, "sp_del_Unit");

                }
                if (select == 0)
                {
                    Label4.Visible = true;
                  //  Label4.Text = "Select Record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                }

            }
            clearall();
            fillgrid();

        }
        catch (Exception ex)
        {

        }
    }
}
