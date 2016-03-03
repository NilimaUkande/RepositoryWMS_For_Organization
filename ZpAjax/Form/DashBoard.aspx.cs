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
using System.Data.SqlClient;
using System.Threading;

public partial class Form_DashBoard : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
    static DataSet dsps = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");
            if (!IsPostBack)
            {
                //ddlyear1.Focus();
               // ddlyear();
                //Department();
               //fillddltaluka();
                //fillddlgaon();
                //fillddlZpgutId();
                //fillddlpsgancode();
               // vidhansabha();
               // fillLoksabha();
                //ddlfillwrktype();
               // ddlEngineerfill();
                //fillworkEntry();



                FillDepartment();
                FillYear();
            }
        }
        catch (Exception ex)
        { }
    }


    //public void ddlEngineerfill()
    //{
    //    DataSet ds = new DataSet();
    //    List<string> para = new List<string>();
    //    para.Add(Session["officeid"].ToString());
    //    para.Add(DdLShakha.SelectedValue.ToString());
    //    ddlEngineer.DataValueField = "engid";
    //    ddlEngineer.DataTextField = "Engineername";
    //    ds = bl_ob.FillGridWithParameter(para, "sp_FillEngineername");
    //    ddlEngineer.DataSource = ds;
    //    ddlEngineer.DataBind();
    //    ddlEngineer.Items.Insert(0, new ListItem("--Select--", "0"));
    //}

    //public void Department()
    //{
    //    DataSet ds = new DataSet();
    //    List<string> para = new List<string>();
    //    para.Add(Session["officeid"].ToString());//set Session Office_ID
    //    DdLShakha.DataValueField = "deptid";
    //    DdLShakha.DataTextField = "deptname";
    //    ds = bl_ob.FillGridWithParameter(para, "sp_FillDepartment_ID");
    //    DdLShakha.DataSource = ds;
    //    DdLShakha.DataBind();
    //    DdLShakha.Items.Insert(0, new ListItem("--Select--", "0"));
    //}

    //protected void DdLShakha_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //   // fillupvibhag();
    //    ddlEngineerfill();
    //    //fill_lscode();
    //    //ddlgaon.Focus();
    //}

    //public void fillddltaluka()
    //{
    //    DataSet ds = new DataSet();
    //    ddltaluka.DataValueField = "TalukaId";
    //    ddltaluka.DataTextField = "TalukaName";
    //    ds = bl_ob.FillGrid("Sp_FillTalukaName");
    //    ddltaluka.DataSource = ds;
    //    ddltaluka.DataBind();
    //    ddltaluka.Items.Insert(0, new ListItem("--Select--", "0"));
    //}

    //protected void ddltaluka_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //   // fillddlgaon();
    //   // fillddlZpgutId();
    //   // ddlgaon.Focus();
    //}


    protected void FillDepartment()
    {

        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["officeid"].ToString());
        DDL_Dept.DataValueField = "deptid";
        DDL_Dept.DataTextField = "deptname";
        ds = bl_obj.FillGridWithParameter(para, "sp_FillDepartment_ID");
        DDL_Dept.DataSource = ds;
        DDL_Dept.DataBind();
        DDL_Dept.Items.Insert(0, new ListItem("--Select--", "0"));
        //DDL_Dept.Items.Insert(0, new ListItem("All", "0"));



    }

    protected void FillYear()
    {
        DataSet ds = new DataSet();
        DDL_Year.DataValueField = "YearId";
        DDL_Year.DataTextField = "Year";
        ds = bl_obj.FillGrid("FillDDL_year1");
        DDL_Year.DataSource = ds;
        DDL_Year.DataBind();
        DDL_Year.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    protected void Taluka()
    {



        List<string> para = new List<string>();
        para.Add(RadioButtonList2.SelectedValue.ToString());
        DataSet ds = new DataSet();
        ds = bl_obj.FillGridWithParameter(para, "sp_SelectTalukaNameNew");
        DDL_Taluka.DataValueField = "Talukaid";
        DDL_Taluka.DataTextField = "Talukaname";
        DDL_Taluka.DataSource = ds;
        DDL_Taluka.DataBind();
        DDL_Taluka.Items.Insert(0, new ListItem("--Select--", "0"));
        DDL_Taluka.Items.Insert(1, new ListItem("All", "0"));


    }
    protected void ddlEngineerfill()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["officeid"].ToString());
        para.Add(DDL_Dept.SelectedValue.ToString());
        ddlEngineer.DataValueField = "engid";
        ddlEngineer.DataTextField = "Engineername";
        ds = bl_obj.FillGridWithParameter(para, "sp_FillEngineername");
        ddlEngineer.DataSource = ds;
        ddlEngineer.DataBind();
        ddlEngineer.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Taluka();
        ddlEngineerfill();
    }
    protected void DDL_Taluka_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlEngineerfill();
    }
}