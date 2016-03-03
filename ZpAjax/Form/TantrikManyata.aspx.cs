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
public partial class Form_TantrikManyata : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {try
            {
                
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {

            ddltmpradhikar.Focus();
                fillddl();
                filldetails1();
                Checkstagestatus();
            }

        lblTalukatext.Text = "कामाचे नाव : " + Session["Workname"].ToString();
        //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
        //         + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();

        }
            catch (Exception ex)
            { }
       
    }



    protected void insert()
    {
        setzero();
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["Work_ID"].ToString());
        para.Add(txtTMRakkam.Text);
        para.Add(txtKramank.Text);
        string date = obj.convertDate(txtdate.Text);
        para.Add(date);
        para.Add(ddltmpradhikar.SelectedValue.ToString());
        ds = obj.ExecuteStoredFunctionWithParameters(para, "update_tantrik_manyata");

        if (ds.Tables.Count != 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
           // lblmsg.Text = "Record Updated";
            lnk_Next.Visible = true;
            // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "nodata();", true);
            // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please fill previous stage.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
          //  lblmsg.Text = "Record Inserted";
            lnk_Next.Visible = true;
            //  ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "shifaras_amount_validation()", true);
            // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please fill previous stage.');", true);

        }
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("4");
        list.Add(Session["User_Id"].ToString());
        list.Add(Session["officeid"].ToString());
        obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
        filldetails1();
           
           
    }


    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {

            //

            //Added for Compairing pmp rakkam with prashaskiy pradhikar amout
            string min = Session["minAmount"].ToString();
            string max = Session["maxAmount"].ToString();
            int minValue = int.Parse(min);
            string tmrakkam = txtTMRakkam.Text;
            int tmRakkam = int.Parse(tmrakkam);
            if (max == "above")
            {
               
                if (tmRakkam >= minValue &&  max == "above")
                {
                    insert();

                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "ValidAmount();", true);
                   // lblmsg.Text = "Please enter valid amt";
                }
               

            }
            else
            {
                //int minValue = int.Parse(min);
                int maxValue = int.Parse(max);
                //string tmrakkam = txtTMRakkam.Text;
                //int tmRakkam = int.Parse(tmrakkam);
                if (tmRakkam >= minValue && (tmRakkam <= maxValue || max == "above"))
                {
                    insert();

                }

                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "ValidAmount();", true);
                   // lblmsg.Text = "Please enter valid amt";
                }

            }
        }

            //
        //setzero();
        //DataSet ds = new DataSet();
        //List<string> para = new List<string>();
        //para.Add(Session["Work_ID"].ToString());   
        //para.Add(txtTMRakkam.Text);
        //para.Add(txtKramank.Text);
        //string date = obj.convertDate(txtdate.Text);
        //para.Add(date);
        //para.Add(ddltmpradhikar.SelectedValue.ToString());
        //ds= obj.ExecuteStoredFunctionWithParameters(para, "update_tantrik_manyata");

            //if (ds.Tables.Count != 0)
        //{
        //   lblmsg.Text = "Record Updated";
        //   lnk_Next.Visible = true;
        //   // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "nodata();", true);
        //   // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please fill previous stage.');", true);
        //}
        //else
        //{
        //   lblmsg.Text = "Record Inserted";
        //   lnk_Next.Visible = true;
        //  //  ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "shifaras_amount_validation()", true);
        //   // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please fill previous stage.');", true);

            //}
        //List<string> list = new List<string>();
        //list.Add(Session["Work_ID"].ToString());
        //list.Add("4");
        //list.Add(Session["User_Id"].ToString());
        //list.Add(Session["officeid"].ToString());
        //obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
        //filldetails1();



        catch (Exception ex)
        {
        }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtKramank);
        obj.Textboxstring(plist);
        plist.Clear();
        plist.Add(txtTMRakkam);
        obj.TextboxNull(plist);
        plist.Clear();
        plist.Add(txtdate);
        obj.Textboxdate(plist);

    }
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    public void fillddl()
    {
        DataSet ds = new DataSet();
        List<string> par = new List<string>();
        ddltmpradhikar.DataValueField = "TMPID";
        ddltmpradhikar.DataTextField = "TPradhikaran_name";
        par.Add(Session["officeid"].ToString());
        ds = obj.FillGridWithParameter(par,"ddl_TantrikManyata");
        ddltmpradhikar.DataSource = ds.Tables[0];
        ddltmpradhikar.DataBind();
        ddltmpradhikar.Items.Insert(0, (new ListItem("-----Select-----", "")));
    }
    protected void filltpradikarlimit()
    {
        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        plist.Add(ddltmpradhikar.SelectedValue.ToString());
        plist.Add("t");// for pradhikar
        ds = obj.FillGridWithParameter(plist, "sp_pradhikarlimit");
        Label8.Text = ds.Tables[0].Rows[0][0].ToString() + "&nbsp;" + "ते" + "&nbsp;" + ds.Tables[0].Rows[0][1].ToString();
        Session["minAmount"] = ds.Tables[0].Rows[0][0].ToString();
        Session["maxAmount"] = ds.Tables[0].Rows[0][1].ToString();
       
    }
    public void filldetails1()
    {
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(Session["Work_ID"].ToString());
        ds = obj.FillGridWithParameter(para, "sp_fillform_TantrikManyata");
        if (ds.Tables[0].Rows.Count != 0)
        {
            txtTMRakkam.Text = ds.Tables[0].Rows[0][0].ToString();
            txtKramank.Text = ds.Tables[0].Rows[0][1].ToString();
            txtdate.Text = ds.Tables[0].Rows[0][2].ToString();
            ddltmpradhikar.ClearSelection();
            ddltmpradhikar.Items.FindByText(ds.Tables[0].Rows[0][4].ToString()).Selected=true;
            filltpradikarlimit();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
    protected void ddltmpradhikar_SelectedIndexChanged(object sender, EventArgs e)
    {
        filltpradikarlimit();
    }
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Tantrik_Pradhikaran_Master.aspx");
    }

    //For disable next stage button 17/8/2015
    protected void Checkstagestatus()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("4");
        ds = obj.FillGridWithParameter(list, "sp_Check_Stage_Status");
        if (ds.Tables[0].Rows.Count != 0)
        {
            lnk_Next.Visible = true;
        }
        else
        {
            lnk_Next.Visible = false;
        }
    }
  
}

