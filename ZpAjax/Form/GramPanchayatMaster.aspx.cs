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

public partial class Form_GramPanchayatMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        
            if (!IsPostBack)
            {
                FillTaluka();
                Button4.Enabled = false;
            }
        }
        catch (Exception ex)
        { }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(TextBox1.Text);
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add(TextBox4.Text);
            para.Add(DropDownList1.SelectedValue.ToString());
            para.Add(TextBox5.Text);
            para.Add(TextBox6.Text);
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_insertgrampanchmaster");
            if (ds.Tables.Count != 0)
            {
                //Label9.Text = "Record Allready Exist";
            }
            else
            {
               // Label9.Text = "Record inserted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
            }
            fillgrid();
            clearall();
            Button1.Enabled = false;           
        }
        catch(Exception ex)
        {

        }
    }
    public void FillTaluka()
    {
        try
        {
            DataSet ds1 = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            ds1 = bl_obj.FillGridWithParameter(para, "sp_Taluka_fill_gav");
            DropDownList1.DataValueField = "TalukaID";
            DropDownList1.DataTextField = "TalukaName";
            DropDownList1.DataSource = ds1;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, (new ListItem("---Select---", "")));
        }
        catch (Exception ex)
        { 
        
        }
   }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(TextBox1.Text);
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add(TextBox4.Text);
            para.Add(DropDownList1.SelectedValue.ToString());
            para.Add(TextBox5.Text);
            para.Add(TextBox6.Text);
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para,"sp_insertgrampanchmaster");
           // Label9.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
            fillgrid();
           
        
            clearall();
        }
        catch (Exception ex)
        {

        }
    }
    protected void clearall()
    {
        DropDownList1.ClearSelection();
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DropDownList1.ClearSelection();
        clearall();
        Button3.Enabled = true;
        Button1.Enabled = false;
        DropDownList1.Enabled = true;
    }
    protected void Button4_Click(object sender, EventArgs e)
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
                  //  Label9.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
                    DataSet ds = bl_obj.FillGridWithParameter(para, "sp_delete_grampanchayat");
                }
                if (select == 0)
                {
                    Label9.Visible = true;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                   // Label9.Text = "Please Select Record";
                }
            }
            fillgrid();
        }
        catch (Exception ex)
        {

        }
    }
    public void fillgrid()
    {
        Button4.Enabled = true;
         List<string> para = new List<string>();       
        DataSet ds = new DataSet();
        para.Add(DropDownList1.SelectedValue.ToString());
        ds = bl_obj.FillGridWithParameter(para,"sp_fillgrampmaster");
        Cache.Insert("gram_mstr",ds);
        
        int id = (ds.Tables[0].Rows.Count) % 30;
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
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            HiddenField1.Value = datagrid.SelectedItem.Cells[2].Text.ToString();
            TextBox1.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
            TextBox2.Text = datagrid.SelectedItem.Cells[4].Text.ToString();
            TextBox3.Text = datagrid.SelectedItem.Cells[5].Text.ToString();
            TextBox4.Text = datagrid.SelectedItem.Cells[6].Text.ToString();
            DropDownList1.ClearSelection();
            DropDownList1.Items.FindByText(datagrid.SelectedItem.Cells[7].Text.ToString()).Selected = true;
            TextBox5.Text = datagrid.SelectedItem.Cells[8].Text.ToString();
            TextBox6.Text = datagrid.SelectedItem.Cells[9].Text.ToString();
            DropDownList1.Enabled = false;
            Button1.Enabled = true;
            Button3.Enabled = false;
            Button4.Enabled = false;
        }
        catch (Exception ex)
        {
        }

    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("gram_mstr");
        fillgrid(ds);
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
    private void fillgrid(DataSet ds)
    {
        Cache.Insert("gram_mstr", ds);
        datagrid.DataSource = ds;
        datagrid.DataBind();
        // flag = 0;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillgrid();
        gpGrid.Attributes.Add("Style","Visibility:Visible");
    }
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Taluka Master.aspx");
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(TextBox1);
        plist.Add(TextBox2);
        plist.Add(TextBox3);
        plist.Add(TextBox4);
        plist.Add(TextBox5);
        bl_obj.Textboxstring(plist);
        plist.Clear();
        plist.Add(TextBox6);
        bl_obj.TextboxNull(plist);
    }
}
