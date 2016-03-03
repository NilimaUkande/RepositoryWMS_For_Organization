using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
public partial class _Chart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
   
    [WebMethod]
    public static List<Data> GetData()
    {
        SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Northwind;Integrated Security=True");
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        conn.Open();
        string cmdstr = "select top 5 Country, COUNT(CompanyName) [Total Suppliers] from [Suppliers] group by Country";
        SqlCommand cmd = new SqlCommand(cmdstr, conn);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(ds);
        dt = ds.Tables[0];
        List<Data> dataList = new List<Data>();
        string cat="";
        int val=0;
        foreach (DataRow dr in dt.Rows)
        {
            cat=dr[0].ToString();
            val=Convert.ToInt32( dr[1]);
            dataList.Add(new Data(cat, val));
        }
        return dataList;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         
    }
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
  