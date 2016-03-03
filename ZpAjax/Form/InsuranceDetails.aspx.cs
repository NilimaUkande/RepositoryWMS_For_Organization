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
using System.Collections.Generic;
using BussinessLayer;
using System.Data.SqlClient;
using System.IO;
public partial class Form_InsuranceDetails : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass obj = new BusinessLayerclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
       
            if (!Page.IsPostBack)
            {
                BillAmt.Focus();
                clrall();
                fillgrid();

                FillImage_Befor();

                fillddl1();

                Calculate_remaining_amount();
                Checkstagestatus();
               
            }
            lblTalukatext.Text = "कामाचे नाव : " + Session["Workname"].ToString();
//            lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
//+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();

        }
        catch (Exception ex)
        { }
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            List<string> para = new List<string>();          
            para.Add(Session["Work_ID"].ToString());
           // para.Add(txtkamachaVima.Text);
            para.Add("0");
           // para.Add(obj.convertDate(txtInsuranceDate.Text).ToString());
            para.Add("1/1/2016");
            para.Add(obj.convertDate(txtmojmapdinank.Text).ToString());           
            para.Add(txtmojmapbookno.Text);
          //  para.Add(txtvima.Text);
            para.Add("0");
            para.Add(txtvat.Text);
            para.Add(txtRoyalty.Text);
            para.Add(txtincometax.Text);
            para.Add(txtdand.Text);
           // para.Add(txtgramnidhi.Text);
            para.Add("0");
           // para.Add(txtkamgarnidhi.Text);
            para.Add("0");
            para.Add(txtsurkshaanamat.Text);
            para.Add(txtother.Text);
            para.Add(txtdhanadeshrakkm.Text);
            para.Add(txtdhanadeshno.Text);
            para.Add(obj.convertDate(txtdinank.Text).ToString());
            para.Add(txttotalexpenditure.Text);
            para.Add(txtvoucherno.Text);
            para.Add(ddlyear.SelectedValue.ToString());
            para.Add(BillAmt.Text);
            para.Add(txtupkar.Text);
            para.Add(txtBookNo.Text);
            para.Add(txtImageInfo.Text);

            //Added for Inserting UniqueBillNumber
            int spendHour,spendMinute, spendSecond;
            DateTime currentTime = DateTime.Now;
            string dt = System.DateTime.Now.ToShortDateString();
            spendHour = currentTime.Hour;
            spendMinute = currentTime.Minute;
            spendSecond = currentTime.Second;
            String a = (Session["Work_ID"].ToString() +  dt + spendHour + spendMinute);
            para.Add(a);
            //Added for Inserting UniqueBillNumber

            obj.ExecuteStoredFunctionWithParameters(para, "Sp_insertInsurance");
            lnk_Next.Visible = true;
            lblmsg.Text = "Record Inserted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);

            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("11");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");

            fillgrid();
            clrall();
            btn_nxt.Focus();


            // to deduct amount from fund
            para.Clear();
            DataSet dscheckamt = new DataSet();
            para.Add("0");           
            para.Add("0");
            para.Add(Session["Work_ID"].ToString());
            para.Add(BillAmt.Text);
            para.Add("bs");
            dscheckamt = obj.ExecuteStoredFunctionWithParameters(para, "Sp_Check_Remainingamount");
            if (dscheckamt.Tables.Count != 0)
            {
                if (dscheckamt.Tables[0].Rows.Count > 0)
                {
                    lbl_remaining_amt.Text = dscheckamt.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    lbl_remaining_amt.Text = "0";
                }
            }



           


            // to deduct amount from fund

            Calculate_remaining_amount();

            
        }
        catch (Exception ee)
        {
        }
    }
    public void setzero()
    {
        //List<TextBox> para = new List<TextBox>();
        //para.Add(txtkamachaVima);
        //para.Add(txtvima);
        //para.Add(txtvat);
        //para.Add(txtRoyalty);
        //para.Add(txtincometax);
        //para.Add(txtdand);
        //para.Add(txtgramnidhi);
        //para.Add(txtkamgarnidhi);
        //para.Add(txtsurkshaanamat);
        //para.Add(txtother);
        //para.Add(txtdhanadeshrakkm);
        //para.Add(txttotalexpenditure);
        //para.Add(BillAmt);
        //para.Add(txtupkar);
        //para.Add(txtvoucherno);
        //obj.TextboxNull(para);

        //para.Clear();
        //para.Add(txtdinank);
        //para.Add(txtmojmapdinank);
        //para.Add(txtInsuranceDate);
        //obj.Textboxdate(para);

        //para.Clear();
        //para.Add(txtmojmapbookno);
        //para.Add(txtBookNo);
        //para.Add(txtdhanadeshno);
     
        //obj.Textboxstring(para);

    }
    public void Calculate_remaining_amount()
    {

       
        // to calculate remaining amount
        List<string> para = new List<string>();
        DataSet dscheckamt = new DataSet();
        para.Add("0");
        para.Add("0");
        para.Add(Session["Work_ID"].ToString());
        para.Add("0");
        para.Add("bc");
        dscheckamt = obj.ExecuteStoredFunctionWithParameters(para, "Sp_Check_Remainingamount");
        if (dscheckamt.Tables.Count != 0)
        {
            if (dscheckamt.Tables[0].Rows.Count > 0)
            {

               
                lbl_remaining_amt.Text = "शिल्लक रक्कम:"+ dscheckamt.Tables[0].Rows[0][0].ToString() + ".00";
            }
            else
            {
                lbl_remaining_amt.Text = "शिल्लक रक्कम:" + "0";
            }
        }

        // to calculate remaining amount

    
    }
    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //GridView1.Visible = false;
        BillAmt.Text = GridView1.SelectedItem.Cells[23].Text.ToString()+".00";
       // txtkamachaVima.Text = GridView1.SelectedItem.Cells[3].Text.ToString()+".00";
       // txtInsuranceDate.Text = GridView1.SelectedItem.Cells[4].Text.ToString();
        txtmojmapdinank.Text = GridView1.SelectedItem.Cells[5].Text.ToString();
        txtmojmapbookno.Text = GridView1.SelectedItem.Cells[6].Text.ToString();
      //  txtvima.Text = GridView1.SelectedItem.Cells[7].Text.ToString()+".00";
        txtvat.Text = GridView1.SelectedItem.Cells[8].Text.ToString();
        txtRoyalty.Text = GridView1.SelectedItem.Cells[9].Text.ToString()+".00";
        txtincometax.Text = GridView1.SelectedItem.Cells[10].Text.ToString()+".00";
        txtdand.Text = GridView1.SelectedItem.Cells[11].Text.ToString()+".00";
      //  txtgramnidhi.Text = GridView1.SelectedItem.Cells[12].Text.ToString()+".00";
       // txtkamgarnidhi.Text = GridView1.SelectedItem.Cells[13].Text.ToString()+".00";
        txtsurkshaanamat.Text = GridView1.SelectedItem.Cells[14].Text.ToString()+".00";
        txtother.Text = GridView1.SelectedItem.Cells[15].Text.ToString()+".00";
        txtdhanadeshrakkm.Text = GridView1.SelectedItem.Cells[16].Text.ToString()+".00";
        txtdhanadeshno.Text = GridView1.SelectedItem.Cells[17].Text.ToString();
        txtdinank.Text = GridView1.SelectedItem.Cells[18].Text.ToString();
        txttotalexpenditure.Text = GridView1.SelectedItem.Cells[19].Text.ToString()+".00";
        txtvoucherno.Text = GridView1.SelectedItem.Cells[20].Text.ToString();
        ddlyear.ClearSelection();
        ddlyear.Items.FindByValue(GridView1.SelectedItem.Cells[21].Text.ToString()).Selected = true;

        //एकूण वजावट add .00 format
        txt_vajavat.Text = Convert.ToString(Convert.ToDouble(BillAmt.Text) - Convert.ToDouble(txttotalexpenditure.Text));
        TextBox1.Text = BillAmt.Text;
        txtupkar.Text = "0";
        txtBookNo.Text = GridView1.SelectedItem.Cells[25].Text.ToString();
        btnadd.Enabled = false;
        btndelete.Enabled = false;
        btnupdate.Enabled = true;
   
    }
    public void fillgrid()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());//Session["WorkId"].ToString();
        ds = obj.FillGridWithParameter(list, "sp_fillGrid_insurance");
        if (ds.Tables[0].Rows.Count != 0)
        {          
            GridView1.Visible = true;
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
        else
        {
            GridView1.Visible = false;
        }

        DataSet ds1 = new DataSet();
        ds1 = obj.FillGridWithParameter(list, "sp_select_info_work");
        if (ds1.Tables.Count != 0)
        {
            if (ds1.Tables[0].Rows.Count != 0)
            {
                Label23.Text = ds1.Tables[0].Rows[0][2].ToString()+".00";
                Label25.Text = ds1.Tables[0].Rows[0][1].ToString()+".00";
                Label27.Text = ds1.Tables[0].Rows[0][3].ToString()+".00";
                Label30.Text = ds1.Tables[0].Rows[0][4].ToString()+".00";
                Label32.Text = ds1.Tables[0].Rows[0][0].ToString()+".00";
                Label34.Text = ds1.Tables[1].Rows[0][0].ToString()+".00";
                calculatepercent();
            }
        }
    }
    public void calculatepercent()
    {
        double s = ((double.Parse(Label25.Text) / 100) * 1);
        //lbl_insu.Text = s.ToString();
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(Session["Work_ID"].ToString());
        ds = obj.FillGridWithParameter(para, "sp_calculatepercent");
        if (ds.Tables.Count != 0)
        {
            if (ds.Tables[0].Rows.Count != 0)
            {
                hf_reg_no.Value = ds.Tables[0].Rows[0][0].ToString();
                hf_flag.Value = ds.Tables[0].Rows[0][0].ToString();
                if (hf_reg_no.Value.ToString() == null)
                {
                    labelvat.Text = Convert.ToString((double.Parse(Label25.Text) / 100) * 4);
                }
                else
                {
                    labelvat.Text = Convert.ToString((double.Parse(Label25.Text) / 100) * 2);
                }
                if (hf_flag.Value.ToString() == "s")
                {
                    lblsecdeposite.Text = Convert.ToString((double.Parse(Label25.Text) / 100) * 1);
                }
                else if (hf_flag.Value.ToString() == "E")
                {
                    lblsecdeposite.Text = Convert.ToString((double.Parse(Label25.Text) / 100) * 2);
                }
                else if (hf_flag.Value.ToString() == "O")
                {
                    lblsecdeposite.Text = Convert.ToString((double.Parse(Label25.Text) / 100) * 2);
                }
            }
        }
        lblitax.Text = Convert.ToString((double.Parse(Label25.Text) / 100) * 2.3);      
        lblupkar.Text = Convert.ToString((double.Parse(Label25.Text) / 100) * 1);
       // Label37.Text = Convert.ToString(double.Parse(Label25.Text) - double.Parse(Label32.Text));
    }
    //protected void txtother_lostfocus(object sender, EventArgs e)
    //{
    //    Double totexpend = Double.Parse(txtvat.Text + txtRoyalty.Text + txtincometax.Text + txtdand.Text + txtkamgarnidhi.Text + txtkamgarnidhi.Text + txtsurkshaanamat.Text + txtother.Text+txtupkar.Text);
    //    Double a = Double.Parse(BillAmt.Text) - totexpend;
    //    txttotalexpenditure.Text = a.ToString();
    //}
    protected void btnupdate_Click1(object sender, EventArgs e)
    {
        try
        {
            setzero();
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());
           // para.Add(txtkamachaVima.Text);
            para.Add("0");
           // para.Add(obj.convertDate(txtInsuranceDate.Text).ToString());
            para.Add("1/1/2016");
            para.Add(obj.convertDate(txtmojmapdinank.Text).ToString());
            para.Add(txtmojmapbookno.Text);
           // para.Add(txtvima.Text);
            para.Add("0");
            para.Add(txtvat.Text);
            para.Add(txtRoyalty.Text);
            para.Add(txtincometax.Text);
            para.Add(txtdand.Text);
          //  para.Add(txtgramnidhi.Text);
            para.Add("0");
          //  para.Add(txtkamgarnidhi.Text);
            para.Add("0");
            para.Add(txtsurkshaanamat.Text);
            para.Add(txtother.Text);
            para.Add(txtdhanadeshrakkm.Text);
            para.Add(txtdhanadeshno.Text);
            para.Add(obj.convertDate(txtdinank.Text).ToString());
            para.Add(txttotalexpenditure.Text);
            para.Add(txtvoucherno.Text);
            para.Add(ddlyear.SelectedValue.ToString());
            para.Add(BillAmt.Text);
            para.Add(txtupkar.Text);
            para.Add(txtBookNo.Text);
            para.Add(GridView1.SelectedItem.Cells[26].Text.ToString());
            obj.ExecuteStoredFunctionWithParameters(para, "update_insurancedetais");
            fillgrid();
            btnadd.Enabled = true;
            btnupdate.Enabled = false;
             lblmsg.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
            clrall();
            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("11");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
            btn_nxt.Focus();
        }
        catch (Exception ex)
        {
        }
    }
    public void fillddl1()
    {
        DataSet ds1 = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["year"].ToString());
        ds1 = obj.FillGridWithParameter(para, "sp_Fill_YearMaster");
        ddlyear.DataValueField = "YearId";
        ddlyear.DataTextField = "Year";     
        ddlyear.DataSource = ds1.Tables[0];
        ddlyear.DataBind();
        ddlyear.Items.Insert(0, (new ListItem("----select---", "0")));
    }
    protected void btndelete_Click1(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
                DataSet ds = new DataSet();
                if (cb.Checked)
                {
                    List<string> para = new List<string>();
                    para.Add(GridView1.Items[i].Cells[26].Text.ToString());
                    ds = obj.FillGridWithParameter(para, "DeleteInsurance");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
                  lblmsg.Text = "record deleted";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                   lblmsg.Text = "Select Record To Delete";
                   lblmsg.Visible = true;
                }
            }
            fillgrid();
        }
        catch (Exception ex)
        {

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void txtother_TextChanged(object sender, EventArgs e)
    {
        total_expence();
        txtdhanadeshno.Focus();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
    public void clrall()
    {
        TextBox1.Text = "";
        txt_vajavat.Text = "";
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    protected void BillAmt_TextChanged(object sender, EventArgs e)
    {
        try
        {
            lblmsg.Text = "";
            //GridView1.Visible = false;
          //  RadioButtonList1.Focus();
            if (BillAmt.Text != "")
            {
                //lblinsurance.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 1)+".00";
                labelitax.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 2.3);
            }
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add(Session["Work_ID"].ToString());
            ds = obj.FillGridWithParameter(para, "sp_calculatepercent");
            if (ds.Tables.Count != 0)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    hf_reg_no.Value = ds.Tables[0].Rows[0][0].ToString();
                    string vat_no = ds.Tables[0].Rows[0][1].ToString();
                    hf_flag.Value = ds.Tables[0].Rows[0][0].ToString();
                    if (hf_reg_no.Value.ToString() == null)
                    {
                        labelvat.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 4);
                    }
                    else
                    {
                        labelvat.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 2);
                    }
                    if (hf_flag.Value.ToString() == "s")
                    {
                        labelsecurity.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 1);
                    }
                    else if (hf_flag.Value.ToString() == "E")
                    {
                        labelsecurity.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 2);
                    }
                    else if (hf_flag.Value.ToString() == "O")
                    {
                        labelsecurity.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 2);
                    }

                    if (vat_no.ToString() == null)
                    {
                        labelvat.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 5);
                    }
                    else
                    {
                        labelvat.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 2);
                    }
                }
                labelupkar.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 1);
                TextBox1.Text = BillAmt.Text;
            }

            // calculate penalty
              DataSet ds1 = new DataSet();

              ds1 = obj.FillGridWithParameter(para, "sp_calculate_penalty");
            if (ds1.Tables.Count != 0)
            {
                if (ds1.Tables[0].Rows.Count != 0 && ds1.Tables[0].Rows[0][0].ToString()!="")
                {
                    Lbl_Penalty.Text = "एकूण दंड:"+ds1.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    Lbl_Penalty.Text = "एकूण दंड:0";
                }
            }

  // calculate penalty
        }
        catch (Exception ex)
        { }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BillAmt.Focus();
        clrall();
        btnadd.Enabled = true;
        btnupdate.Enabled = false;
        btndelete.Enabled = true;
        fillgrid();
    }
    protected void btn_nxt_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/FineRecoveryDetails.aspx");
    }
    //protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (RadioButtonList1.SelectedValue.ToString() == "1")
    //    {
    //        //txtkamachaVima.Enabled = false;
    //      //  txtvima.Enabled = true;
    //        txtvima.Text = "0";
    //        txtkamachaVima.Text = "0";
    //       // txtInsuranceDate.Enabled = false;
    //       // txtmojmapdinank.Focus();

    //    }
    //    else
    //    {
    //        //txtkamachaVima.Enabled = true;
    //       // txtvima.Enabled = false;
    //        txtvima.Text = "0";
    //        txtkamachaVima.Text = "";
    //        txtkamachaVima.Focus();

    //    }
    //}
    protected void txtvima_TextChanged(object sender, EventArgs e)
    {
        total_expence();
    }
    protected void total_expence()
    {
        try
        {
           setzero();
            double totexpend = Double.Parse(txtvat.Text) + Double.Parse(txtRoyalty.Text) + Double.Parse(txtincometax.Text) + Double.Parse(txtdand.Text) + Double.Parse(txtsurkshaanamat.Text) + Double.Parse(txtupkar.Text) + Double.Parse(txtother.Text);
            txt_vajavat.Text = totexpend.ToString();
            double a = Double.Parse(BillAmt.Text) - totexpend;
            txttotalexpenditure.Text = a.ToString();
            txtdhanadeshrakkm.Text = txttotalexpenditure.Text;
            Label37.Text = (a + totexpend).ToString();
            txtvat.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 2);
           // labelvat.Text = Convert.ToString((double.Parse(BillAmt.Text) / 100) * 2);
        }
        catch (Exception ex)
        { }
     }
    protected void txtvat_TextChanged(object sender, EventArgs e)
    {
        total_expence();
    }
    protected void txtRoyalty_TextChanged(object sender, EventArgs e)
    {
        total_expence();
    }
    protected void txtincometax_TextChanged(object sender, EventArgs e)
    {
        total_expence();
    }
    protected void txtdand_TextChanged(object sender, EventArgs e)
    {
        total_expence();
    }
    protected void txtgramnidhi_TextChanged(object sender, EventArgs e)
    {
        total_expence();
    }
    protected void txtkamgarnidhi_TextChanged(object sender, EventArgs e)
    {
        total_expence();
    }
    protected void txtsurkshaanamat_TextChanged(object sender, EventArgs e)
    {
        total_expence();
    }
   
     protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());

            DataSet ds = new DataSet();
            ds = obj.FillGridWithParameter(para, "sp_selectImage4");
            if (ds.Tables[0].Rows.Count != 0)
            {
               obj.FillGridWithParameter(para, "Sp_DeleteImage4");
            }
            else
            {


                int intImageSize=0;
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

                    SqlCommand myCommand = new SqlCommand("Sp_InsertImage4", myConnection);



                    //' Mark the Command as a SPROC

                    myCommand.CommandType = CommandType.StoredProcedure;



                    //' Add Parameters to SPROC



                    SqlParameter Image_Idsp = new SqlParameter("@imgid4", SqlDbType.BigInt);

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


     protected void FillImage_Befor()
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(Session["Work_ID"].ToString());
            Image4.Visible = true;
            DataSet ds = new DataSet();
            ds = obj.FillGridWithParameter(para, "sp_selectImage4");
            int w_id = Convert.ToInt32(Session["Work_ID"].ToString());
            if (ds.Tables[0].Rows.Count != 0)
            {
                Image4.ImageUrl = "readrealimage.aspx?id=" + w_id + "&flag=" + 5;
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

     //code for enabling next button
     protected void Checkstagestatus()
     {
         DataSet ds = new DataSet();
         List<string> list = new List<string>();
         list.Add(Session["Work_ID"].ToString());
         list.Add("11");
         ds = obj.FillGridWithParameter(list, "sp_Check_Stage_Status");
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

 
                 