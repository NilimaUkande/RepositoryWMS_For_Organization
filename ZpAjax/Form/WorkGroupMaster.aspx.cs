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


public partial class Form_WorkGroupMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!IsPostBack)
        {
            
                TextBox1.Focus();
                fillgrid();
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

            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(TextBox1.Text);
            para.Add("a");
            ds = bl.ExecuteStoredFunctionWithParameters(para, "sp_WorkGroupMaster");
            if (ds.Tables.Count != 0)
            {
               // Label3.Text = "Record Already Exist";
            }
            else
            {
               // Label3.Text = "Record Inserted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
            }

            fillgrid();
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
    public void fillgrid()
    {
        DataSet ds = new DataSet();
        //List<string> param = new List<string>();
        //param.Add("1");
        ds = bl.FillGrid("sp_fillgroupmaster");
        // TextBox1.Text = ds.Tables[0].Rows[0][0].ToString();
        Cache.Insert("wrk_gr_mstr", ds);
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        List<string> para1 = new List<string>();
        para1.Add(HiddenField1.Value.ToString());
        para1.Add(TextBox1.Text);
        para1.Add("u");
        ds1 = bl.ExecuteStoredFunctionWithParameters(para1, "sp_WorkGroupMaster");
        if (ds1.Tables.Count != 0)
        {
          //  Label3.Text = "Record Already Exist";
        }
        else
        {
           // Label3.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
        }

        clearall();
        fillgrid();
        Button2.Enabled = true;
        Button1.Enabled = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        clearall();
        Button1.Enabled = true;
        Button2.Enabled = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
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
                    para.Add(datagrid.Items[i].Cells[3].Text.ToString());
                    para.Add("d");
                 
                    DataSet ds = bl.FillGridWithParameter(para, "sp_WorkGroupMaster");
                   

                }
            }
              fillgrid();
               if(select==0)
                {
                    Label3.Visible = true;
                // Label3.Text = "Select Record to Delete";
                 ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                }
            else
               {
                     // Label3.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);

               }


            
            clearall();
          

        }
        catch (Exception ex)
        {

        }
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenField1.Value = datagrid.SelectedItem.Cells[2].Text.ToString();
        TextBox1.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
        Button2.Enabled = true;
        Button1.Enabled = false;
        Button4.Enabled = false;
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("wrk_gr_mstr");
        Cache.Insert("wrk_gr_mstr", ds);
        datagrid.DataSource = ds;
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();

    }
}
