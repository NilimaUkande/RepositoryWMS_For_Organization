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
using DataLayer;
public partial class Forms_Taluka_Master : System.Web.UI.Page
{   
    TalukaMasterBussinessLayer obj = new TalukaMasterBussinessLayer();
  
    protected void Page_Load(object sender, EventArgs e)
    {try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        if (!Page.IsPostBack)
        {
            
                TextBox1.Focus();
                FillGrid();
                clearAll();
            }
        }
            catch (Exception ex)
            { }
      

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try 
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            bool m = obj.Record_Exist(Convert.ToInt32(Session["District_id"].ToString()), TextBox1.Text);
            if(m == true)
            {   
                //Label5.Text = "Record Already Exists";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

            }
            else
            {
                para.Add("1");
                para.Add(TextBox1.Text.Trim()); //taluka name
                para.Add(Session["District_id"].ToString());//distirct name
                para.Add(RadioButtonList1.SelectedValue.ToString());
                obj.InsertIntoTalukamaster(para);
                //Label5.Text = "Record Inserted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
            }            
          }
        catch(Exception ex)
        {
         Label5.Text = ex.ToString();
        }
        TextBox1.Text = "";
        FillGrid();
        clearAll();
    }
    protected void Btn_Update_Click(object sender, EventArgs e)
    {
        try
        {
            //bool record_Exist = obj.Record_Exist(TextBox1.Text);
            bool m = obj.Record_Exist(Convert.ToInt32(Session["District_id"].ToString()), TextBox1.Text);
            if (m == false)
            {
                List<string> para1 = new List<string>(); 
                para1.Add(GridView1.SelectedItem.Cells[3].Text.ToString());
                para1.Add(TextBox1.Text);// taluka name
                para1.Add(Session["District_id"].ToString());
                para1.Add(RadioButtonList1.SelectedValue.ToString());                
                obj.UpdateTalukaMaster(para1);
               // Label5.Text = "Updated Successfully..";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
                FillGrid();
            }
            else
            {                  
              //Label5.Text = "Already Exist";
              ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

            }
            clearAll();
            Btn_Add.Enabled = true;
            Btn_Update.Enabled = false;
        }
        catch (Exception ex)
        {
         Label5.Text = ex.ToString();
        }
    }
    protected void Btn_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            CheckBox cb;
            int select = 0;
            for (int i = 0; i < GridView1.Items.Count; i++)
            {
                List<string> para = new List<string>();
                cb = (CheckBox)GridView1.Items[i].FindControl("checkbox1");
                if (cb.Checked)
                {
                    select = 1;
                    para.Add(GridView1.Items[i].Cells[3].Text);
                    //Label5.Text = "Record Deleted";
                    
                
                    obj.DeleteTalukaMaster(para); 
                    }                
            }
            FillGrid();
            if (select == 0)
            {
                //Label5.Visible = true;
                //Label5.Text = "Please Select a Record to delete";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

            }
            else
            { 
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
            }

                
            Btn_Add.Enabled = true;
            Btn_Delete.Enabled = true;
            
        }
        catch (Exception ex)
        {
         Label5.Text = ex.ToString();
        }
    }
    public void FillGrid()
    {
        try
        {
            DataSet ds=new DataSet();
            List<string> para = new List<string>();
            if (Session["District_id"] .ToString()== "")
            {
                GridView1.Visible = false;
            }
            else
            {
                GridView1.Visible = true;
                para.Add(Session["District_id"].ToString());
                ds = obj.FillGrid1(para);
                Cache.Insert("taluka_mstr",ds);
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
        }
        catch (Exception e)
        {
            Label3.Text = e.ToString();
        }        
    }
    public void clearAll()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Btn_Update.Enabled = true;
        Btn_Add.Enabled = false;
        Btn_Delete.Enabled = false;
        TextBox1.Text = GridView1.SelectedItem.Cells[2].Text;
        Label3.Text= "";        
    }
    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("taluka_mstr");
        Cache.Insert("taluka_mstr",ds);

        GridView1.DataSource = ds;
        GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind(); 
    }
   

    protected void DDL_District_SelectedIndexChanged(object sender, EventArgs e)
    {

    }  
      
    protected void Button1_Click2(object sender, EventArgs e)
    {
        clearAll();
        Btn_Add.Enabled = true;
        Btn_Update.Enabled = false;
    }
}
