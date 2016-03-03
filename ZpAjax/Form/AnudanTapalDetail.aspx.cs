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
using System.Text;
using System.Net;
using System.IO;


public partial class AnidanTapalDetail : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
    BussinessLayer.BusinessLayerclass obj = new BusinessLayerclass();
    BusinessLayer.anudanTapsil bl = new BusinessLayer.anudanTapsil();
    protected void Page_Load(object sender, EventArgs e)
    {
     
        //To view the result
    
        try
        {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
       
            if (!IsPostBack)
            {
                ddlyear.Focus();
                DDlFill();
               fillgrid();
                ClearAll();
                Checkstagestatus();
               
            }

            lblTalukatext.Text =  "कामाचे नाव : " + Session["Workname"].ToString();
            //lblTalukatext.Text = "तालुका : " + Session["Talukaname"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "गाव : " + Session["Gavname"].ToString()
            //      + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "कामाचे नाव : " + Session["Workname"].ToString();

           
        }
        catch (Exception ex)
        { }

    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txtpatrano);
        bl_obj.Textboxstring(plist);
        plist.Clear();
        plist.Add(txtmoney);
        bl_obj.TextboxNull(plist);
        plist.Clear();
        plist.Add(txtdate);
        bl_obj.Textboxdate(plist);
       
    }
    public void DDlFill()
      {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["year"].ToString());
        ds = obj.FillGridWithParameter(para, "sp_Fill_YearMaster");
        ddlyear.DataValueField = "YearId";
        ddlyear.DataTextField = "Year";
        ddlyear.DataSource = ds;
        ddlyear.DataBind();
        ddlyear.Items.Insert(0, (new ListItem("---Select---", "")));
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
         setzero();

         //String temp = String.Format("{0:f2}",txtmoney.Text);
        // String temp = String.Format("{0: #,#.00", txtmoney.Text);
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add("1");//for primary key
        para.Add(Session["Work_ID"].ToString());
        para.Add(ddlyear.SelectedValue.ToString());
        para.Add(txtpatrano.Text);
        string date = obj.convertDate(txtdate.Text);
        para.Add(date);
        para.Add(txtmoney.Text);
        para.Add("a");
        ds = bl.anu_insert(para);
        lnk_Next.Visible = true;
        if (ds.Tables.Count != 0)
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "checkRecord();", true);
            //lblmsg.Text = "Record Allready Exist";
        }
        else
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
            //lblmsg.Text = "Record Inserted";
           
            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("3");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");
            
           
        }
       
        fillgrid();         
        ClearAll();
       
    }
    public void fillgrid()
 
    {

        List<string> para = new List<string>();
        para.Add(Session["Work_ID"].ToString());
       
        DataSet ds = new DataSet();
        ds = bl.FillDataGrid(para);
        if (ds.Tables.Count != 0)
        {
            if (ds.Tables[0].Rows.Count != 0)
            {
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
                    Button1.Enabled = true;
                    datagrid.DataSource = ds;
                    datagrid.DataBind();
                }
            }

            else
            {
                Button1.Enabled = false;
                datagrid.DataSource = ds;
                datagrid.DataBind();
            }
        }
  
    }
    public void ClearAll()
    {
       ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);       
        
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {         
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(HiddenField1.Value.ToString());
            para.Add(Session["Work_ID"].ToString());//for workid
            para.Add(ddlyear.SelectedValue.ToString());
            para.Add(txtpatrano.Text);
            string date = obj.convertDate(txtdate.Text);
            para.Add(date);
            para.Add(txtmoney.Text);
            para.Add("u");
            ds = bl.anu_insert(para);
            
            fillgrid();
            ClearAll();          
            lblmsg.Visible = true;

            if (ds.Tables.Count != 0)
            {
                 ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
               // lblmsg.Text = "Record Updated";
            }
            else
                
             ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
               // lblmsg.Text = "Record Updated";
            ddlyear.Focus();

            List<string> list = new List<string>();
            list.Add(Session["Work_ID"].ToString());
            list.Add("3");
            list.Add(Session["User_Id"].ToString());
            list.Add(Session["officeid"].ToString());
            obj.FillGridWithParameter(list, "sp_Stage_Tracking_insert");  
        }
        catch (Exception ex)
        { }
    }
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlyear.ClearSelection();
            HiddenField1.Value = datagrid.SelectedItem.Cells[2].Text.ToString();
            ddlyear.Items.FindByText(datagrid.SelectedItem.Cells[5].Text.ToString()).Selected = true;
            txtpatrano.Text = datagrid.SelectedItem.Cells[6].Text.ToString();
            txtmoney.Text = datagrid.SelectedItem.Cells[8].Text.ToString()+".00";
            txtdate.Text = datagrid.SelectedItem.Cells[7].Text.ToString();
           
            btnadd.Enabled = false;
            btnupdate.Enabled = true;
            Button1.Enabled = false;
        }
        catch(Exception ex)
        {}
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    try
    //    {

    //        CheckBox cb;
    //        DataSet ds = new DataSet();
    //        for (int i = 0; i < datagrid.Items.Count; i++)
    //        {
    //            List<string> para = new List<string>();
    //            cb = (CheckBox)datagrid.Items[i].FindControl("CheckBox1");
    //            //lblmsg.Text = "Select A Record To Delete";
    //            if (cb.Checked)
    //            {
    //                para.Add(datagrid.Items[i].Cells[2].Text.ToString());                  
    //                obj.FillGridWithParameter(para, "sp_delete_anudanTapshil");
    //          // lblmsg.Text = "Record Deleted";
    //           ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
             
    //            }
    //            else
    //            {
    //            // lblmsg.Text="Please Select Record";
    //                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel;", true);
    //            }
    //        }
    //        fillgrid();
    //        ddlyear.Focus();

    //    }

    //    catch (Exception ex)
    //    {
    //        Session["Exception"] = ex.ToString();
    //        Response.Redirect("ExceptionHandling.aspx");
    //    }

    //}

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int select=0;
            CheckBox cb;
            DataSet ds = new DataSet();
            for (int i = 0; i < datagrid.Items.Count; i++)
            {
                List<string> para = new List<string>();
                cb = (CheckBox)datagrid.Items[i].FindControl("CheckBox1");
                //lblmsg.Text = "Select A Record To Delete";
                if (cb.Checked)
                {
                    select = 1;
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                    obj.FillGridWithParameter(para, "sp_delete_anudanTapshil");
                   

                }
            }
             fillgrid();
            if(select==1)
            {
                 // lblmsg.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
            }
                else
                {
                 //if(select==0)
                 //{
                    // lblmsg.Text="Please Select Record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                //}
            }
            
    
            ddlyear.Focus();

        }

        catch (Exception ex)
        {
            Session["Exception"] = ex.ToString();
            Response.Redirect("ExceptionHandling.aspx");
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/HomePage.aspx");
    }   
    protected void Button2_Click(object sender, EventArgs e)
    {
    //    //this.Dispose();
    //    //Response.Redirect("~/Form/login.aspx");
    ////}
    ////protected void Button2_Click1(object sender, EventArgs e)
    ////{
    //    Label74.Text = "pageform code behind";

    //    ddlyear.Focus();
    //    ClearAll();
    //    btnadd.Enabled = true;
    //    Button1.Enabled = true;
    //    btnupdate.Enabled = false;

        txtdate.Text = " ";
        txtmoney.Text = " ";
        txtpatrano.Text = " ";
        ddlyear.ClearSelection();
        ddlyear.Focus();
    }
   


    protected void Button3_Click(object sender, EventArgs e)
    {
        //txtdate.Text = " ";
        //txtmoney.Text = " ";
        //txtpatrano.Text = " ";
        //ddlyear.ClearSelection();
        //ddlyear.Focus();
        ClearAll();
    }

     protected void txtmoney_TextChanged(Object sender, EventArgs e)
    {
        //String num = txtPMRakkam.Text;
        //String Ans = String.Format("{0:C}", Convert.ToInt32(num));
        //txtPMRakkam.Text = Ans;


        //String num = txtmoney.Text;
        //String ans = num + ".00";
        //txtmoney.Text = ans;
    }

     //For disable next stage button 17/8/2015
     protected void Checkstagestatus()
     {
         DataSet ds = new DataSet();
         List<string> list = new List<string>();
         list.Add(Session["Work_ID"].ToString());
         list.Add("3");
         ds = obj.FillGridWithParameter(list, "sp_Check_Stage_Status");
         if (ds.Tables[0].Rows.Count != 0)
         {
             lnk_Next.Visible = true;
         }
         else
         {
             lnk_Next.Visible = false;
         }
     }
  
}

