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
using BusinessLayer;
using System.Collections.Generic;


public partial class Form_panchyatsamiteeMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");

        if (!Page.IsPostBack)
        {
            
                txtpanchayatSamitteName.Focus();
                fillgrid();
                FillDDl();
                ClearAll();
                btndelete.Enabled = false;
            }
        }
        catch(Exception ex)
        {}

        //btndelete.Enabled = false;
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(txtpanchayatSamitteName.Text);
            para.Add(txtpscode.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(ddlzpcode.SelectedValue.ToString());
            para.Add("a");
            ds =bl.ExecuteStoredFunctionWithParameters(para, "sp_PanchayatSameteeGunMaster");
            fillgrid();
            ClearAll();
           // lblmsg.Text = "Record Inserted";
           // lblmsg.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(txtpanchayatSamitteName.Text);
            para.Add(txtpscode.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(ddlzpcode.SelectedValue.ToString());
            para.Add("u");
            ds = bl.ExecuteStoredFunctionWithParameters(para, "sp_PanchayatSameteeGunMaster");
            fillgrid();
            ClearAll();
           // lblmsg.Text = "Record Updated";
          //  lblmsg.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
               
            ddlzpcode.Enabled = true;
        }
        catch (Exception ex)
        {

        }
        btndelete.Enabled = true;
        btnadd.Enabled = true;
        btnupdate.Enabled = false;
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
    try
        {
            Boolean flag =false ;
            
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
                if (cb.Checked==true)
                {

                   // lblmsg.Visible = false;
                    List<string> para = new List<string>();
                    para.Add(GridView1.Items[i].Cells[2].Text.ToString());
                    DataSet ds = bl.FillGridWithParameter(para, "sp_Del_PanchayatSameteeGunMaster");
                   // lblmsg.Text = "record deleted";
                    //lblmsg.Visible = true;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
                   
                    flag = true;
                }
                else
                {
                    flag = false;
                }
            }                           
            if(flag==false)
                {
                    //lblmsg.Text = "Select Record To Delete";
                    //lblmsg.Visible = true;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }
            fillgrid();
            ClearAll();
        }
        catch (Exception ex)
        {

        }
    }
    public void fillgrid()
        
    {
        try
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(ddlzpcode.SelectedValue.ToString());
        ds=bl.FillGridWithParameter(para,"sp_Fill_PanchayatSameteeGunMaster");
        Cache.Insert("Pnch_samitee",ds);
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
        catch(Exception e)
        {
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlzpcode.ClearSelection();
            HiddenField1.Value = GridView1.SelectedItem.Cells[2].Text.ToString();
            txtpanchayatSamitteName.Text =GridView1.SelectedItem.Cells[3].Text.ToString();
            txtpscode.Text = GridView1.SelectedItem.Cells[4].Text.ToString();
            ddlzpcode.Items.FindByText(GridView1.SelectedItem.Cells[6].Text.ToString()).Selected = true;
            btnupdate.Enabled = true;
            btnadd.Enabled = false;
            btndelete.Enabled = false;
           // ddlzpcode.Enabled = false;
        }
          catch(Exception ex)
        {
        }
    }
    public void ClearAll()  
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);         
    }
    public void FillDDl()
    {
        DataSet ds = new DataSet();
        ddlzpcode.DataValueField = "ZpgutId";
        ddlzpcode.DataTextField = "ZpGut";
        ds = bl.FillGrid("FillDDL_panchayatsamitee");
        ddlzpcode.DataSource = ds.Tables[0];
        ddlzpcode.DataBind();
        ddlzpcode.Items.Insert(0, (new ListItem("-----Select-----", "0")));
    }   
    protected void GridView1_PageIndexChanged1(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("Pnch_samitee");
        Cache.Insert("Pnch_samitee",ds);
        //GridView1.DataSource = ds;
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        ClearAll();
        btnadd.Enabled = true;
        btnupdate.Enabled = false;
        ddlzpcode.Enabled = true;        
    }
    protected void ddlzpcode_SelectedIndexChanged(object sender, EventArgs e)
    {
      fillgrid();
      //btndelete.Visible= true;
      btndelete.Enabled = true;
      panchayatsamitigrid.Attributes.Add("Style","Visibility:Visible");
    }
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/ZpGutMaster.aspx");
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtpscode);
        bl.Textboxstring(plist);
        plist.Clear();    

    }
}
