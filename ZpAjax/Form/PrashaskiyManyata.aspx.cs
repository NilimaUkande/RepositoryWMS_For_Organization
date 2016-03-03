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

public partial class Form_Sameer_PrashaskiyManyata : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");

            if (!Page.IsPostBack)
            {

                ddlppradhikar.Focus();
                ddl();
                fillddl_pradhikar();
                FillRecord();
                Checkstagestatus();
               
                //Label12.Visible = false;
                //Label14.Visible = false;
                Label15.Visible = false;
                //Label4.Visible = false;
                //Label6.Visible = false;
                if (ddllekhashirsha.SelectedValue.ToString() == "0" || ddllekhashirsha.SelectedValue.ToString() == "")
                {
                   // Label4.Visible = false;
                  //  Label6.Visible = false;
                
                }

                else 
                {

                  //  Label4.Visible = true;
                   // Label6.Visible = true;

                }
            }

            lblTalukatext.Text ="कामाचे नाव : " + Session["Workname"].ToString();

            //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
            //        + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();

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
        para.Add(txtPMRakkam.Text);
        para.Add(txtkramank.Text);
        string date = obj.convertDate(Request.Form[TextBox1.UniqueID]);
        para.Add(date);
        para.Add(ddllekhashirsha.SelectedValue.ToString());
        para.Add(ddlppradhikar.SelectedValue.ToString());
        if (ddlyojana.SelectedValue.ToString() == "")
        {
            para.Add("0");
        }
        else
        {
            para.Add(ddlyojana.SelectedValue.ToString());
        }
        ds = obj.ExecuteStoredFunctionWithParameters(para, "Update_PrashakiyaManyata");
        lnk_Next.Visible = true;
        if (ds.Tables.Count != 0)
        {
            // lblmsg.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
        }

        else
        {
        
            //  lblmsg.Text = "Record Inserted";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);

            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("2");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");

            // to deduct amount from fund
            para.Clear();
            DataSet dscheckamt = new DataSet();
            para.Add(ddllekhashirsha.SelectedValue.ToString());
            if (ddlyojana.SelectedValue.ToString() == "0" || ddlyojana.SelectedValue.ToString() == "")
            {
                para.Add("0");
            }
            else
            {
                para.Add(ddlyojana.SelectedValue.ToString());

            }

            para.Add(Session["Work_ID"].ToString());
            para.Add(txtPMRakkam.Text);
            para.Add("ps");
            dscheckamt = obj.ExecuteStoredFunctionWithParameters(para, "Sp_Check_Remainingamount");
            if (dscheckamt.Tables.Count != 0)
            {
                if (dscheckamt.Tables[0].Rows.Count > 0)
                {
                    Label15.Visible = true;
                    lbl_remaining_amt.Text = dscheckamt.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    Label15.Visible = true;
                    lbl_remaining_amt.Text = "0";
                }
            }

            // to deduct amount from fund


        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            //Added for Compairing pmp rakkam with prashaskiy pradhikar amout
            string min = Session["minAmount"].ToString();
            string max = Session["maxAmount"].ToString();
            int minValue = int.Parse(min);
           // int maxValue = int.Parse(max);
            string pmrakkam = txtPMRakkam.Text;
            int pmRakkam = int.Parse(pmrakkam);
            if (max == "संपुर्ण अधिकार")
            {
                insert();
            
            }
            else
            {
                //int minValue = int.Parse(min);
                int maxValue = int.Parse(max);
               // string pmrakkam = txtPMRakkam.Text;
                //int pmRakkam = int.Parse(pmrakkam);
                if (pmRakkam >= minValue && pmRakkam <= maxValue)
                {
                    insert();
               
                }

                else
                {
                    //lblmsg.Text = "Please enter valid amt";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "ValidAmount();", true);
                }

             }


        }
        catch (Exception ea)
        {
        }

      
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtkramank);
        obj.Textboxstring(plist);
        plist.Clear();
        plist.Add(txtPMRakkam);
        obj.TextboxNull(plist);
        plist.Clear();
        plist.Add(TextBox1);
        obj.Textboxdate(plist);
    }
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);
    }
    public void ddl()
    {
        DataSet ds = new DataSet();
        ddllekhashirsha.DataValueField = "HDID";
        ddllekhashirsha.DataTextField = "HeadDescription";
        ds = obj.FillGrid("ddl_prashakiyamanyata");
        ddllekhashirsha.DataSource = ds.Tables[0];
        ddllekhashirsha.DataBind();
        ddllekhashirsha.Items.Insert(0, (new ListItem("-----Select-----", "")));
    }
    public void ddlyojana1()
    {
        ddlyojana.Items.Clear();
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(ddllekhashirsha.SelectedValue.ToString());
        ds = obj.FillGridWithParameter(para, "sp_selectyojana");
        ddlyojana.DataValueField = "YojanaID";
        ddlyojana.DataTextField = "YojanaName";
        if (ds.Tables[0].Rows.Count != 0)
        {
            ddlyojana.DataSource = ds.Tables[0];
            ddlyojana.DataBind();
            ddlyojana.Items.Insert(0, (new ListItem("-----Select-----", "")));
        }
        else
        {
            ddlyojana.Items.Insert(0, (new ListItem("-----Select-----", "")));
        }




    }
    protected void FillRecord()
    {
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(Session["Work_ID"].ToString());
        ds = obj.FillGridWithParameter(para, "sp_PrashakiyaManyata_select");
        if (ds.Tables.Count != 0)
        {
            if (ds.Tables[0].Rows.Count != 0)
            {
                if (ds.Tables[0].Rows[0][0].ToString() != "")
                {
                    txtPMRakkam.Text = ds.Tables[0].Rows[0][0].ToString();
                    txtkramank.Text = ds.Tables[0].Rows[0][1].ToString();
                    TextBox1.Text = ds.Tables[0].Rows[0][2].ToString();
                    ddllekhashirsha.ClearSelection();
                    ddllekhashirsha.Items.FindByValue(ds.Tables[0].Rows[0][3].ToString()).Selected = true;
                    ddlppradhikar.ClearSelection();
                    ddlppradhikar.Items.FindByValue(ds.Tables[0].Rows[0][4].ToString()).Selected = true;
                    ddlyojana1();
                    ddlyojana.ClearSelection();
                    if (ds.Tables[0].Rows[0][5].ToString() == "0")
                    { }
                    else
                    {
                        ddlyojana.Items.FindByValue(ds.Tables[0].Rows[0][5].ToString()).Selected = true;
                    }
                    if (ddllekhashirsha.SelectedValue.ToString() != "-----Select-----")
                    {
                        List<string> para1 = new List<string>();
                        DataSet ds1 = new DataSet();
                        ds1.Clear();
                        para1.Clear();
                        para1.Add(ddllekhashirsha.SelectedValue.ToString());
                        ds1 = obj.FillGridWithParameter(para1, "Sp_SelectzpCodeGovCode");
                        if (ds1.Tables[0].Rows[0][1].ToString() == "-" || ds1.Tables[0].Rows[0][1].ToString() == " " || ds1.Tables[0].Rows[0][1].ToString() == "NULL")
                        {
                            lblgovcode.Text = " ";
                        }
                        else
                        {
                            lblgovcode.Text = " शासकीय सांकेतांक:" + ds1.Tables[0].Rows[0][1].ToString();
                        }

                        if (ds1.Tables[0].Rows[0][0].ToString() == "-" || ds1.Tables[0].Rows[0][0].ToString() == " " || ds1.Tables[0].Rows[0][0].ToString() == "NULL")
                        {
                            lblzpcode.Text = " ";
                        }
                        else
                        { 
                         lblzpcode.Text = "जि.प.सांकेतांक:" + ds1.Tables[0].Rows[0][0].ToString();

                        }

                       
                    }
                    fillLimit();
                }
            }
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    public void fillddl_pradhikar()
    {
        DataSet ds = new DataSet();

        ddlppradhikar.DataValueField = "PMPID";
        ddlppradhikar.DataTextField = "Description";
        ds = obj.FillGrid("ddlpradhikar");
        ddlppradhikar.DataSource = ds.Tables[0];
        ddlppradhikar.DataBind();

        ddlppradhikar.Items.Insert(0, (new ListItem("-----Select-----", "")));



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
    }
    protected void ddllekhashirsha_SelectedIndexChanged(object sender, EventArgs e)
    {
       // Label4.Visible = true;
       // Label6.Visible = true;
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(ddllekhashirsha.SelectedValue.ToString());
        ds = obj.FillGridWithParameter(para, "Sp_SelectzpCodeGovCode");

        if (ds.Tables[0].Rows[0][0].ToString() != "-" && ds.Tables[0].Rows[0][1].ToString() != " ")
        {
           // Label4.Visible = true;
           // Label6.Visible = true;
            lblzpcode.Visible = true;
            lblzpcode.Text = ds.Tables[0].Rows[0][0].ToString();

            ////  Added for if code is blank with(without Data) then don’t show on form...31/8/2015
            if (lblzpcode.Text == "-" || lblzpcode.Text == "")
            {
                lblzpcode.Text = "";

            }
            else
            {
                lblzpcode.Text = "जि.प.सांकेतांक:" + ds.Tables[0].Rows[0][0].ToString();
            }
            

            lblgovcode.Visible = true;
            lblgovcode.Text = ds.Tables[0].Rows[0][1].ToString();

           // Added for if code is blank with(without Data) then don’t show on form...31/8/2015
            if (ds.Tables[0].Rows[0][1].ToString() == "-" || ds.Tables[0].Rows[0][1].ToString() == "")
            {
                lblgovcode.Text = "";
            }
            else
            {
                lblgovcode.Text = " शासकीय सांकेतांक:" + ds.Tables[0].Rows[0][1].ToString();
            }
            
        }
        else
        {
           // Label4.Visible = false;
           // Label6.Visible = false;
            lblgovcode.Visible = false;
            lblzpcode.Visible = false;
        }
        //if (ds.Tables[0].Rows[0][1].ToString() != "0")
        //{
        //    lblgovcode.Visible = true;
        //    lblgovcode.Text = ds.Tables[0].Rows[0][1].ToString();
        //}
        //else
        //{
        //   // Label4.Visible = false;
        //    Label6.Visible = false;
        //    lblgovcode.Visible = false;
        //}


        ddlyojana1();
        para.Clear();
        // to calculate remaining amount
        DataSet dscheckamt = new DataSet();
        para.Add(ddllekhashirsha.SelectedValue.ToString());
        para.Add("0");
        para.Add(Session["Work_ID"].ToString());
        para.Add("0");
        para.Add("pc");
        dscheckamt = obj.ExecuteStoredFunctionWithParameters(para, "Sp_Check_Remainingamount");
        if (dscheckamt.Tables.Count != 0)
        {
            if (dscheckamt.Tables[0].Rows.Count > 0)
            {
                Label15.Visible = true;
                lbl_remaining_amt.Text = dscheckamt.Tables[0].Rows[0][0].ToString();
            }
            else
            {
                Label15.Visible = true;
                lbl_remaining_amt.Text = "0";
            }
        }

        // to calculate remaining amount

    }
    protected void ddlppradhikar_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillLimit();
        Label12.Visible = true;
       // Label14.Visible = true;
    }
    protected void fillLimit()
    {
        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        plist.Add(ddlppradhikar.SelectedValue.ToString());
        plist.Add("p");// for pradhikar
        ds = obj.FillGridWithParameter(plist, "sp_pradhikarlimit");
        Label12.Text = ds.Tables[0].Rows[0][0].ToString() + "&nbsp;" + "ते" + "&nbsp;" + ds.Tables[0].Rows[0][1].ToString();

    // Label12.Text = ds.Tables[0].Rows[0][0].ToString() + "/"+ ds.Tables[0].Rows[0][1].ToString();
     Session["minAmount"] = ds.Tables[0].Rows[0][0].ToString();
     Session["maxAmount"] = ds.Tables[0].Rows[0][1].ToString();
        //Label10.Text = ds.Tables[0].Rows[0][0].ToString();
        //Label11.Text = ds.Tables[0].Rows[0][1].ToString();
    }
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/PrashaskiyManyataPradhikarMaster.aspx");
    }
    //protected void LinkButton3_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Form/HeadMaster.aspx");
    //}
    //protected void LinkButton4_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Form/YojnaMaster.aspx");
    //}
   
    protected void ddlyojana_SelectedIndexChanged(object sender, EventArgs e)
    {
        // to calculate remaining amount
        List<string> para = new List<string>();
        DataSet dscheckamt = new DataSet();
        para.Add(ddllekhashirsha.SelectedValue.ToString());
        para.Add(ddlyojana.SelectedValue.ToString());
        para.Add(Session["Work_ID"].ToString());
        para.Add("0");
        para.Add("pc");
        dscheckamt = obj.ExecuteStoredFunctionWithParameters(para, "Sp_Check_Remainingamount");
        if (dscheckamt.Tables.Count != 0)
        {
            if (dscheckamt.Tables[0].Rows.Count > 0)
            {
                Label15.Visible = true;
                lbl_remaining_amt.Text = dscheckamt.Tables[0].Rows[0][0].ToString();
            }
            else
            {
                Label15.Visible = true;
                lbl_remaining_amt.Text = "0";
            }
        }

        // to calculate remaining amount
    }

    //For disable next stage button 17/8/2015
    protected void Checkstagestatus()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("2");
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
