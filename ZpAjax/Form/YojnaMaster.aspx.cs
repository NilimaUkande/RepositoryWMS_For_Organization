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


public partial class Form_YojnaMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();

    protected void Page_Load(object sender, EventArgs e)
    { try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {
            ddllekhashirsha.Focus();
           
                
                clareall();
                btnUpdated.Enabled = false;
                ddl();
                //fillgrid();
                btndelete.Enabled = false;
            }                  
            }
            catch (Exception ex)
            { 
            
            }

       

    }
    public void ddl()
    {
        DataSet ds = new DataSet();

        ddllekhashirsha.DataValueField = "HDID";
        ddllekhashirsha.DataTextField = "HeadDescription";
        ds = bl_obj.FillGrid("ddl_prashakiyamanyata");
        ddllekhashirsha.DataSource = ds.Tables[0];
        ddllekhashirsha.DataBind();

        ddllekhashirsha.Items.Insert(0, (new ListItem("-----Select-----", "")));


    }
    public void fillgrid()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(ddllekhashirsha.SelectedValue.ToString());

            if (ddllekhashirsha.SelectedValue.ToString() == "")
            {
                datagrid.Visible = false;
            }
            else
            {
                ds = bl_obj.FillGridWithParameter(para, "sp_Fill_YojnaMaster");
                //datagrid.DataSource = ds;
                //datagrid.DataBind();
                if (ds.Tables[0].Rows.Count != 0)
                {
                    datagrid.Visible = true;
                    TextBox1.Text = ds.Tables[0].Rows[0][0].ToString();
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
                else
                {
                    datagrid.DataSource = ds;
                    datagrid.DataBind();
                }
            }
        }
        catch (Exception ex)
        { }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(txtYojna.Text);
            para.Add(ddllekhashirsha.SelectedValue.ToString());
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_YojnaMaster");
           // lblMsg.Text = "Record Inserted";
             ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
            fillgrid();
            clareall();
            btndelete.Enabled = true;
            btnUpdated.Enabled = false;
            btnreset.Enabled = true;
           

        }
        catch (Exception ex)
        { 
        
        }
    }
    protected void btnUpdated_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(TextBox1.Text);
            para.Add(txtYojna.Text);
            para.Add(ddllekhashirsha.SelectedValue.ToString());
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_YojnaMaster");
            //lblMsg.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
               
            fillgrid();
            clareall();
            btndelete.Enabled = true;
            
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
                    Label2.Visible = false;
                    List<string> para = new List<string>();
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                    para.Add(datagrid.Items[i].Cells[3].Text.ToString());
                    para.Add("1");
                    para.Add("d");
                    //lblMsg.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
           
                    DataSet ds = bl_obj.FillGridWithParameter(para, "sp_YojnaMaster");

                }
            }
            fillgrid();
                if (select == 0)
                {
                   // lblMsg.Visible = true;
                  //  lblMsg.Text = "Select Record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }
          
            clareall();
        }
        catch (Exception ex)
        { 
        
        }
    }

    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddllekhashirsha.ClearSelection();
            ddllekhashirsha.Items.FindByText(datagrid.SelectedItem.Cells[4].Text.ToString()).Selected=true;
            TextBox1.Text = datagrid.SelectedItem.Cells[2].Text.ToString();
            txtYojna.Text = datagrid.SelectedItem.Cells[3].Text.ToString();
            btnUpdated.Enabled = true;
            btnAdd.Enabled = false;
            btndelete.Enabled = false;
           // ddllekhashirsha.Enabled = false;
            
        }
        catch (Exception ex)
        {
        }
    }

    public void clareall()
     {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
     }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        clareall();
        btnAdd.Enabled = true;
        btnUpdated.Enabled = false;
        ddllekhashirsha.Enabled = true;
    }
   
    

   
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }

    protected void ddllekhashirsha_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillgrid();
        btndelete.Enabled = true;
        btnAdd.Enabled = true;
        YojnaGrid.Attributes.Add("Style","Visibility:Visible");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HeadMaster.aspx");
    }
}
