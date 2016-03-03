using System;
using System.IO;
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
using System.Data.SqlClient;

public partial class Form_WorkComplitionDetails_for_AccountBranch : System.Web.UI.Page
{
    //string wid;
    BussinessLayer.BusinessLayerclass obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");
            if (!Page.IsPostBack)
            {

                ddlyear.Focus();
                DDlFill();
                filldetails();

                lblTalukatext.Text = "कामाचे नाव : " + Session["Workname"].ToString();
                //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
                //         + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();

            }
        }
        catch (Exception ex)
        { }

    }
    public void DDlFill()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["year"].ToString());
        ds = obj.FillGridWithParameter(para, "sp_Fill_YearMaster");
        ddlyear.DataValueField = "YearId";
        ddlyear.DataTextField = "Year";
        ddlyear.DataSource = ds;
        ddlyear.DataBind();
        ddlyear.Items.Insert(0, (new ListItem("---Select---", "")));
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());
            para.Add(ddlyear.SelectedValue.ToString());
            para.Add(txtdosh.Text);
            para.Add(TextBox1.Text);
            para.Add(RadioBtn_Dosh.SelectedValue.ToString());
            para.Add("Y");
            ds = obj.ExecuteStoredFunctionWithParameters(para, "update_workDetailAccount");
            //wid = ds.Tables[0].Rows[0][0].ToString();



            //File Upload


            //HttpFileCollection uploadedFiles = Request.Files;
            //for (int i = 0; i < uploadedFiles.Count; i++)
            //{
            //    HttpPostedFile userPostedFile = uploadedFiles[i];
            //    try
            //    {
            //        if (userPostedFile.ContentLength > 0)
            //        {

            //            List<string> para1 = new List<string>();
            //            para1.Add(Session["Work_ID"].ToString());
            //            para1.Add(Label10.Text);

            //            int intImageSize = 0;
            //            string strImageType;
            //            Stream ImageStream;

            //            //intImageSize = FileUpload1.PostedFile.ContentLength;

            //            intImageSize = userPostedFile.ContentLength;


            //            // strImageType = FileUpload1.PostedFile.ContentType;
            //            strImageType = userPostedFile.ContentType;

            //            // ImageStream = FileUpload1.PostedFile.InputStream;
            //            ImageStream = userPostedFile.InputStream;


            //            byte[] ImageContent = new byte[intImageSize];

            //            int intStatus;

            //            intStatus = ImageStream.Read(ImageContent, 0, intImageSize);

            //            string cnstring;
            //            cnstring = System.Configuration.ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            //            SqlConnection myConnection = new SqlConnection(cnstring);

            //            SqlCommand myCommand = new SqlCommand("Sp_WorkCompletedImageUpload", myConnection);
            //            myCommand.CommandType = CommandType.StoredProcedure;

            //            SqlParameter Image_Idsp = new SqlParameter("@image1_ID", SqlDbType.BigInt);

            //            Image_Idsp.Value = Convert.ToInt64("1");

            //            myCommand.Parameters.Add(Image_Idsp);

            //            SqlParameter Image_Iconsp = new SqlParameter("@image1", SqlDbType.Image);

            //            Image_Iconsp.Value = ImageContent;

            //            myCommand.Parameters.Add(Image_Iconsp);

            //            SqlParameter Image_Typesp = new SqlParameter("@imagetype1", SqlDbType.VarChar, 255);

            //            Image_Typesp.Value = strImageType;

            //            myCommand.Parameters.Add(Image_Typesp);


            //            SqlParameter workid = new SqlParameter("@workplanningID", SqlDbType.BigInt);

            //            workid.Value = Convert.ToInt64(Session["Work_ID"].ToString());

            //            myCommand.Parameters.Add(workid);





            //myConnection.Open();

            //myCommand.ExecuteNonQuery();

            //myConnection.Close();

            //        }

            //    }
            //    catch
            //    {

            //    }


            //}




            if (ds.Tables.Count != 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
                // lblmsg.Text = "Record Updated";
            }
            else
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
                // lblmsg.Text = "Record inserted";
            }

           
            worksummery.Attributes.Add("Style", "Visibility:Visible");


            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("15");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");



        }

        catch (Exception ea)
        {
        }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtdosh);
        plist.Add(TextBox1);
        obj.Textboxstring(plist);
    }
    public void filldetails()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());
            ds = obj.filldetails2(para);
            if (ds.Tables[0].Rows.Count != 0)
            {
                ddlyear.Items.FindByValue(ds.Tables[0].Rows[0][0].ToString()).Selected = true;

                TextBox1.Text = ds.Tables[0].Rows[0][2].ToString();
                if (ds.Tables[0].Rows[0][3].ToString() == "Yes")
                {
                    RadioBtn_Dosh.ClearSelection();
                    RadioBtn_Dosh.Items.FindByValue("Yes").Selected = true;
                    Panel_txtdosh.Visible = true;
                    txtdosh.Text = ds.Tables[0].Rows[0][1].ToString();
                }
                else
                {
                    RadioBtn_Dosh.ClearSelection();
                    RadioBtn_Dosh.Items.FindByValue("No").Selected = true;
                }


            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }



    protected void RadioBtn_Dosh_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioBtn_Dosh.SelectedValue == "Yes")
        {
            Panel_txtdosh.Visible = true;
        }
        else
        {
            Panel_txtdosh.Visible = false;
        }
    }


    //Added for Closing work
    protected void btnCloseWork_Click(object sender, EventArgs e)
    {
        List<string> paralist = new List<string>();
        paralist.Add(Session["Work_ID"].ToString());//Session["WorkId"].ToString();

        //Flag for closing work
        paralist.Add("Z");
        DataSet ds1 = new DataSet();
        ds1 = obj.FillGridWithParameter(paralist, "Sp_Close_Work_Wms");
        ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "addd();", true);
    }
    protected void btnSummery_Click(object sender, EventArgs e)
    {

        //Used for displaying all stage data
        workdetails.Attributes.Add("Style", "Visibility:Visible");

        List<string> paralist = new List<string>();
        paralist.Add(Session["Work_ID"].ToString());//Session["WorkId"].ToString();

        //Flag for closing work
        // paralist.Add("Z");
        DataSet ds1 = new DataSet();
        ds1 = obj.FillGridWithParameter(paralist, "Sp_Close_Work");
        if (ds1.Tables.Count != 0)
        {
            if (ds1.Tables[0].Rows.Count != 0)
            {

                lblWorkName.Text = ds1.Tables[0].Rows[0][0].ToString();
                lblGav.Text = ds1.Tables[0].Rows[0][1].ToString();

                lblTaluka.Text = ds1.Tables[0].Rows[0][2].ToString();
                lblZilha.Text = ds1.Tables[0].Rows[0][3].ToString();

                lblVibhag.Text = ds1.Tables[0].Rows[0][4].ToString();
                lblAbhiyanta.Text = ds1.Tables[0].Rows[0][5].ToString();
                lblAndajpatrkiyRakkam.Text = ds1.Tables[0].Rows[0][6].ToString() + ".00";
                lblLakhashirsh.Text = ds1.Tables[0].Rows[0][7].ToString();
                lblPmr.Text = ds1.Tables[0].Rows[0][8].ToString() + ".00";

                lblTmr.Text = ds1.Tables[0].Rows[0][9].ToString() + ".00";
                lblNividaRakkam.Text = ds1.Tables[0].Rows[0][10].ToString() + ".00";
                lblSurakshaAnamatRakkam.Text = ds1.Tables[0].Rows[0][11].ToString() + ".00";
                lblBayanaRakkam.Text = ds1.Tables[0].Rows[0][12].ToString() + ".00";
                lblKamSuruDate.Text = ds1.Tables[0].Rows[0][13].ToString();
                lblKamachiMudat.Text = ds1.Tables[0].Rows[0][14].ToString();
                lblEkunKharch.Text = ds1.Tables[0].Rows[0][15].ToString() + ".00";
                lblKamPurnDate.Text = ds1.Tables[0].Rows[0][16].ToString();
                lblPurntwachaDakhla.Text = ds1.Tables[0].Rows[0][17].ToString();
                lblUpyogitaCertificate.Text = ds1.Tables[0].Rows[0][18].ToString();
                lblLekhaSanstha.Text = ds1.Tables[0].Rows[0][19].ToString();
                lblKamAhwal.Text = ds1.Tables[0].Rows[0][20].ToString();
                lblVasuliAction.Text = ds1.Tables[0].Rows[0][21].ToString();
                lblAhwalPurtata.Text = ds1.Tables[0].Rows[0][22].ToString();
                lblPutataAhval.Text = ds1.Tables[0].Rows[0][23].ToString();
                lblAnudanRakkam.Text = ds1.Tables[1].Rows[0][0].ToString() + ".00";
            }
        }

        closework.Attributes.Add("Style", "Visibility:Visible");
    }
}
