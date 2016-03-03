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

public partial class Form_CompletedworksReport : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_Obj = new BusinessLayerclass();
    BusinessLayer.email_sms1 bl_email = new BusinessLayer.email_sms1();
    BusinessLayer.email_sms1 bl_sms = new BusinessLayer.email_sms1();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");

            if (!IsPostBack)
            {

                filllekhashirsh();
                fillddltaluka();

                if (Convert.ToString(Session["Work_ID"].ToString()) == "")
                {
                    FillgridMain();
                }
                else
                {
                    FillgridMain();
                   
                  
                }

                HiddenField1.Value = "1";

                


            }
        }
        catch (Exception ex)
        { }
              
    }

    public void FillgridMain()
    {
        fillmaingridform();
        //try
        //{

        //    DataSet ds = new DataSet();

        //    List<string> plist = new List<string>();
        //    if (Session["Head_ID"].ToString() == "")
        //    {
        //        ds = bl_Obj.FillGrid("FillWorkId");
        //    }
        //    else
        //    {
        //        plist.Add(Session["Head_ID"].ToString());
        //        plist.Add(Session["Tal"].ToString());
        //        ds = bl_Obj.FillGridWithParameter(plist, "FillWorkId_parameter");
        //    }
        //    Cache.Insert("home_page",ds);
        //    int id = (ds.Tables[0].Rows.Count) % 10;
        //    if (id == 0)
        //    {
        //        if (datagrid.CurrentPageIndex > 0)
        //        {
        //            datagrid.DataSource = ds;
        //            datagrid.CurrentPageIndex--;
        //            datagrid.DataBind();
        //        }
        //        else
        //        {
        //            datagrid.DataSource = ds;
        //            datagrid.DataBind();
        //        }
        //    }
        //    else
        //    {
        //        datagrid.DataSource = ds;
        //        datagrid.DataBind();
        //    }
        //}
        //catch (Exception ex)
        //{
        //    Session["Exception"] = ex.ToString();
        //    Response.Redirect("ExceptionHandling.aspx");
        //}
    }
  
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds1 = (DataSet)Cache.Get("Completed_Work");
        Cache.Insert("Completed_Work", ds1);
        datagrid.DataSource = ds1;
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
    public void filllekhashirsh()
    {
        DataSet ds = new DataSet();
        DropDownList1.DataValueField = "HDID";
        DropDownList1.DataTextField = "HeadDescription";
        ds = bl_Obj.FillGrid("ddl_prashakiyamanyata");
        DropDownList1.DataSource = ds.Tables[0];
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, (new ListItem("--Select--", "0")));
    }
    public void fillddltaluka()
    {
        DataSet ds1 = new DataSet();
        List<string> para = new List<string>();
        DropDownList2.DataValueField = "TalukaId";
        DropDownList2.DataTextField = "TalukaName";
        para.Add(Session["District_id"].ToString());
        ds1 = bl_Obj.FillGridWithParameter(para, "sp_Taluka_fill_gav");
        DropDownList2.DataSource = ds1.Tables[0];
        DropDownList2.DataBind();
        DropDownList2.Items.Insert(0, (new ListItem("----select----", "")));
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        fillmaingridform();
       
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillyojana();
    }
    public void fillyojana()
    {
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(DropDownList1.SelectedValue.ToString());
        ds = bl_Obj.FillGridWithParameter(para, "sp_selectyojana");
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
    private void fillmaingridform()
{
    try
    {
        DataSet ds1 = new DataSet();
        List<string> list = new List<string>();
        List<string> para_name = new List<string>();
        if (!(DropDownList1.SelectedValue.ToString() == "0" || DropDownList1.SelectedValue.ToString() == ""))
        {
            para_name.Add("@HDID");
            list.Add(DropDownList1.SelectedValue.ToString());
        }
        if (!(ddlYojana.SelectedValue.ToString() == "0" || ddlYojana.SelectedValue.ToString() == ""))
        {
            para_name.Add("@YojanaID");
            list.Add(ddlYojana.SelectedValue.ToString());
        }
        if (!(DropDownList2.SelectedValue.ToString() == "0" || DropDownList2.SelectedValue.ToString() == ""))
        {
            para_name.Add("@TalukaId");
            list.Add(DropDownList2.SelectedValue.ToString());
        }
        para_name.Add("@officeid");
        list.Add("1");//officeid
        ds1 = bl_Obj.FillGridWithName_Parameter(para_name, list, "Sp_report_Completedwork");
     // lbl_MSG .Text  = ds1.Tables[0].Rows.Count.ToString();
        
      Label55.Text = ds1.Tables[0].Rows.Count.ToString();
        Cache.Insert("Completed_Work", ds1);
        int id = (ds1.Tables[0].Rows.Count) % 10;
        if (id == 0)
        {
            if (datagrid.CurrentPageIndex > 0)
            {
                datagrid.DataSource = ds1;
                datagrid.CurrentPageIndex--;
                datagrid.DataBind();
            }
            else
            {
                datagrid.DataSource = ds1;
                datagrid.DataBind();
            }
        }
        else
        {
            datagrid.DataSource = ds1;
            datagrid.DataBind();
        }
    }
    catch (Exception ex)
    { }
}
    protected void btnAddNewWork_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterWork.aspx");
    }

    private HtmlControl FindHtmlControlByIdInControl(Control control, string id)
    {
        foreach (Control childControl in control.Controls)
        {
            if (childControl.ID != null && childControl.ID.Equals(id, StringComparison.OrdinalIgnoreCase) && childControl is HtmlControl)
            {
                return (HtmlControl)childControl;
            }

            if (childControl.HasControls())
            {
                HtmlControl result = FindHtmlControlByIdInControl(childControl, id);
                if (result != null) return result;
            }
        }

        return null;
    }
  
    protected void BtnReset_Click(object sender, EventArgs e)
    {

        //if (BtnReset != null)
        //{ //reload the page in 1 second.
        //    BtnReset.Attributes.Add("onclick", "setReloadTime(1)");
        //}
        DropDownList2.ClearSelection();
        DropDownList1.ClearSelection();
        ddlYojana.ClearSelection();
        fillmaingridform();
    }
}
