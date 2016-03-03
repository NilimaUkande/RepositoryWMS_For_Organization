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
public partial class Form_Default4 : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    { try
            {  
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {
           
                     
                fillddltaluka();
                filllekhashirsh();
                fill_work();
            }
        }
            catch (Exception ex)
            {
            }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            fill_work();
        }
        catch (Exception ex)
        {
        }
    }
    protected void fill_work()
    {
        DataSet ds1 = new DataSet();
        List<string> list = new List<string>();
        List<string> para_name = new List<string>();
        if (!(ddlhead.SelectedValue.ToString() == "0" || ddlhead.SelectedValue.ToString() == ""))
        {

            para_name.Add("@HDID");
            list.Add(ddlhead.SelectedValue.ToString());

        }
        if (!(ddlYojana.SelectedValue.ToString() == "0" || ddlYojana.SelectedValue.ToString() == ""))
        {
            para_name.Add("@YojanaID");
            list.Add(ddlYojana.SelectedValue.ToString());
        }
        if (!(ddltaluka.SelectedValue.ToString() == "0" || ddltaluka.SelectedValue.ToString() == ""))
        {
            para_name.Add("@TalukaId");
            list.Add(ddltaluka.SelectedValue.ToString());
        }
        para_name.Add("@officeid");
        list.Add(Session["officeid"].ToString());//officeid
        ds1 = bl_obj.FillGridWithName_Parameter(para_name, list, "Sp_DeleteWork_search");
        Cache.Insert("delete_work", ds1);
        int id = (ds1.Tables[0].Rows.Count) % 10;
        if (id == 0)
        {
            if (GridView1.CurrentPageIndex > 0)
            {

                GridView1.DataSource = ds1;
                GridView1.CurrentPageIndex--;
                GridView1.DataBind();

            }
            else
            {

                GridView1.DataSource = ds1;
                GridView1.DataBind();
            }
        }
        else
        {

            GridView1.DataSource = ds1;
            GridView1.DataBind();
        }

       
    }
    public void fillddltaluka()
    {

        DataSet ds1 = new DataSet();
        List<string> para = new List<string>();
        ddltaluka.DataValueField = "TalukaId";
        ddltaluka.DataTextField = "TalukaName";
        para.Add(Session["District_id"].ToString());
        ds1 = bl_obj.FillGridWithParameter(para, "sp_Taluka_fill_gav");
        ddltaluka.DataSource = ds1.Tables[0];
        ddltaluka.DataBind();
        ddltaluka.Items.Insert(0, (new ListItem("----select----", "0")));
    }
    public void filllekhashirsh()
    {
        DataSet ds = new DataSet();

        ddlhead.DataValueField = "HDID";
        ddlhead.DataTextField = "HeadDescription";
        ds = bl_obj.FillGrid("ddl_prashakiyamanyata");
        ddlhead.DataSource = ds.Tables[0];
        ddlhead.DataBind();
        ddlhead.Items.Insert(0, (new ListItem("---Select---", "0")));
    }
    public void fillyojana()
    {
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(ddlhead.SelectedValue.ToString());
        ds = bl_obj.FillGridWithParameter(para, "sp_selectyojana");
        ddlYojana.DataValueField = "YojanaID";
        ddlYojana.DataTextField = "YojanaName";
        if (ds.Tables[0].Rows.Count != 0)
        {
            ddlYojana.Items.Clear();
            ddlYojana.DataSource = ds.Tables[0];
            ddlYojana.DataBind();
            ddlYojana.Items.Insert(0, (new ListItem("-----Select-----", "0")));
            ddlYojana.Enabled = true;
        }
        else
        {
            ddlYojana.Items.Clear();
         
            ddlYojana.Enabled = false;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlYojana.ClearSelection();
        fillyojana();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {     
                DataSet ds = new DataSet();
                List<string> para = new List<string>();
                para.Add(GridView1.SelectedItem.Cells[1].Text.ToString());
                para.Add("D"); //Flag for Deleted Work
                ds = bl_obj.FillGridWithParameter(para, "sp_deletework");
                fill_work();
         }
        catch (Exception ex)
        {

        }
    }
    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds1 = (DataSet)Cache.Get("delete_work");// (DataSet)Grid1.DataSource;
        fillgrid(ds1);
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    private void fillgrid(DataSet ds1)
    {
        Cache.Insert("delete_work", ds1);
        GridView1.DataSource = ds1;
        GridView1.DataBind();
        // flag = 0;
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            CheckBox cb;
            DataSet ds = new DataSet();
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                List<string> para = new List<string>();
                cb = (CheckBox)GridView1.Items[i].FindControl("Cb");
                if (cb.Checked)
                {
                    select = 1;
                    para.Add(GridView1.Items[i].Cells[1].Text.ToString());
                    para.Add("D"); //Flag for Deleted Work
                  
                    bl_obj.FillGridWithParameter(para, "sp_deletework");
                    lblmsg.Text = "Record Deleted";
                }
                if (select == 0)
                {
                    lblmsg.Text = "Please select record";
                }
            }



        }
        catch (Exception ex)
        {
        }

        fill_work();
    }
}
