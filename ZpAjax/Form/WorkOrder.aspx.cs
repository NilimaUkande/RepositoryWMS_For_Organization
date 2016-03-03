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
using BusinessLayer;

public partial class Form_WorkOrder : System.Web.UI.Page
{

    BussinessLayer.BusinessLayerclass bl_ob = new BussinessLayer.BusinessLayerclass();

    protected void Page_Load(object sender, EventArgs e)
    { try
    {       
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {
           
                txtWorkOrderNo.Focus();
                filltekedarid();
                fillworkorder();
               



                List<string> list = new List<string>();
                list.Add(Session["Work_ID"].ToString());//Session["WorkId"].ToString();
                DataSet ds1 = new DataSet();
                ds1 = bl_ob.FillGridWithParameter(list, "sp_select_info_work_forShifaras");
                if (ds1.Tables.Count != 0)
                {
                    if (ds1.Tables[0].Rows.Count != 0)
                    {
                        lblAndajPatrkiy.Text = ds1.Tables[0].Rows[0][1].ToString() + ".00";

                        lblPrashaskiyManyata.Text = ds1.Tables[0].Rows[0][2].ToString() + ".00";
                        lblTantrikManyata.Text = ds1.Tables[0].Rows[0][3].ToString() + ".00";

                        lblAnudan.Text = ds1.Tables[0].Rows[0][0].ToString() + ".00";

                    }
                   // Button3.Enabled = true;
                }




            }

        lblTalukatext.Text = "कामाचे नाव : " + Session["Workname"].ToString();
        //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
        //+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();

        //Checkstagestatus();
        }
            catch (Exception ex)
            {
            }

    Checkstagestatus();

    }

    public void filltekedarid()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["Work_ID"].ToString()); //set the workDetailsID in session
        //ds = bl_ob.FillGridWithParameter(para,"Sp_FillTekedar_ID");
        ds = bl_ob.FillGridWithParameter(para, "Sp_FillTekedar_ID_new");

        if (ds.Tables[0].Rows.Count != 0)
        {
            HiddenField1.Value = ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            HiddenField1.Value = ds.Tables[0].Rows[0][0].ToString();
        }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtWorkOrderNo);
        plist.Add(txtWorkValidity);
        plist.Add(TextBox1);
        bl_ob.TextboxNull(plist);
    }

    public void fillworkorder()

    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["Work_ID"].ToString());//set the workplaningid session
        ds=bl_ob.FillGridWithParameter(para,"Sp_Fill_WorkwiseOrderDetails");

        if (ds.Tables[0].Rows.Count != 0)
        {
            btnSave.Enabled = false;
            btnUpdate.Enabled = true;
            Button3.Enabled = true;

            txtWorkOrderNo.Text = ds.Tables[0].Rows[0][0].ToString();
            txtWorkOrderDate.Text =  ds.Tables[0].Rows[0][1].ToString();
            txtWorkValidity.Text = ds.Tables[0].Rows[0][2].ToString();
            txtWorkFromDate.Text = ds.Tables[0].Rows[0][3].ToString();
            txtToDate.Text =ds.Tables[0].Rows[0][4].ToString();
            txtWorkStartDate.Text = ds.Tables[0].Rows[0][5].ToString();
            TextBox1.Text = ds.Tables[0].Rows[0][6].ToString();
            txtNewsPaperName.Text = ds.Tables[0].Rows[0][7].ToString();

        }
        else
        {
            clearall();
            btnSave.Enabled = true;
            btnUpdate.Enabled = false;
            Button3.Enabled = false;
        }
    
    }

    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
           setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());//Set the Session WorkDetail_ID 
            //para.Add("5");
            para.Add(HiddenField1.Value.ToString());//thedkedarID
            para.Add(txtWorkOrderNo.Text);
            string date = bl_ob.convertDate(txtWorkOrderDate.Text);
            para.Add(date);
            para.Add(txtWorkValidity.Text);
            string date1 = bl_ob.convertDate(txtWorkFromDate.Text);
            para.Add(date1);
            Session["WorkStartDate"] = txtWorkFromDate.Text;
            string date2 = bl_ob.convertDate(txtToDate.Text);
            para.Add(date2);
        
            if (txtWorkStartDate.Text != "")
            {
                string date3 = bl_ob.convertDate(txtWorkStartDate.Text);
                para.Add(date3);               
                para.Add(TextBox1.Text);
                para.Add(txtNewsPaperName.Text);
                para.Add("S");
            }
            else
            {
                string date3 = bl_ob.convertDate(txtWorkStartDate.Text);
                para.Add(date3);
                para.Add(TextBox1.Text);
                para.Add(txtNewsPaperName.Text);
                para.Add("C");
            }
           
            para.Add("a");
            ds = bl_ob.ExecuteStoredFunctionWithParameters(para, "Sp_Tbl_WorkWiseOrderDetails");
           

            if (ds.Tables.Count != 0)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {

                   // Label2.Text = "Record Inserted";

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
                  
                }

                else
                {
                   // Label2.Text = "Record Already Exists";
                  //  Label2.Text = "Record updated";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
                }
            }


            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("8");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            bl_ob.ExecuteStoredFunctionWithParameters(list, "sp_Stage_Tracking_insert");

          //  Label2.Visible = true; 
            btnUpdate.Enabled = true;
            btnSave.Enabled = false;
            fillworkorder();
            btn_nxt.Focus();
            lnk_Next.Visible = true;
        }
        catch (Exception ex)
        {

        }

        //btnUpdate.Enabled = true;
        //btnSave.Enabled = false;
        Button3.Enabled = true;
    }
 
   
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            
               setzero();
                DataSet ds = new DataSet();
                List<string> para = new List<string>();
                para.Add(Session["Work_ID"].ToString());//Set the Session WorkDetail_ID 
                para.Add(HiddenField1.Value.ToString());//thedkedarID
                para.Add(txtWorkOrderNo.Text);
                string date = bl_ob.convertDate(txtWorkOrderDate.Text);
                para.Add(date);
                para.Add(txtWorkValidity.Text);
                string date1 = bl_ob.convertDate(txtWorkFromDate.Text);
                para.Add(date1);
                Session["WorkStartDate"] = txtWorkFromDate.Text;
                string date2 = bl_ob.convertDate(txtToDate.Text);
                para.Add(date2);



                if (txtWorkStartDate.Text != "")
                {
                    string date3 = bl_ob.convertDate(txtWorkStartDate.Text);
                    para.Add(date3);

                    para.Add(TextBox1.Text);
                    para.Add(txtNewsPaperName.Text);
                    para.Add("S");
                }
                else
                {
                    string date3 = bl_ob.convertDate(txtWorkStartDate.Text);
                    para.Add(date3);
                    para.Add(TextBox1.Text);
                    para.Add(txtNewsPaperName.Text);
                    para.Add("C");
                }
               // para.Add(txtNewsPaperName.Text);
                para.Add("U");
                ds = bl_ob.ExecuteStoredFunctionWithParameters(para, "Sp_Tbl_WorkWiseOrderDetails");
              //  Label2.Text = "Record Updated";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
                List<string> list = new List<string>();
                list.Add(Session["Work_ID"].ToString());
                list.Add("8");
                list.Add(Session["User_Id"].ToString());
                list.Add(Session["officeid"].ToString());
                bl_ob.ExecuteStoredFunctionWithParameters(list, "sp_Stage_Tracking_insert");

              //  Label2.Visible = true;
                fillworkorder();
                btn_nxt.Focus();
              
        }
        catch (Exception ex)
        {

        }

        Button3.Enabled = true;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Report/workorderReports.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
    protected void txtWorkFromDate_TextChanged(object sender, EventArgs e)
    {

        System.DateTime today = Convert.ToDateTime(txtToDate.Text).AddMonths(Convert.ToInt32(txtWorkValidity.Text));
        txtToDate.Text = today.ToString();
    }
    protected void btn_nxt_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Form/WorkStatusDetails.aspx");
    }
    protected void txtWorkOrderDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            txtWorkFromDate.Text = txtWorkOrderDate.Text;
            txtWorkValidity.Focus();
        }
        catch (Exception ex)
        { }
    }
    protected void txtWorkValidity_TextChanged(object sender, EventArgs e)
    {
        try
        {
            txtToDate.Text = "";
            if (txtWorkValidity.Text != "")
            {
                DateTime date = DateTime.ParseExact(txtWorkFromDate.Text, "dd/MM/yyyy", null);

                System.DateTime today = date.AddMonths(Convert.ToInt32(txtWorkValidity.Text));
                //string Date1 = string.Format("{0:dd/MM/yyyy}", today.ToString());
                DateTime Date = Convert.ToDateTime(today.ToString());
                txtToDate.Text = Date.ToString("dd/MM/yyyy");
                txtWorkStartDate.Focus();
            }
        }
        catch (Exception ex)
        { }
    }


    //code for enabling next button
    protected void Checkstagestatus()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("8");
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
