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
public partial class Form_WorkEntry : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_ob = new BussinessLayer.BusinessLayerclass();
    static DataSet dsps = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    { try
            {
               
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!IsPostBack)
        {
                ddlyear1.Focus();           
                ddlyear();           
                Department();              
                fillddltaluka();
                fillddlgaon();
                fillddlZpgutId();
                fillddlpsgancode();
                vidhansabha();
                fillLoksabha();
                ddlfillwrktype();
                ddlEngineerfill();
                FillddlUnit();
                fillworkEntry();
                Checkstagestatus();
                

               // Label14.Visible = false;
                Label2.Visible = false;
               // Label17.Visible = false;
                Label20.Visible = false;
                //Label18.Visible = false;
                Label9.Visible = false;

               
                //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
                //      + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();

                lblTalukatext.Text =  "कामाचे नाव : " + Session["Workname"].ToString();

               // lblTalukavalue.Text = Session["Talukaname"].ToString();
               // lblGaonvalue.Text = Session["Gavname"].ToString();
              //  lblWorknamevalue.Text = Session["Workname"].ToString();
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
    public void fillworkEntry()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> plist = new List<string>();
            plist.Add(Session["Work_ID"].ToString());
            ds = bl_ob.FillGridWithParameter(plist, "Sp_Fill_WorkPLANING");
            if (ds.Tables.Count != 0)
            {

                if (ds.Tables[1].Rows.Count != 0)
                {
                    TextBox1.Text = ds.Tables[1].Rows[0][4].ToString();
                    ddlwrktype.ClearSelection();
                    ddlwrktype.Items.FindByValue(ds.Tables[1].Rows[0][3].ToString()).Selected = true;
                    ddltaluka.ClearSelection();
                    ddltaluka.Items.FindByValue(ds.Tables[1].Rows[0][1].ToString()).Selected = true;
            //taluka on every page
                    //Session["Taluka"] = ds.Tables[1].Rows[0][1].ToString();

                    fillddlZpgutId();
                   
                    fillddlgaon();
                    ddlgaon.ClearSelection();
                    ddlgaon.Items.FindByValue(ds.Tables[1].Rows[0][2].ToString()).Selected = true;
                }
              if (ds.Tables[0].Rows.Count != 0)
                {
                    // btnSave.Enabled = false;
                    //  Button2.Enabled = true;          
                    ddlyear1.ClearSelection();
                    ddlyear1.Items.FindByValue(ds.Tables[0].Rows[0][1].ToString()).Selected = true;

                    DdLShakha.ClearSelection();
                    DdLShakha.Items.FindByValue(ds.Tables[0].Rows[0][2].ToString()).Selected = true;

                    fillupvibhag();

                    fillddlZpgutId();
                    ddlzpgut.ClearSelection();
                    ddlzpgut.Items.FindByValue(ds.Tables[0].Rows[0][6].ToString()).Selected = true;
                    fillddlpsgancode();
                    ddlpsgancode.ClearSelection();
                    ddlpsgancode.Items.FindByValue(ds.Tables[0].Rows[0][7].ToString()).Selected = true;


                    //RadioButtonList1
                   //
                    ddlvsabhaPari.ClearSelection();
                    ddlvsabhaPari.Items.FindByValue(ds.Tables[0].Rows[0][9].ToString()).Selected = true;
                    RadioButtonList2.ClearSelection();
                    RadioButtonList2.Items.FindByValue(ds.Tables[0].Rows[0][10].ToString()).Selected = true;
                    ddllokRajyaSabha.ClearSelection();
                    ddllokRajyaSabha.Items.FindByValue(ds.Tables[0].Rows[0][11].ToString()).Selected = true;
                    ddlStar.ClearSelection();
                    ddlStar.Items.FindByValue(ds.Tables[0].Rows[0][12].ToString()).Selected = true;

                    TextBox1.Text = ds.Tables[0].Rows[0][14].ToString();
                    Session["workname"] = TextBox1.Text;
                    txtthikan.Text = ds.Tables[0].Rows[0][15].ToString();

                   //unit
                  //
                    ddlEngineerfill();
                    ddlEngineer.ClearSelection();
                    ddlEngineer.Items.FindByValue(ds.Tables[0].Rows[0][17].ToString()).Selected = true;




                 TextBox3.Text = ds.Tables[0].Rows[0][18].ToString()+".00";

                 //unit
                 ddlUnit.ClearSelection();
                 ddlUnit.Items.FindByText(ds.Tables[0].Rows[0][16].ToString()).Selected = true;
                  //
                 RadioButtonList1.ClearSelection();
                 RadioButtonList1.Items.FindByValue(ds.Tables[0].Rows[0][8].ToString()).Selected = true;
                  //

                 
                   // ddlupvibhag.ClearSelection();
                   // ddlupvibhag.Items.FindByValue(ds.Tables[0].Rows[0][3].ToString()).Selected = true;

                    fill_psgun();
                    fill_vsgun();
                    fill_lscode();
                }
            }

            else
            {
                clearall();
                // btnSave.Enabled = true;
                // Button2.Enabled = false;
            }
           }
        catch (Exception ex)
        { }
    }
   
    public void clearall()
    {
        ddlyear1.ClearSelection();
        DdLShakha.ClearSelection();
        ddlupvibhag.ClearSelection();
        ddltaluka.ClearSelection();
        ddlgaon.ClearSelection();
        ddlzpgut.ClearSelection();
        ddlpsgancode.ClearSelection();
        RadioButtonList1.ClearSelection();
        ddlvsabhaPari.ClearSelection();
        RadioButtonList2.ClearSelection();
        ddllokRajyaSabha.ClearSelection();
        ddlStar.ClearSelection();
        TextBox1.Text = "";
        ddlUnit.ClearSelection();
        ddlEngineer.ClearSelection();
        TextBox3.Text = "";
        RadioButtonList3.ClearSelection();
        Label20.Text = "";
        Label9.Text = "";
        Label2.Text = "";
    }
   
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(TextBox1);
        plist.Add(TextBox3);
        bl_ob.TextboxNull(plist);
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
    public void ddlEngineerfill()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["officeid"].ToString());
        //para.Add(DdLShakha.SelectedValue.ToString());
        para.Add("1");
        ddlEngineer.DataValueField = "engid";
        ddlEngineer.DataTextField = "Engineername";
        ds = bl_ob.FillGridWithParameter(para, "sp_FillEngineername");
        ddlEngineer.DataSource = ds;
        ddlEngineer.DataBind();
        ddlEngineer.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    public void Department()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["officeid"].ToString());//set Session Office_ID
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
        try
        {
            DataSet ds = new DataSet();
            List<string> plist = new List<string>();
            plist.Add(ddltaluka.SelectedValue.ToString());
            ddlzpgut.DataValueField = "ZpGutid";
            ddlzpgut.DataTextField = "zpgut";
            ds = bl_ob.FillGridWithParameter(plist, "sp_FillZpGutMaster");
            ddlzpgut.DataSource = ds;
            ddlzpgut.DataBind();
            ddlzpgut.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        catch (Exception ex)
        { }
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
    
    protected void fill_lscode()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(DdLShakha.SelectedValue.ToString());
        ds = bl_ob.FillGridWithParameter(para, "sp_Fill_Locasabha_Rajaysabha_code");
        if (ds.Tables[0].Rows.Count != 0)
        {
            Label2.Text = ds.Tables[0].Rows[0][1].ToString();

            // Added for code is blank with(without Data) then don’t show on form...31/8/2015
            if (Label2.Text == "0")
            {
                Label2.Text = "";
            }
            else
            {
                Label2.Text = "कोड:" + ds.Tables[0].Rows[0][1].ToString();
            }
            //
        }
    }
    protected void ddltaluka_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillddlgaon();
        fillddlZpgutId();
        ddlgaon.Focus();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataSet dsFlag = new DataSet();
        List<string> plist = new List<string>();
        plist.Add(Session["Work_ID"].ToString());
        dsFlag = bl_ob.FillGridWithParameter(plist, "sp_workstatus_flag");
        try
        {
            setzero();
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add(Session["Work_ID"].ToString());
           // para.Add(ddlyear1.SelectedValue.ToString());
            para.Add("15");
            para.Add("1");
            para.Add("1");
            para.Add("1");
            para.Add("1");
            para.Add("1");
            para.Add("इतर");
            para.Add(TextBox1.Text);
            para.Add(ddlUnit.SelectedValue.ToString());
            para.Add(ddlEngineer.SelectedValue.ToString());
            para.Add("1");
            para.Add(TextBox3.Text);
            para.Add(RadioButtonList3.SelectedValue.ToString());
           
            if (dsFlag.Tables[0].Rows.Count != 0)
            {
                para.Add(dsFlag.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                para.Add("N");
            }
            para.Add("1");
            para.Add(ddlwrktype.SelectedValue.ToString());
            para.Add(txtthikan.Text);
            para.Add("u");
            
            ds = bl_ob.ExecuteStoredFunctionWithParameters(para, "sp_WorkEntry");
            lnk_Next.Visible = true;
            if (ds.Tables.Count != 0)
            {
               
                //This msg work with update panel also
              //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Record inserted Successfully')", true);
              
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               // lblmsg.Text = "Record inserted";
            }
            else
            {
             
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
               // lblmsg.Text = "Record Updated";
            }
            HiddenField1.Value = ds.Tables[0].Rows[0][0].ToString();

            List<string> list = new List<string>();
            list.Add(HiddenField1.Value.ToString());

            //list.Add(Session["Work_ID"].ToString());
            list.Add("1");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            bl_ob.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
            fillworkEntry();
                  }
        catch (Exception ex)
        {

        }
     
    }
    protected void ddlvsabhaPari_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Label18.Visible = true;
        Label9.Visible = true;

        fill_vsgun();
        RadioButtonList2.Focus();
    }
    protected void fill_vsgun()
    {
        //Label18.Visible = true;
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(ddlvsabhaPari.SelectedValue.ToString());
        ds = bl_ob.FillGridWithParameter(para, "sp_Fill_Vidhansabha_Vidhanparishadcode1");
        if (ds.Tables.Count != 0)
        {
           // Label18.Visible = true;
            Label9.Visible = true;
            Label9.Text = ds.Tables[0].Rows[0][1].ToString();

           //  Added for code is blank with(without Data) then don’t show on form...31/8/2015
            if (Label9.Text == "0")
            {
                Label9.Text = "";
            }
            else
            {
                Label9.Text = "कोड:" + ds.Tables[0].Rows[0][1].ToString();
            }
            
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void ddlzpgut_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillddlpsgancode();
        ddlpsgancode.Focus();
    }
    protected void ddlpsgancode_SelectedIndexChanged(object sender, EventArgs e)
    {
       // Label17.Visible = true;
        Label20.Visible = true;
        fill_psgun();
        RadioButtonList1.Focus();
    }

    protected void fill_psgun()
    {
        DataSet ds1 = new DataSet();
        List<string> plist = new List<string>();
        try
        {
            plist.Add(ddlpsgancode.SelectedValue.ToString());
            ds1 = bl_ob.FillGridWithParameter(plist, "sp_PSCode1");
            if (ds1.Tables.Count != 0)
            {
                Label20.Text = ds1.Tables[0].Rows[0][2].ToString();

               // Added for code is blank with(without Data) then don’t show on form...31/8/2015


                if (Label20.Text == "-")
                {
                    Label20.Text = "";
                }
                else
                {
                    Label20.Text = "कोड:"+ ds1.Tables[0].Rows[0][2].ToString();
                }
                //
            }
        }
        catch (Exception ex)
        { }
    }
    protected void DdLShakha_SelectedIndexChanged(object sender, EventArgs e)
    {
       // Label14.Visible = true;
        Label2.Visible = true;
        fillupvibhag();
        ddlEngineerfill();       
        fill_lscode();
        ddlgaon.Focus();      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }

    protected void LinkButton2_Click1(object sender, EventArgs e)
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
    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/WorkTypeMaster.aspx");
    }
    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/AbhiyantaMaster.aspx");
    }

    //For disable next stage button 17/8/2015
    protected void Checkstagestatus()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("1");
        ds = bl_ob.FillGridWithParameter(list, "sp_Check_Stage_Status");
        if (ds.Tables[0].Rows.Count != 0)
        {
            lnk_Next.Visible = true;
        }
        else
        {
            lnk_Next.Visible = false;
        }
    }

    public void FillddlUnit()
    {
        DataSet ds = new DataSet();
         List<string> str = new List<string>();
        ddlUnit.DataValueField = "Unit";
        ddlUnit.DataTextField = "Unit";

        ds = bl_ob.FillGridWithParameter(str, "FillDDL_Unit");
       // ds = bl_ob.FillGrid("FillDDL_Unit");
        ddlUnit.DataSource = ds;
        ddlUnit.DataBind();
        ddlUnit.Items.Insert(0, new ListItem("--Select--", "0"));
    }
}


   //DataSet ds = new DataSet();
   //     List<string> str = new List<string>();
   //     str.Add(DdLShakha.SelectedValue.ToString());
   //     str.Add(ddltaluka.SelectedValue.ToString());
   //     ddlupvibhag.DataValueField = "sdeptid";
   //     ddlupvibhag.DataTextField = "sdeptname";
   //     ds = bl_ob.FillGridWithParameter(str, "sp_fillsubdeptmasterddl");
   //     ddlupvibhag.DataSource = ds;
   //     ddlupvibhag.DataBind();
       // ddlupvibhag.Items.Insert(0, new ListItem("--Select--", "0"));