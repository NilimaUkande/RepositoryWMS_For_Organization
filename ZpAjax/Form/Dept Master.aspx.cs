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

public partial class Form_Dept_Master : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        
            if (!IsPostBack)
            {
                txtdeptname.Focus();
                fillgrid();
            }
        }
        catch (Exception ex)
        { }
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(txtdeptname.Text);
        para.Add(Session["officeid"].ToString());

        ds=bl.ExecuteStoredFunctionWithParameters(para, "insert_deptmaster");
        if (ds.Tables.Count != 0)
        {
          //  lblmsg.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);
           // lblmsg.Text = "Record already present";
        }
        else
        {
           // lblmsg.Visible = true;
           // lblmsg.Text = "Record Inserted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);

          
        }
        fillgrid();
        ClearAll();
    }
    public void fillgrid()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = bl.FillGrid("fillgrid_deptmaster");
            Cache.Insert("dept_Mstr", ds);
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

    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("dept_Mstr");// (DataSet)Grid1.DataSource;
        fillgrid(ds);
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    private void fillgrid(DataSet ds)
    {
        Cache.Insert("dept_Mstr", ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        // flag = 0;
    }
    public void ClearAll()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);    
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(HiddenField1.Value.ToString());
        para.Add(txtdeptname.Text);
        para.Add(Session["officeid"].ToString());
        ds=bl.ExecuteStoredFunctionWithParameters(para, "update_deptmaster");
        if (ds.Tables.Count != 0)
        {
            //lblmsg.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
           // lblmsg.Text = "Record Updated ";
        }
        else
        {
          //  lblmsg.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
           // lblmsg.Text = "Record Updated ";            
         }        
        fillgrid();
        ClearAll();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenField1.Value = GridView1.SelectedItem.Cells[2].Text.ToString();
        txtdeptname.Text = GridView1.SelectedItem.Cells[3].Text.ToString();
        btnadd.Enabled = false;
        btndelete.Enabled = false;
        btnupdate.Enabled = true;
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


                    ds = bl.FillGridWithParameter(para, "delete_deptmaster");

                }
            }
            fillgrid();

            if (select == 0)
            {
               // lblmsg.Visible = true;
               // lblmsg.Text = "Select Record To Delete";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);


            }
            else
            {
                if(select ==1 )
                {

                //lblmsg.Text = "Record Deleted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);

                }
            }
        }

        catch (Exception ex)
        {

        }
        btnadd.Enabled = true;
        btndelete.Enabled = true;
        btnupdate.Enabled = false;
    }


    //protected void btndelete_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        int select = 0;
    //        for (int i = 0; i < GridView1.Items.Count; i++)
    //        {
    //            CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
    //            DataSet ds = new DataSet();
    //            if (cb.Checked)
    //            {
    //                select = 1;
    //                List<string> para = new List<string>();
    //                para.Add(GridView1.Items[i].Cells[2].Text.ToString());
    //                lblmsg.Text = "Record Deleted";
    //                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);


    //                ds = bl.FillGridWithParameter(para, "delete_deptmaster");

    //            }
    //            if (select == 0)
    //            {
    //                lblmsg.Visible = true;
    //                lblmsg.Text = "Select Record To Delete";
    //                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);


    //            }
    //        }
    //        fillgrid();

    //    }


    //    catch (Exception ex)
    //    {

    //    }
    //    btnadd.Enabled = true;
    //    btndelete.Enabled = true;
    //    btnupdate.Enabled = false;
    //}
  

    protected void Button1_Click1(object sender, EventArgs e)
    {
        txtdeptname.Focus();
        ClearAll();
        btnadd.Enabled = true;
        btnupdate.Enabled = false;
    }
}
