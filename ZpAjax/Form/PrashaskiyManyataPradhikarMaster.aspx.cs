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
using System.Collections;

public partial class Form_PrashaskiyManyataPradhikarMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    { try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {           
                txtDiscription.Focus();                
                fillgrid();
                btnUpdated.Enabled = false;

            }
        }
            catch (Exception ex)
            {

            }

        
    }

 


protected void  btnAdd_Click(object sender, EventArgs e)
{
     try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(txtDiscription.Text);           
            para.Add(Session["officeid"].ToString());
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_PrashaskiyManyataPradhikarMaster");
            if (ds.Tables[0].Rows[0][0].ToString() != "")
            {
                //lblMsg.Text = "Record Already Exist";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

            }
            else
            {

               // lblMsg.Text = "Record Inserted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
            }
            
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
        try
        {

            DataSet ds = new DataSet();
            ds = bl_obj.FillGrid("sp_PrashaskiyManyataPradhikarMaster_fill");
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
           
           // TextBox1.Text = ds.Tables[0].Rows[0][0].ToString();

        }
        catch (Exception ex)
        { 
        
        }
    }
    //public void fillYojna()
    //{
    //    try
    //    {
    //        DataSet ds = new DataSet();
          
    //        ds = bl_obj.FillGrid("sp_Fill_YojnaMaster");
    //        DDLYojna.Items.Insert(0, (new ListItem("------select------", "")));                     
    //        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
    //        {
               
    //            DDLYojna.Items.Add(new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
                
                
    //        }
            

    //    }
    //    catch (Exception ex)
    //    { 
        
    //    }
    //}

    protected void btnUpdated_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(txtDiscription.Text);            
            para.Add(Session["officeid"].ToString());
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add("u");
            //lblMsg.Text = "record updated";
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_PrashaskiyManyataPradhikarMaster");
            if (ds.Tables[0].Rows[0][0].ToString() != "")
            {
              //  lblMsg.Text = "Record Already Exist";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

            }
            else
            {
               // lblMsg.Text = "Record Updated";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
               
            }
           fillgrid();         
            clearall();
        }
        catch (Exception ex)
        
        { 

        
        }
}
protected void  datagrid_SelectedIndexChanged(object sender, EventArgs e)
{
    try
        {
            HiddenField1.Value  = datagrid.SelectedItem.Cells[2].Text.ToString();
            txtDiscription.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
            TextBox3.Text = datagrid.SelectedItem.Cells[6].Text.ToString();
            TextBox2.Text = datagrid.SelectedItem.Cells[5].Text.ToString();
            btnUpdated.Enabled = true;
            btnAdd.Enabled = false;
            btndelete.Enabled = false;
        }
        catch (Exception ex)
        { 

        }
}
protected void  btndelete_Click(object sender, EventArgs e)
{
 try
        {
            DataSet ds = new DataSet();
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
                    para.Add(datagrid.Items[i].Cells[3].Text.ToString());
                    para.Add("1");
                    para.Add("1");
                    para.Add("1");
                    para.Add("d");
                  //  lblMsg.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
           
                    ds = bl_obj.FillGridWithParameter(para, "sp_PrashaskiyManyataPradhikarMaster");
                }
            }
            fillgrid();
                if (select == 0)
                {
                  //  lblMsg.Visible = true;
                  //  lblMsg.Text = "Select Record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }
                
           
            clearall();
        }
        catch (Exception ex)
        { 
        
        }
}
    public void clearall()
    {

        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();

    }
   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        clearall();
    }
}
   
    
    