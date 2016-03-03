using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Data.Sql;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BussinessLayer;
using System.IO;


public partial class Form_WorkStatusDetails : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        try
        {
            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");
            if (!IsPostBack)
            {

                DataSet ds = new DataSet();
                List<string> list = new List<string>();
                list.Add(Session["Work_ID"].ToString());
                ds = bl_obj.FillGridWithParameter(list, "SP_Fetch_NividaAmount_workFromDate");


                lblStartDate_NividaAmount.Text = "काम सुरु दिनांक : " + ds.Tables[0].Rows[0][1].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    + "निविदा रक्कम : " + ds.Tables[0].Rows[0][0].ToString();

                Session["NividaAmount"] = ds.Tables[0].Rows[0][0].ToString();
                Session["WorkStartDate"] = ds.Tables[0].Rows[0][1].ToString();

                lblTalukatext.Text = "कामाचे नाव : " + Session["Workname"].ToString();
                //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
                // + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();


                Checkstagestatus();
                btnUpdated.Enabled = false;

                Clearall();
                TextBox1.Focus();
                FillGrid();
               // fillrecord();
                FillImage_Befor();
                FillImage_progress();
                fillimage_Complete();

            }

        }
        catch (Exception ex)
        { }
        //Checkstagestatus();

    }
    public void Clearall()
    {
        TextBox1.Text = "";
        txtarthik.Text = "";
        txtarthik1.Text = "";
        txtbhutic.Text = "";
        txtbhutic1.Text = "";

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> plist = new List<string>();
            plist.Add(Session["Work_ID"].ToString());//workid
            
            //plist.Add(HiddenField1.Value.ToString());

            plist.Add(bl_obj.convertDate(TextBox1.Text).ToString());

            plist.Add(txtarthik.Text);
            plist.Add(txtbhutic.Text);

           // plist.Add(TextBox2.Text);
           // plist.Add(bl_obj.convertDate(TextBox4.Text).ToString());
            //plist.Add(TextBox3.Text);

           // plist.Add(TextBox8.Text);
          //  plist.Add(bl_obj.convertDate(TextBox7.Text).ToString());
           // plist.Add(TextBox9.Text);

           plist.Add(txtarthik1.Text);
           // plist.Add(TextBox5.Text);
          //  plist.Add(TextBox11.Text);

            plist.Add(txtbhutic1.Text);
            //plist.Add(TextBox6.Text);
           // plist.Add(TextBox12.Text);

           // plist.Add(eco4.Text);
           // plist.Add(bl_obj.convertDate(date4.Text).ToString());
          //  plist.Add(phy4.Text);
          //  plist.Add(eco5.Text);
           // plist.Add(bl_obj.convertDate(date5.Text).ToString());
           // plist.Add(phy5.Text);

           // plist.Add(actualeco4.Text);
          
          //  plist.Add(actualeco5.Text);
          //  plist.Add(actualphy4.Text);
           // plist.Add(actualphy5.Text);

          //  plist.Add("a");
            //added for comparing amount with nivida amount

            //float TotalArthik, NividaAmount, one, two, three,four,five;
            float TotalArthik, NividaAmount, one;
            one = float.Parse(txtarthik.Text);

           // two = float.Parse(TextBox2.Text);
          //  three = float.Parse(TextBox8.Text);

          //  four = float.Parse(eco4.Text);
           // five = float.Parse(eco5.Text);

            NividaAmount = float.Parse(Session["NividaAmount"].ToString());
            //  NividaAmount = float.Parse(Session["NividaAmount"].ToString());
            //TotalArthik = one + two + three;
          // TotalArthik = one + two + three + four + five;
            TotalArthik = one;
           CheckFirstStepDate();
            if (TotalArthik > NividaAmount)
            {
               // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkAmount();", true);
                Label8.Text = "Total of three amounts should not be greater than Nivida Amount";
            }
            else
            {

                ds = bl_obj.ExecuteStoredFunctionWithParameters(plist, "sp_Tbl_Work_ProcessDetails_Insert");
              //  ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
                Label8.Text = "Record Inserted";
                lnk_Next.Visible = true;
                List<string> list = new List<string>();
                list.Add(Session["Work_ID"].ToString());
                list.Add("9");
                list.Add(Session["User_Id"].ToString());
                list.Add(Session["officeid"].ToString());
                bl_obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
                FillGrid();
                Clearall();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "disable_control();", true);
            }
            //added for comparing amount with nivida amount
         }
        catch (Exception ex)
        { }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtarthik);
        plist.Add(TextBox2);
        plist.Add(TextBox8);
        plist.Add(txtarthik1);
        plist.Add(TextBox5);
        plist.Add(TextBox11);
        //added for arthik
        plist.Add(eco4);
        plist.Add(eco5);
        plist.Add(actualeco4);
        plist.Add(actualeco5);
        ////
        bl_obj.TextboxNull(plist);
        plist.Clear();

        plist.Add(txtbhutic);
        plist.Add(TextBox3);
        plist.Add(TextBox9);
        plist.Add(txtbhutic1);
        plist.Add(TextBox6);
        plist.Add(TextBox12);
        ////added for bhotik
        plist.Add(phy4);
        plist.Add(phy5);
        plist.Add(actualphy4);
        plist.Add(actualphy5);
        ////
        bl_obj.Textboxstring(plist);
        plist.Clear();

        //plist.Add(TextBox1);
        //plist.Add(TextBox4);
        //plist.Add(TextBox7);
        ////added for date
        //plist.Add(date4);
        //plist.Add(date5);
        ////
        bl_obj.Textboxdate(plist);

    }
    protected void btnUpdated_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> plist = new List<string>();
            plist.Add(Session["Work_ID"].ToString());//workid
            plist.Add(HiddenField1.Value.ToString());
            plist.Add(txtarthik.Text);

            plist.Add(bl_obj.convertDate(TextBox1.Text).ToString());
            plist.Add(txtbhutic.Text);

           // plist.Add(TextBox2.Text);
           // plist.Add(bl_obj.convertDate(TextBox4.Text).ToString());
            //plist.Add(TextBox3.Text);

           // plist.Add(TextBox8.Text);
           // plist.Add(bl_obj.convertDate(TextBox7.Text).ToString());
           // plist.Add(TextBox9.Text);

          plist.Add(txtarthik1.Text);
            //plist.Add(TextBox5.Text);
          //  plist.Add(TextBox11.Text);

            plist.Add(txtbhutic1.Text);
           // plist.Add(TextBox6.Text);
          //  plist.Add(TextBox12.Text);

          //  plist.Add(eco4.Text);
           // plist.Add(bl_obj.convertDate(date4.Text).ToString());
           // plist.Add(phy4.Text);
          //  plist.Add(eco5.Text);
          //  plist.Add(bl_obj.convertDate(date5.Text).ToString());
          //  plist.Add(phy5.Text);

           // plist.Add(actualeco4.Text);
           
           // plist.Add(actualeco5.Text);
          //  plist.Add(actualphy4.Text);
          //  plist.Add(actualphy5.Text);

           // plist.Add("u");

            //added for comparing amount with nivida amount
            float TotalArthik, NividaAmount, one;
           // float TotalArthik, NividaAmount, one, two, three, four, five;
            one = float.Parse(txtarthik.Text);
           // two = float.Parse(TextBox2.Text);
          //  three = float.Parse(TextBox8.Text);

           // four = float.Parse(eco4.Text);
           // five = float.Parse(eco5.Text);

            NividaAmount = float.Parse(Session["NividaAmount"].ToString());
            TotalArthik = one;
           // TotalArthik = one + two + three + four + five;
            CheckFirstStepDate();
            if (TotalArthik > NividaAmount)
            {
               // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkAmount();", true);
                 Label8.Text = "Total of three amounts should not be greater than Nivida Amount";
            }
            else
            {
                ds = bl_obj.ExecuteStoredFunctionWithParameters(plist, "sp_Tbl_Work_ProcessDetails_Update");
               // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
                  Label8.Text = "Record Updated ";

                List<string> list = new List<string>();
                list.Add(Session["Work_ID"].ToString());
                list.Add("9");
                list.Add(Session["User_Id"].ToString());
                list.Add(Session["officeid"].ToString());
                bl_obj.ExecuteStoredFunctionWithParameters(list, "sp_Stage_Tracking_insert");
                FillGrid();
                Clearall();
                btnUpdated.Enabled = false;
               btnAdd.Enabled = true;
            }
            //added for comparing amount with nivida amount

        }
        catch (Exception ex)
        { }
    }
    public void fillrecord()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> plist = new List<string>();
            plist.Add(Session["Work_ID"].ToString());
            ds = bl_obj.FillGridWithParameter(plist, "sp_Fill_WorkProcessDetails");
            DataSet dd = new DataSet();
            dd = bl_obj.FillGridWithParameter(plist, "sp_select_date");
            wrkenddate.Text = dd.Tables[0].Rows[0][0].ToString();
             if (ds.Tables[0].Rows.Count != 0)
           // if ((ds.Tables[0].Rows.Count != 0) && (ds.Tables[1].Rows[0][1]!= "01/01/1900"))
            {
                //morestage.Attributes.Add("Style", "Visibility:hidden");
                buttons.Attributes.Add("Style", "Visibility:Visible");
               // workstage.Attributes.Add("Style", "Visibility:Visible");

                txtarthik.Text = ds.Tables[0].Rows[0][1].ToString();
                TextBox1.Text = ds.Tables[0].Rows[0][2].ToString();

                txtbhutic.Text = ds.Tables[0].Rows[0][3].ToString();

                TextBox2.Text = ds.Tables[0].Rows[0][4].ToString();
                TextBox4.Text = ds.Tables[0].Rows[0][5].ToString();
                TextBox3.Text = ds.Tables[0].Rows[0][6].ToString();

                TextBox8.Text = ds.Tables[0].Rows[0][7].ToString();
                TextBox7.Text = ds.Tables[0].Rows[0][8].ToString();
                TextBox9.Text = ds.Tables[0].Rows[0][9].ToString();

                txtarthik1.Text = ds.Tables[0].Rows[0][10].ToString();
                TextBox5.Text = ds.Tables[0].Rows[0][11].ToString() + ".00";
                TextBox11.Text = ds.Tables[0].Rows[0][12].ToString() + ".00";

                txtbhutic1.Text = ds.Tables[0].Rows[0][13].ToString();
                TextBox6.Text = ds.Tables[0].Rows[0][14].ToString();
                TextBox12.Text = ds.Tables[0].Rows[0][15].ToString();

                //Added for step4 and step5
                //date4.Text = ds.Tables[1].Rows[0][1].ToString();
                //eco4.Text = ds.Tables[1].Rows[0][0].ToString();
                //phy4.Text = ds.Tables[1].Rows[0][2].ToString();
                //eco5.Text = ds.Tables[1].Rows[0][3].ToString();
                //date5.Text = ds.Tables[1].Rows[0][4].ToString();
                //phy5.Text = ds.Tables[1].Rows[0][5].ToString();
                //actualeco4.Text = ds.Tables[1].Rows[0][6].ToString();
                //actualeco5.Text = ds.Tables[1].Rows[0][7].ToString();
                //actualphy4.Text = ds.Tables[1].Rows[0][8].ToString();
                //actualphy5.Text = ds.Tables[1].Rows[0][9].ToString();



                 //nnn
                date4.Text = ds.Tables[1].Rows[0][1].ToString();
                eco4.Text = ds.Tables[1].Rows[0][0].ToString();

                phy4.Text = ds.Tables[1].Rows[0][8].ToString();
                eco5.Text = ds.Tables[1].Rows[0][2].ToString();
                date5.Text = ds.Tables[1].Rows[0][3].ToString();
                phy5.Text = ds.Tables[1].Rows[0][9].ToString();
                actualeco4.Text = ds.Tables[1].Rows[0][4].ToString();
                actualeco5.Text = ds.Tables[1].Rows[0][5].ToString();
                actualphy4.Text = ds.Tables[1].Rows[0][6].ToString();
                actualphy5.Text = ds.Tables[1].Rows[0][7].ToString();
                 //nnn

                btnAdd.Enabled = true ;
                //Added for step4 and step5
            }
            //else if ((ds.Tables[0].Rows.Count != 0) || (ds.Tables[1].Rows[0][1] == "01/01/1900"))
            //    {
            //       // morestage.Attributes.Add("Style", "Visibility:visible");
            //       // workstage.Attributes.Add("Style", "Visibility:hidden");
            //        buttons.Attributes.Add("Style", "Visibility:hidden");

            //        txtarthik.Text = ds.Tables[0].Rows[0][1].ToString();
            //        TextBox1.Text = ds.Tables[0].Rows[0][2].ToString();

            //        txtbhutic.Text = ds.Tables[0].Rows[0][3].ToString();

            //        TextBox2.Text = ds.Tables[0].Rows[0][4].ToString();
            //        TextBox4.Text = ds.Tables[0].Rows[0][5].ToString();
            //        TextBox3.Text = ds.Tables[0].Rows[0][6].ToString();

            //        TextBox8.Text = ds.Tables[0].Rows[0][7].ToString();
            //        TextBox7.Text = ds.Tables[0].Rows[0][8].ToString();
            //        TextBox9.Text = ds.Tables[0].Rows[0][9].ToString();

            //        txtarthik1.Text = ds.Tables[0].Rows[0][10].ToString() + ".00";
            //        TextBox5.Text = ds.Tables[0].Rows[0][11].ToString() + ".00";
            //        TextBox11.Text = ds.Tables[0].Rows[0][12].ToString() + ".00";

            //        txtbhutic1.Text = ds.Tables[0].Rows[0][13].ToString();
            //        TextBox6.Text = ds.Tables[0].Rows[0][14].ToString();
            //        TextBox12.Text = ds.Tables[0].Rows[0][15].ToString();
            //    }
            else
            {
               
                //btnAdd.Enabled = false;
                //btnUpdated.Enabled = true;
                btnAdd.Enabled = true;
                btnUpdated.Enabled = false;
            }
        }
        catch (Exception ex)
        { }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());

            DataSet ds = new DataSet();
            ds = bl_obj.FillGridWithParameter(para, "sp_selectImage");
            if (ds.Tables[0].Rows.Count != 0)
            {
                bl_obj.FillGridWithParameter(para, "Sp_DeleteImage");
            }
            else
            {


                int intImageSize = 0;
                string strImageType;
                Stream ImageStream;

                //' Gets the Size of the Image

                intImageSize = FileUpload1.PostedFile.ContentLength;


                //' Gets the Image Type


                strImageType = FileUpload1.PostedFile.ContentType;

                //' Reads the Image

                ImageStream = FileUpload1.PostedFile.InputStream;


                byte[] ImageContent = new byte[intImageSize];

                int intStatus;

                intStatus = ImageStream.Read(ImageContent, 0, intImageSize);


                //                        ' Create Instance of Connection and Command Object

                string cnstring;


                // cnstring = "Data Source=SAISERVER\\SQLEXPRESS;Initial Catalog=zilla_parishad;Integrated Security=True;";
                cnstring = System.Configuration.ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                SqlConnection myConnection = new SqlConnection(cnstring);

                SqlCommand myCommand = new SqlCommand("Sp_InsertImage", myConnection);



                //' Mark the Command as a SPROC

                myCommand.CommandType = CommandType.StoredProcedure;



                //' Add Parameters to SPROC



                SqlParameter Image_Idsp = new SqlParameter("@imgid", SqlDbType.BigInt);

                Image_Idsp.Value = Convert.ToInt64("1");

                myCommand.Parameters.Add(Image_Idsp);

                SqlParameter Image_Iconsp = new SqlParameter("@img1", SqlDbType.Image);

                Image_Iconsp.Value = ImageContent;

                myCommand.Parameters.Add(Image_Iconsp);

                SqlParameter Image_Typesp = new SqlParameter("@imgtype1", SqlDbType.VarChar, 255);

                Image_Typesp.Value = strImageType;

                myCommand.Parameters.Add(Image_Typesp);


                SqlParameter workid = new SqlParameter("@workplanningID", SqlDbType.BigInt);

                workid.Value = Convert.ToInt64(Session["Work_ID"].ToString());

                myCommand.Parameters.Add(workid);
                myConnection.Open();

                myCommand.ExecuteNonQuery();

                myConnection.Close();
                FillImage_Befor();


            }

        }
        catch (Exception)
        {
            //Response.Write("Please Select  Image");
            //Response.Write("Insert Failed. Error Details are: " + SQLexc.ToString());
        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());

            DataSet ds1 = new DataSet();
            ds1 = bl_obj.FillGridWithParameter(para, "sp_selectImage2");
            if (ds1.Tables[0].Rows.Count != 0)
            {
                bl_obj.FillGridWithParameter(para, "Sp_DeleteImage1");
            }
            int intImageSize;

            string strImageType;

            Stream ImageStream;



            //' Gets the Size of the Image

            intImageSize = FileUpload2.PostedFile.ContentLength;


            //' Gets the Image Type

            strImageType = FileUpload2.PostedFile.ContentType;

            //' Reads the Image

            ImageStream = FileUpload2.PostedFile.InputStream;


            byte[] ImageContent = new byte[intImageSize];

            int intStatus;

            intStatus = ImageStream.Read(ImageContent, 0, intImageSize);


            //                        ' Create Instance of Connection and Command Object

            string cnstring;


            // cnstring = "Data Source=SAISERVER\\SQLEXPRESS;Initial Catalog=zilla_parishad;Integrated Security=True;";
            cnstring = System.Configuration.ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(cnstring);

            SqlCommand myCommand = new SqlCommand("Sp_InsertImage2", myConnection);



            //' Mark the Command as a SPROC

            myCommand.CommandType = CommandType.StoredProcedure;



            //' Add Parameters to SPROC



            SqlParameter Image_Idsp = new SqlParameter("@imgid1", SqlDbType.BigInt);

            Image_Idsp.Value = Convert.ToInt64("1");

            myCommand.Parameters.Add(Image_Idsp);

            SqlParameter Image_Iconsp = new SqlParameter("@img2", SqlDbType.Image);

            Image_Iconsp.Value = ImageContent;

            myCommand.Parameters.Add(Image_Iconsp);

            SqlParameter Image_Typesp = new SqlParameter("@umgtype2", SqlDbType.VarChar, 255);

            Image_Typesp.Value = strImageType;

            myCommand.Parameters.Add(Image_Typesp);


            SqlParameter workid = new SqlParameter("@workplanningID", SqlDbType.BigInt);

            workid.Value = Convert.ToInt64(Session["Work_ID"].ToString());

            myCommand.Parameters.Add(workid);
            myConnection.Open();

            myCommand.ExecuteNonQuery();

            myConnection.Close();
            FillImage_progress();
        }
        catch (Exception)
        {
            //Response.Write("Please Select  Image");
            //Response.Write("Insert Failed. Error Details are: " + SQLexc.ToString());
        }

    }
    protected void Button4_Click1(object sender, EventArgs e)
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());

            DataSet ds2 = new DataSet();
            ds2 = bl_obj.FillGridWithParameter(para, "sp_selectImage3");
            if (ds2.Tables[0].Rows.Count != 0)
            {
                bl_obj.FillGridWithParameter(para, "Sp_DeleteImage2");
            }
            int intImageSize;

            string strImageType;

            Stream ImageStream;



            //' Gets the Size of the Image

            intImageSize = FileUpload3.PostedFile.ContentLength;


            //' Gets the Image Type

            strImageType = FileUpload3.PostedFile.ContentType;

            //' Reads the Image

            ImageStream = FileUpload3.PostedFile.InputStream;


            byte[] ImageContent = new byte[intImageSize];

            int intStatus;

            intStatus = ImageStream.Read(ImageContent, 0, intImageSize);


            //                        ' Create Instance of Connection and Command Object

            string cnstring;


            // cnstring = "Data Source=SAISERVER\\SQLEXPRESS;Initial Catalog=zilla_parishad;Integrated Security=True;";
            cnstring = System.Configuration.ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            SqlConnection myConnection = new SqlConnection(cnstring);

            SqlCommand myCommand = new SqlCommand("Sp_InsertImage3", myConnection);



            //' Mark the Command as a SPROC

            myCommand.CommandType = CommandType.StoredProcedure;



            //' Add Parameters to SPROC



            SqlParameter Image_Idsp = new SqlParameter("@imgid2", SqlDbType.BigInt);

            Image_Idsp.Value = Convert.ToInt64("1");

            myCommand.Parameters.Add(Image_Idsp);

            SqlParameter Image_Iconsp = new SqlParameter("@img3", SqlDbType.Image);

            Image_Iconsp.Value = ImageContent;

            myCommand.Parameters.Add(Image_Iconsp);

            SqlParameter Image_Typesp = new SqlParameter("@imgtype3", SqlDbType.VarChar, 255);

            Image_Typesp.Value = strImageType;

            myCommand.Parameters.Add(Image_Typesp);


            SqlParameter workid = new SqlParameter("@workplanningID", SqlDbType.BigInt);

            workid.Value = Convert.ToInt64(Session["Work_ID"].ToString());

            myCommand.Parameters.Add(workid);
            myConnection.Open();

            myCommand.ExecuteNonQuery();

            myConnection.Close();
            fillimage_Complete();
        }
        catch (Exception)
        {
            //Response.Write("Please Select  Image");
            //Response.Write("Insert Failed. Error Details are: " + SQLexc.ToString());
        }

    }

    protected void FillImage_Befor()
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());
            Image4.Visible = true;
            DataSet ds = new DataSet();
            ds = bl_obj.FillGridWithParameter(para, "sp_selectImage");
            int w_id = Convert.ToInt32(Session["Work_ID"].ToString());
            if (ds.Tables[0].Rows.Count != 0)
            {
                Image4.ImageUrl = "readrealimage.aspx?id=" + w_id + "&flag=" + 2;
            }
            else
            {
                Image4.ImageUrl = "../images/Not_available_icon.jpg";
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void FillImage_progress()
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());

            Image5.Visible = true;
            DataSet ds1 = new DataSet();
            ds1 = bl_obj.FillGridWithParameter(para, "sp_selectImage2");
            int w_id = Convert.ToInt32(Session["Work_ID"].ToString());

            if (ds1.Tables[0].Rows.Count != 0)
            {
                Image5.ImageUrl = "readrealimage.aspx?id=" + w_id + "&flag=" + 3;

            }
            else
            {
                Image5.ImageUrl = "../images/Not_available_icon.jpg";
            }
        }
        catch (Exception ex)
        {
            Image5.ImageUrl = "../images/Not_available_icon.jpg";
        }
    }

    protected void fillimage_Complete()
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());

            Image6.Visible = true;

            DataSet ds2 = new DataSet();


            ds2 = bl_obj.FillGridWithParameter(para, "sp_selectImage3");
            int w_id = Convert.ToInt32(Session["Work_ID"].ToString());
            if (ds2.Tables[0].Rows.Count != 0)
            {
                Image6.ImageUrl = "readrealimage.aspx?id=" + w_id + "&flag=" + 4;

            }
            else
            {
                Image6.ImageUrl = "../images/Not_available_icon.jpg";
            }

        }
        catch (Exception ex)
        {

        }

       
    }

    //protected void Button2_Click1(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        FillImage_Befor();
    //        FillImage_progress();
    //        fillimage_Complete();
    //    }
    //    catch (Exception ex)
    //    { 

    //    }
    //}
    protected void btn_nxt_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/workexteddetail.aspx");
    }

    //code for enabling next button
    protected void Checkstagestatus()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("9");

        ds = bl_obj.FillGridWithParameter(list, "sp_Check_Stage_Status");
        if (ds.Tables[0].Rows.Count != 0)
        {
            lnk_Next.Visible = true;
        }
        else
        {
            lnk_Next.Visible = false;
        }
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
    //    //String workstartdate = Session["WorkStartDate"].ToString();
    //    DateTime workstartdate1 = Convert.ToDateTime(Session["WorkStartDate"].ToString());

    //    DateTime date4 = Convert.ToDateTime(TextBox1.Text);
    //    if (date4 <= workstartdate1)
    //    {
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkDate();", true);
    //        //Label8.Text = "Dates should be greater than work start date..";
    //    }
    //    else
    //    {
    //        Session["FirstDate"] = date4;
    //        Label8.Text = "";
    //       // string a = Session["FirstDate"].ToString();
    //    }
 }

    
    public void CheckFirstStepDate()
    {
        //String workstartdate = Session["WorkStartDate"].ToString();
        DateTime workstartdate1 = Convert.ToDateTime(Session["WorkStartDate"].ToString());

        DateTime date4 = Convert.ToDateTime(TextBox1.Text);
        if (date4 <= workstartdate1)
        {
           // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkDate();", true);
            Label8.Text = "Dates should be greater than work start date..";
        }
        else
        {
            Session["FirstDate"] = date4;
            Label8.Text = "";
            // string a = Session["FirstDate"].ToString();
        }
    }
    
    
    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {
       //   DataSet ds = new DataSet();
       //    List<string> plist = new List<string>();
       //    plist.Add(Session["Work_ID"].ToString());
       //    ds = bl_obj.FillGridWithParameter(plist, "sp_Fill_WorkProcessDetails");
          
       //    TextBox1.Text = ds.Tables[0].Rows[0][2].ToString();
       //     String FirstDate = TextBox1.Text;
                
       // //Session not working...Alternative to session value(SP) 
       //// String FirstDate = Session["FirstDate"].ToString();
       // DateTime FirstDate1 = Convert.ToDateTime(FirstDate);

       // DateTime date5 = Convert.ToDateTime(TextBox4.Text);

       // if (date5 <= FirstDate1)
       // {
       //     ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkAmountTappa1();", true);
       //     //  Label8.Text = "Dates should be greater than कामाचा नियोजन टप्पा १ date..";
       // }
       // else
       // {
       //     Session["SecondDate"] = date5;
       //     Label8.Text = "";
       // }
    }
    protected void TextBox7_TextChanged(object sender, EventArgs e)
    {
      //  DataSet ds = new DataSet();
      //  List<string> plist = new List<string>();
      //  plist.Add(Session["Work_ID"].ToString());
      //  ds = bl_obj.FillGridWithParameter(plist, "sp_Fill_WorkProcessDetails");
      //  TextBox4.Text = ds.Tables[0].Rows[0][5].ToString();
       
      //  String SecondDate = TextBox4.Text;

      //  //Session not working...Alternative to session value(SP) 

      ////  String SecondDate = Session["SecondDate"].ToString();
      //  DateTime SecondDate1 = Convert.ToDateTime(SecondDate);

      //  DateTime date6 = Convert.ToDateTime(TextBox7.Text);

      //  if (date6 <= SecondDate1)
      //  {
      //      ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkAmountTappa2();", true);
      //      // Label8.Text = "Dates should be greater than कामाचा नियोजन टप्पा २ date..";
      //  }
      //  else
      //  {
      //      Session["ThirdDate"] = date6;
      //      Label8.Text = "";
      //  }
    }

   
    protected void date4_TextChanged(object sender, EventArgs e)
    {
       // DataSet ds = new DataSet();
       // List<string> plist = new List<string>();
       // plist.Add(Session["Work_ID"].ToString());
       // ds = bl_obj.FillGridWithParameter(plist, "sp_Fill_WorkProcessDetails");
       // TextBox7.Text = ds.Tables[0].Rows[0][8].ToString();
      
       // String ThirdDate = TextBox7.Text;

       // //Session not working...Alternative to session value(SP) 
       //// String ThirdDate = Session["ThirdDate"].ToString();
       // DateTime ThirdDate1 = Convert.ToDateTime(ThirdDate);

       // DateTime ecodateFour = Convert.ToDateTime(date4.Text);

       // if (ecodateFour <= ThirdDate1)
       // {
       //     ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkAmountTappa3();", true);
       //   // Label8.Text = "Dates should be greater than कामाचा नियोजन टप्पा 3 date..";
       // }
       // else
       // {
       //     Session["FourDate"] = ecodateFour;
       //     Label8.Text = "";
       // }
    }

    protected void date5_TextChanged(object sender, EventArgs e)
    {

       // DataSet ds = new DataSet();
       // List<string> plist = new List<string>();
       // plist.Add(Session["Work_ID"].ToString());
       // ds = bl_obj.FillGridWithParameter(plist, "sp_Fill_WorkProcessDetails");
       // date4.Text = ds.Tables[1].Rows[0][1].ToString();
      
       // String FourDate = date4.Text;

       // //Session not working...Alternative to session value(SP) 
       //// String FourDate = Session["FourDate"].ToString();
       // DateTime FourDate1 = Convert.ToDateTime(FourDate);

       // DateTime ecodateFive = Convert.ToDateTime(date5.Text);

       // if (ecodateFive <= FourDate1)
       // {
       //      ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkAmountTappa4();", true);
       //     //Label8.Text = "Dates should be greater than कामाचा नियोजन टप्पा 4 date..";
       // }
       // else
       // {
       //     //Session["FiveDate"] = ecodateFive;
       //     Label8.Text = "";
       // }
    }

    //protected void ButtonYes_Click(object sender, EventArgs e)
    //{
    //   // workstage.Attributes.Add("Style", "Visibility:Visible");
    //    morestage.Attributes.Add("Style", "Visibility:hidden");
    //    buttons.Attributes.Add("Style", "Visibility:Visible");
    //}
    //protected void ButtonNo_Click(object sender, EventArgs e)
    //{
    //    morestage.Attributes.Add("Style", "Visibility:hidden");
    //    buttons.Attributes.Add("Style", "Visibility:Visible");
    //}




    protected void KamacheNiyojanGrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        FillGrid();
        KamacheNiyojanGrid.CurrentPageIndex = e.NewPageIndex;
        KamacheNiyojanGrid.DataBind();
       
    }
    protected void KamacheNiyojanGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnAdd.Enabled = false;
        btnUpdated.Enabled = true;
       // btn_delete.Enabled = false;
        HiddenField1.Value = KamacheNiyojanGrid.SelectedItem.Cells[2].Text.ToString();
        TextBox1.Text = KamacheNiyojanGrid.SelectedItem.Cells[3].Text.ToString();
        txtarthik.Text = KamacheNiyojanGrid.SelectedItem.Cells[4].Text.ToString();
        txtbhutic.Text = KamacheNiyojanGrid.SelectedItem.Cells[5].Text.ToString();
        txtarthik1.Text = KamacheNiyojanGrid.SelectedItem.Cells[6].Text.ToString();
        txtbhutic1.Text = KamacheNiyojanGrid.SelectedItem.Cells[7].Text.ToString();
        
    }
    public void FillGrid()
    {
        List<string> para = new List<string>();
        para.Add(Session["Work_ID"].ToString());
        DataSet ds = new DataSet();
        ds = bl_obj.FillGridWithParameter(para, "Fill_KamacheNiyojan");
       // Cache.Insert("thekedar", ds);
        int id = (ds.Tables[0].Rows.Count) % 20;
        if (id == 0)
        {
            if (KamacheNiyojanGrid.CurrentPageIndex > 0)
            {
                KamacheNiyojanGrid.DataSource = ds;
                KamacheNiyojanGrid.CurrentPageIndex--;
                KamacheNiyojanGrid.DataBind();
            }
            else
            {
                KamacheNiyojanGrid.DataSource = ds;
                KamacheNiyojanGrid.DataBind();
            }
        }
        else
        {
            KamacheNiyojanGrid.DataSource = ds;
            KamacheNiyojanGrid.CurrentPageIndex = 0;
            KamacheNiyojanGrid.DataBind();
        }
    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            for (int i = 0; i < KamacheNiyojanGrid.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)KamacheNiyojanGrid.Items[i].FindControl("CheckBox1");
                if (cb.Checked)
                {
                    select = 1;
                   // Label2.Visible = false;
                    List<string> para = new List<string>();
                  //  para.Add(HiddenField1.Value.ToString());
                     para.Add(KamacheNiyojanGrid.Items[i].Cells[2].Text.ToString());
                    //para.Add(KamacheNiyojanGrid.Items[i].Cells[3].Text.ToString());
                    //para.Add("1");
                    //para.Add("d");
                     Label8.Text = "Record Deleted";
                   // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);

                    DataSet ds = bl_obj.FillGridWithParameter(para, "sp_KamacheNiyojanDelete");

                }
            }
            
            if (select == 0)
            {
                // lblMsg.Visible = true;
                Label8.Text = "Select Record";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

            }
           
            Clearall();
        }
        catch (Exception ex)
        {

        }
        FillGrid();
    }
}
