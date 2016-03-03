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
public partial class Form_ZpGutMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        try
        {
            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");
            if (!Page.IsPostBack)
            {
                txtGut.Focus();

                fillddl();
                //fillgrid();
               
                clearall();
                btndelete.Enabled = false;
            }
        }
        catch (Exception ex)
        {

        }
       btndelete.Enabled = false;
        btnUpdated.Enabled = false;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(txtGut.Text);
            para.Add(txtGutId.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(txtzpmember.Text);
            para.Add(ddltalukaid.SelectedValue.ToString());
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_ZpGutMaster");
            if (ds.Tables[0].Rows.Count != 0)
            {
                if (ds.Tables[0].Rows[0][0].ToString() == "")
                {
                   // lblMsg.Text = "record already exists";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

                }
                else
                {
                  //  lblMsg.Text = "record inserted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
                }

            }
            fillgrid();

            clearall();
            btnUpdated.Enabled = false;
            btndelete.Enabled = true;
        }
        catch (Exception ex)
        {

        }
    }
    public void fillgrid()
    {
        List<string> para = new List<string>();
        para.Add(ddltalukaid.SelectedValue.ToString());
        DataSet ds = new DataSet();
        ds = bl_obj.FillGridWithParameter(para, "sp_FillZpGutMaster");
        //datagrid.DataSource = ds;
        //datagrid.DataBind();
        //HiddenField1.Value = ds.Tables[0].Rows[0][0].ToString();
        if (ds.Tables[0].Rows.Count != 0)
        {
            datagrid.Visible = true;
            HiddenField1.Value = ds.Tables[0].Rows[0][0].ToString();

            int id = (ds.Tables[0].Rows.Count) % 10;
            if (id == 0)
            {
                if (datagrid.CurrentPageIndex > 0)
                {

                    datagrid.DataSource = ds;
                    datagrid.CurrentPageIndex--;
                    datagrid.DataBind();

                }
                else
                {
                    datagrid.DataSource = ds;
                    datagrid.DataBind();
                }
            }
            else
            {
                datagrid.DataSource = ds;
                datagrid.DataBind();
            }

        }
    }
    protected void btnUpdated_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value);
            para.Add(txtGut.Text);
            para.Add(txtGutId.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(txtzpmember.Text);
            para.Add(ddltalukaid.SelectedValue.ToString());
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_ZpGutMaster");
            //lblMsg.Text = "record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
                
            fillgrid();
            btnAdd.Enabled = true;
            btnUpdated.Enabled = false;
            ddltalukaid.Enabled = true;
            clearall();
           
        }
        catch (Exception ex)
        {

        }
        btndelete.Enabled = true;

    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            HiddenField1.Value = datagrid.SelectedItem.Cells[2].Text.ToString();
            txtGut.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
            txtGutId.Text = datagrid.SelectedItem.Cells[4].Text.ToString();
            txtzpmember.Text = datagrid.SelectedItem.Cells[6].Text.ToString();

            ddltalukaid.ClearSelection();
            ddltalukaid.Items.FindByText(datagrid.SelectedItem.Cells[8].Text.ToString()).Selected = true;
            //ddltalukaid.Enabled = false;
           
            btnUpdated.Enabled = true;
            btnAdd.Enabled = false;
           // btndelete.Enabled = true;

        }
        catch (Exception ex)
        {
        }


    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;

            for (int i = 0; i < datagrid.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)datagrid.Items[i].FindControl("CheckBox2");
                if (cb.Checked)
                {
                    select = 1;
                    Label3.Visible = false;
                    List<string> para = new List<string>();
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());

                   
                    DataSet ds=new DataSet();
                    ds= bl_obj.FillGridWithParameter(para, "spdeletezpgutmaster");
                   // lblMsg.Text = "record deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
          
                }
            }
            fillgrid();
                if (select == 0)
                {
                  // lblMsg.Visible = true;
                    //Response.Write("Please select the option");
                  //  lblMsg.Text = "Please Select Record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }

           
        }
        catch (Exception ex)
        {

        }
        btndelete.Enabled = true;
        btnAdd.Enabled = true;

    }
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    public void fillddl()
    {

        //ddlzpcode.Items.Clear();
        //ddlzpcode.Items.Insert(0, (new ListItem("-----Select-----", "")));
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["District_id"].ToString());
        ddltalukaid.DataValueField = "TalukaId";
        ddltalukaid.DataTextField = "TalukaName";
        ds = bl_obj.FillGridWithParameter(para, "fillddl_zpgutmaster");
        ddltalukaid.DataSource = ds.Tables[0];
        ddltalukaid.DataBind();
        ddltalukaid.Items.Insert(0, (new ListItem("-----Select-----", "")));
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        clearall();
        btnAdd.Enabled = true;
    }
    protected void ddltalukaid_SelectedIndexChanged1(object sender, EventArgs e)
    {
        zpgutGrid.Attributes.Add("style","visibility:visible");
        fillgrid();
        btndelete.Enabled= true;
        btnUpdated.Enabled = false;

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
    
       // ddltalukaid.Items.Clear();
        clearall();
        btnAdd.Enabled = true;
        btnUpdated.Enabled = false;
        ddltalukaid.Enabled = true;
        ddltalukaid.ClearSelection();
       // btndelete.Enabled = true;
    }
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Taluka Master.aspx");
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtGutId);
        plist.Add(txtzpmember);
        bl_obj.Textboxstring(plist);

    }
}

