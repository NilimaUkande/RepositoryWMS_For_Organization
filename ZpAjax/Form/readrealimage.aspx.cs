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
using System.Data.SqlClient;
public partial class readrealimage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string strImageID = Request.QueryString["id"].ToString();
            string strImageflag = Request.QueryString["flag"].ToString();
           

            // ' Create Instance of Connection and Command Object
            string cnstring = null;
            // cnstring = "Data Source=SSTSSERVER;Initial Catalog=zpcivil;Integrated Security=True;";
            cnstring = System.Configuration.ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString; 
            SqlConnection myConnection = new SqlConnection(cnstring);
            if (strImageflag == "2")
            {
                SqlCommand myCommand = new SqlCommand("select img1,imgtype1 from Tbl_Image1Upload Where workplanningID =" + strImageID, myConnection);

                myConnection.Open();
                SqlDataReader myDataReader;
                myDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                while (myDataReader.Read())
                {
                    // Convert.ToInt32(strImageflag)
                    Response.ContentType = myDataReader.GetValue(1).ToString();
                    Response.BinaryWrite((byte[])myDataReader.GetValue(0));
                }
                myConnection.Close();
            }
            else if (strImageflag == "3")
            {
                SqlCommand myCommand = new SqlCommand("select img2,umgtype2 from tbl_image2upload Where workplanningID=" + strImageID, myConnection);
                myConnection.Open();
                SqlDataReader myDataReader;
                myDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                while (myDataReader.Read())
                {
                    // Convert.ToInt32(strImageflag)
                    Response.ContentType = myDataReader.GetValue(1).ToString();
                    Response.BinaryWrite((byte[])myDataReader.GetValue(0));
                }
                myConnection.Close();
            }
            else if (strImageflag == "4")
            {
                SqlCommand myCommand = new SqlCommand("select img3,imgtype3 from tbl_image3upload Where workplanningID=" + strImageID, myConnection);

                myConnection.Open();
                SqlDataReader myDataReader;
                myDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                while (myDataReader.Read())
                {
                    Response.ContentType = myDataReader.GetValue(1).ToString();
                    Response.BinaryWrite((byte[])myDataReader.GetValue(0));
                }
                myConnection.Close();
            }



            else if (strImageflag == "5")
            {
                SqlCommand myCommand = new SqlCommand("select img4,imgtype4 from tbl_image4upload Where workplanningID=" + strImageID, myConnection);

                myConnection.Open();
                SqlDataReader myDataReader;
                myDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                while (myDataReader.Read())
                {
                    Response.ContentType = myDataReader.GetValue(1).ToString();
                    Response.BinaryWrite((byte[])myDataReader.GetValue(0));
                }
                myConnection.Close();
            }


             //to read Image from Tbl_WorkExtendImageUpload
            else if (strImageflag == "6")
            {
                 string strWorkExtendID = Request.QueryString["wid"].ToString();
                 SqlCommand myCommand = new SqlCommand("select img4,imgtype4 from Tbl_WorkExtendImageUpload Where workplanningID=" + strImageID + " and image_ID=" + strWorkExtendID, myConnection);

                myConnection.Open();
                SqlDataReader myDataReader;
                myDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                while (myDataReader.Read())
                {
                    Response.ContentType = myDataReader.GetValue(1).ToString();
                    Response.BinaryWrite((byte[])myDataReader.GetValue(0));
                }
                myConnection.Close();
            }


             //to read Image from Tbl_KamPurnImageUpload
            else if (strImageflag == "7")
            {
                string strkamimg_id = Request.QueryString["kamimg_id"].ToString();
                SqlCommand myCommand = new SqlCommand("select kamimage,kamimagetype from Tbl_KamPurnImageUpload Where workplanningID=" + strImageID + " and kamimg_ID=" + strkamimg_id, myConnection);

                myConnection.Open();
                SqlDataReader myDataReader;
                myDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                while (myDataReader.Read())
                {
                    Response.ContentType = myDataReader.GetValue(1).ToString();
                    Response.BinaryWrite((byte[])myDataReader.GetValue(0));
                }
                myConnection.Close();
            }


             //to read Image from Tbl_KamPurnImageUpload
            else if (strImageflag == "8")
            {
                string strkamimg_id = Request.QueryString["workcompleteimg_ID"].ToString();
                SqlCommand myCommand = new SqlCommand("select workcompleteimage,workcompleteimagetype from Tbl_workcompleteImageUpload Where workplanningID=" + strImageID + " and workcompleteimg_ID=" + strkamimg_id, myConnection);

                myConnection.Open();
                SqlDataReader myDataReader;
                myDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                while (myDataReader.Read())
                {
                    Response.ContentType = myDataReader.GetValue(1).ToString();
                    Response.BinaryWrite((byte[])myDataReader.GetValue(0));
                }
                myConnection.Close();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/Form/Image.gif");              
        }
    }
        
}
