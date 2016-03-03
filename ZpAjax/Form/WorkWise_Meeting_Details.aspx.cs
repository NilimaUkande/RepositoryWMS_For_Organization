using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using BussinessLayer;
public partial class Form_WorkWise_Meeting_Details : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_Obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");
            if (!Page.IsPostBack)
            {
                ddlhead.Focus();

                clearall();
                // FillgridMain();
                fillddltaluka();
                filllekhashirsh();
            }
        }
        catch (Exception ex)
        {

        }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();

        plist.Add(TextBox2);
        plist.Add(TextBox3);
        plist.Add(TextBox4);
        plist.Add(TextBox5);
        bl_Obj.TextboxNull(plist);
    }
    public void filllekhashirsh()
    {
        DataSet ds = new DataSet();

        ddlhead.DataValueField = "HDID";
        ddlhead.DataTextField = "HeadDescription";
        ds = bl_Obj.FillGrid("ddl_prashakiyamanyata");
        ddlhead.DataSource = ds.Tables[0];
        ddlhead.DataBind();
        ddlhead.Items.Insert(0, (new ListItem("---Select---", "0")));
    }
    public void fillyojana()
    {
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(ddlhead.SelectedValue.ToString());
        ds = bl_Obj.FillGridWithParameter(para, "sp_selectyojana");
        ddlYojana.DataValueField = "YojanaID";
        ddlYojana.DataTextField = "YojanaName";
        if (ds.Tables[0].Rows.Count != 0)
        {
            ddlYojana.Items.Clear();
            ddlYojana.DataSource = ds.Tables[0];
            ddlYojana.DataBind();
            ddlYojana.Items.Insert(0, (new ListItem("-----Select-----", "0")));
            ddlYojana.Enabled = true;
        }
        else
        {
            ddlYojana.Items.Clear();
            //ddlYojana.Items.Insert(0, (new ListItem("-----Select-----", "0")));
            ddlYojana.Enabled = false;
        }
    }
    public void fillddltaluka()
    {
        DataSet ds1 = new DataSet();
        List<string> para = new List<string>();
        ddltaluka.DataValueField = "TalukaId";
        ddltaluka.DataTextField = "TalukaName";
        para.Add(Session["District_id"].ToString());
        ds1 = bl_Obj.FillGridWithParameter(para, "sp_Taluka_fill_gav");
        ddltaluka.DataSource = ds1.Tables[0];
        ddltaluka.DataBind();
        ddltaluka.Items.Insert(0, (new ListItem("----select----", "0")));
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add("1");
            // para.Add("1");
            para.Add(ddlwork.SelectedValue.ToString());//set WorkplaningID in Session
            para.Add(bl_Obj.convertDate(TextBox1.Text).ToString());
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add(TextBox4.Text);
            para.Add(TextBox5.Text);
            para.Add(Session["officeid"].ToString()); //set the Office_ID in Session 
            para.Add("a");
            //Added to check if there is atleast one remark
            if ((TextBox2.Text != "0" && TextBox3.Text == "0" && TextBox4.Text == "0" && TextBox5.Text == "0")
                || (TextBox2.Text == "0" && TextBox3.Text != "0" && TextBox4.Text == "0" && TextBox5.Text == "0")
                || (TextBox2.Text == "0" && TextBox3.Text == "0" && TextBox4.Text != "0" && TextBox5.Text == "0")
                || (TextBox2.Text == "0" && TextBox3.Text == "0" && TextBox4.Text == "0" && TextBox5.Text != "0")
                || (TextBox2.Text != "0" && TextBox3.Text != "0" && TextBox4.Text != "0" && TextBox5.Text != "0")
                || (TextBox2.Text != "0" && TextBox3.Text != "0" && TextBox4.Text == "0" && TextBox5.Text == "0")
                || (TextBox2.Text == "0" && TextBox3.Text != "0" && TextBox4.Text != "0" && TextBox5.Text == "0")
                || (TextBox2.Text == "0" && TextBox3.Text == "0" && TextBox4.Text != "0" && TextBox5.Text!= "0")
                || (TextBox2.Text != "0" && TextBox3.Text == "0" && TextBox4.Text == "0" && TextBox5.Text != "0")
                || (TextBox2.Text != "0" && TextBox3.Text != "0" && TextBox4.Text != "0" && TextBox5.Text == "0")
                || (TextBox2.Text == "0" && TextBox3.Text != "0" && TextBox4.Text != "0" && TextBox5.Text != "0")
                || (TextBox2.Text != "0" && TextBox3.Text == "0" && TextBox4.Text != "0" && TextBox5.Text!= "0")
                || (TextBox2.Text != "0" && TextBox3.Text != "0" && TextBox4.Text == "0" && TextBox5.Text != "0") )
            {
                ds = bl_Obj.ExecuteStoredFunctionWithParameters(para, "sp_MeetingDetails");
                // lblmsg.Text = "Record inserted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
                fillgrid();
                clearall();
            }
            else
            {
                // lblmsg.Text = "Enter atleast one remark";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Remark();", true);
            }
            //Added to check if there is atleast one remark

           
        }
        catch (Exception ex)
        {


        }

    }
    public void fillgrid()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(ddlwork.SelectedValue.ToString());
        ds = bl_Obj.FillGridWithParameter(para, "Sp_FillMeetingDetails");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
        if (DataGrid1.Items.Count != 0)
        {
            try
            {
                btn_report.Enabled = true;


            }
            catch (Exception ex)
            { }

        }
        else
        {
            btn_report.Enabled = false;
        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add(HiddenField1.Value.ToString());
            para.Add(ddlwork.SelectedValue.ToString());//set WorkplaningID in Session
            para.Add(bl_Obj.convertDate(TextBox1.Text).ToString());
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add(TextBox4.Text);
            para.Add(TextBox5.Text);
            para.Add(Session["officeid"].ToString()); //set the Office_ID in Session 
            para.Add("u");
            ds = bl_Obj.ExecuteStoredFunctionWithParameters(para, "sp_MeetingDetails");
            // lblmsg.Text = "record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
            fillgrid();
            clearall();
            btnAdd.Enabled = true;
            Button2.Enabled = false;
        }
        catch (Exception ex)
        {


        }
    }
    public void clearall()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)DataGrid1.Items[i].FindControl("CheckBox2");
                if (cb.Checked)
                {
                    select = 1;
                    List<string> para = new List<string>();
                    para.Add(ddlwork.SelectedValue.ToString());
                    para.Add(DataGrid1.Items[i].Cells[2].Text.ToString());
                    DataSet ds = bl_Obj.FillGridWithParameter(para, "sp_delete_meeting");
                    // lblmsg.Text = "record deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delete();", true);

                }
                if (select == 0)
                {
                    // lblmsg.Text = "Select record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                }

            }
            fillgrid();

        }
        catch (Exception ex)
        {

        }

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        HiddenField1.Value = DataGrid1.SelectedItem.Cells[2].Text.ToString();
        TextBox1.Text = DataGrid1.SelectedItem.Cells[4].Text.ToString();
        TextBox2.Text = DataGrid1.SelectedItem.Cells[5].Text.ToString();
        TextBox3.Text = DataGrid1.SelectedItem.Cells[6].Text.ToString();
        TextBox4.Text = DataGrid1.SelectedItem.Cells[7].Text.ToString();
        TextBox5.Text = DataGrid1.SelectedItem.Cells[8].Text.ToString();
        btnAdd.Enabled = false;
        Button2.Enabled = true;
        btn_report.Enabled = true;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds1 = new DataSet();
            List<string> list = new List<string>();
            List<string> para_name = new List<string>();
            if (!(ddlhead.SelectedValue.ToString() == "0" || ddlhead.SelectedValue.ToString() == ""))
            {

                para_name.Add("@HDID");
                list.Add(ddlhead.SelectedValue.ToString());

            }
            if (!(ddlYojana.SelectedValue.ToString() == "0" || ddlYojana.SelectedValue.ToString() == ""))
            {
                para_name.Add("@YojanaID");
                list.Add(ddlYojana.SelectedValue.ToString());
            }
            if (!(ddltaluka.SelectedValue.ToString() == "0" || ddltaluka.SelectedValue.ToString() == ""))
            {
                para_name.Add("@TalukaId");
                list.Add(ddltaluka.SelectedValue.ToString());
            }
            para_name.Add("@officeid");
            list.Add("1");//officeid
            ds1 = bl_Obj.FillGridWithName_Parameter(para_name, list, "Sp_Meeting_search");
            ddlwork.DataValueField = "workplanningID";
            ddlwork.DataTextField = "workname";
            ddlwork.DataSource = ds1.Tables[0];
            ddlwork.DataBind();
            ddlwork.Items.Insert(0, (new ListItem("---Select---", "0")));

        }
        catch (Exception ex)
        { }
    }
    protected void fill_info()
    {
        DataSet ds3 = new DataSet();
        List<string> para = new List<string>();
        para.Add(ddlwork.SelectedValue.ToString());
        ds3 = bl_Obj.FillGridWithParameter(para, " sp_fill_meeting_info");

        if (ds3.Tables.Count != 0)
        {
            if (ds3.Tables[0].Rows.Count != 0)
            {
                Label30.Text = ds3.Tables[0].Rows[0][0].ToString();
                Label26.Text = ds3.Tables[0].Rows[0][1].ToString();
                Label19.Text = ds3.Tables[0].Rows[0][2].ToString();
                Label4.Text = ds3.Tables[0].Rows[0][3].ToString();
                Label27.Text = ds3.Tables[0].Rows[0][4].ToString();


            }
            else { }
            if (ds3.Tables[1].Rows.Count != 0)
            {
                Label32.Text = ds3.Tables[1].Rows[0][1].ToString();
            }
            else { }
            if (ds3.Tables[2].Rows.Count != 0)
            {
                lblEngineer.Text = ds3.Tables[2].Rows[0][0].ToString();
                lblthekedar.Text = ds3.Tables[2].Rows[0][1].ToString();
                lbltaluka.Text = ds3.Tables[2].Rows[0][2].ToString();
                lblvillage.Text = ds3.Tables[2].Rows[0][3].ToString();
                Label8.Text = ds3.Tables[2].Rows[0][4].ToString();
                Label35.Text = ds3.Tables[2].Rows[0][5].ToString();
            }
            else { }
        }


        // calculate penalty
        DataSet ds1 = new DataSet();

        ds1 = bl_Obj.FillGridWithParameter(para, "sp_calculate_penalty");
        if (ds1.Tables.Count != 0)
        {
            if (ds1.Tables[0].Rows.Count != 0 && ds1.Tables[0].Rows[0][0].ToString() != "")
            {
                lblDandDisplay.Text = ds1.Tables[0].Rows[0][0].ToString();
            }
            else
            {
                lblDandDisplay.Text = "0";
            }
        }

        // calculate penalty





    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlYojana.ClearSelection();
        fillyojana();
    }
    protected void ddlwork_SelectedIndexChanged(object sender, EventArgs e)
    {
        Clear();
        fill_info();
        fillgrid();

    }

    protected void Clear()
    {
        lbltaluka.Text = "";
        lblvillage.Text = "";
        lblEngineer.Text = "";
        lblthekedar.Text = "";
        Label19.Text = "";
        Label26.Text = "";
        Label4.Text = "";
        Label27.Text = "";
        Label30.Text = "";
        Label32.Text = "";
        Label8.Text = "";
        Label35.Text = "";
        lblDandDisplay.Text = "";


    }

    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btn_report_Click(object sender, EventArgs e)
    {
        string meetingid = HiddenField1.Value;
        string workid = ddlwork.SelectedValue.ToString();
        Server.Transfer("~/Report/MeetingWiseReportViewer.aspx?meetingid=" + meetingid + "&workid=" + workid);
    }
}
