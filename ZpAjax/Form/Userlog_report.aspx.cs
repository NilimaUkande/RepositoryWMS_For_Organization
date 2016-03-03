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

public partial class Form_Userlog_report : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_Obj = new BusinessLayerclass();
    BusinessLayer.email_sms1 bl_email = new BusinessLayer.email_sms1();
    BusinessLayer.email_sms1 bl_sms = new BusinessLayer.email_sms1();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");

            if (!IsPostBack)
            {

                fillmaingridform();

               

                HiddenField1.Value = "1";







            }
        }
        catch (Exception ex)
        { }
              
    }
    
 
    
        
       
    
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds1 = (DataSet)Cache.Get("Completed_Work");
        Cache.Insert("Completed_Work", ds1);
        datagrid.DataSource = ds1;
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        fillmaingridform();
       
    }
   
   
    private void fillmaingridform()
{
    try
    {
        DataSet ds1 = new DataSet();
        List<string> list = new List<string>();
        List<string> para_name = new List<string>();
        //if (!(DropDownList1.SelectedValue.ToString() == "0" || DropDownList1.SelectedValue.ToString() == ""))
        //{
        //    para_name.Add("@HDID");
        //    list.Add(DropDownList1.SelectedValue.ToString());
        //}
        //if (!(ddlYojana.SelectedValue.ToString() == "0" || ddlYojana.SelectedValue.ToString() == ""))
        //{
        //    para_name.Add("@YojanaID");
        //    list.Add(ddlYojana.SelectedValue.ToString());
        //}
        //if (!(DropDownList2.SelectedValue.ToString() == "0" || DropDownList2.SelectedValue.ToString() == ""))
        //{
        //    para_name.Add("@TalukaId");
        //    list.Add(DropDownList2.SelectedValue.ToString());
        //}
        para_name.Add("@officeid");
        list.Add("1");//officeid
        ds1 = bl_Obj.FillGridWithName_Parameter(para_name, list, "sp_userlog_report");
     // lbl_MSG .Text  = ds1.Tables[0].Rows.Count.ToString();
        
     
        Cache.Insert("Completed_Work", ds1);
        int id = (ds1.Tables[0].Rows.Count) % 10;
        if (id == 0)
        {
            if (datagrid.CurrentPageIndex > 0)
            {
                datagrid.DataSource = ds1;
                datagrid.CurrentPageIndex--;
                datagrid.DataBind();
            }
            else
            {
                datagrid.DataSource = ds1;
                datagrid.DataBind();
            }
        }
        else
        {
            datagrid.DataSource = ds1;
            datagrid.DataBind();
        }
    }
    catch (Exception ex)
    { }
}
  

   
  
    protected void BtnReset_Click(object sender, EventArgs e)
    {

        //if (BtnReset != null)
        //{ //reload the page in 1 second.
        //    BtnReset.Attributes.Add("onclick", "setReloadTime(1)");
        //}
        //DropDownList2.ClearSelection();
        //DropDownList1.ClearSelection();
        //ddlYojana.ClearSelection();
        fillmaingridform();
    }
}
