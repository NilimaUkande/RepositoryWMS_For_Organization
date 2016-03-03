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


public partial class Form_WorkEntryNew : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_ob = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!IsPostBack)
        {
            ddlyear1.Focus();
            
                ddlyear();
                fillddltaluka();
                Department();
                fillupvibhag();            
                fillddlgaon();
                fillddlZpgutId();
                fillddlpsgancode();
                vidhansabha();
                fillLoksabha();
                ddlfillwrktype();
                ddlEngineerfill();
            }
        }
            catch (Exception ex)
            { }

        
    }
    protected void ddlfillwrktype()
    {
        DataSet ds = new DataSet();
        ds = bl_ob.FillGrid("sp_fillworktypemaster");
        ddlwrktype.DataValueField = "worktypeID";
        ddlwrktype.DataTextField = "worktypeName";
        ddlwrktype.DataSource = ds;
        ddlwrktype.DataBind();
        ddlwrktype.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
         try
        {
            setzero();
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add("1");
            para.Add(ddlyear1.SelectedValue.ToString());
            para.Add(DdLShakha.SelectedValue.ToString());
            para.Add(ddlpsgancode.SelectedValue.ToString());
            para.Add(ddlzpgut.SelectedValue.ToString());
            para.Add(ddlvsabhaPari.SelectedValue.ToString());
            para.Add(ddllokRajyaSabha.SelectedValue.ToString());
            para.Add(ddlStar.SelectedValue.ToString());
            para.Add(TextBox1.Text);
            para.Add(DropDownList1.SelectedValue.ToString());
            para.Add(ddlEngineer.SelectedValue.ToString());
            para.Add(ddlgaon.SelectedValue.ToString());
            para.Add(TextBox3.Text);
            para.Add(RadioButtonList3.SelectedValue.ToString());
            para.Add("N");
            para.Add(ddlupvibhag.SelectedValue.ToString());
            para.Add(ddlwrktype.SelectedValue.ToString());
            para.Add("a");
            ds = bl_ob.ExecuteStoredFunctionWithParameters(para, "sp_WorkEntry");
            lblmsg.Text = "Record Inserted ";
            HiddenField1.Value = ds.Tables[0].Rows[0][0].ToString();
           //Session["Work_ID"] = ds.Tables[0].Rows[0][0].ToString();
            btnSave.Enabled = false;     
            List<string> list = new List<string>();
            list.Add(HiddenField1.Value.ToString());

            //list.Add(Session["Work_ID"].ToString());
            list.Add("1");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            bl_ob.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
        }
        catch(Exception ex)
        {
        
        }
      Response.Redirect("~/Form/HomePage.aspx");
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(TextBox1);
        plist.Add(TextBox3);
        bl_ob.TextboxNull(plist);
    }
    protected void DdLShakha_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillupvibhag();
        ddlEngineerfill();
        fill_lscode();
        ddlgaon.Focus();
    }
    protected void ddltaluka_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillddlgaon();
        fillddlZpgutId();
        ddlgaon.Focus();
    }
    public void ddlEngineerfill()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["officeid"].ToString());
        para.Add(DdLShakha.SelectedValue.ToString());
        ddlEngineer.DataValueField = "engid";
        ddlEngineer.DataTextField = "Engineername";
        ds = bl_ob.FillGridWithParameter(para,"sp_FillEngineername");
        ddlEngineer.DataSource = ds;
        ddlEngineer.DataBind();
        ddlEngineer.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    protected void ddlzpgut_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillddlpsgancode();
        ddlpsgancode.Focus();
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList2.SelectedValue == "L")
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(RadioButtonList2.SelectedValue.ToString());
            ds = bl_ob.FillGridWithParameter(para, "sp_Fill_Locasabha_Rajaysabha");
            ddllokRajyaSabha.DataValueField = "LSID";
            ddllokRajyaSabha.DataTextField = "L_Name";
            ddllokRajyaSabha.DataSource = ds;
            ddllokRajyaSabha.DataBind();
            ddllokRajyaSabha.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        else if (RadioButtonList2.SelectedValue == "R")
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(RadioButtonList2.SelectedValue.ToString());
            ds = bl_ob.FillGridWithParameter(para, "sp_Fill_Locasabha_Rajaysabha");
            ddllokRajyaSabha.DataValueField = "LSID";
            ddllokRajyaSabha.DataTextField = "L_Name";
            ddllokRajyaSabha.DataSource = ds;
            ddllokRajyaSabha.DataBind();
            ddllokRajyaSabha.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        ddllokRajyaSabha.Focus();
    }
    protected void ddlpsgancode_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        List<string> plist = new List<string>();

        plist.Add(ddlpsgancode.SelectedValue.ToString());
        ds1 = bl_ob.FillGridWithParameter(plist, "sp_PSCode");
        if (ds1.Tables.Count != 0)
        {
            if (ds1.Tables[0].Rows.Count != 0)
            {
                Label20.Text = ds1.Tables[0].Rows[0][2].ToString();
            }
        }
        RadioButtonList1.Focus();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    } 
    protected void ddlvsabhaPari_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(RadioButtonList1.SelectedValue);
        ds = bl_ob.FillGridWithParameter(para, "sp_Fill_Vidhansabha_Vidhanparishadcode");
        Label9.Text = ds.Tables[0].Rows[0][1].ToString();
       
    }
  
    protected void fill_lscode()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(DdLShakha.SelectedValue.ToString());
        ds = bl_ob.FillGridWithParameter(para, "sp_Fill_Locasabha_Rajaysabha_code");
        if (ds.Tables.Count != 0)
        {
            Label2.Text = ds.Tables[0].Rows[0][1].ToString();
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "S")
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(RadioButtonList1.SelectedValue.ToString());
            ds = bl_ob.FillGridWithParameter(para, "sp_Fill_Vidhansabha_Vidhanparishadcode");
            ddlvsabhaPari.DataValueField = "VSID";
            ddlvsabhaPari.DataTextField = "V_Name";
            ddlvsabhaPari.DataSource = ds;
            ddlvsabhaPari.DataBind();
            ddlvsabhaPari.Items.Insert(0, new ListItem("--Select--", "0"));

        }
        else if (RadioButtonList1.SelectedValue == "P")
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(RadioButtonList1.SelectedValue.ToString());
            ds = bl_ob.FillGridWithParameter(para, "sp_Fill_Vidhansabha_Vidhanparishadcode");
            ddlvsabhaPari.DataValueField = "VSID";
            ddlvsabhaPari.DataTextField = "V_Name";
            ddlvsabhaPari.DataSource = ds;
            ddlvsabhaPari.DataBind();
            ddlvsabhaPari.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        ddlvsabhaPari.Focus();

    }
    public void ddlyear()
    {
        DataSet ds = new DataSet();

        ddlyear1.DataValueField = "YearId";
        ddlyear1.DataTextField = "Year";
        ds = bl_ob.FillGrid("FillDDL_year1");
        ddlyear1.DataSource = ds;
        ddlyear1.DataBind();
        ddlyear1.Items.Insert(0, new ListItem("--Select--", "0"));


    }

    public void Department()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["officeid"].ToString());
   
        DdLShakha.DataValueField = "deptid";
        DdLShakha.DataTextField = "deptname";
        ds = bl_ob.FillGridWithParameter(para, "sp_FillDepartment_ID");
        DdLShakha.DataSource = ds;
        DdLShakha.DataBind();
        DdLShakha.Items.Insert(0, new ListItem("--Select--", "0"));


    }
    public void fillddlpsgancode()
    {
        DataSet ds = new DataSet();
        List<string> plist1 = new List<string>();
        plist1.Add(ddlzpgut.SelectedValue.ToString());
        ddlpsgancode.DataValueField = "PSID";
        ddlpsgancode.DataTextField = "PSname";
        ds = bl_ob.FillGridWithParameter(plist1, "sp_PSCode");
        ddlpsgancode.DataSource = ds;
        ddlpsgancode.DataBind();
        ddlpsgancode.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    public void fillddlZpgutId()
    {
        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        plist.Add(ddltaluka.SelectedValue.ToString());
        ddlzpgut.DataValueField = "ZpgutId";
        ddlzpgut.DataTextField = "ZpGut";
        ds = bl_ob.FillGridWithParameter(plist, "sp_FillZpGutMaster");
        ddlzpgut.DataSource = ds;
        ddlzpgut.DataBind();
        ddlzpgut.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    public void fillddltaluka()
    {
        DataSet ds = new DataSet();
        ddltaluka.DataValueField = "TalukaId";
        ddltaluka.DataTextField = "TalukaName";
        ds = bl_ob.FillGrid("Sp_FillTalukaName");
        ddltaluka.DataSource = ds;
        ddltaluka.DataBind();
        ddltaluka.Items.Insert(0, new ListItem("--Select--", "0"));
    }
   
    public void fillupvibhag()
    {
        DataSet ds = new DataSet();
        List<string> str = new List<string>();
        str.Add(DdLShakha.SelectedValue.ToString());
        str.Add(ddltaluka.SelectedValue.ToString());
        ddlupvibhag.DataValueField = "sdeptid";
        ddlupvibhag.DataTextField = "sdeptname";
        ds = bl_ob.FillGridWithParameter(str, "sp_fillsubdeptmasterddl");
        ddlupvibhag.DataSource = ds;
        ddlupvibhag.DataBind();
        //ddlupvibhag.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    public void fillddlgaon()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(ddltaluka.SelectedValue);
        ddlgaon.DataValueField = "GavID";
        ddlgaon.DataTextField = "GavName";
        ds = bl_ob.FillGridWithParameter(para, "sp_GavMaster_DDLSelectPro");
        ddlgaon.DataSource = ds;
        ddlgaon.DataBind();
        ddlgaon.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    public void vidhansabha()
    {

        DataSet ds = new DataSet();
        ddlvsabhaPari.DataValueField = "VSID";
        ddlvsabhaPari.DataTextField = "V_Name";
        ds = bl_ob.FillGrid("FillVidhanSabha");
        ddlvsabhaPari.DataSource = ds;
        ddlvsabhaPari.DataBind();
        ddlvsabhaPari.Items.Insert(0, new ListItem("--Select--", "0"));

    }
    public void fillLoksabha()
    {

        DataSet ds = new DataSet();
        ddllokRajyaSabha.DataValueField = "LSID";
        ddllokRajyaSabha.DataTextField = "L_Name";
        ds = bl_ob.FillGrid("FillLokSabha");
        ddllokRajyaSabha.DataSource = ds;
        ddllokRajyaSabha.DataBind();
        ddllokRajyaSabha.Items.Insert(0, new ListItem("--Select--", "0"));

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Dept Master.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/UpvibhagMaster.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Taluka Master.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/GavMaster.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/ZpGutMaster.aspx");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/panchyatsamiteeMaster.aspx");
    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/VidhanSabhaGutMaster.aspx");
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/LoksabhaMaster.aspx");
    }

    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/WorkTypeMaster.aspx");
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/AbhiyantaMaster.aspx");
    }
}
