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
public partial class Form_SearchWork : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_Obj = new BusinessLayerclass();
    //protected void Page_Load(object sender, EventArgs e)
    //{try
    //        {
    //    if (Session["Group_Id"] == null)
    //        Response.Redirect("~/Form/login.aspx");
    //    if (!Page.IsPostBack)
    //    {
            
            
    //            ddlstage();
    //            fillddltaluka();
    //            filllekhashirsh();
    //            fill_work();
    //        }
    //    }
    //        catch (Exception ex)
    //        {
    //        }
     
    //}
    //public void fillddltaluka()
    //{

    //    DataSet ds1 = new DataSet();
    //    List<string> para =new List<string>();
    //    ddltaluka.DataValueField = "TalukaId";
    //    ddltaluka.DataTextField = "TalukaName";
    //    para.Add(Session["District_id"].ToString());
    //    ds1 = bl_Obj.FillGridWithParameter(para, "sp_Taluka_fill_gav");
    //    ddltaluka.DataSource = ds1.Tables[0];
    //    ddltaluka.DataBind();
    //    ddltaluka.Items.Insert(0, (new ListItem("----select----", "0")));
    //}    
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        fill_work();
    //        one.Attributes.Add("style", "visibility:Visible");
    //        two.Attributes.Add("style", "visibility:Visible");
    //        three.Attributes.Add("style", "visibility:Visible"); 

    //    }
    //    catch (Exception ex)
    //    { 
    //    }
    //}
    //protected void fill_work()
    //{
    //    DataSet ds1 = new DataSet();
    //    List<string> list = new List<string>();
    //    List<string> para_name = new List<string>();
    //    if (!(ddlhead.SelectedValue.ToString() == "0" || ddlhead.SelectedValue.ToString() == ""))
    //    {

    //        para_name.Add("@HDID");
    //        list.Add(ddlhead.SelectedValue.ToString());

    //    }
    //    if (!(ddlYojana.SelectedValue.ToString() == "0" || ddlYojana.SelectedValue.ToString() == ""))
    //    {
    //        para_name.Add("@YojanaID");
    //        list.Add(ddlYojana.SelectedValue.ToString());
    //    }
    //    if (!(ddltaluka.SelectedValue.ToString() == "0" || ddltaluka.SelectedValue.ToString() == ""))
    //    {
    //        para_name.Add("@TalukaId");
    //        list.Add(ddltaluka.SelectedValue.ToString());
    //    }
    //    para_name.Add("@officeid");
    //    list.Add(Session["officeid"].ToString());//officeid
    //    ds1 = bl_Obj.FillGridWithName_Parameter(para_name, list, "Sp_Meeting_search");
    //    ddlwork.DataValueField = "workplanningID";
    //    ddlwork.DataTextField = "workname";
    //    ddlwork.DataSource = ds1.Tables[0];
    //    ddlwork.DataBind();
    //    ddlwork.Items.Insert(0, (new ListItem("---Select---", "0")));
    //    ddlwork.ClearSelection();
    //}
    //public void ddlstage()
    //{
    //    DataSet ds2 = new DataSet();
    //    List<string> para = new List<string>();
    //    C.DataValueField = "Stage_Id";
    //    C.DataTextField = "Stage_Name";
    //    //para.Add(Session["District_id"].ToString());

    //    ds2 = bl_Obj.FillGrid("sp_ddlstage");
    //    C.DataSource = ds2.Tables[0];
    //    C.DataBind();
    //    C.Items.Insert(0,(new ListItem("---ALL Stages---","0")));

    //}
    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        List<string> para = new List<string>();

    //        para.Add(ddlwork.SelectedValue.ToString());
    //        para.Add(C.SelectedValue.ToString());
    //        bl_Obj.FillGridWithParameter(para,"sp_singlestage");
    //        Label2.Text = "Stage Cleared";
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}
    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    ddlYojana.ClearSelection();
    //    fillyojana();
    //}
    //public void filllekhashirsh()
    //{
    //    DataSet ds = new DataSet();

    //    ddlhead.DataValueField = "HDID";
    //    ddlhead.DataTextField = "HeadDescription";
    //    ds = bl_Obj.FillGrid("ddl_prashakiyamanyata");
    //    ddlhead.DataSource = ds.Tables[0];
    //    ddlhead.DataBind();
    //    ddlhead.Items.Insert(0, (new ListItem("---Select---","0")));
    //}
    //public void fillyojana()
    //{
    //    List<string> para = new List<string>();
    //    DataSet ds = new DataSet();
    //    para.Add(ddlhead.SelectedValue.ToString());
    //    ds = bl_Obj.FillGridWithParameter(para, "sp_selectyojana");
    //    ddlYojana.DataValueField = "YojanaID";
    //    ddlYojana.DataTextField = "YojanaName";
    //    if (ds.Tables[0].Rows.Count != 0)
    //    {
    //        ddlYojana.Items.Clear();
    //        ddlYojana.DataSource = ds.Tables[0];
    //        ddlYojana.DataBind();
    //        ddlYojana.Items.Insert(0,(new ListItem("-----Select-----", "0")));
    //        ddlYojana.Enabled = true;
    //    }
    //    else
    //    {
    //        ddlYojana.Items.Clear();
    //        //ddlYojana.Items.Insert(0,(new ListItem("-----Select-----", "0")));
    //        ddlYojana.Enabled = false;
    //    }
    //}


}
