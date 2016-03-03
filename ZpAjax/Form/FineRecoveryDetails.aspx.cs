using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BussinessLayer;
public partial class Form_FineRecoveryDetails : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_ob = new BusinessLayerclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");
            if (Session["Group_Id"].ToString() == "1")
                stage_button.Visible = false;
            if (!IsPostBack)
            {

                Checkstagestatus();
                TextBox1.Focus();
                fineRecoveryFill();
                fillgrid();
                clearall();
                Button2.Attributes.Add("OnClick", "if(!confirm('Are You Sure,To Delete Record?')) return false");
                //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
                //                + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();
                lblTalukatext.Text = "कामाचे नाव : " + Session["Workname"].ToString();
            }
        }
        catch (Exception ex)
        {
            //
        }




    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            String finerecoveryID;
            DataSet ds = new DataSet();
            List<string> para = new List<string>();

            para.Add("1");
            para.Add(Session["Work_ID"].ToString());//set the workID in session

            para.Add(bl_ob.convertDate(TextBox1.Text));
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add(TextBox4.Text);
            para.Add("a");
            ds = bl_ob.ExecuteStoredFunctionWithParameters(para, "Sp_FineRecoveryDetails");

            Session["finerecoveryID"] = ds.Tables[0].Rows[0][0].ToString();
            HiddenField1.Value = ds.Tables[0].Rows[0][0].ToString();
            lblFineRecoveryID.Text = Session["finerecoveryID"].ToString();
          //  Label6.Text = "Recored Inserted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
            lnk_Next.Visible = true;

            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("12");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            bl_ob.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
            clearall();
            fillgrid();
         //   Label6.Visible = true;
            btnUpdate.Enabled = true;
            btnSave.Enabled = false;



        }
        catch (Exception ex)
        {
        }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(TextBox1);
        bl_ob.Textboxdate(plist);
        plist.Clear();
        plist.Add(TextBox2);
        plist.Add(TextBox3);
        bl_ob.TextboxNull(plist);
        plist.Clear();
        plist.Add(TextBox4);
        bl_ob.Textboxstring(plist);
    }
    public void fillgrid()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
       // list.Add(HiddenField1.Value.ToString());
       list.Add(Session["Work_ID"].ToString());//Session["WorkId"].ToString();
       
        ds = bl_ob.FillGridWithParameter(list, "sp_fillgridfinerecoverydet");

        Cache.Insert("fine_rcvr", ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
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
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            //    setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(Session["Work_ID"].ToString());//set the workID in session

            para.Add(bl_ob.convertDate(TextBox1.Text));
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add(TextBox4.Text);
           // para.Add("u");
            ds = bl_ob.ExecuteStoredFunctionWithParameters(para, "Sp_FineRecoveryDetails_update");
          //  Label6.Text = "Recored Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
            fillgrid();
            clearall();
            //Label6.Visible = true;
            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("12");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            bl_ob.FillGridWithParameter(list, "sp_Stage_Tracking_insert");

        }
        catch (Exception ex)
        {

        }
    }
    public void fineRecoveryFill()
    {
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(Session["Work_ID"].ToString());//set the WorkplaningID in Session
        ds = bl_ob.FillGridWithParameter(para, "Sp_FineRecoveryFill");
        if (ds.Tables[0].Rows.Count != 0)
        {
            btnSave.Enabled = false;
            btnUpdate.Enabled = true;

            TextBox1.Text = (ds.Tables[0].Rows[0][0].ToString());
            TextBox2.Text = (ds.Tables[0].Rows[0][1].ToString()) + ".00";
            TextBox3.Text = (ds.Tables[0].Rows[0][2].ToString()) + ".00";
            TextBox4.Text = (ds.Tables[0].Rows[0][3].ToString());
        }
        else
        {
            btnSave.Enabled = true;
            btnUpdate.Enabled = false;

        }


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenField1.Value = GridView1.SelectedItem.Cells[2].Text.ToString();
        TextBox1.Text = GridView1.SelectedItem.Cells[4].Text.ToString();
        TextBox2.Text = GridView1.SelectedItem.Cells[5].Text.ToString();
        TextBox3.Text = GridView1.SelectedItem.Cells[6].Text.ToString();
        TextBox4.Text = GridView1.SelectedItem.Cells[7].Text.ToString();
        btnSave.Enabled = false;
        Button2.Enabled = false;
        btnUpdate.Enabled = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Focus();
        clearall();
    }
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);
    }

    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("fine_rcvr");
        fillgrid(ds);
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    private void fillgrid(DataSet ds)
    {
        Cache.Insert("fine_rcvr", ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        // flag = 0;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int select=0;
        try
        {
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
               // Label6.Visible = true;
                CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
                DataSet ds = new DataSet();
                if (cb.Checked)
                {
                    select=1;
                    List<string> para = new List<string>();
                    para.Add(GridView1.Items[i].Cells[2].Text.ToString());
                    ds = bl_ob.FillGridWithParameter(para, "sp_deletefinerecoverydet");
                 
                }
            }
             fillgrid();
               if(select==0)
                {
                    // Label6.Visible = true;
                   // Label6.Text = "Select Record To Delete";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }
            else
               {
                   // Label6.Text = "Record Deleted";
                   ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
               }
          
           
            clearall();

        }


        catch (Exception ex)
        {

        }
    }
    protected void btn_nxt_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Kam_Purn_kelayche_Cert.aspx");
    }

    //code for enabling next button
    protected void Checkstagestatus()
    {
        DataSet ds = new DataSet();
        List<string> list = new List<string>();
        list.Add(Session["Work_ID"].ToString());
        list.Add("12");

        ds = bl_ob.FillGridWithParameter(list, "sp_Check_Stage_Status");
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
