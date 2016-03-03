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

public partial class Form_Kam_Purn_kelayche_Cert : System.Web.UI.Page
{
    //string wid;
    BussinessLayer.BusinessLayerclass bl_obj = new BusinessLayerclass();
    //added for ddmmyy format for date
    BussinessLayer.ThekedarMaster bl_ob = new ThekedarMaster();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        btnsave.Enabled = true;
        try
        {
            //TextBox2.Text = Session["SurakshaDetails"].ToString();
            //TextBox3.Text = Session["SurakshaDate"].ToString();
            //TextBox6.Text = Session["SurakshaAmount"].ToString();
            //TextBox4.Text = Session["AnamatDetails"].ToString();
            //TextBox5.Text = Session["AnamatDate"].ToString();
            //TextBox7.Text = Session["AnamatAmount"].ToString();

            
            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");


            if (!IsPostBack)
            {
                

                date_completion.Focus();

                //fillItem();
                FillForm();
                Checkstagestatus();

                //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                //    "गाव : " + Session["Gavname"].ToString()
                //     + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();

                lblTalukatext.Text = "कामाचे नाव : " + Session["Workname"].ToString();
                DataSet ds = new DataSet();
                List<string> list = new List<string>();
                list.Add(Session["Work_ID"].ToString());
                ds = bl_obj.FillGridWithParameter(list, "SP_Fetch_Bayana_Surksha_Details");

                TextBox2.Text = ds.Tables[0].Rows[0][0].ToString();
                TextBox3.Text = ds.Tables[0].Rows[0][1].ToString();
                TextBox6.Text = ds.Tables[0].Rows[0][2].ToString();
                TextBox4.Text = ds.Tables[0].Rows[0][3].ToString();
                TextBox5.Text = ds.Tables[0].Rows[0][4].ToString();
                TextBox7.Text = ds.Tables[0].Rows[0][5].ToString();



            }
        }
        catch (Exception ex)
        { }

    }
    protected void Fillgrid()
    {
        fillItem();
        List<string> para1 = new List<string>();
        DataSet ds = new DataSet();
        para1.Add(Session["Work_ID"].ToString());
        ds = bl_obj.FillGridWithParameter(para1, "sp_SelectTmpRecordDetails");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

    }
    protected void fillItem()
    {
        DataSet ds = new DataSet();
        ds = bl_obj.FillGrid("sp_Fill_Items");
        DDLITem.DataValueField = "item_id";
        DDLITem.DataTextField = "item";
        DDLITem.DataSource = ds;
        DDLITem.DataBind();
        DDLITem.Items.Insert(0, (new ListItem("---Select---", "")));
    }
    public void FillForm()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            ds = bl_obj.FillGridWithParameter(list, "sp_KampurnaRecord");
            if (ds.Tables[0].Rows.Count != 0)
            {
                //btnsave.Enabled = false;
                btnUpdate.Enabled = true;
                Fillgrid();
                TextBox1.Text = ds.Tables[0].Rows[0][0].ToString();
                TextBox2.Text = ds.Tables[0].Rows[0][1].ToString();
                TextBox3.Text = ds.Tables[0].Rows[0][2].ToString();
                TextBox6.Text = ds.Tables[0].Rows[0][3].ToString() + ".00";
                TextBox4.Text = ds.Tables[0].Rows[0][4].ToString();
                TextBox5.Text = ds.Tables[0].Rows[0][5].ToString();
                TextBox7.Text = ds.Tables[0].Rows[0][6].ToString() + ".00";
                TextBox8.Text = ds.Tables[0].Rows[0][7].ToString();
                date_completion.Text = ds.Tables[0].Rows[0][8].ToString();
            }
            else
            {
                btnsave.Enabled = true;
                btnUpdate.Enabled = false;
            }
            Fillgrid();
        }
        catch (Exception ex)
        { }
    }
    public void setzero1()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtYear);
        plist.Add(txtBunchNo);
        plist.Add(txtFileno);
        plist.Add(txtRackno);
        bl_obj.TextboxNull(plist);
    }
    public void setzero2()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(TextBox1);
        plist.Add(TextBox8);
        plist.Add(TextBox2);
        plist.Add(TextBox4);
        bl_obj.Textboxstring(plist);
        plist.Clear();
        plist.Add(TextBox5);
        plist.Add(TextBox3);
        bl_obj.Textboxdate(plist);
        plist.Clear();
        plist.Add(TextBox5);
        plist.Add(TextBox3);
        bl_obj.Textboxdate(plist);

    }
    protected void Butt_Add_Click(object sender, EventArgs e)
    {

    }
    protected void Callclear()
    {
      ddl_Mudat.ClearSelection();
        DDLITem.ClearSelection();
        txtBunchNo.Text = "";
        txtFileno.Text = "";
        txtRackno.Text = "";
        txtYear.Text = "";
           
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);
    }
    protected void Datagrid_UpdateCommand(object source, DataGridCommandEventArgs e)
    {
        try
        {
            TextBox Item;
            TextBox limit;
            TextBox year;
            TextBox banch;
            TextBox file;
            TextBox rackno;
            DataSet ds = new DataSet();
            Item = (TextBox)(e.Item.Cells[3].Controls[0]);
            limit = (TextBox)(e.Item.Cells[4].Controls[0]);
            year = (TextBox)(e.Item.Cells[5].Controls[0]);
            banch = (TextBox)(e.Item.Cells[6].Controls[0]);
            file = (TextBox)(e.Item.Cells[7].Controls[0]);
            rackno = (TextBox)(e.Item.Cells[8].Controls[0]);
            Item.Enabled = false;
            List<string> para1 = new List<string>();
            para1.Add(Session["Work_ID"].ToString());
            para1.Add(Item.Text);
            para1.Add(limit.Text);
            para1.Add(year.Text);
            para1.Add(banch.Text);
            para1.Add(file.Text);
            para1.Add(rackno.Text);
            para1.Add("U");
            ds = bl_obj.FillGridWithParameter(para1, "sp_TmpRecordRoomDetails");
            DataGrid1.EditItemIndex = -1;
            Fillgrid();
            DataGrid1.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            ViewAttachments.Enabled = false;
            setzero2();
            List<string> para1 = new List<string>();
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add(Session["Work_ID"].ToString());
            para.Add(TextBox1.Text);
            para.Add(TextBox8.Text);
            para.Add(TextBox2.Text);
            para.Add(bl_obj.convertDate(TextBox3.Text).ToString());
            para.Add(TextBox6.Text);
            para.Add(TextBox4.Text);
            para.Add(bl_obj.convertDate(TextBox5.Text).ToString());
            para.Add(TextBox7.Text);
            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {

                para.Add(DataGrid1.Items[i].Cells[4].Text);

                para.Add(DataGrid1.Items[i].Cells[5].Text);

                para.Add(DataGrid1.Items[i].Cells[6].Text);

                para.Add(DataGrid1.Items[i].Cells[7].Text);

                para.Add(DataGrid1.Items[i].Cells[8].Text);

            }
            para.Add(bl_obj.convertDate(date_completion.Text));
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "Sp_ComplitionDetails");
            lnk_Next.Visible = true;
            ViewAttachments.Enabled = true;
            // wid = ds.Tables[0].Rows[0][0].ToString();
            // Session["Work_ID"] = ds.Tables[0].Rows[0][0].ToString();

            HttpFileCollection uploadedFiles = Request.Files;
            for (int i = 0; i < uploadedFiles.Count; i++)
            {
                HttpPostedFile userPostedFile = uploadedFiles[i];
                try
                {
                    if (userPostedFile.ContentLength > 0)
                    {

                        List<string> para2 = new List<string>();
                        para2.Add(Session["Work_ID"].ToString());
                        para2.Add(Label10.Text);

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

                        SqlCommand myCommand = new SqlCommand("Sp_KamPurnImageUpload", myConnection);
                        myCommand.CommandType = CommandType.StoredProcedure;

                        SqlParameter Image_Idsp = new SqlParameter("@kamimg_ID", SqlDbType.BigInt);

                        Image_Idsp.Value = Convert.ToInt64("1");

                        myCommand.Parameters.Add(Image_Idsp);

                        SqlParameter Image_Iconsp = new SqlParameter("@kamimage", SqlDbType.Image);

                        Image_Iconsp.Value = ImageContent;

                        myCommand.Parameters.Add(Image_Iconsp);

                        SqlParameter Image_Typesp = new SqlParameter("@kamimagetype", SqlDbType.VarChar, 255);

                        Image_Typesp.Value = strImageType;

                        myCommand.Parameters.Add(Image_Typesp);


                        SqlParameter workid = new SqlParameter("@workplanningID", SqlDbType.BigInt);

                        workid.Value = Convert.ToInt64(Session["Work_ID"].ToString());

                        myCommand.Parameters.Add(workid);


                        //SqlParameter workextend_id = new SqlParameter("@wid", SqlDbType.BigInt);

                        //workextend_id.Value = Convert.ToInt64(wid);

                        //myCommand.Parameters.Add(workextend_id);



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




            para.Clear();
          //  Label9.Text = "record Inserted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("13");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            bl_obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
           
            FillForm();
            btn_nxt.Focus();
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "disable_btnsave();", true); 
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            setzero2();
            List<string> para1 = new List<string>();
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add(Session["Work_ID"].ToString());
            para.Add(TextBox1.Text);
            para.Add(TextBox8.Text);
            para.Add(TextBox2.Text);
            para.Add(bl_obj.convertDate(TextBox3.Text).ToString());
            para.Add(TextBox6.Text);
            para.Add(TextBox4.Text);
            para.Add(bl_obj.convertDate(TextBox5.Text).ToString());
            para.Add(TextBox7.Text);
            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                para.Add(DataGrid1.Items[i].Cells[4].Text);
                para.Add(DataGrid1.Items[i].Cells[5].Text);
                para.Add(DataGrid1.Items[i].Cells[6].Text);
                para.Add(DataGrid1.Items[i].Cells[7].Text);
                para.Add(DataGrid1.Items[i].Cells[8].Text);
            }
            para.Add(bl_obj.convertDate(date_completion.Text));
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "Sp_ComplitionDetails");
            para.Clear();
           // Label9.Text = "record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
          //  ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
            FillForm();
            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("13");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            bl_obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
            btn_nxt.Focus();
            //  btnsave.Enabled = false;
            btnUpdate.Enabled = true;
        }
        catch (Exception ex)
        {

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            setzero1();
            List<string> paralist = new List<string>();
            DataSet ds = new DataSet();
            paralist.Add(HiddenField1.Value.ToString());
            paralist.Add(DDLITem.SelectedValue.ToString());
            if (ddl_Mudat.SelectedValue.ToString() == "0")
            {
               // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Mudat();", true);
               // Label9.Text = "select Mudat";
            }
            else
            {
                fillddlmudat();
                paralist.Add(Label19.Text);

                paralist.Add(bl_obj.convertDate(txtYear.Text).ToString());

               // paralist.Add(bl_ob.convertDate(txtYear.Text).ToString()); 
                paralist.Add(bl_ob.convertDate(txtYear.Text).ToString());

                paralist.Add(txtBunchNo.Text.ToString());
                paralist.Add(txtFileno.Text.ToString());
                paralist.Add(txtRackno.Text.ToString());
                if (TextBox9.Text == "0")
                {
                    paralist.Add("a");
                }
                else
                {
                    paralist.Add("U");
                }
                ds = bl_obj.ExecuteStoredFunctionWithParameters(paralist, "sp_TmpRecordRoomDetails");
                lnk_Next.Visible = true;
                string items = ds.Tables[0].Rows[0][0].ToString();
                if (items.ToString() == "")
                {
                    //Label9.Text = "Record Inserted";
                    Label9.Text = "Action Petrformed Successfully";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
                }
                else
                {
                    //Label9.Text = "Record Updated";
                    Label9.Text = "Action Petrformed Successfully";
                   // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkRecord();", true);
                }
            }

            Fillgrid();
            Callclear();
            Butt_Add.Enabled = true;
            Button1.Enabled = true;
        }
        catch (Exception ex)
        { }
    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenField1.Value = DataGrid1.SelectedItem.Cells[2].Text.ToString();
        txtYear.Text = DataGrid1.SelectedItem.Cells[5].Text.ToString();
        txtBunchNo.Text = DataGrid1.SelectedItem.Cells[6].Text.ToString();
        txtFileno.Text = DataGrid1.SelectedItem.Cells[7].Text.ToString();
        txtRackno.Text = DataGrid1.SelectedItem.Cells[8].Text.ToString();
        DDLITem.ClearSelection();
        DDLITem.Items.FindByText(DataGrid1.SelectedItem.Cells[3].Text.ToString()).Selected = true;
        TextBox9.Text = DataGrid1.SelectedItem.Cells[9].Text.ToString();
        Butt_Add.Enabled = false;
        Button1.Enabled = true;
    }
    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        Fillgrid();
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataGrid1.DataBind();
    }
    protected void btn_nxt_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/CompletionDetailsof Project branch.aspx");
    }
    private void fillddlmudat()
    {

        DateTime today = DateTime.Now;
        if (ddl_Mudat.SelectedValue.ToString() == "A")
        {
            Label19.Text = "30";
        }
        else if (ddl_Mudat.SelectedValue.ToString() == "B")
        {
            Label19.Text = "15";
        }
        else if (ddl_Mudat.SelectedValue.ToString() == "C")
        {
            Label19.Text = "10";
        }
        else if (ddl_Mudat.SelectedValue.ToString() == "C1")
        {
            Label19.Text = "5";
        }
        else
        {
            Label19.Text = "1";
        }

        DateTime year = today.AddYears(Convert.ToInt32(Label19.Text));
        DateTime Date = Convert.ToDateTime(year.ToString());
        txtYear.Text = Date.ToString("d");

    }

    //code for view attachments
    protected void ViewAttachments_Click(object sender, EventArgs e)
    {

        //DataGridItem grdrow = (DataGridItem)((Button)sender).NamingContainer;

        List<string> paralist = new List<string>();
        paralist.Add(Session["Work_ID"].ToString());
        //Session["Work_ID"] = grdrow.Cells[2].Text;


        Response.Redirect("KamPurnImage.aspx");

    }
    protected void ddl_Mudat_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            setzero1();
            List<string> paralist = new List<string>();
            DataSet ds = new DataSet();
            paralist.Add(Session["Work_ID"].ToString());
            paralist.Add(DDLITem.SelectedValue.ToString());
            if (ddl_Mudat.SelectedValue.ToString() == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Mudat();", true);
                Label9.Text = "select Mudat";
            }
            else
            {
                if (ddl_Mudat.SelectedValue.ToString() == "A")
                {
                    DateTime today = DateTime.Now;
                    DateTime year = today.AddYears(30);
                    paralist.Add("30");
                    DateTime Date = Convert.ToDateTime(year.ToString());
                    txtYear.Text = Date.ToString("d");
                    paralist.Add(bl_ob.convertDate(txtYear.Text).ToString());
                }
                else if (ddl_Mudat.SelectedValue.ToString() == "B")
                {
                    DateTime today = DateTime.Now;
                    DateTime year = today.AddYears(15);
                    paralist.Add("15");
                    DateTime Date = Convert.ToDateTime(year.ToString());
                    txtYear.Text = Date.ToString("d");
                    paralist.Add(bl_ob.convertDate(txtYear.Text).ToString());
                }
                else if (ddl_Mudat.SelectedValue.ToString() == "C")
                {
                    DateTime today = DateTime.Now;
                    DateTime year = today.AddYears(10);
                    paralist.Add("10");
                    DateTime Date = Convert.ToDateTime(year.ToString());
                    txtYear.Text = Date.ToString("d");
                    paralist.Add(bl_ob.convertDate(txtYear.Text).ToString());
                }
                else if (ddl_Mudat.SelectedValue.ToString() == "C1")
                {
                    DateTime today = DateTime.Now;
                    DateTime year = today.AddYears(5);
                    paralist.Add("5");
                    DateTime Date = Convert.ToDateTime(year.ToString());
                    txtYear.Text = Date.ToString("d");
                    paralist.Add(bl_ob.convertDate(txtYear.Text).ToString());
                }
                else
                {
                    DateTime today = DateTime.Now;
                    DateTime year = today.AddYears(1);
                    paralist.Add("1");
                    DateTime Date = Convert.ToDateTime(year.ToString());
                    txtYear.Text = Date.ToString("d");
                    paralist.Add(bl_ob.convertDate(txtYear.Text).ToString());
                }
                paralist.Add(txtBunchNo.Text.ToString());
                paralist.Add(txtFileno.Text.ToString());
                paralist.Add(txtRackno.Text.ToString());
                paralist.Add("A");
                ds = bl_obj.ExecuteStoredFunctionWithParameters(paralist, "sp_TmpRecordRoomDetails");


                string items = ds.Tables[0].Rows[0][0].ToString();
                if (items.ToString() == "")
                {
                   Label9.Text = "Action Petrformed Successfully";
                }
                else
                {
                   Label9.Text = "Action Petrformed Successfully";
                }
            }
            Fillgrid();
            Callclear();
        }
        catch (Exception ex)
        { }
    }


    //For disable next stage button 17/8/2015
    protected void Checkstagestatus()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("13");
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
}