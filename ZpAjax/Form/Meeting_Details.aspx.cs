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

public partial class Form_Meeting_Details : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_Obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {
            
                TextBox1.Focus();
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
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add("1");
            para.Add(Session["Work_ID"].ToString());//set WorkplaningID in Session
            para.Add(bl_Obj.convertDate(TextBox1.Text).ToString());
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add(TextBox4.Text);
            para.Add(TextBox5.Text);
            para.Add(Session["officeid"].ToString()); //set the Office_ID in Session 
            para.Add("a");
            ds = bl_Obj.FillGridWithParameter(para, "sp_MeetingDetails");
            lblmsg.Text = "record inserted";
            fillgrid();
            clearall();
        }
        catch (Exception ex)
        {
        }
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(TextBox2);
        plist.Add(TextBox3);
        plist.Add(TextBox4);
        plist.Add(TextBox5);
        bl_Obj.TextboxNull(plist);
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        TextBox1.Text = datagrid.SelectedItem.Cells[4].Text.ToString();
        TextBox2.Text = datagrid.SelectedItem.Cells[5].Text.ToString();
        TextBox3.Text = datagrid.SelectedItem.Cells[6].Text.ToString();
        TextBox4.Text = datagrid.SelectedItem.Cells[7].Text.ToString();
        TextBox5.Text = datagrid.SelectedItem.Cells[8].Text.ToString();
    }
    public void fillgrid()
    {
        DataSet ds = new DataSet();
        ds = bl_Obj.FillGrid("Sp_FillMeetingDetails");
        datagrid.DataSource = ds;
        datagrid.DataBind();
        Label6.Text = ds.Tables[0].Rows[0][0].ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add(Label6.Text);
            para.Add(Session["Work_ID"].ToString());//set WorkplaningID in Session
            para.Add(bl_Obj.convertDate(TextBox1.Text).ToString());
            para.Add(TextBox2.Text);
            para.Add(TextBox3.Text);
            para.Add(TextBox4.Text);
            para.Add(TextBox5.Text);
            para.Add(Session["officeid"].ToString()); //set the Office_ID in Session 
            para.Add("u");
            ds = bl_Obj.FillGridWithParameter(para, "sp_MeetingDetails");
            lblmsg.Text = "record Updated";
            fillgrid();
            clearall();
        }
        catch (Exception ex)
        {
        }
    }
    public void clearall()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
    }

    protected void Button3_Click(object sender, EventArgs e)
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
                    List<string> para = new List<string>();
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                    para.Add(datagrid.Items[i].Cells[3].Text.ToString());
                   // para.Add(TextBox1.Text);
                    para.Add(bl_Obj.convertDate(TextBox1.Text).ToString());
                    para.Add(TextBox2.Text);
                    para.Add(TextBox3.Text);
                    para.Add(TextBox4.Text);
                    para.Add(TextBox5.Text);
                    para.Add(Session["officeid"].ToString()); //set the Office Id
                    para.Add("d");
                    lblmsg.Text = "record deleted";
                    DataSet ds = bl_Obj.FillGridWithParameter(para, "sp_MeetingDetails");
                }
                if (select == 0)
                {
                    lblmsg.Text = "Select the option";
                }
            }
            fillgrid();
        }
        catch (Exception ex)
        {

        }
    }    
    protected void Button4_Click(object sender, EventArgs e)
    {
        this.Dispose();
        Response.Redirect("~/Form/login.aspx");
    }
}
