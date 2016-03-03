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
using System.Data;
using BussinessLayer;

public partial class Form_Fine_CEO : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_Obj = new BusinessLayerclass();
protected void Page_Load(object sender, EventArgs e)
    {try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {
         
                        
                callclearall();
                search_work();
                fillddltaluka();
                filllekhashirsh();
                fillyojana();
            }
        }
            catch (Exception ex)
            {
            }
      
    }  
     protected void  Button1_Click(object sender, EventArgs e)
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
            ds1 = bl_Obj.FillGrid("ddl_workfine");
            ddlwork.DataValueField = "workplanningID";
            ddlwork.DataTextField = "workname";
            ddlwork.DataSource = ds1.Tables[0];
            ddlwork.DataBind();
            ddlwork.Items.Insert(0, (new ListItem("---Select---", "0")));          
        }
        catch (Exception ex)
        {
        }
}


    protected void search_work()
    {
        DataSet ds1 = new DataSet();
        List<string> list = new List<string>();
        List<string> para = new List<string>();  
        if (!(ddlhead.SelectedValue.ToString() == "0" || ddlhead.SelectedValue.ToString() == ""))
        {
            para.Add("@HDID");
            list.Add(ddlhead.SelectedValue.ToString());
        }
        if (!(ddlYojana.SelectedValue.ToString() == "0" || ddlYojana.SelectedValue.ToString() == ""))
        {
            para.Add("@YojanaID");
            list.Add(ddlYojana.SelectedValue.ToString());
        }
        if (!(ddltaluka.SelectedValue.ToString() == "0" || ddltaluka.SelectedValue.ToString() == ""))
        {
            para.Add("@TalukaId");
            list.Add(ddltaluka.SelectedValue.ToString());
        }
        ds1 = bl_Obj.FillGrid("ddl_workfine");
        ddlwork.DataValueField = "workplanningID";
        ddlwork.DataTextField = "workname";
        ddlwork.DataSource = ds1.Tables[0];
        ddlwork.DataBind();
        ddlwork.Items.Insert(0, (new ListItem("---Select---", "0")));           
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
            else{}
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

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlYojana.ClearSelection();
        fillyojana();
    }
 
    protected void ddlwork_SelectedIndexChanged(object sender, EventArgs e)
    {
        clearall();
        fill_info();   
    }

    public void clearall()
    {
        lbltaluka.Text = "";
        lblEngineer.Text = "";
        Label19.Text = "";
        Label7.Text = "";
        Label30.Text = "";
        Label9.Text = "";
        lblvillage.Text = "";
        lblthekedar.Text = "";
        Label26.Text = "";
        Label27.Text = "";
        Label32.Text = "";
        Label35.Text = "";
        lblekundand.Text = "";
        lblmagildand.Text = "";
        lblchaludand.Text = "";

    }


    protected void btn_add_Click(object sender, EventArgs e)
    {
        List<string> para = new List<string>();
        para.Add(ddlwork.SelectedValue.ToString());
        para.Add(txtdandpratidin.Text);
        string date = bl_Obj.convertDate(txtdinank.Text);
        para.Add(date.ToString());
        string date1 = bl_Obj.convertDate(txttodate.Text);
        para.Add(date1.ToString());
        para.Add(txtekundand.Text);
        para.Add(txtremark.Text);
        para.Add("c");
        bl_Obj.FillGridWithParameter(para, "sp_insertfineCEO");
        lblmsg.Text = "Record Inseted";
        callclearall();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtdinank.Text=string.Format("{0:dd/MM/yyyy}",Calendar1.SelectedDate);
        Calendar1.Visible = false;    
    }
    public void callclearall()
    {
        txtdandpratidin.Text = "";
        txtdinank.Text = "";
        txtremark.Text = "";
        txtekundand.Text = "";
        txttodate.Text = "";
        txtfromdate.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
    }


    protected void btnttodate_Click(object sender, EventArgs e)
    {
        Calendar2.Visible = true;
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        txttodate.Text = string.Format("{0:dd/MM/yyyy}", Calendar2.SelectedDate);
    
        Calendar2.Visible = false;

    }


    protected void txtdandpratidin_TextChanged(object sender, EventArgs e)
    {

        int days = Convert.ToDateTime(txttodate.Text).Subtract(Convert.ToDateTime(txtdinank.Text)).Days;
        double total = Convert.ToDouble(txtdandpratidin.Text) * days;
        txtekundand.Text = total.ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Calendar3.Visible=true;
    }
    protected void Calendar3_SelectionChanged(object sender, EventArgs e)
    {
        txtfromdate.Text = string.Format("{0:dd/MM/yyyy}", Calendar3.SelectedDate);
       
        Calendar3.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Calendar4.Visible = true;
    }
    protected void Calendar4_SelectionChanged(object sender, EventArgs e)
    {
    TextBox2.Text = string.Format("{0:dd/MM/yyyy}", Calendar4.SelectedDate);

        Calendar4.Visible = false;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        try
        {
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
         
            para.Add(ddlwork.SelectedValue.ToString());

            string date = bl_Obj.convertDate(txtfromdate.Text);
            para.Add(date.ToString());
            string date1 = bl_Obj.convertDate(TextBox2.Text);
            para.Add(date1.ToString());
            para.Add(TextBox3.Text);
            para.Add(TextBox4.Text);
            para.Add("m");
            ds = bl_Obj.FillGridWithParameter(para, "sp_insertfineCEOless");
            L.Text = "Record Inseted";
            callclearall();
           
        }
        catch (Exception ex)
        { 
        }
    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {
        int days = Convert.ToDateTime(TextBox2.Text).Subtract(Convert.ToDateTime(txtfromdate.Text)).Days;
        double total = Convert.ToDouble(TextBox3.Text) * days;
        TextBox4.Text = total.ToString();
    }
}
 

