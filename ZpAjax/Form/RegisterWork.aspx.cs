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

public partial class Form_RegisterWork : System.Web.UI.Page
{
    string wid;
    BusinessLayerclass bl_ob = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //filltaluka();
            fillWorkType();
        }
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            List<string> plist = new List<string>();
            para.Add("1");
            para.Add(ddl_wrkType.SelectedValue.ToString());
            para.Add("1");
            para.Add(txt_wrkName.Text);
            para.Add("0");
            Session["WorkType"] = ddl_wrkType.SelectedValue.ToString();
            //Session["Gav"] = ddl_gav.SelectedValue.ToString();
            plist.Add("@workplanningID");
            plist.Add("@worktypeID");
            plist.Add("@GavID");
            plist.Add("@workname");
           plist.Add("@UniqueWorkNumber");
            ds = bl_ob.FillGridWithName_Parameter(plist, para, "Sp_register_work");

            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "register();", true);
            Session["Work_ID"] = ds.Tables[0].Rows[0][0].ToString();

            //Added for Inserting UniqueWorkNumber
            DataSet ds1 = new DataSet();
            List<string> para1 = new List<string>();
            para1.Add(Session["Work_ID"].ToString());

            int spendHour, spendMinute, spendSecond;
            DateTime currentTime = DateTime.Now;
            string dt = System.DateTime.Now.ToShortDateString();
            spendHour = currentTime.Hour;
            spendMinute = currentTime.Minute;
            spendSecond = currentTime.Second;

            String a = (Session["Work_ID"].ToString() + Session["WorkType"].ToString() + "1" + dt);
            para1.Add(a);
            ds1 = bl_ob.FillGridWithParameter(para1, "Update_register_work");
            //Added for Inserting UniqueWorkNumber
        }
        catch (Exception ex)
        {

        }
        fillstage.Attributes.Add("style", "visibility:Visible");
        //Response.Redirect("~/Form/HomePage.aspx");
    }
    //private void filltaluka()
    //{
    //    DataSet ds = new DataSet();
    //    ddl_Taluka.DataValueField = "TalukaId";
    //    ddl_Taluka.DataTextField = "TalukaName";
    //    ds = bl_ob.FillGrid("Sp_FillTalukaName");
    //    ddl_Taluka.DataSource = ds;
    //    ddl_Taluka.DataBind();
    //    ddl_Taluka.Items.Insert(0, new ListItem("--Select--", "0"));
    //}
    private void fillWorkType()
    {
        DataSet ds = new DataSet();
        ds = bl_ob.FillGrid("sp_fillworktypemaster");
        ddl_wrkType.DataValueField = "worktypeID";
        ddl_wrkType.DataTextField = "worktypeName";
        ddl_wrkType.DataSource = ds;
        ddl_wrkType.DataBind();
        ddl_wrkType.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    //protected void ddl_Taluka_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DataSet ds = new DataSet();
    //    List<string> para = new List<string>();
    //    para.Add(ddl_Taluka.SelectedValue);
    //    ddl_gav.DataValueField = "GavID";
    //    ddl_gav.DataTextField = "GavName";
    //    ds = bl_ob.FillGridWithParameter(para, "sp_GavMaster_DDLSelectPro");
    //    ddl_gav.DataSource = ds;
    //    ddl_gav.DataBind();
    //    ddl_gav.Items.Insert(0, new ListItem("--Select--", "0"));
    //}
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }


    protected void ButtonYes_Click(object sender, EventArgs e)
    {




        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        plist.Add(Session["Work_ID"].ToString());
        ds = bl_ob.FillGridWithParameter(plist, "sp_select_year");
        Session["year"] = ds.Tables[0].Rows[0][0].ToString();
        Session["Talukaname"] = ds.Tables[0].Rows[0][1].ToString();
        Session["Gavname"] = ds.Tables[0].Rows[0][2].ToString();
        Session["Workname"] = ds.Tables[0].Rows[0][3].ToString();




        Response.Redirect("WorkEntry.aspx", false);


    }
    protected void ButtonNo_Click(object sender, EventArgs e)
    {
        Response.Redirect("HomePage.aspx", false);
    }
}
