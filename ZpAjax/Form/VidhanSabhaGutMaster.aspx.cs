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
public partial class Form_VidhanSabhaGutMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    { try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {
            txtVidhansabhacode.Focus();
           
                
                fillgrid();
                clearall();
            }
        }
            catch (Exception ex)
            {
                
            }
        

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(txtVidhansabhacode.Text);        
            para.Add(txtVidhansabhName.Text);
            para.Add(Txtvidmember.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(RadioButtonList1.SelectedValue.ToString());
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_Tbl_VidhanSabhaGutMaster");
           // lblMsg.Text = "Record Inserted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
            fillgrid();
            btnUpdated.Enabled = false;
            clearall();
        }
        catch (Exception ex)
        {
        }
    }
    public void fillgrid()
    {
        DataSet ds = new DataSet();
        ds = bl_obj.FillGrid("sp_Fill_Tbl_VidhansabhaGutMaster");
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
    protected void btnUpdated_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(txtVidhansabhacode.Text);          
            para.Add(txtVidhansabhName.Text);
            para.Add(Txtvidmember.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(RadioButtonList1.SelectedValue.ToString());
            para.Add("u");
            
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_Tbl_VidhanSabhaGutMaster");
           // lblMsg.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
               
            fillgrid();
            btnAdd.Enabled = true;
            btnUpdated.Enabled = false;
            clearall();
        }
        catch (Exception ex)
        {

        }
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            HiddenField1 .Value= datagrid.SelectedItem.Cells[2].Text.ToString();
            txtVidhansabhacode.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
            txtVidhansabhName.Text = datagrid.SelectedItem.Cells[4].Text.ToString();
            Txtvidmember.Text = datagrid.SelectedItem.Cells[5].Text.ToString();
            RadioButtonList1.Items.FindByValue(datagrid.SelectedItem.Cells[7].Text.ToString()).Selected=true;
           
        }
        catch (Exception ex)
        {

        }
        btnUpdated.Enabled = true;
        btnAdd.Enabled = false;
        btndelete.Enabled = false;
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            int select=0;
        for(int i=0;i<datagrid.Items.Count;i++)
        {
            CheckBox cb=(CheckBox)datagrid.Items[i].FindControl("CheckBox2");
            if(cb.Checked)
            {
                Label3.Visible = false;
                select = 1;
                List<string> para=new List<string>();
                para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                para.Add(datagrid.Items[i].Cells[3].Text.ToString());
                para.Add(datagrid.Items[i].Cells[4].Text.ToString());
                para.Add(datagrid.Items[i].Cells[5].Text.ToString());
                para.Add(datagrid.Items[i].Cells[6].Text.ToString());
                para.Add(Session["officeid"].ToString());
                para.Add("d");
                DataSet ds=bl_obj.FillGridWithParameter(para,"sp_Tbl_VidhanSabhaGutMaster");
                //Label3.Visible = true;
               // lblMsg.Text = "Record Deleted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
           
            }            
         }
        fillgrid();
         if (select == 0)
         {
//Label3.Visible = true;
           // lblMsg.Text = "Please Select Record";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

         }
        
         clearall();
        }
        catch(Exception ex)           
         {

         }
    }
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        clearall();
        btnAdd.Enabled = true;
    }    
    protected void datagrid_PageIndexChanged1(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        clearall();
        btnAdd.Enabled = true;
        btnUpdated.Enabled = false;
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();       
        plist.Add(Txtvidmember);
        bl_obj.Textboxstring(plist);

    }
    protected void btnUpdated_Click1(object sender, EventArgs e)
    {

    }
}

