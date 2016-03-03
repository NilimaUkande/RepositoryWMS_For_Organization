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
public partial class Form_NewsPaperMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!IsPostBack)
        {
            
                ddl_ntype.Focus();
                fillddl_type();
                fillddl_star();
                fillgrid();
                clearall();
            }
        }
            catch (Exception ex)
            { 
            }
               
    }
    protected void fillddl_type()
    {
        DataSet ds = new DataSet();
        ds = bl_obj.FillGrid("sp_fill_newstype");
        ddl_ntype.DataTextField ="ntype_name";
        ddl_ntype.DataValueField = "ntype_id";
        ddl_ntype.DataSource = ds;
        ddl_ntype.DataBind();
        ddl_ntype.Items.Insert(0,new ListItem("---select---","0"));
    }
    protected void fillddl_star()
    {
        DataSet ds = new DataSet();
        ds = bl_obj.FillGrid("sp_fillddl_newsstar");
        ddl_star.DataTextField = "nstar_name";
        ddl_star.DataValueField = "nstar_id";
        ddl_star.DataSource = ds;
        ddl_star.DataBind();
        ddl_star.Items.Insert(0, new ListItem("---Select---", "0"));    
    }
    protected void fillgrid()
    {
        DataSet ds = new DataSet();
        ds = bl_obj.FillGrid("sp_fillgrid_newspaper");
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
    protected void clearall()
    {
       ddl_ntype.ClearSelection();
           ddl_star.ClearSelection();
           txt_news.Text = "";
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);    
    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(ddl_ntype.SelectedValue.ToString());
            para.Add(ddl_star.SelectedValue.ToString());
            para.Add(txt_news.Text);
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_NewsPaper");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
            //Label5.Text = "Inserted Successfully";
            fillgrid();
            clearall();
        }
        catch (Exception ex)
        { }
    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(ddl_ntype.SelectedValue.ToString());
            para.Add(ddl_star.SelectedValue.ToString());
            para.Add(txt_news.Text);
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_NewsPaper");
            fillgrid();
            clearall();
            btn_add.Enabled = true;
            btn_Update.Enabled = false;
            btn_Delete.Enabled = true;
            Label5.Text = "Updated Successfully";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
           // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
        }
        catch (Exception ex)
        { }
    }
    protected void btn_Reset_Click(object sender, EventArgs e)
    {
        btn_add.Enabled = true;
        btn_Update.Enabled = false;
        clearall();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            HiddenField1.Value = GridView1.SelectedItem.Cells[2].Text.ToString();
            txt_news.Text = GridView1.SelectedItem.Cells[3].Text.ToString();
            ddl_ntype.ClearSelection();
            ddl_ntype.Items.FindByValue(GridView1.SelectedItem.Cells[6].Text.ToString()).Selected = true;
            ddl_star.ClearSelection();
            ddl_star.Items.FindByValue(GridView1.SelectedItem.Cells[7].Text.ToString()).Selected = true;
            btn_add.Enabled = false;
            btn_Update.Enabled = true;
            btn_Delete.Enabled = false;
        }
        catch (Exception ex)
        { }
    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
                DataSet ds = new DataSet();
                if (cb.Checked)
                {
                    select = 1;
                    List<string> para = new List<string>();
                    para.Add(GridView1.Items[i].Cells[2].Text.ToString());
                   // Label5.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
                    ds = bl_obj.FillGridWithParameter(para, "sp_delete_news");
                   
                }
                if (select == 0)
                {
                    Label5.Visible = true; 
                   // Label5.Text = "Select Record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                    
                }
            }
            fillgrid();          
        }
        catch (Exception ex)
        { }
    }
    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}
