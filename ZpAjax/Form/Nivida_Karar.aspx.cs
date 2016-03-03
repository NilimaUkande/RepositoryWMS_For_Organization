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
public partial class Form_Nivida_Karar : System.Web.UI.Page
{

   
    BussinessLayer.BusinessLayerclass bl_ob = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");
            if (!Page.IsPostBack)
            {

               // clearall();
                filltaluka();
                fillddlpradhikar();
                fillShifarasNo();
                fillWorkContractDetails();
              //  lblmsg.Visible = false;

                Checkstagestatus();
                
                


                //  Button2.Enabled = false;

                //Button1.Enabled = true;

            }

            lblTalukatext.Text = "कामाचे नाव : " + Session["Workname"].ToString();
            //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
            // + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();


            // Button2.Enabled = true;

        }
        catch (Exception ex)
        {

        }


    }
    protected void filltaluka()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        ds = bl_ob.FillGridWithParameter(list, "sp_TalukaName");
        if (ds.Tables.Count != 0)
        {
            Session["talukaId"] = ds.Tables[0].Rows[0][1].ToString();
        }
    }
    public void fillShifarasNo()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());//Set WorkPlain_ID Value session
            ds = bl_ob.FillGridWithParameter(para, "Sp_FillShifaras_No");
            if (ds.Tables.Count != 0)
            {

                hd_thekedar_id.Value = ds.Tables[0].Rows[0][0].ToString();

                if (ds.Tables[0].Rows.Count != 0)
                {
                    TextBox2.Text = ds.Tables[0].Rows[0][1].ToString();
                    TextBox2.DataBind();
                    ddlswikrutidar.Enabled = true;
                    TextBox4.Enabled = true;
                }

                HiddenField2.Value = ds.Tables[0].Rows[0][2].ToString();
            }
        }
        catch (Exception ex)
        {
        }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(TextBox3);
        plist.Add(TextBox4);
        plist.Add(TextBox6);
        plist.Add(TextBox7);
        bl_ob.TextboxNull(plist);
        plist.Clear();

        plist.Add(TextBox2);
        plist.Add(TextBox1);
        bl_ob.Textboxstring(plist);
        plist.Clear();

        plist.Add(TextBox5);
        bl_ob.Textboxdate(plist);

    }
    public void fillWorkContractDetails()
    {

        DataSet dst = new DataSet();
        List<string> pllist = new List<string>();
        pllist.Add(Session["Work_ID"].ToString());
        pllist.Add(HiddenField2.Value.ToString());
        dst = bl_ob.FillGridWithParameter(pllist, "Sp_FillWorkwise_ContractDetails");
        if (dst.Tables.Count != 0)
        {
            if (dst.Tables[0].Rows.Count != 0 && dst.Tables[1].Rows.Count != 0)
            {
                fillddl1();
                if (HiddenField2.Value != "G")
                {

                    if (HiddenField2.Value != "O")
                    {
                        ddlpradhikar.Focus();
                        ddlthekedar.ClearSelection();
                        ddlthekedar.Items.FindByValue(dst.Tables[0].Rows[0][0].ToString()).Selected = true;
                        ddlthekedar.Enabled = false;
                    }
                    else
                    {
                        ddlthekedar.Focus();
                        ddlthekedar.ClearSelection();
                        ddlthekedar.Items.FindByValue(dst.Tables[2].Rows[0][0].ToString()).Selected = true;
                        ddlthekedar.Enabled = true;
                    }
                    ddlpradhikar.ClearSelection();
                    ddlpradhikar.Items.FindByValue(dst.Tables[1].Rows[0][7].ToString()).Selected = true;
                    TextBox1.Text = dst.Tables[1].Rows[0][0].ToString();
                    TextBox3.Text = dst.Tables[1].Rows[0][1].ToString(); //not working .00
                    TextBox4.Text = dst.Tables[1].Rows[0][2].ToString();
                    txtfinalamount.Text = dst.Tables[1].Rows[0][5].ToString();  //not working .00
                    ddlswikrutidar.ClearSelection();
                    ddlswikrutidar.Items.FindByValue(dst.Tables[1].Rows[0][4].ToString()).Selected = true;
                   
                    TextBox9.Text = dst.Tables[1].Rows[0][9].ToString();
                    TextBox10.Text = dst.Tables[1].Rows[0][10].ToString();
                    TextBox11.Text = dst.Tables[1].Rows[0][11].ToString() + ".00";
                    TextBox12.Text = dst.Tables[1].Rows[0][12].ToString();
                    TextBox13.Text = dst.Tables[1].Rows[0][13].ToString();
                    TextBox14.Text = dst.Tables[1].Rows[0][14].ToString() + ".00";
                    TextBox8.Text = dst.Tables[1].Rows[0][15].ToString() + ".00";

                    //Used for displaying Select type on page
                    if (dst.Tables[1].Rows[0][16].ToString() == "Percentage")
                    {
                        RadioBtnSelectType.ClearSelection();
                        RadioBtnSelectType.Items.FindByValue("Percentage").Selected = true;
                        Panel2.Visible = true;

                    }
                    else
                    {
                        RadioBtnSelectType.ClearSelection();
                        RadioBtnSelectType.Items.FindByValue("Amount").Selected = true;
                        Panel4.Visible = true;

                    }
                    //
                    

                    Session["SurakshaDetails"] = TextBox9.Text;
                    Session["SurakshaDate"] = TextBox10.Text;
                    Session["SurakshaAmount"] = TextBox11.Text;
                    Session["AnamatDetails"] = TextBox12.Text;
                    Session["AnamatDate"] = TextBox13.Text;
                    Session["AnamatAmount"] = TextBox14.Text;


                    Panel1.Visible = false;
                    Panel3.Visible = true;
                    Button1.Enabled = false;
                    Button2.Enabled = true;
                }
                else
                {
                    ddlthekedar.ClearSelection();
                    ddlthekedar.Items.FindByValue(dst.Tables[0].Rows[0][0].ToString()).Selected = true;
                    TextBox5.Text = dst.Tables[1].Rows[0][3].ToString();
                    TextBox6.Text = dst.Tables[1].Rows[0][1].ToString() + ".00";
                    TextBox7.Text = dst.Tables[1].Rows[0][2].ToString() + ".00";

                    TextBox9.Text = dst.Tables[1].Rows[0][4].ToString();
                    TextBox10.Text = dst.Tables[1].Rows[0][5].ToString();
                    TextBox11.Text = dst.Tables[1].Rows[0][6].ToString() + ".00";
                    TextBox12.Text = dst.Tables[1].Rows[0][7].ToString();
                    TextBox13.Text = dst.Tables[1].Rows[0][8].ToString();
                    TextBox14.Text = dst.Tables[1].Rows[0][9].ToString() + ".00";

                    Session["SurakshaDetails"] = TextBox9.Text;
                    Session["SurakshaDate"] = TextBox10.Text;
                    Session["SurakshaAmount"] = TextBox11.Text;
                    Session["AnamatDetails"] = TextBox12.Text;
                    Session["AnamatDate"] = TextBox13.Text;
                    Session["AnamatAmount"] = TextBox14.Text;


                    Panel1.Visible = true;
                    Panel3.Visible = false;
                    Button1.Enabled = false;
                    Button2.Enabled = true;

                    Button3.Visible = false;

                   

                    ddlthekedar.Enabled = true;
                   
                }
            }
            else
            {
                fillddl1();
                if (HiddenField2.Value != "G")
                {
                    if (HiddenField2.Value != "O")
                    {
                        ddlpradhikar.Focus();
                        ddlthekedar.ClearSelection();
                        ddlthekedar.Items.FindByValue(hd_thekedar_id.Value).Selected = true;
                        ddlthekedar.Enabled = false;
                    }
                    else
                    {
                        ddlthekedar.Focus();
                        ddlthekedar.Enabled = true;
                        TextBox2.Text = "----";
                    }
                    Panel1.Visible = false;
                    Panel3.Visible = true;
                }
                else
                {
                    ddlthekedar.ClearSelection();
                    ddlthekedar.Items.FindByValue(hd_thekedar_id.Value).Selected = true;
                    ddlthekedar.Enabled = false;
                    Panel1.Visible = true;
                    Panel3.Visible = false;
                }

                //To hide Report button from panel2
                Button3.Visible = false;
            }
        }
        else
        {
            Button2.Enabled = true;
            Button1.Enabled = false;
        }
        fillLimit();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (HiddenField2.Value.ToString() == "G")
            {
                Insert();

            }
            else
            {
                Insert_panel1();
            }
        }
        catch (Exception ex)
        {

        }
        //ddlpradhikar.Items.Clear();
        Button2.Enabled = true;
        Button1.Enabled = false;
       
    }


    public void Insert_panel1()
    {
        string min = Session["NividaminAmount"].ToString();
        string max = Session["NividamaxAmount"].ToString();
        int minValue = int.Parse(min);
        string nrakkam = TextBox3.Text;
        int Rakkam = int.Parse(nrakkam);
        if (max == "संपुर्ण अधिकार")
        {
            Insert();

            //DataSet ds1 = new DataSet();
            //List<string> plist = new List<string>();
            //setzero();
            //plist.Add(Session["Work_ID"].ToString());
            //plist.Add(ddlpradhikar.SelectedValue.ToString());
            //plist.Add(TextBox1.Text);
            //plist.Add(TextBox4.Text);
            //plist.Add("C");//workstatus
            //plist.Add(ddlswikrutidar.SelectedValue.ToString());
            //if (HiddenField2.Value.ToString() == "G")
            //{
            //    plist.Add(TextBox6.Text);
            //    plist.Add(TextBox7.Text);
            //    plist.Add(bl_ob.convertDate(TextBox5.Text));

            //    // Session["NividaAmount"] = TextBox6.Text;
            //}
            //else
            //{

            //    plist.Add(TextBox3.Text);
            //    plist.Add(txtfinalamount.Text);
            //    plist.Add("1947/1/1");
            //    //  Session["NividaAmount"] = TextBox3.Text;
            //}
            //plist.Add(ddlthekedar.SelectedValue.ToString());
            ////New Added for bayana & suraksha amount
            //plist.Add(TextBox9.Text);
            //plist.Add(bl_ob.convertDate(TextBox10.Text).ToString());
            //plist.Add(TextBox11.Text);
            //plist.Add(TextBox12.Text);
            //plist.Add(bl_ob.convertDate(TextBox13.Text).ToString());
            //plist.Add(TextBox14.Text);
            ////New Added

            //plist.Add(TextBox8.Text);

            //plist.Add(RadioBtnSelectType.SelectedValue.ToString());

            //plist.Add("a");
            //ds1 = bl_ob.ExecuteStoredFunctionWithParameters(plist, "Sp_WorkWise_Contact_Details");
            //lnk_Next.Visible = true;


            //lblmsg.Visible = true;
            //if (ds1.Tables.Count != 0)
            //{
            //    if (ds1.Tables[0].Rows.Count != 0)
            //    {
            //        lblmsg.Text = "Record Inserted ";

            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);

            //    }
            //    else
            //        lblmsg.Text = "Record Already Exists";
            //}
            //List<string> list = new List<string>();
            //list.Add(Session["Work_ID"].ToString());
            //list.Add("6");
            //list.Add(Session["User_Id"].ToString());
            //list.Add(Session["officeid"].ToString());
            //bl_ob.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
            //// Session["SurakshaDetails"] = ds1.Tables[0].Rows[0][10].ToString();
            //btn_nxt.Focus();
            //// ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);   

        }
        else
        {
            int maxValue = int.Parse(max);
            // string pmrakkam = txtPMRakkam.Text;
            //int pmRakkam = int.Parse(pmrakkam);
            if (Rakkam >= minValue && Rakkam <= maxValue)
            {
                Insert();

                //DataSet ds1 = new DataSet();
                //List<string> plist = new List<string>();
                //setzero();
                //plist.Add(Session["Work_ID"].ToString());
                //plist.Add(ddlpradhikar.SelectedValue.ToString());
                //plist.Add(TextBox1.Text);
                //plist.Add(TextBox4.Text);
                //plist.Add("C");//workstatus
                //plist.Add(ddlswikrutidar.SelectedValue.ToString());
                //if (HiddenField2.Value.ToString() == "G")
                //{
                //    plist.Add(TextBox6.Text);
                //    plist.Add(TextBox7.Text);
                //    plist.Add(bl_ob.convertDate(TextBox5.Text));

                //    // Session["NividaAmount"] = TextBox6.Text;
                //}
                //else
                //{

                //    plist.Add(TextBox3.Text);
                //    plist.Add(txtfinalamount.Text);
                //    plist.Add("1947/1/1");
                //    //  Session["NividaAmount"] = TextBox3.Text;
                //}
                //plist.Add(ddlthekedar.SelectedValue.ToString());
                ////New Added for bayana & suraksha amount
                //plist.Add(TextBox9.Text);
                //plist.Add(bl_ob.convertDate(TextBox10.Text).ToString());
                //plist.Add(TextBox11.Text);
                //plist.Add(TextBox12.Text);
                //plist.Add(bl_ob.convertDate(TextBox13.Text).ToString());
                //plist.Add(TextBox14.Text);
                ////New Added

                //plist.Add(TextBox8.Text);

                //plist.Add(RadioBtnSelectType.SelectedValue.ToString());

                //plist.Add("a");
                //ds1 = bl_ob.ExecuteStoredFunctionWithParameters(plist, "Sp_WorkWise_Contact_Details");
                //lnk_Next.Visible = true;


                //lblmsg.Visible = true;
                //if (ds1.Tables.Count != 0)
                //{
                //    if (ds1.Tables[0].Rows.Count != 0)
                //    {
                //        lblmsg.Text = "Record Inserted ";

                //        ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);

                //    }
                //    else
                //        lblmsg.Text = "Record Already Exists";
                //}
                //List<string> list = new List<string>();
                //list.Add(Session["Work_ID"].ToString());
                //list.Add("6");
                //list.Add(Session["User_Id"].ToString());
                //list.Add(Session["officeid"].ToString());
                //bl_ob.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
                //// Session["SurakshaDetails"] = ds1.Tables[0].Rows[0][10].ToString();
                //btn_nxt.Focus();
                //// ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);   

            }

            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "ValidAmount();", true);
              //  lblmsg.Text = "Please enter valid amt";
            }

        }
    }

    public void Insert()
    {

        DataSet ds1 = new DataSet();
        List<string> plist = new List<string>();
        setzero();
        plist.Add(Session["Work_ID"].ToString());
        plist.Add(ddlpradhikar.SelectedValue.ToString());
        plist.Add(TextBox1.Text);
        plist.Add(TextBox4.Text);
        plist.Add("C");//workstatus
        plist.Add(ddlswikrutidar.SelectedValue.ToString());
        if (HiddenField2.Value.ToString() == "G")
        {
            plist.Add(TextBox6.Text);
            plist.Add(TextBox7.Text);
            plist.Add(bl_ob.convertDate(TextBox5.Text));

            // Session["NividaAmount"] = TextBox6.Text;
        }
        else
        {

            plist.Add(TextBox3.Text);
            plist.Add(txtfinalamount.Text);
            plist.Add("1947/1/1");
            //  Session["NividaAmount"] = TextBox3.Text;
        }
        plist.Add(ddlthekedar.SelectedValue.ToString());
        //New Added for bayana & suraksha amount
        plist.Add(TextBox9.Text);
        plist.Add(bl_ob.convertDate(TextBox10.Text).ToString());
        plist.Add(TextBox11.Text);
        plist.Add(TextBox12.Text);
        plist.Add(bl_ob.convertDate(TextBox13.Text).ToString());
        plist.Add(TextBox14.Text);
        //New Added

        plist.Add(TextBox8.Text);

        plist.Add(RadioBtnSelectType.SelectedValue.ToString());

        plist.Add("a");
        ds1 = bl_ob.ExecuteStoredFunctionWithParameters(plist, "Sp_WorkWise_Contact_Details");
        lnk_Next.Visible = true;


       // lblmsg.Visible = true;
        if (ds1.Tables.Count != 0)
        {
            if (ds1.Tables[0].Rows.Count != 0)
            {
               // lblmsg.Text = "Record Inserted ";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);

            }
            else
              //  lblmsg.Text = "Record Already Exists";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkRecord();", true);
        }
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("6");
        list.Add(Session["User_Id"].ToString());
        list.Add(Session["officeid"].ToString());
        bl_ob.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
        // Session["SurakshaDetails"] = ds1.Tables[0].Rows[0][10].ToString();
        btn_nxt.Focus();
        // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);   

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            if (HiddenField2.Value.ToString() == "G")
            {
                Insert_Update();

            }
            else
            {
                Insert_Updatepanel1();
            }
        }
        catch (Exception ex)
        {

        }
       
    }

    public void Insert_Updatepanel1()
    {



        string min = Session["NividaminAmount"].ToString();
        string max = Session["NividamaxAmount"].ToString();
        int minValue = int.Parse(min);
        string nrakkam = TextBox3.Text;
        int Rakkam = int.Parse(nrakkam);
        if (max == "संपुर्ण अधिकार")
        {

            Insert_Update();

            //setzero();
            //DataSet ds2 = new DataSet();
            //List<string> para2 = new List<string>();
            //para2.Add(Session["Work_ID"].ToString());//Set WorkPlain_ID Value session
            //ds2 = bl_ob.FillGridWithParameter(para2, "Sp_FillShifaras_No");
            //TextBox2.DataBind();
            //DataSet ds3 = new DataSet();
            //List<string> plist3 = new List<string>();
            //plist3.Add(Session["Work_ID"].ToString());
            //plist3.Add(ddlpradhikar.SelectedValue.ToString());
            //plist3.Add(TextBox1.Text);
            //plist3.Add(TextBox4.Text);
            //plist3.Add("C");//workstatus
            //plist3.Add(ddlswikrutidar.SelectedValue.ToString());
            //if (HiddenField2.Value.ToString() == "G")
            //{
            //    plist3.Add(TextBox6.Text);
            //    plist3.Add(TextBox7.Text);
            //    plist3.Add(bl_ob.convertDate(TextBox5.Text));
            //    // Session["NividaAmount"] = TextBox6.Text;
            //}
            //else
            //{
            //    plist3.Add(TextBox3.Text);
            //    plist3.Add(txtfinalamount.Text);

            //    plist3.Add("1947/1/1");
            //    // Session["NividaAmount"] = TextBox3.Text;
            //}
            //plist3.Add(ddlthekedar.SelectedValue.ToString());
            ////New Added for bayana & suraksha amount
            //plist3.Add(TextBox9.Text);
            //plist3.Add(bl_ob.convertDate(TextBox10.Text).ToString());
            //plist3.Add(TextBox11.Text);
            //plist3.Add(TextBox12.Text);
            //plist3.Add(bl_ob.convertDate(TextBox13.Text).ToString());
            //plist3.Add(TextBox14.Text);
            ////New Added
            //plist3.Add(TextBox8.Text);
            //plist3.Add(RadioBtnSelectType.SelectedValue.ToString());
            //plist3.Add("u");
            //ds3 = bl_ob.ExecuteStoredFunctionWithParameters(plist3, "Sp_WorkWise_Contact_Details");

            //Session["SurakshaDetails"] = TextBox9.Text;
            //Session["SurakshaDate"] = TextBox10.Text;
            //Session["SurakshaAmount"] = TextBox11.Text;
            //Session["AnamatDetails"] = TextBox12.Text;
            //Session["AnamatDate"] = TextBox13.Text;
            //Session["AnamatAmount"] = TextBox14.Text;
            //Session["Swikruti"] = TextBox8.Text;


            //lblmsg.Visible = true;
            //if (ds3.Tables.Count != 0)
            //{
            //    if (ds3.Tables[0].Rows.Count != 0)
            //    {

            //        List<string> list = new List<string>();
            //        list.Add(Session["Work_ID"].ToString());
            //        list.Add("6");
            //        list.Add(Session["User_Id"].ToString());
            //        list.Add(Session["officeid"].ToString());
            //        bl_ob.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
            //        lblmsg.Text = "Record Updated";
            //    }
            //    else
            //        lblmsg.Text = "Record Already Exists";
            //}
            //fillWorkContractDetails();

            //btn_nxt.Focus();
        }
        else
        {
            int maxValue = int.Parse(max);
            // string pmrakkam = txtPMRakkam.Text;
            //int pmRakkam = int.Parse(pmrakkam);
            if (Rakkam >= minValue && Rakkam <= maxValue)
            {
                Insert_Update();
                //setzero();
                //DataSet ds2 = new DataSet();
                //List<string> para2 = new List<string>();
                //para2.Add(Session["Work_ID"].ToString());//Set WorkPlain_ID Value session
                //ds2 = bl_ob.FillGridWithParameter(para2, "Sp_FillShifaras_No");
                //TextBox2.DataBind();
                //DataSet ds3 = new DataSet();
                //List<string> plist3 = new List<string>();
                //plist3.Add(Session["Work_ID"].ToString());
                //plist3.Add(ddlpradhikar.SelectedValue.ToString());
                //plist3.Add(TextBox1.Text);
                //plist3.Add(TextBox4.Text);
                //plist3.Add("C");//workstatus
                //plist3.Add(ddlswikrutidar.SelectedValue.ToString());
                //if (HiddenField2.Value.ToString() == "G")
                //{
                //    plist3.Add(TextBox6.Text);
                //    plist3.Add(TextBox7.Text);
                //    plist3.Add(bl_ob.convertDate(TextBox5.Text));
                //    // Session["NividaAmount"] = TextBox6.Text;
                //}
                //else
                //{
                //    plist3.Add(TextBox3.Text);
                //    plist3.Add(txtfinalamount.Text);

                //    plist3.Add("1947/1/1");
                //    // Session["NividaAmount"] = TextBox3.Text;
                //}
                //plist3.Add(ddlthekedar.SelectedValue.ToString());
                ////New Added for bayana & suraksha amount
                //plist3.Add(TextBox9.Text);
                //plist3.Add(bl_ob.convertDate(TextBox10.Text).ToString());
                //plist3.Add(TextBox11.Text);
                //plist3.Add(TextBox12.Text);
                //plist3.Add(bl_ob.convertDate(TextBox13.Text).ToString());
                //plist3.Add(TextBox14.Text);
                ////New Added
                //plist3.Add(TextBox8.Text);
                //plist3.Add(RadioBtnSelectType.SelectedValue.ToString());
                //plist3.Add("u");
                //ds3 = bl_ob.ExecuteStoredFunctionWithParameters(plist3, "Sp_WorkWise_Contact_Details");

                //Session["SurakshaDetails"] = TextBox9.Text;
                //Session["SurakshaDate"] = TextBox10.Text;
                //Session["SurakshaAmount"] = TextBox11.Text;
                //Session["AnamatDetails"] = TextBox12.Text;
                //Session["AnamatDate"] = TextBox13.Text;
                //Session["AnamatAmount"] = TextBox14.Text;
                //Session["Swikruti"] = TextBox8.Text;


                //lblmsg.Visible = true;
                //if (ds3.Tables.Count != 0)
                //{
                //    if (ds3.Tables[0].Rows.Count != 0)
                //    {

                //        List<string> list = new List<string>();
                //        list.Add(Session["Work_ID"].ToString());
                //        list.Add("6");
                //        list.Add(Session["User_Id"].ToString());
                //        list.Add(Session["officeid"].ToString());
                //        bl_ob.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
                //        lblmsg.Text = "Record Updated";
                //    }
                //    else
                //        lblmsg.Text = "Record Already Exists";
                //}
                //fillWorkContractDetails();

                //btn_nxt.Focus();
            }

            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "ValidAmount();", true);
              //  lblmsg.Text = "Please enter valid amt";
            }

        }
       
    }

    public void Insert_Update()
    {
        setzero();
        DataSet ds2 = new DataSet();
        List<string> para2 = new List<string>();
        para2.Add(Session["Work_ID"].ToString());//Set WorkPlain_ID Value session
        ds2 = bl_ob.FillGridWithParameter(para2, "Sp_FillShifaras_No");
        TextBox2.DataBind();
        DataSet ds3 = new DataSet();
        List<string> plist3 = new List<string>();
        plist3.Add(Session["Work_ID"].ToString());
        plist3.Add(ddlpradhikar.SelectedValue.ToString());
        plist3.Add(TextBox1.Text);
        plist3.Add(TextBox4.Text);
        plist3.Add("C");//workstatus
        plist3.Add(ddlswikrutidar.SelectedValue.ToString());
        if (HiddenField2.Value.ToString() == "G")
        {
            plist3.Add(TextBox6.Text);
            plist3.Add(TextBox7.Text);
            plist3.Add(bl_ob.convertDate(TextBox5.Text));
            // Session["NividaAmount"] = TextBox6.Text;
        }
        else
        {
            plist3.Add(TextBox3.Text);
            plist3.Add(txtfinalamount.Text);

            plist3.Add("1947/1/1");
            // Session["NividaAmount"] = TextBox3.Text;
        }
        plist3.Add(ddlthekedar.SelectedValue.ToString());
        //New Added for bayana & suraksha amount
        plist3.Add(TextBox9.Text);
        plist3.Add(bl_ob.convertDate(TextBox10.Text).ToString());
        plist3.Add(TextBox11.Text);
        plist3.Add(TextBox12.Text);
        plist3.Add(bl_ob.convertDate(TextBox13.Text).ToString());
        plist3.Add(TextBox14.Text);
        //New Added
        plist3.Add(TextBox8.Text);
        plist3.Add(RadioBtnSelectType.SelectedValue.ToString());
        plist3.Add("u");
        ds3 = bl_ob.ExecuteStoredFunctionWithParameters(plist3, "Sp_WorkWise_Contact_Details");

        Session["SurakshaDetails"] = TextBox9.Text;
        Session["SurakshaDate"] = TextBox10.Text;
        Session["SurakshaAmount"] = TextBox11.Text;
        Session["AnamatDetails"] = TextBox12.Text;
        Session["AnamatDate"] = TextBox13.Text;
        Session["AnamatAmount"] = TextBox14.Text;
        Session["Swikruti"] = TextBox8.Text;


       // lblmsg.Visible = true;
        if (ds3.Tables.Count != 0)
        {
            if (ds3.Tables[0].Rows.Count != 0)
            {

                List<string> list = new List<string>();
                list.Add(Session["Work_ID"].ToString());
                list.Add("6");
                list.Add(Session["User_Id"].ToString());
                list.Add(Session["officeid"].ToString());
                bl_ob.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
              //  lblmsg.Text = "Record Updated";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
            }
            else
               // lblmsg.Text = "Record Already Exists";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkRecord();", true);
        }
        fillWorkContractDetails();

        btn_nxt.Focus();
    
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void TextBox4_lostfocus(object sender, EventArgs e)
    {
        if (ddlswikrutidar.SelectedValue.Equals("Above"))
        {
            float d = float.Parse(TextBox3.Text) + (float.Parse(TextBox3.Text) * (float.Parse(TextBox4.Text) / 100));
            txtfinalamount.Text = d.ToString();
        }
        else if (ddlswikrutidar.SelectedValue.Equals("b"))
        {
            float b = float.Parse(TextBox3.Text) - (float.Parse(TextBox3.Text) * (float.Parse(TextBox4.Text) / 100));
            txtfinalamount.Text = b.ToString();
        }
        else if (ddlswikrutidar.SelectedValue.Equals("e"))
        {
            Int32 c = Int32.Parse(TextBox3.Text);
            txtfinalamount.Text = c.ToString();
        }
    }
    protected void ddlswikrutidar_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox4.Text = "";
        txtfinalamount.Text = "";
        if (ddlswikrutidar.SelectedValue.ToString() == "e")
        {
            TextBox4.Text = "0";
        }
        TextBox4.Focus();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
    protected void fillddlpradhikar()
    {
        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        ds = bl_ob.FillGridWithParameter(plist, "sp_Nivida_Master");
        ddlpradhikar.DataValueField = "NPID";
        ddlpradhikar.DataTextField = "NividaName";
        ddlpradhikar.DataSource = ds.Tables[0];
        ddlpradhikar.DataBind();
        ddlpradhikar.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    public void fillddl1()
    {
        DataSet ds2 = new DataSet();
        List<string> plist = new List<string>();
        if (HiddenField2.Value.ToString() != "G")
        {
            plist.Add(HiddenField2.Value.ToString());
            ddlthekedar.DataValueField = "ThekedarId";
            ddlthekedar.DataTextField = "ThekedarName";
            ds2 = bl_ob.FillGridWithParameter(plist, "Sp_FillThekedar");
        }
        else
        {
            plist.Add(Session["talukaId"].ToString());
            ddlthekedar.DataValueField = "gp_id";
            ddlthekedar.DataTextField = "g_name";
            ds2 = bl_ob.FillGridWithParameter(plist, "sp_fillGram");
        }
        ddlthekedar.DataSource = ds2;
        ddlthekedar.DataBind();
        ddlthekedar.Items.Insert(0, new ListItem("--Select--", ""));
    }
    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlswikrutidar.SelectedValue.Equals("1"))
            {
                float d = float.Parse(TextBox3.Text) + (float.Parse(TextBox3.Text) * (float.Parse(TextBox4.Text) / 100));
                txtfinalamount.Text = d.ToString();
            }
            else if (ddlswikrutidar.SelectedValue.Equals("2"))
            {
                float b = float.Parse(TextBox3.Text) - (float.Parse(TextBox3.Text) * (float.Parse(TextBox4.Text) / 100));
                txtfinalamount.Text = b.ToString();
            }
            else
            {
                txtfinalamount.Text = TextBox3.Text;
            }
        }
        catch (Exception ex)
        { }
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Report/majurTender.aspx");
    }
    protected void ddlpradhikar_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillLimit();
    }
    protected void fillLimit()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> plist = new List<string>();
            plist.Add(ddlpradhikar.SelectedValue.ToString());
            plist.Add("n");// for pradhikar
            ds = bl_ob.FillGridWithParameter(plist, "sp_pradhikarlimit");
            if (ds.Tables.Count != 0)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Label9.Text = ds.Tables[0].Rows[0][0].ToString() + "&nbsp;" + "ते" + "&nbsp;" + ds.Tables[0].Rows[0][1].ToString();
                    Session["NividaminAmount"] = ds.Tables[0].Rows[0][0].ToString();
                    Session["NividamaxAmount"] = ds.Tables[0].Rows[0][1].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            //Label6.Text = "";
            //Label10.Text = "";
        }
    }
    protected void Gram_add_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(TextBox1.Text);
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add("1");
            para.Add("1");
            para.Add("a");
            ds = bl_ob.FillGridWithParameter(para, "sp_grampanchayatnivida");
            if (ds.Tables.Count != 0)
            {
                Label5.Text = "Record Already Exist";
            }
            else
            {
                Label5.Text = "Record Inserted";
            }
            Button1.Enabled = true;
            Button2.Enabled = false;
            clearall();
        }
        catch (Exception ex)
        {

        }
    }
    protected void Gram_update_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(TextBox1.Text);
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add("1");
            para.Add("1");
            para.Add("u");
            ds = bl_ob.FillGridWithParameter(para, "sp_grampanchayatnivida");
            if (ds.Tables.Count != 0)
            {
                Label5.Text = "Record Already Exist";
            }
            else
            {
                Label5.Text = "Record Updated";
            }
            clearall();
        }
        catch (Exception ex)
        {

        }
    }
    protected void gram_set_Click(object sender, EventArgs e)
    {
        //ddlpradhikar.Focus();
        //clearall();       
    }
    public void clearall()
    {
        //ddlthekedar.Items.Clear();
        ddlpradhikar.Items.Clear();
        TextBox1.Text = "";
       
        TextBox3.Text = "";
        ddlswikrutidar.Items.Clear();
        TextBox4.Text = "";
        TextBox8.Text = "";
        txtfinalamount.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
        TextBox12.Text = "";
        TextBox13.Text = "";
        TextBox14.Text = "";
    }
    protected void btn_nxt_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Kararnama.aspx");
    }
    protected void link_thekedar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Thekedar Master.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/NividaPradhikarMaster.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        ddlpradhikar.Focus();
        clearall();
    }
    protected void txtfinalamount_TextChanged(object sender, EventArgs e)
    {

    }
    protected void RadioBtnSelectType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioBtnSelectType.SelectedValue == "Percentage")
        {
            Panel2.Visible = true;
            Panel4.Visible = false;


         // ViewState["Percentage"]=
              //RadioBtnSelectType.Items.FindByValue(dst.Tables[1].Rows[0][17].ToString()).Selected = true;
           // RadioBtnSelectType.Items.FindByValue("Percentage").Selected = true;
            //http://www.c-sharpcorner.com/UploadFile/225740/what-is-view-state-and-how-it-works-in-Asp-Net53/
        }
        else
        {
            Panel2.Visible = false;
            Panel4.Visible = true;
           // RadioBtnSelectType.Items.FindByValue("Amount").Selected = true;

            // txtfinalamount.Text = TextBox3.Text - TextBox8.Text;

        }
    }
    protected void TextBox8_TextChanged(object sender, EventArgs e)
    {
        float d = float.Parse(TextBox3.Text) - float.Parse(TextBox8.Text);
        txtfinalamount.Text = d.ToString();
    }

    //For disable next stage button 17/8/2015
    protected void Checkstagestatus()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("6");
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
}
