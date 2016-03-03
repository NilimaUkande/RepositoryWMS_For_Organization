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
public partial class Form_Tantrik_Pradhikaran_Master : System.Web.UI.Page
{
    BusinessLayer.BL_Tantrik_Pradhikaran_Master obj = new BL_Tantrik_Pradhikaran_Master();
    protected void Page_Load(object sender, EventArgs e)
    { try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {
           
                txtpradhikarname.Focus();
                if (Convert.ToString(Session["username"]) == "")
                {
                    Response.Redirect("Index.aspx");
                }
                fillgrid();
                clearall();
                btnupdate.Enabled = false;
            }
        }
            catch (Exception ex)
            { }
        
    }
    protected void IsRecordExist() 
    {
        List<string> para = new List<string>();
        para.Add(txtpradhikarname.Text);
        DataSet ds = new DataSet();
        ds = obj.IsRecordExist(para);
        if(ds.Tables[0].Rows.Count>0){}
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnadd.Enabled = false;
        btndelete.Enabled = false;
        btnupdate.Enabled = true;
        HiddenField1.Value = datagrid.SelectedItem.Cells[2].Text.ToString();
        txtpradhikarname.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
        txtpradhikarmaryada.Text = datagrid.SelectedItem.Cells[4].Text.ToString();
        TextBox1.Text = datagrid.SelectedItem.Cells[6].Text.ToString();
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("tan_pra_mstr");
        Cache.Insert("tan_pra_mstr", ds);
        datagrid.DataSource = ds;
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        clearall();
        btnadd.Enabled = true;
        btnupdate.Enabled = false;
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(txtpradhikarname.Text);
            para.Add(txtpradhikarmaryada.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(TextBox1.Text);
            obj.InsertInto(para);
           // lblmsg.Text = "Record inserted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
            fillgrid();
            btnupdate.Enabled = false;
            clearall();
        }
        catch (Exception e1)
        { 
        }       
    }
    public void fillgrid()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = obj.Select();
            Cache.Insert("tan_pra_mstr",ds);
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
        catch (Exception ex)
        {
        }    
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(txtpradhikarname.Text);
            para.Add(txtpradhikarmaryada.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(TextBox1.Text);
            obj.Update(para);
          //  lblmsg.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
               
            btnadd.Enabled = true;
            btnupdate.Enabled = false;
            fillgrid();
            btnadd.Enabled = true;
            btnupdate.Enabled = false;
            clearall();
        }
        catch (Exception ea)
        { 
        }
    }
    protected void btndelete_Click(object sender, EventArgs e)
    { try
        {
            int select=0;
        for(int i=0;i<datagrid.Items.Count;i++)
        {
       CheckBox cb=(CheckBox)datagrid.Items[i].FindControl("CheckBox2");
            if(cb.Checked)
            {
               // lblmsg.Visible = false;
                select = 1;
                List<string> para=new List<string>();
                para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                DataSet ds=obj.Deletetantrik(para);
               // lblmsg.Visible = true;
             //  lblmsg.Text = "record deleted";
               ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
            
            }
         }
        fillgrid();
         if (select == 0)
         {
           // lblmsg.Visible = true;
            // lblmsg.Text = "Please Select record";
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
}