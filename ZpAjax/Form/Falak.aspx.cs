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
using System.IO;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class Form_Falak : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        
            if (!IsPostBack)
            {
                FillImage_Befor();
            }
        }
        catch (Exception ex)
        { }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            List<string> para = new List<string>();
            //para.Add(Session["Work_ID"].ToString());
            para.Add("1");


            DataSet ds = new DataSet();
            ds = bl_obj.FillGridWithParameter(para, "sp_select_falak");
            //if (ds.Tables[0].Rows.Count != 0)
            //{
            //bl_obj.FillGridWithParameter(para, "Sp_DeleteImage");
            //}
            int intImageSize;

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


            //'  cnstring = "Data Source=SSTS-6C054FDF6E\\SqlExpress;Initial Catalog=ImageDb;Integrated Security=True;"
            cnstring = System.Configuration.ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString; 
            SqlConnection myConnection = new SqlConnection(cnstring);

            SqlCommand myCommand = new SqlCommand("sp_insert_falak", myConnection);



            //' Mark the Command as a SPROC

            myCommand.CommandType = CommandType.StoredProcedure;



            //' Add Parameters to SPROC



            SqlParameter Image_Idsp = new SqlParameter("@imgid", SqlDbType.BigInt);

            Image_Idsp.Value = Convert.ToInt64("1");

            myCommand.Parameters.Add(Image_Idsp);

            SqlParameter Image_Iconsp = new SqlParameter("@img", SqlDbType.Image);

            Image_Iconsp.Value = ImageContent;

            myCommand.Parameters.Add(Image_Iconsp);

            SqlParameter Image_Typesp = new SqlParameter("@imagetype", SqlDbType.VarChar, 255);

            Image_Typesp.Value = strImageType;

            myCommand.Parameters.Add(Image_Typesp);


            SqlParameter workid = new SqlParameter("@workplanningID", SqlDbType.BigInt);

            //workid.Value = Convert.ToInt64(Session["Work_ID"].ToString());
            workid.Value = Convert.ToInt64("1");

            myCommand.Parameters.Add(workid);
            myConnection.Open();

            myCommand.ExecuteNonQuery();

            myConnection.Close();
            FillImage_Befor();


        }
        catch (Exception)
        {
            //Response.Write("Please Select  Image");
            //Response.Write("Insert Failed. Error Details are: " + SQLexc.ToString());
        }
    }
    protected void FillImage_Befor()
    {
        List<string> para = new List<string>();
        //para.Add(Session["Work_ID"].ToString());
        para.Add("1");
        Image1.Visible = true;
        DataSet ds = new DataSet();
        ds = bl_obj.FillGridWithParameter(para, "sp_select_falak");
        //int w_id = Convert.ToInt32(Session["Work_ID"].ToString());
        int w_id = Convert.ToInt32("1");

        if (ds.Tables[0].Rows.Count != 0)
        {
            RadioButtonList1.Items.FindByValue("y").Selected = true;
            Panel1.Visible = true;
            Image1.ImageUrl = "D.aspx?id=" + w_id;

        }
        else
        {
            RadioButtonList1.Items.FindByValue("n").Selected = true;
            Image1.ImageUrl = "~/Form/Image.gif";

        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue.ToString() == "y")
        {
            Panel1.Visible = true;
        }
        else
        {
            Panel1.Visible = false;
        }
    }
}
