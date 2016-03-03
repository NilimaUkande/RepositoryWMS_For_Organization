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

public partial class Form_Dashboard_details_totalwork : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep(3000);
        try
        {
          string flag=  Request.QueryString["q"];
           
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");
        
          
              
           
                fillGrid();
              
                        
           
        }
        catch (Exception ex)
        { }
    }
  
 
   
    protected void fillGrid()
    {


        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        plist.Add(Request.QueryString["q"]);
        ds = bl_obj.FillGridWithParameter(plist, "alert_window_for_ceo_totalwork_details");      
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
   
    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
       // (DataSet)Grid1.DataSource;
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
    
}
