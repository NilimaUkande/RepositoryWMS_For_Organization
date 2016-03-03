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
using BussinessLayer;
using System.Collections.Generic;


public partial class Form_User_Master : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_Obj = new BussinessLayer.BusinessLayerclass();

    protected void Page_Load(object sender, EventArgs e)
        {try
                {
      
            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");
            if (!IsPostBack)
            {
                
                    DropDownList2.Focus();
                    if (Session["group_id"].ToString() != "1")
                    {
                        RadioButtonList1.Visible = false;
                        DropDownList1.Visible = true;
                        DropDownList2.Visible = false;
                        Label4.Visible = false;
                        Label7.Visible = false;
                    }
                    else
                    {
                        RadioButtonList1.Visible = true;
                        RadioButtonList1.Visible = true;
                        DropDownList1.Visible = false;
                        Label6.Visible = false;
                        DropDownList2.Visible = true;
                        Label4.Visible = true;
                        Label7.Visible = true;
                    }
                    fillGrid();
                    Fillddl();
                    fillGroupddl();
                    Fillddltaluka();
                   // clearall();
                btnAdd.Enabled = true;
            btndelete.Enabled = true;
            btnUpdate.Enabled = false;
        
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
                bool isexist;
                    List<string> plist = new List<string>();
                    plist.Add("1");
                    plist.Add(txtUserName.Text);
                    plist.Add(txtpassword.Text);
                if (Session["group_id"].ToString() != "1")
                    {
                        plist.Add(Session["group_id"].ToString());
                        plist.Add(DropDownList1.SelectedValue.ToString());                 
                        plist.Add("SA");                   
                        isexist = bl_Obj.record_exist_user(txtUserName.Text, DropDownList1.SelectedValue.ToString());
                    }
                     else
                    {


                        plist.Add(DropDownList2.SelectedValue.ToString());                       
                        plist.Add(Session["officeid"].ToString());
                        isexist = bl_Obj.record_exist_user(txtUserName.Text, Session["officeid"].ToString());
                        if (DropDownList2.SelectedValue.ToString()== "4")
                        {
                            plist.Add("A");
                        }
                        else
                        {
                            plist.Add(RadioButtonList1.SelectedValue.ToString());
                        }
                    }
                    plist.Add(ddltaluka.SelectedValue.ToString());
                    plist.Add("A");
                    if (isexist == true)
                    {
                       // lblMsg.Text = "Record Already Exist";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

                    }
                    else
                    {
                        ds = bl_Obj.FillGridWithParameter(plist, "sp_user_master_Pro");
                       // lblMsg.Text = "Record Inserted";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
                    }                                   
                fillGrid();

                btnAdd.Enabled = true;
                btnUpdate.Enabled = false;
                btndelete.Enabled = true;
                DropDownList2.ClearSelection();
                ddltaluka.ClearSelection();
                txtUserName.Text = "";
                txtpassword.Text = "";
                txt_Confirm_Password.Text = "";
                RadioButtonList1.ClearSelection();
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
            CheckBox cb;
            DataSet ds = new DataSet();
            for (int i = 0; i < datagrid.Items.Count; i++)
            {
                List<string> para = new List<string>();
                cb = (CheckBox)datagrid.Items[i].FindControl("Cb");
                if (cb.Checked)
                {
                    select = 1;
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                    para.Add("1");
                    para.Add("1");
                    para.Add("1");
                    para.Add("1");
                    para.Add("1");
                    para.Add("1");
                    para.Add("d");
                    bl_Obj.FillGridWithParameter(para, "sp_user_master_Pro"); 
                   // lblMsg.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
            
                }
            }
            fillGrid();
                if (select == 0)
                {
                    //lblMsg.Text = "Please select record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }
           
        }
        catch (Exception ex)
        {
        }
    }
    public void Fillddl()
    {
        DropDownList1.ClearSelection();       
        DataSet ds = new DataSet();
        ds = bl_Obj.fillddl();
        DropDownList1.DataValueField = "officeid";
        DropDownList1.DataTextField = "officename";
        DropDownList1.DataSource=ds.Tables[0];
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, (new ListItem("----select----", "")));
    }
    public void Fillddltaluka()
    {
        ddltaluka.ClearSelection();
        DataSet ds = new DataSet();
        ds = bl_Obj.FillGrid("Sp_FillTalukaName");
        ddltaluka.DataValueField = "TalukaId";
        ddltaluka.DataTextField = "TalukaName";
        ddltaluka.DataSource = ds.Tables[0];
        ddltaluka.DataBind();
        ddltaluka.Items.Insert(0, (new ListItem("----select----", "")));
    }
    public void fillGroupddl()
    {
        DataSet ds = new DataSet();
        ds = bl_Obj.fillddl();
        DropDownList2.DataValueField = "Gr_Id";
        DropDownList2.DataTextField = "Gr_Name";
        DropDownList2.DataSource=ds.Tables[1];
        DropDownList2.DataBind();
        DropDownList2.Items.Insert(0, (new ListItem("----select----", "")));    
    }
    public void fillGrid()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> plist = new List<string>();         
            plist.Add(Session["officeid"].ToString());
            plist.Add(Session["group_id"].ToString());
            ds = bl_Obj.FillGridWithParameter(plist, "sp_user_master_Select_Pro");
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
    public void clearall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);
        btnAdd.Enabled = true;
        btnUpdate.Enabled = false;
        btndelete.Enabled = true;
    }    
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillGrid();
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        string rb_val = datagrid.SelectedItem.Cells[5].Text.ToString();
        txtUserName.Text=datagrid.SelectedItem.Cells[3].Text;
        txtpassword.Text = datagrid.SelectedItem.Cells[4].Text;
        DropDownList2.ClearSelection();
        DropDownList2.Items.FindByValue(datagrid.SelectedItem.Cells[7].Text.ToString()).Selected = true;
        ddltaluka.ClearSelection();
        ddltaluka.Items.FindByValue(datagrid.SelectedItem.Cells[9].Text.ToString()).Selected=true;
        HiddenField1.Value = datagrid.SelectedItem.Cells[2].Text;
        txtUserName.Enabled = false;
        btnAdd.Enabled = false;
        btndelete.Enabled = false;
        btnUpdate.Enabled = true;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            bool isexist=false;
            List<string> plist = new List<string>();
            plist.Add(HiddenField1.Value.ToString());
            plist.Add(txtUserName.Text);
            plist.Add(txtpassword.Text);
            if (Session["group_id"].ToString() != "1")
            {
                plist.Add("1");
                plist.Add(DropDownList1.SelectedValue.ToString());               
                plist.Add("SA");
            }
            else
            {
                plist.Add(DropDownList2.SelectedValue.ToString());
                plist.Add(Session["officeid"].ToString());
                if (DropDownList2.SelectedValue.ToString() == "4")
                {
                    plist.Add("A");
                }
                else
                {
                    plist.Add(RadioButtonList1.SelectedValue.ToString());
                }
            }
            plist.Add(ddltaluka.SelectedValue.ToString());            
            plist.Add("U");
            if (isexist == true)
            {
              //  lblMsg.Text = "Record Already Exist";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

            }
            else
            {
                ds = bl_Obj.FillGridWithParameter(plist, "sp_user_master_Pro");
               // lblMsg.Text = "Record Updated";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
               
            }
            fillGrid();
            btnAdd.Enabled = true;
            btnUpdate.Enabled = false;
            btndelete.Enabled = true;
            DropDownList2.ClearSelection();
            ddltaluka.ClearSelection();
            txtUserName.Text = "";
            txtpassword.Text = "";
            txt_Confirm_Password.Text = "";
            txtUserName.Enabled = true;
            RadioButtonList1.ClearSelection();
        }
        catch (Exception ex)
        {
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //clearall();
        btnAdd.Enabled= true;
        btnUpdate.Enabled = false;
        btndelete.Enabled = true;
        DropDownList2.ClearSelection();
        ddltaluka.ClearSelection();
        txtUserName.Text = "";
        txtpassword.Text = "";
        txt_Confirm_Password.Text = "";
        RadioButtonList1.ClearSelection();
     
    }
    protected void btnview_Click(object sender, EventArgs e)
    {

    }
}
