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


public partial class Form_officemaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl=new BussinessLayer.BusinessLayerclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        
            if (!Page.IsPostBack)
            {
                DDL_District.Focus();
                Fillddl();
                fillgrid();
            // ClearAll();
                btnupdate.Enabled = false;
            }
               

        }
        catch (Exception ex)
        { }

           
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add("1");
        para.Add(txtofficename.Text.Trim());
        para.Add(DDL_District.SelectedItem.Value.ToString());
        ds=bl.ExecuteStoredFunctionWithParameters(para,"inser_officemaster");
        //if (ds.Tables[0].Rows[0][0].ToString() != "")
        //{
        //    Label2.Text = "Record Already Exist";
        //}
        //else
        //{
            //Label2.Text = "Record inserted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);

            DDL_District.ClearSelection();
            txtofficename.Text = "";
            btnadd.Enabled = true;
            btnupdate.Enabled = false;
            btndelete.Enabled = true;
        //} 
        //Label2.Text = "Record Inserted";
        fillgrid();
        //ClearAll();
        btnupdate.Enabled = false;
    }
    protected void Fillddl()
    {
        DataSet ds = new DataSet();
        ds = bl.FillGrid("sp_FillDistrict");
        DDL_District.ClearSelection();
        DDL_District.DataValueField = "Districtid";
        DDL_District.DataTextField = "Districtname";
        DDL_District.DataSource = ds;
        DDL_District.DataBind();
        DDL_District.Items.Insert(0, new ListItem("-----select-----", ""));
    }
    public void fillgrid()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();                 
            ds= bl.FillGrid("fillgrid_officemaster");
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
        catch (Exception e)
        {
        }
    }
    public void ClearAll()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);
    }
protected void  GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
{
    fillgrid();
    GridView1.CurrentPageIndex = e.NewPageIndex;
    GridView1.DataBind();
}
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
          //  DDL_District.Enabled = false;
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(TextBox1.Text);
            para.Add(txtofficename.Text);
            ds = bl.ExecuteStoredFunctionWithParameters(para, "update_officemaster");
          
                //Label2.Text = "Record inserted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
           
           
           
        }
        catch(Exception ex)
        {}
        fillgrid();
        DDL_District.ClearSelection();
        txtofficename.Text = "";
        btnadd.Enabled = true;
        btnupdate.Enabled = false;
        btndelete.Enabled = true;
        DDL_District.Enabled = true;
           
      
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtofficename.Text = GridView1.SelectedItem.Cells[3].Text.ToString();
        DDL_District.ClearSelection();
        DDL_District.Items.FindByValue(GridView1.SelectedItem.Cells[5].Text.ToString()).Selected=true;
        TextBox1.Text = GridView1.SelectedItem.Cells[2].Text.ToString();
        btnupdate.Enabled = true;
        btnadd.Enabled = false;
        btndelete.Enabled = false;
        DDL_District.Enabled = false;
           
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
                DataSet ds = new DataSet();
                if (cb.Checked)
                {
                    select = 1;
                    List<string> para = new List<string>();
                    para.Add(GridView1.Items[i].Cells[2].Text.ToString()); 
                    ds = bl.FillGridWithParameter(para, " delete_officemaster");
                  //  Label2.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
            
                }
            }
            fillgrid();
                if (select == 0)
                {
                  //  Label2.Text = "Please select record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }
                 
           
        }
        catch (Exception ex)
        {

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ClearAll();
        btnadd.Enabled= true;
 
    }


   
    protected void reset_Click(object sender, EventArgs e)
    {
        DDL_District.ClearSelection();
        txtofficename.Text = "";
       // ClearAll();
        btnadd.Enabled = true;
        btnupdate.Enabled = false;
        btndelete.Enabled = true;
        DDL_District.Enabled = true;
         
    }
}

