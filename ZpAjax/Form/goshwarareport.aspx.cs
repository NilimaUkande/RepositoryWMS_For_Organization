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
public partial class Report_goshwarareport : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           
            DataSet ds = new DataSet();
            List<string> rptparam = new List<string>();

            DataTable rptdataset = new DataTable();
            string year1 = Request.QueryString["year1"];
            string dept1 = Request.QueryString["dept1"];
            string b = null;
            rptparam.Add(year1);
            rptparam.Add(dept1);
            rptdataset = bl_obj.RetriveMultipleDataSet("Sp_Manjur_Kame", rptparam);
            //rptdataset = bl_obj.FillGridWithParameter(rptparam, "Sp_Manjur_Kame");
            CrystalDecisions.CrystalReports.Engine.ReportDocument myReportDocument = new CrystalDecisions.CrystalReports.Engine.ReportDocument();

            if (dept1 != "0")
            {
                b = Server.MapPath("~/Report/Goshwara.rpt");
            }
            else
            {
                b = Server.MapPath("~/Report/GoshwaraForAll.rpt");
            }
            myReportDocument.Load(b);
            myReportDocument.Database.Tables["Sp_Goshvara"].SetDataSource(rptdataset);
            CrystalReportViewer1.ReportSource = myReportDocument;
            CrystalReportViewer1.DataBind();

        }
        catch (Exception ex)
        { }
    }
    protected void CrystalReportViewer1_Init(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Form/Goshwara.aspx");
    }
}
