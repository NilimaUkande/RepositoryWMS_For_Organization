using System;
using System.Data;
using System.IO;
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

public partial class WorkExtendImage : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        FillImage_Befor();

    }

    protected void FillImage_Befor()
    {
        try
        {
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add(Session["Work_ID"].ToString());
            para.Add(Session["WorkExtend_ID"].ToString());
            ds = obj.FillGridWithParameter(para, "sp_selectImage_for_workextend");

            if (ds.Tables[0].Rows.Count != 0)
            {

                DataTable dt = new DataTable();
                DataColumn imageid = new DataColumn("imageid", typeof(string));
                dt.Columns.Add(imageid);

                DataColumn imageCol = new DataColumn("images", typeof(string));
                dt.Columns.Add(imageCol);

                int w_id = Convert.ToInt32(Session["Work_ID"].ToString());
                if (ds.Tables[0].Rows.Count != 0)
                {

                   

                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        dt.Rows.Add(ds.Tables[0].Rows[i][0].ToString());

                        // dt.Rows[i][imageCol] = string.Format("<img src='Handler.ashx?id={0}' alt='' style='width:100px' />",dt.Rows[i][0].ToString());
                        dt.Rows[i][imageCol] = string.Format("<img src='readrealimage.aspx?id=" + w_id + "&flag=" + 6 + "&wid=" + ds.Tables[0].Rows[i][0].ToString() + "' alt='' style='width:100px' />");
                        //Image4.ImageUrl = "readrealimage.aspx?id=" + w_id + "&flag=" + 6 + "&wid=" + 78;
                    }

                }
                else
                {

                }
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "noImage();", true);
                lblmsg.Text = "No images to display";
            }
        }
        catch (Exception ex)
        {

        }
    }


    //private void BindDataList()
    //{
    //    string sqlCmd = "SELECT imageid FROM Images";
    //    DataBaseHelper DBHelper = new DataBaseHelper();
    //    DataTable dt = DBHelper.GetTable(sqlCmd);
    //    //adding new column to display image
    //    DataColumn imageCol = new DataColumn("images", typeof(string));
    //    dt.Columns.Add(imageCol);

    //    if (dt.Rows.Count > 0)
    //    {
    //        for (int i = 0; i < dt.Rows.Count; i++)
    //        {
    //            dt.Rows[i][imageCol] = string.Format
    //    ("<img src='Handler.ashx?id={0}' alt='' style='width:100px' />",
    //        dt.Rows[i][0].ToString());
    //        }
    //    }
    //    DataList1.DataSource = dt;
    //    DataList1.DataBind();
    //}

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("workexteddetail.aspx");
    }





    protected void GvImages_RowEditing(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = e.Item.ItemIndex;
        FillImage_Befor();
    }
    protected void GvImages_RowCancelingEdit(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = -1;
        FillImage_Befor();
    }
    protected void GvImages_RowUpdating(object source, DataListCommandEventArgs e)
    {

        DataList1.SelectedIndex = e.Item.ItemIndex;


        //string id = GvImages.DataKeys[e.RowIndex].Value.ToString();
        FileUpload Fu = (FileUpload)DataList1.Items[e.Item.ItemIndex].FindControl("fupload");

        //Code for Upload Image



        HttpFileCollection uploadedFiles =  Request.Files;

        for (int i = 0; i < uploadedFiles.Count; i++)
        {
            HttpPostedFile userPostedFile = uploadedFiles[i];
            try
            {
                if (userPostedFile.ContentLength > 0)
                {

                    //List<string> para1 = new List<string>();
                    //para1.Add(Session["Work_ID"].ToString());
                    //para1.Add(Label10.Text);

                    int intImageSize = 0;
                    string strImageType;
                    Stream ImageStream;

                    //intImageSize = FileUpload1.PostedFile.ContentLength;

                    intImageSize = userPostedFile.ContentLength;


                    //strImageType = FileUpload1.PostedFile.ContentType;
                    strImageType = userPostedFile.ContentType;

                    //ImageStream = FileUpload1.PostedFile.InputStream;
                    ImageStream = userPostedFile.InputStream;


                    byte[] ImageContent = new byte[intImageSize];

                    int intStatus;

                    intStatus = ImageStream.Read(ImageContent, 0, intImageSize);

                    string cnstring;
                    cnstring = System.Configuration.ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                    SqlConnection myConnection = new SqlConnection(cnstring);

                    SqlCommand myCommand = new SqlCommand("Sp_WorkExtendImageUpdate", myConnection);
                    myCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter Image_Idsp = new SqlParameter("@image_ID", SqlDbType.BigInt);                       
                    Image_Idsp.Value = e.CommandArgument.ToString(); 
                    //Image_Idsp.Value = Convert.ToInt64("1");

                    myCommand.Parameters.Add(Image_Idsp);

                    SqlParameter Image_Iconsp = new SqlParameter("@img4", SqlDbType.Image);

                    Image_Iconsp.Value = ImageContent;

                    myCommand.Parameters.Add(Image_Iconsp);

                    SqlParameter Image_Typesp = new SqlParameter("@imgtype4", SqlDbType.VarChar, 255);

                    Image_Typesp.Value = strImageType;

                    myCommand.Parameters.Add(Image_Typesp);


                    SqlParameter workid = new SqlParameter("@workplanningID", SqlDbType.BigInt);

                    workid.Value = Convert.ToInt64(Session["Work_ID"].ToString());

                    myCommand.Parameters.Add(workid);


                    SqlParameter workextend_id = new SqlParameter("@workextendid", SqlDbType.BigInt);

                    workextend_id.Value = Convert.ToInt64(Session["WorkExtend_ID"].ToString());

                    myCommand.Parameters.Add(workextend_id);


                    myConnection.Open();

                    myCommand.ExecuteNonQuery();

                    myConnection.Close();
                    //lblmsg.Text = "Uploaded Successfully";
                }

            }
            catch
            {
                //Label1.ForeColor = System.Drawing.Color.Red;
                //Label1.Text = "Please try again later";
            }


        }







        //Code for Upload Image end
        
        DataList1.EditItemIndex = -1;
        FillImage_Befor();




    }
}
