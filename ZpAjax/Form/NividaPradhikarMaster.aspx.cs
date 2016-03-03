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
using BusinessLayer;
public partial class Form_NividaPradhikarMaster : System.Web.UI.Page
{
    BusinessLayer.nividapradhikar obj = new nividapradhikar();
    BussinessLayer.BusinessLayerclass bl = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!IsPostBack)
        {
            
                if (Convert.ToString(Session["username"]) == "")
                {
                    Response.Redirect("Index.aspx");
                }
                fillgrid();
                clearall();
            }
        }
            catch (Exception ex)
            { }
       
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            List<string> para = new List<string>();           
            para.Add(TextBox1.Text);
            para.Add(TextBox2.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(TextBox3.Text);
            obj.InsertInto(para);
           // Label2.Text = "Record inserted";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
            fillgrid();
            clearall();
        }
        catch (Exception e1)
        {
        }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(TextBox1);
        plist.Add(TextBox2);
        plist.Add(TextBox3);
        bl.TextboxNull(plist);
    }

    protected void IsRecordExist()
    {
        List<string> para = new List<string>();
        para.Add(TextBox1.Text);
        DataSet ds = new DataSet();
        ds = obj.IsRecordExist(para);
        if (ds.Tables[0].Rows.Count > 0) { }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(TextBox1.Text);
            para.Add(TextBox2.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(TextBox3.Text);
            obj.Update(para);
           // Label2.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
               
            fillgrid();
            clearall();
        }
        catch (Exception ea)
        {
        }
    }
    public void fillgrid()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = obj.Select();
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
        catch (Exception ex)
        {
        }
    }
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
                if (cb.Checked)
                {
                 //   Label2.Visible = false;
                    select = 1;
                    List<string> para = new List<string>();
                    para.Add(GridView1.Items[i].Cells[2].Text.ToString());
                    DataSet ds = obj.Deletetantrik(para);
                   // Label2.Visible = true;
                  //  Label2.Text = "record deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
           
                }
            }
            fillgrid();
            if (select == 0)
            {
              //  Label2.Visible = true;
              //  Label2.Text = "Please Select record";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

            }
          
            clearall();
        }
        catch (Exception ex)
        {
        }

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1.Enabled = false;
        Button3.Enabled = false;
        Button2.Enabled = true;
        HiddenField1.Value = GridView1.SelectedItem.Cells[2].Text.ToString();
        TextBox1.Text = GridView1.SelectedItem.Cells[3].Text.ToString();
        TextBox2.Text = GridView1.SelectedItem.Cells[4].Text.ToString();
        TextBox3.Text = GridView1.SelectedItem.Cells[6].Text.ToString();
    }
    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        clearall();
        Button1.Enabled = true;
        Button2.Enabled = false;
    } 
}
