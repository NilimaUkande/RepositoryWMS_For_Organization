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
using System.Data.SqlClient;
using System.Web.Services;
using BussinessLayer;
using System.Threading;
using System.Text;

public partial class Form_AdminPage : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
   
    static DataSet dsps = new DataSet();

    StringBuilder str = new StringBuilder();
    StringBuilder str1 = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");
            if (!IsPostBack)
            {
                //ddlyear1.Focus();
                // ddlyear();
                //Department();
                //fillddltaluka();
                //fillddlgaon();
                //fillddlZpgutId();
                //fillddlpsgancode();
                // vidhansabha();
                // fillLoksabha();
                //ddlfillwrktype();
                // ddlEngineerfill();
                //fillworkEntry();



                //FillDepartment();
                //FillYear();
            }

           
            
            BindChart();
            BindChart1();
            BindChartthekedar();
        }
        catch (Exception ex)
        { }
    }


    //public void ddlEngineerfill()
    //{
    //    DataSet ds = new DataSet();
    //    List<string> para = new List<string>();
    //    para.Add(Session["officeid"].ToString());
    //    para.Add(DdLShakha.SelectedValue.ToString());
    //    ddlEngineer.DataValueField = "engid";
    //    ddlEngineer.DataTextField = "Engineername";
    //    ds = bl_ob.FillGridWithParameter(para, "sp_FillEngineername");
    //    ddlEngineer.DataSource = ds;
    //    ddlEngineer.DataBind();
    //    ddlEngineer.Items.Insert(0, new ListItem("--Select--", "0"));
    //}

    //public void Department()
    //{
    //    DataSet ds = new DataSet();
    //    List<string> para = new List<string>();
    //    para.Add(Session["officeid"].ToString());//set Session Office_ID
    //    DdLShakha.DataValueField = "deptid";
    //    DdLShakha.DataTextField = "deptname";
    //    ds = bl_ob.FillGridWithParameter(para, "sp_FillDepartment_ID");
    //    DdLShakha.DataSource = ds;
    //    DdLShakha.DataBind();
    //    DdLShakha.Items.Insert(0, new ListItem("--Select--", "0"));
    //}

    //protected void DdLShakha_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //   // fillupvibhag();
    //    ddlEngineerfill();
    //    //fill_lscode();
    //    //ddlgaon.Focus();
    //}

    //public void fillddltaluka()
    //{
    //    DataSet ds = new DataSet();
    //    ddltaluka.DataValueField = "TalukaId";
    //    ddltaluka.DataTextField = "TalukaName";
    //    ds = bl_ob.FillGrid("Sp_FillTalukaName");
    //    ddltaluka.DataSource = ds;
    //    ddltaluka.DataBind();
    //    ddltaluka.Items.Insert(0, new ListItem("--Select--", "0"));
    //}

    //protected void ddltaluka_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //   // fillddlgaon();
    //   // fillddlZpgutId();
    //   // ddlgaon.Focus();
    //}


    //protected void FillDepartment()
    //{

    //    DataSet ds = new DataSet();
    //    List<string> para = new List<string>();
    //    para.Add(Session["officeid"].ToString());
    //    DDL_Dept.DataValueField = "deptid";
    //    DDL_Dept.DataTextField = "deptname";
    //    ds = bl_obj.FillGridWithParameter(para, "sp_FillDepartment_ID");
    //    DDL_Dept.DataSource = ds;
    //    DDL_Dept.DataBind();
    //    DDL_Dept.Items.Insert(0, new ListItem("--Select--", "0"));
       



    //}

    //protected void FillYear()
    //{
    //    DataSet ds = new DataSet();
    //    DDL_Year.DataValueField = "YearId";
    //    DDL_Year.DataTextField = "Year";
    //    ds = bl_obj.FillGrid("FillDDL_year1");
    //    DDL_Year.DataSource = ds;
    //    DDL_Year.DataBind();
    //    DDL_Year.Items.Insert(0, new ListItem("--Select--", "0"));
    //}
    //protected void Taluka()
    //{



    //    List<string> para = new List<string>();
    //    para.Add(RadioButtonList2.SelectedValue.ToString());
    //    DataSet ds = new DataSet();
    //    ds = bl_obj.FillGridWithParameter(para, "sp_SelectTalukaNameNew");
    //    DDL_Taluka.DataValueField = "Talukaid";
    //    DDL_Taluka.DataTextField = "Talukaname";
    //    DDL_Taluka.DataSource = ds;
    //    DDL_Taluka.DataBind();
    //    DDL_Taluka.Items.Insert(0, new ListItem("--Select--", "0"));
    //    DDL_Taluka.Items.Insert(1, new ListItem("All", "0"));


    //}
    //protected void ddlEngineerfill()
    //{
    //    DataSet ds = new DataSet();
    //    List<string> para = new List<string>();
    //    para.Add(Session["officeid"].ToString());
    //    para.Add(DDL_Dept.SelectedValue.ToString());
    //    ddlEngineer.DataValueField = "engid";
    //    ddlEngineer.DataTextField = "Engineername";
    //    ds = bl_obj.FillGridWithParameter(para, "sp_FillEngineername");
    //    ddlEngineer.DataSource = ds;
    //    ddlEngineer.DataBind();
    //    ddlEngineer.Items.Insert(0, new ListItem("--Select--", "0"));
    //}
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Taluka();
        //ddlEngineerfill();
    }
    protected void DDL_Taluka_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ddlEngineerfill();
    }

    //for pending pie chart
    [WebMethod]
    public static List<Data> GetData()
    {
        BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();
        DataSet ds = new DataSet();

        List<string> Para = new List<string>();
        Para.Add("1");

        ds = bl_obj.ExecuteStoredFunctionWithParameters(Para, "alert_window_for_ceo");


        //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString);
        //DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        //conn.Open();
        //string cmdstr = "select top 5 Country, COUNT(CompanyName) [Total Suppliers] from [Suppliers] group by Country";
        //SqlCommand cmd = new SqlCommand(cmdstr, conn);
        //SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //adp.Fill(ds);
        dt = ds.Tables[0];
        List<Data> dataList = new List<Data>();
        string cat = "";
        int val = 0;
        foreach (DataRow dr in dt.Rows)
        {
            cat = dr[0].ToString();
            val = Convert.ToInt32(dr[1]);
            dataList.Add(new Data(cat, val));
        }
        return dataList;
    }

    public class Data
    {
        public string ColumnName = "";
        public int Value = 0;

        public Data(string columnName, int value)
        {
            ColumnName = columnName;
            Value = value;
        }
    }
    //for pending pie chart




    //for stack chart
    private DataTable GetDatastack()
    {
        DataTable dt = new DataTable();
        List<string> para = new List<string>();
        para.Add("1");
        dt = bl_obj.RetriveMultipleDataSet_for_talukadashboard("alert_window_for_ceo_talukawise", para);
        return dt;
    }

    private void BindChart()
    {
        DataTable dt = new DataTable();
        try
        {
            dt = GetDatastack();

            str.Append(@"<script type=*text/javascript*> 
            function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Taluka');
            data.addColumn('number', 'एकुण');
            data.addColumn('number', 'निर्गत');      
            data.addColumn('number', 'प्रलंबित');   
            data.addRows(" + dt.Rows.Count + ");");

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                str.Append("data.setValue( " + i + "," + 0 + "," + "'" + dt.Rows[i][0].ToString() + "');");
                str.Append("data.setValue(" + i + "," + 1 + "," + dt.Rows[i][1].ToString() + ") ;");
                str.Append("data.setValue(" + i + "," + 2 + "," + dt.Rows[i][2].ToString() + ") ;");
                str.Append("data.setValue(" + i + "," + 3 + "," + dt.Rows[i][3].ToString() + ") ;");
            }

            str.Append(" var chart = new google.visualization.ColumnChart(document.getElementById('subchart_div'));");
            str.Append(" chart.draw(data,{isStacked:true, width:510, height:350, legend: {position: 'top',maxLines: 3}, hAxis: {showTextEvery:1, slantedText:true}}  );google.setOnLoadCallback(drawChartfortotalwork); ");
            str.Append("  function selectHandler() { var selectedItem = chart.getSelection()[0]; if (selectedItem) { var topping = data.getValue(selectedItem.row, 0);var label = data.getColumnLabel(selectedItem.column);window.location.href = 'Dashboard_details_talukawise.aspx?q=' + topping + '&p=' + label;}} google.visualization.events.addListener(chart, 'select', selectHandler);}");
            str.Append("</script>");
            lt.Text = str.ToString().Replace('*', '"');
        }
        catch
        { }
    }

    //for stack chart


    //for pie chart totalwork
    private DataTable GetDatastacktotalwork()
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        ds = bl_obj.FillGrid("alert_window_for_ceo_totalwork");
        dt = ds.Tables[0];
       
        return dt;
    }

    private void BindChart1()
    {
        DataTable dsChartData = new DataTable();
        StringBuilder strScript = new StringBuilder();

        try
        {
            dsChartData = GetDatastacktotalwork();

            strScript.Append(@"<script type='text/javascript'>  
                    google.load('visualization', '1', {packages: ['corechart']}); </script>  
                      
                    <script type='text/javascript'>  
                     
                    function drawChartfortotalwork() {         
                    var data = google.visualization.arrayToDataTable([['col', 'value'],");

            foreach (DataRow row in dsChartData.Rows)
            {
                strScript.Append("['" + row["col"] + "'," + row["value"] + "],");
            }
            strScript.Remove(strScript.Length - 1, 1);
            strScript.Append("]);");

            strScript.Append(@" var options = {     
                                    width:510, 
                                    height:350, 
                                    legend: {position: 'top',maxLines: 3},  
                                    is3D: true,          
                                    };   ");

            strScript.Append(@"var chart = new google.visualization.PieChart(document.getElementById('visualizationtotalwork')); 
 function selectHandler() {
                var selectedItem = chart.getSelection()[0];
                if (selectedItem) {
                    var topping = data.getValue(selectedItem.row, 0);
                    window.location.href = 'Dashboard_details_totalwork.aspx?q=' + topping;
                }
            }
            google.visualization.events.addListener(chart, 'select', selectHandler);         
                                chart.draw(data, options);        
                                }    
                            google.setOnLoadCallback(drawChartfortotalwork);  
                            ");
            strScript.Append(" </script>");


            lttotalwork.Text = strScript.ToString();
        }
        catch
        {
        }
        finally
        {
            dsChartData.Dispose();
           
        }
    }

    





    //for pie chart totalwork

    //for pie chart thekedar
    private DataTable GetDatastackthekedar()
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        ds = bl_obj.FillGrid("alert_window_for_ceo_thekedar");
        dt = ds.Tables[0];

        return dt;
    }
    private void BindChartthekedar()
    {
        DataTable dsChartData = new DataTable();
        StringBuilder strScript1 = new StringBuilder();

        try
        {
            dsChartData = GetDatastackthekedar();

            strScript1.Append(@"<script type='text/javascript'>  
                    google.load('visualization', '1', {packages: ['corechart']}); </script>  
                      
                    <script type='text/javascript'>  
                     
                    function drawChartforthekedar() {         
                    var data = google.visualization.arrayToDataTable([['col', 'value'],");

            foreach (DataRow row in dsChartData.Rows)
            {
                strScript1.Append("['" + row["col"] + "'," + row["value"] + "],");
            }
            strScript1.Remove(strScript1.Length - 1, 1);
            strScript1.Append("]);");

            strScript1.Append(@" var options = {     
                                    width:510, 
                                    height:350, 
                                    legend: {position: 'top',maxLines: 4},  
                                    is3D: true,          
                                    };   ");

            strScript1.Append(@"var chart = new google.visualization.PieChart(document.getElementById('visualizationthekedar')); 
 function selectHandler() {
                var selectedItem = chart.getSelection()[0];
                if (selectedItem) {
                    var topping = data.getValue(selectedItem.row, 0);
                    window.location.href = 'Dashboard_details_thekedar.aspx?q=' + topping;
                }
            }
            google.visualization.events.addListener(chart, 'select', selectHandler);         
                                chart.draw(data, options);        
                                }    
                            google.setOnLoadCallback(drawChartforthekedar);  
                            ");
            strScript1.Append(" </script>");


            ltthekedar.Text = strScript1.ToString();
        }
        catch
        {
        }
        finally
        {
            dsChartData.Dispose();

        }
    }


    //for pie chart thekedar

  
}
