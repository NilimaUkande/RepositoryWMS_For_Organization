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
using BusinessLayer;
public partial class Report_Manjur_KameReport : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                FillDepartment();
                FillYear();
            }
        }
        catch (Exception ex)
        { }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         string dept1 = DDL_Dept.SelectedValue.ToString();
         string year1 = DDL_Year.SelectedValue.ToString();
         Server.Transfer("~/Form/goshwarareport.aspx?dept1=" + dept1 + "&year1=" + year1);
    }
    protected void FillDepartment()
  
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add("1");        
        DDL_Dept.DataValueField = "deptid";
        DDL_Dept.DataTextField = "deptname";
        ds = bl_obj.FillGridWithParameter(para,"sp_FillDepartment_ID");
        DDL_Dept.DataSource = ds;
        DDL_Dept.DataBind();
        //DDL_Dept.Items.Insert(0, new ListItem("--Select--", "0"));
        DDL_Dept.Items.Insert(1, new ListItem("All", "0"));
    }
    protected void FillYear()

    {
        DataSet ds = new DataSet();
        DDL_Year.DataValueField = "YearId";
        DDL_Year.DataTextField = "Year";
        ds = bl_obj.FillGrid("FillDDL_year1");
        DDL_Year.DataSource = ds;
        DDL_Year.DataBind();
        DDL_Year.Items.Insert(0, new ListItem("--Select--", "0"));
    }

}
