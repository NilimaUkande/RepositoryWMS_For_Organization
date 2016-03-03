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

public partial class Form_workexteddetail : System.Web.UI.Page
{
    String wid;
    String wid1;
    BussinessLayer.BusinessLayerclass bl_oj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");

            if (Session["Group_Id"].ToString() == "1")              
                stage_button.Visible = false;



            if (!Page.IsPostBack)
            {

                txtdateextend.Focus();
                fillgrid();
                clearall();
                Checkstagestatus();


                List<string> list = new List<string>();
                list.Add(Session["Work_ID"].ToString());//Session["WorkId"].ToString();
                DataSet ds1 = new DataSet();
                ds1 = bl_oj.FillGridWithParameter(list, "sp_select_info_work_forShifaras");
                if (ds1.Tables.Count != 0)
                {
                    if (ds1.Tables[0].Rows.Count != 0)
                    {
                        lblAndajPatrkiy.Text = ds1.Tables[0].Rows[0][1].ToString() + ".00";

                        lblPrashaskiyManyata.Text = ds1.Tables[0].Rows[0][2].ToString() + ".00";
                        lblTantrikManyata.Text = ds1.Tables[0].Rows[0][3].ToString() + ".00";

                        lblAnudan.Text = ds1.Tables[0].Rows[0][0].ToString() + ".00";

                    }
                }
                
               
            }
            lblTalukatext.Text = "कामाचे नाव : " + Session["Workname"].ToString();
     //       lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
     //+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();
            
        }
        catch (Exception ex)
        { }
       
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            setzero();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(Session["Work_ID"].ToString());
            para.Add(bl_oj.convertDate(txtdateextend.Text).ToString());
            if (RadioButtonList2.SelectedValue.ToString() == "Days")
            {
                para.Add(txtkalawadhi.Text);
                para.Add("0");
            }
            else
            {
                para.Add("0");
                para.Add(txtkalawadhi.Text);
            }
          
            para.Add(bl_oj.convertDate(txtworkstartdate.Text).ToString());
            para.Add(bl_oj.convertDate(txtworkenddate.Text).ToString());
            para.Add(txtfineperday.Text);

         
            //para.Add(RadioButtonList1.SelectedValue.ToString());
            para.Add("N");
            para.Add(TextBox1.Text);

            //nn
            para.Add(RadioButtonList2.SelectedValue.ToString());
            //nn


            
            ds = bl_oj.ExecuteStoredFunctionWithParameters(para, "ins_workextendDetail");

            wid = ds.Tables[0].Rows[0][0].ToString();
            Session["WorkExtendID"] = wid;
            //Code for Upload Image
               


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
                    para1.Add(Label10.Text);

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

                    SqlCommand myCommand = new SqlCommand("Sp_WorkExtendImageUpload", myConnection);
                    myCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter Image_Idsp = new SqlParameter("@image_ID", SqlDbType.BigInt);

                    Image_Idsp.Value = Convert.ToInt64("1");

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

                    workextend_id.Value = Convert.ToInt64(wid);

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
                //  Label1.Text = "Please try again later";
            }


        }
   






            //Code for Upload Image end





          //  lblmsg.Text = "Record Inserted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("10");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
          // list.Add(Session["workextendid"].ToString());
            bl_oj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");

            lnk_Next.Visible = true;
            txtdateextend.Focus();
            fillgrid();
            Button1.Enabled = true;
            clearall();
            btn_nxt.Focus();

        }
        catch (Exception ex)
        {

        }


    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtkalawadhi);
        //plist.Add(txtkalawadhiMonths);
        plist.Add(txtfineperday);
        plist.Add(TextBox1);
        bl_oj.TextboxNull(plist);
    }

    public void fillgrid()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());
            ds = bl_oj.FillGridWithParameter(para, "fill_workextendesdetails");
            int id = (ds.Tables[0].Rows.Count) % 10;
            if (id == 0)
            {
                if (GridView1.CurrentPageIndex > 0)
                {

                    GridView1.DataSource = ds;
                    GridView1.CurrentPageIndex--;
                    GridView1.DataBind();

                }
                else
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
            else
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

        }
        catch (Exception e)
        {
        }


    }
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        HiddenField1.Value = GridView1.SelectedItem.Cells[2].Text.ToString();
        txtdateextend.Text = GridView1.SelectedItem.Cells[4].Text.ToString();
        RadioButtonList2.ClearSelection();
        if (GridView1.SelectedItem.Cells[5].Text.ToString() != "0")
        {
            txtkalawadhi.Text = GridView1.SelectedItem.Cells[5].Text.ToString();
            RadioButtonList2.Items.FindByValue("Days").Selected = true;
        }
        if (GridView1.SelectedItem.Cells[6].Text.ToString() != "0")
        {
            txtkalawadhi.Text = GridView1.SelectedItem.Cells[6].Text.ToString();
            RadioButtonList2.Items.FindByValue("Months").Selected = true;
        }

       // txtkalawadhi.Text = GridView1.SelectedItem.Cells[5].Text.ToString();
        //txtkalawadhiMonths.Text = GridView1.SelectedItem.Cells[6].Text.ToString();
        txtworkstartdate.Text = GridView1.SelectedItem.Cells[7].Text.ToString();
        txtworkenddate.Text = GridView1.SelectedItem.Cells[8].Text.ToString();

        txtfineperday.Text = GridView1.SelectedItem.Cells[9].Text.ToString() + ".00";
        TextBox1.Text = GridView1.SelectedItem.Cells[11].Text.ToString();
        string flag = GridView1.SelectedItem.Cells[10].Text.ToString();
        Session["WorkExtend_ID"] = GridView1.SelectedItem.Cells[3].Text.ToString();

        Label10.Text = Session["WorkExtend_ID"].ToString();
        btnadd.Enabled = false;
        Button2.Enabled = true;
        Button1.Enabled = true;
    }

    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }


    //protected void btndelete_Click(object sender, EventArgs e)
    //{//old code
    //    try
    //    {
    //        for (int i = 0; i < GridView1.Items.Count; i++)
    //        {
    //            CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
    //            DataSet ds = new DataSet();
    //            if (cb.Checked)
    //            {

    //                List<string> para = new List<string>();
    //                para.Add(GridView1.Items[i].Cells[2].Text.ToString());
    //                ds = bl_oj.FillGridWithParameter(para, " delete_workextend");
    //                lblmsg.Text = "Record Deleted";
    //                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
    //            }
    //            else
    //            {
    //                lblmsg.Visible = true;
    //                lblmsg.Text = "Select Record To Delete";
    //                lblmsg.Text = "Record Deleted11";
    //                lblmsg.Text = "Record Deleted22";
    //                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

    //            }
    //        }
    //        fillgrid();
    //        clearall();
    //    }
    //    catch (Exception ex)
    //    {
    //    }
    //}
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            setzero();
            List<String> para = new List<string>();
            para.Add(HiddenField1.Value);
            para.Add(Session["Work_ID"].ToString());
            para.Add(bl_oj.convertDate(txtdateextend.Text).ToString());
          //  para.Add(txtkalawadhi.Text);
            if (RadioButtonList2.SelectedValue.ToString() == "Days")
            {
                para.Add(txtkalawadhi.Text);
                para.Add("0");
            }
            else
            {
                para.Add("0");
                para.Add(txtkalawadhi.Text);
            }
            //para.Add(txtkalawadhiMonths.Text);
            para.Add(bl_oj.convertDate(txtworkstartdate.Text).ToString());
            para.Add(bl_oj.convertDate(txtworkenddate.Text).ToString());
            para.Add(txtfineperday.Text);
            para.Add(RadioButtonList1.SelectedValue.ToString());
            para.Add(TextBox1.Text);


            //nn
            //RadioButtonList2.Items.FindByValue(GridView1.SelectedItem.Cells[1].Text.ToString()).Selected = true;
           para.Add(RadioButtonList2.SelectedValue.ToString());
            //nn



           ds= bl_oj.ExecuteStoredFunctionWithParameters(para, "update_workextend");
           wid1 = ds.Tables[0].Rows[0][0].ToString();
            //Session["WorkExtendID"] = wid;
            //Code for Upload Image

           DataSet ds1 = new DataSet();
           List<string> list1 = new List<string>();
           list1.Add(Session["Work_ID"].ToString());
           list1.Add(HiddenField1.Value);

           ds1 = bl_oj.FillGridWithParameter(list1, "sp_Check_Image_Status");
           if (ds1.Tables[0].Rows.Count != 0)
           {
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
                           para1.Add(Label10.Text);

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

                           SqlCommand myCommand = new SqlCommand("Sp_WorkExtendImageUpload", myConnection);
                           myCommand.CommandType = CommandType.StoredProcedure;

                           SqlParameter Image_Idsp = new SqlParameter("@image_ID", SqlDbType.BigInt);

                           Image_Idsp.Value = Convert.ToInt64("1");

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

                           workextend_id.Value = Convert.ToInt64(HiddenField1.Value);

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
                       //  Label1.Text = "Please try again later";
                   }


               }
   

           }
           else
           {
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
                           para1.Add(Label10.Text);

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

                           SqlCommand myCommand = new SqlCommand("Sp_WorkExtendImageUpdate", myConnection);
                           myCommand.CommandType = CommandType.StoredProcedure;

                           SqlParameter Image_Idsp = new SqlParameter("@image_ID", SqlDbType.BigInt);

                           Image_Idsp.Value = Convert.ToInt64("1");

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

                           workextend_id.Value = Convert.ToInt64(HiddenField1.Value);

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
                       //  Label1.Text = "Please try again later";
                   }


               }

           }
            

           //Code for Upload Image end

            Session["WorkExtendID"] = HiddenField1.Value;
            
           // lblmsg.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);

            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("10");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            bl_oj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
            txtdateextend.Focus();
            fillgrid();
            clearall();
            btn_nxt.Focus();
            btnadd.Enabled = true;
            Button2.Enabled = false;
            Button1.Enabled = true;
        }
        catch (Exception ex)
        {
        }
    }





    protected void btndelete_Click(object sender, EventArgs e)
    {//modifid code new
        try
        {
            int select = 0;
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
                DataSet ds = new DataSet();
                if (cb.Checked)
                {
                    select = 1;
                    List<string> para = new List<string>();
                    para.Add(GridView1.Items[i].Cells[2].Text.ToString());
                    ds = bl_oj.FillGridWithParameter(para, " delete_workextend");

                }
            }
            fillgrid();
            if (select == 1)
            {
                lblmsg.Text = "Record Deleted";
              ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);

            }
            else
            {
                //if (select == 1)
                //{
                    // lblmsg.Visible = true;
                    lblmsg.Text = "Select Record To Delete";
                 ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

               // }
            }


           // clearall();
        }
        catch (Exception ex)
        {
        }
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
    protected void txtkalawadhi_TextChanged(object sender, EventArgs e)
    {
        try
        {
            txtworkenddate.Text = "";
            if (txtdateextend.Text != "")
            {
                if (RadioButtonList2.SelectedValue.ToString() == "Days")
                {
                    DateTime date = DateTime.ParseExact(txtworkstartdate.Text, "dd/MM/yyyy", null);
                    System.DateTime today = date.AddDays(Convert.ToInt32(txtkalawadhi.Text));
                    DateTime Date = Convert.ToDateTime(today.ToString());
                    txtworkenddate.Text = Date.ToString("dd/MM/yyyy");
                    this.SetFocus(TextBox1);
                }
                if (RadioButtonList2.SelectedValue.ToString() == "Months")
                {
                    DateTime date = DateTime.ParseExact(txtworkstartdate.Text, "dd/MM/yyyy", null);
                    System.DateTime today = date.AddMonths(Convert.ToInt32(txtkalawadhi.Text));
                    DateTime Date = Convert.ToDateTime(today.ToString());
                    txtworkenddate.Text = Date.ToString("dd/MM/yyyy");
                    this.SetFocus(TextBox1);
                }
                
            }
        }
        catch (Exception ex)
        { }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Report/workextend.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        txtdateextend.Focus();
        clearall();
        btnadd.Enabled = true;
        Button2.Enabled = false;
        btndelete.Enabled = true;
        Button1.Enabled = true;

    }

    protected void btn_nxt_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/InsuranceDetails.aspx");
    }


 //new code for months

    //protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    //{
       
    //    if(RadioButtonList2.SelectedValue=="Days")
    //    {
           
    //        txtkalawadhi.Visible = true;
    //        txtkalawadhiMonths.Visible = false;
           
    //    }
    //    else
            
    //    {
    //        txtkalawadhi.Visible =false;
    //        txtkalawadhiMonths.Visible =true;
          

    //    }
    //}
    //protected void txtkalawadhiMonths_TextChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        txtworkenddate.Text = "";
    //        if (txtdateextend.Text != "")
    //        {
    //            DateTime date = DateTime.ParseExact(txtworkstartdate.Text, "dd/MM/yyyy", null);
    //            System.DateTime today = date.AddMonths(Convert.ToInt32(txtkalawadhiMonths.Text));
    //            DateTime Date = Convert.ToDateTime(today.ToString());
    //            txtworkenddate.Text = Date.ToString("dd/MM/yyyy");
    //            this.SetFocus(TextBox1);
    //        }
    //    }
    //    catch (Exception ex)
    //    { }
    //}
 

    //code for view attachments
       //protected void ViewAttachments_Click(object sender, EventArgs e)
       //{
           
          

       //}
       protected void ViewAttachments_Click1(object sender, ImageClickEventArgs e)
       {
           DataGridItem grdrow = (DataGridItem)((ImageButton)sender).NamingContainer;
           Session["WorkExtend_ID"] = grdrow.Cells[2].Text;


           Response.Redirect("WorkExtendImage.aspx");
       }

       //code for enabling next button
       protected void Checkstagestatus()
       {
           DataSet ds = new DataSet();
           List<string> list = new List<string>();
           list.Add(Session["Work_ID"].ToString());
           list.Add("10");

           ds = bl_oj.FillGridWithParameter(list, "sp_Check_Stage_Status");
           if (ds.Tables[0].Rows.Count != 0)
           {
               lnk_Next.Visible = true;
           }
           else
           {
               lnk_Next.Visible = true;
           }
       }

}