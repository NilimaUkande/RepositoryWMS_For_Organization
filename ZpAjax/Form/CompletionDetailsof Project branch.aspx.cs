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

public partial class Form_CompletionDetailsof_Project_branch : System.Web.UI.Page
{
    string wid;
    BussinessLayer.BusinessLayerclass obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
       
            if (!Page.IsPostBack)
            {
                txtkamnirikshan.Focus();
                clearall();
              
                DDlFill();
                lblTalukatext.Text = "कामाचे नाव : " + Session["Workname"].ToString();
                //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
                //         + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();
                Checkstagestatus();
                filldetails();
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

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());
            para.Add(ddlyear.SelectedValue.ToString());
            para.Add(ddlLekhaSanstha.SelectedValue.ToString());
            para.Add(txtkamnirikshan.Text);
            para.Add(txtnirikshanvasuli.Text);
            para.Add(txtahwalpurtata.Text);
            ds=obj.ExecuteStoredFunctionWithParameters(para, "update_completedetails");
           // wid = ds.Tables[0].Rows[0][0].ToString();
            lnk_Next.Visible = true;

            HttpFileCollection uploadedFiles = Request.Files;
            for (int i = 0; i < uploadedFiles.Count; i++)
            {
                HttpPostedFile userPostedFile = uploadedFiles[i];
                try
                {
                    if (userPostedFile.ContentLength > 0)
                    {

                        List<string> para1 = new List<string>();
                        para1.Add(Session["Work_ID"].ToString());
                       // para1.Add(Label10.Text);

                        int intImageSize = 0;
                        string strImageType;
                        Stream ImageStream;

                        //intImageSize = FileUpload1.PostedFile.ContentLength;

                        intImageSize = userPostedFile.ContentLength;


                        // strImageType = FileUpload1.PostedFile.ContentType;
                        strImageType = userPostedFile.ContentType;

                        // ImageStream = FileUpload1.PostedFile.InputStream;
                        ImageStream = userPostedFile.InputStream;


                        byte[] ImageContent = new byte[intImageSize];

                        int intStatus;

                        intStatus = ImageStream.Read(ImageContent, 0, intImageSize);

                        string cnstring;
                        cnstring = System.Configuration.ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                        SqlConnection myConnection = new SqlConnection(cnstring);

                        SqlCommand myCommand = new SqlCommand("Sp_workcompleteImageUpload", myConnection);
                        myCommand.CommandType = CommandType.StoredProcedure;

                        SqlParameter Image_Idsp = new SqlParameter("@workcompleteimg_ID", SqlDbType.BigInt);

                        Image_Idsp.Value = Convert.ToInt64("1");

                        myCommand.Parameters.Add(Image_Idsp);

                        SqlParameter Image_Iconsp = new SqlParameter("@workcompleteimage", SqlDbType.Image);

                        Image_Iconsp.Value = ImageContent;

                        myCommand.Parameters.Add(Image_Iconsp);

                        SqlParameter Image_Typesp = new SqlParameter("@workcompleteimagetype", SqlDbType.VarChar, 255);

                        Image_Typesp.Value = strImageType;

                        myCommand.Parameters.Add(Image_Typesp);


                        SqlParameter workid = new SqlParameter("@workplanningID", SqlDbType.BigInt);

                        workid.Value = Convert.ToInt64(Session["Work_ID"].ToString());

                        myCommand.Parameters.Add(workid);


                       // SqlParameter workextend_id = new SqlParameter("@WorkCompletionID", SqlDbType.BigInt);

                        //workextend_id.Value = Convert.ToInt64(wid);

                       // myCommand.Parameters.Add(workextend_id);



                        myConnection.Open();

                        myCommand.ExecuteNonQuery();

                        myConnection.Close();
                       // lblmsg.Text = "Uploaded Successfully";
                    }

                }
                catch
                {
                    //Label1.ForeColor = System.Drawing.Color.Red;
                    //  Label1.Text = "Please try again later";
                }


            }

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
            
         

            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("14");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
            btn_nxt.Focus();
        }
        catch (Exception ex)
        { 
        }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtkamnirikshan);
        plist.Add(txtnirikshanvasuli);
        plist.Add(txtahwalpurtata);
        obj.Textboxstring(plist);
    }
    public void filldetails()
     {
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(Session["Work_ID"].ToString());
        ds = obj.filldetails1(para);
        if (ds.Tables[0].Rows.Count != 0)
        {
            txtkamnirikshan.Text = ds.Tables[0].Rows[0][0].ToString();
            txtnirikshanvasuli.Text = ds.Tables[0].Rows[0][1].ToString();
            txtahwalpurtata.Text = ds.Tables[0].Rows[0][2].ToString();

            //txtkamnirikshan.Text = ds.Tables[0].Rows[0][2].ToString();
            //txtnirikshanvasuli.Text = ds.Tables[0].Rows[0][3].ToString();
            //txtahwalpurtata.Text = ds.Tables[0].Rows[0][4].ToString();
          ddlyear.Items.FindByValue(ds.Tables[0].Rows[0][3].ToString()).Selected = true;
            ddlLekhaSanstha.Items.FindByValue(ds.Tables[0].Rows[0][4].ToString()).Selected = true;
        }
    }
    public void clearall()
    {
        txtkamnirikshan.Text = "";
        txtnirikshanvasuli.Text = "";
        txtahwalpurtata.Text = "";
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    this.Dispose();
    //    Response.Redirect("~/Form/login.aspx");
    //}
    protected void btn_nxt_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/WorkComplitionDetails_for_AccountBranch.aspx");
    }

    //code for view attachments
    protected void ViewAttachments_Click(object sender, EventArgs e)
    {

        //DataGridItem grdrow = (DataGridItem)((Button)sender).NamingContainer;

        List<string> paralist = new List<string>();
        paralist.Add(Session["Work_ID"].ToString());
        //Session["Work_ID"] = grdrow.Cells[2].Text;


        Response.Redirect("CompletionDetailsImage.aspx");

    }

    //code for enabling next button
    protected void Checkstagestatus()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("14");
        ds=obj.FillGridWithParameter(list, "sp_Check_Stage_Status");
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
