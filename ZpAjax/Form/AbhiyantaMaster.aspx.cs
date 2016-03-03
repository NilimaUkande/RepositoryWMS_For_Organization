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
using System.Web.Caching;
using BussinessLayer;

public partial class Form_AbhiyantaMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep(3000);
        try
        {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        
            if (!IsPostBack)
            {
                Cache.Remove("add_eng");
                F_name.Focus();
                fillddl();
                fillGrid();
                clearall();
                Button2.Enabled = false;             
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
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            para.Add(F_name.Text);
            para.Add(M_Name.Text);
            para.Add(L_Name.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(R_Designation.SelectedValue.ToString());
            para.Add(bl_obj.convertDate(Date_Oppointment.Text));
            para.Add(Ddl_DeptName.SelectedValue.ToString());
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_AbhiyantaMaster");       
            if (ds.Tables.Count != 0)
            {
               
               Label8.Text = "Record Already exist";                          
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
              //  Label8.Text = "Record Inserted";
               
            }
            fillddl();
            fillGrid();
            clearall(); 
        }
        catch (Exception ex)
        { 
        
        }
    }
    //private void fillgrid(DataSet ds)
    //{
    //    //GridView1.DataSource = ds;
    //    //GridView1.DataBind();
    //}
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(F_name);
        plist.Add(M_Name);
        plist.Add(L_Name);
        bl_obj.Textboxstring(plist);
        plist.Clear();
        plist.Add(Date_Oppointment);
        bl_obj.Textboxdate(plist);
    }
    protected void fillddl()
    {
       DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        plist.Add(Session["officeid"].ToString());         
        ds = bl_obj.FillGridWithParameter(plist, "sp_FillDepartment_ID");
        Ddl_DeptName.DataValueField = "deptid";
        Ddl_DeptName.DataTextField = "deptname";
        Ddl_DeptName.DataSource = ds.Tables[0];
        Ddl_DeptName.DataBind();
        Ddl_DeptName.Items.Insert(0, new ListItem("----select----", ""));
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(F_name.Text);
            para.Add(M_Name.Text);
            para.Add(L_Name.Text);
            para.Add(Session["officeid"].ToString());
            para.Add(R_Designation.SelectedValue.ToString());
            para.Add(bl_obj.convertDate(Date_Oppointment.Text));
            para.Add(Ddl_DeptName.SelectedValue.ToString());
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_AbhiyantaMaster");
            if (ds.Tables.Count != 0)
            {
              
                Label8.Text = "Record Already exist";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
                //Label8.Text = "Record Updated";
            }
            fillddl();
            clearall();
            fillGrid();          
        }
        catch (Exception ex)
        {
        }  
    }
    protected void fillGrid()
    {


        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        plist.Add(Session["officeid"].ToString());
        ds = bl_obj.FillGridWithParameter(plist, "sp_fillengineerGrid");      
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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenField1.Value = GridView1.SelectedItem.Cells[2].Text.ToString();
        F_name.Text = GridView1.SelectedItem.Cells[3].Text.ToString();
        M_Name.Text = GridView1.SelectedItem.Cells[4].Text.ToString();
        L_Name.Text = GridView1.SelectedItem.Cells[5].Text.ToString();
        R_Designation.ClearSelection();
        R_Designation.Items.FindByValue(GridView1.SelectedItem.Cells[6].Text.ToString()).Selected=true;
        Date_Oppointment.Text = GridView1.SelectedItem.Cells[7].Text.ToString();
        Ddl_DeptName.ClearSelection();
        Ddl_DeptName.Items.FindByText(GridView1.SelectedItem.Cells[8].Text.ToString()).Selected=true;
        Button2.Enabled = true;
        Button1.Enabled = false;
        Button3.Enabled = false;
    }
    protected void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);       
    }
    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("form_ds");// (DataSet)Grid1.DataSource;
       // fillgrid(ds);
        fillGrid();
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    private void fillgrid(DataSet ds)
    {
        Cache.Insert("form_ds", ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        // flag = 0;
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        try
        {
           int select = 0;
            DataSet ds = new DataSet();
            ds.Clear();
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)GridView1.Items[i].FindControl("CheckBox1");
              
                if (cb.Checked)
                {
                    select = 1;
                    List<string> para = new List<string>();
                    para.Add(GridView1.Items[i].Cells[2].Text.ToString());
                 
                    ds = bl_obj.FillGridWithParameter(para, "sp_del_Abhiyantamaster1");
                }  
                }
            fillGrid();
                if(select==0)
                {
                    Label8.Visible = true;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                   // Label8.Text = "Select Record To Delete";
                   
                }
            else
                {
                    //  Label8.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
                }
          
            
        }

        catch (Exception ex)
        {
            
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        clearall();
    }
}
