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

public partial class Form_publishingMaster : System.Web.UI.Page
{
    BusinessLayerclass bl_obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ClearAll();
            fillgrid();
        }
    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add("1");
        para.Add(txt_ptype.Text);
        para.Add(Session["officeid"].ToString()); //officeid
        para.Add("a");
        ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_publish_master");
        if (ds.Tables.Count != 0)
        {
            if (ds.Tables[0].Rows.Count != 0)
            {
                datagrid.DataSource = ds;
                datagrid.DataBind();
            }
            lblmsg.Text = "Record inserted";
        }
        txt_ptype.Text = "";
    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(hf_ptypeId.Value);
        para.Add(txt_ptype.Text);
        para.Add(Session["officeid"].ToString()); //officeid
        para.Add("u");
        ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_publish_master");
        if (ds.Tables.Count != 0)
        {
            if (ds.Tables[0].Rows.Count != 0)
            {
                datagrid.DataSource = ds;
                datagrid.DataBind();
            }
            lblmsg.Text = "Record Updated";
           
        }
        txt_ptype.Text = "";
        btn_update.Enabled = false;
        btn_add.Enabled = true;
    }
    protected void btn_del_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            DataSet ds = new DataSet();
            for (int i = 0; i < datagrid.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)datagrid.Items[i].FindControl("CheckBox2");
                if (cb.Checked)
                {
                    ds.Clear();
                    select = 1;
                    Label2.Visible = false;
                    List<string> para = new List<string>();
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                    para.Add("1");
                    para.Add("1"); //officeid
                    para.Add("d");                   
                    ds=bl_obj.FillGridWithParameter(para, "sp_publish_master");
                  

                }              
            }
            if (ds.Tables.Count != 0)
            {
                
                    datagrid.DataSource = ds;
                    datagrid.DataBind();
                
                lblmsg.Text = "Record Deleted";
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
            hf_ptypeId.Value = datagrid.SelectedItem.Cells[2].Text.ToString();
            txt_ptype.Text = datagrid.SelectedItem.Cells[3].Text.ToString();          
            btn_update.Enabled = true;
            btn_add.Enabled = false;
            btn_del.Enabled = false;
        }
        catch (Exception ex)
        {
        }
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
    protected void fillgrid()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["officeid"].ToString());
        ds = bl_obj.FillGridWithParameter(para,"sp_fillgridPublish");
        if (ds.Tables.Count != 0)
        {
            if (ds.Tables[0].Rows.Count != 0)
            {
                datagrid.Visible = true;
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
            else
            {
                datagrid.DataSource = ds;
                datagrid.DataBind();
            }
        }
    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        txt_ptype.Text = "";
    }

    public void ClearAll()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
}
