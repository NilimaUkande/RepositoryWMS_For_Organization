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
using BussinessLayer;

public partial class KamPurnImage : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        FillImage_Befor();

    }

    
             
            
   
    protected void FillImage_Befor()
    {
        try
        {
            List<string> para = new List<string>();
            DataSet ds = new DataSet();
            para.Add(Session["Work_ID"].ToString());
           // para.Add(Session["WorkExtend_ID"].ToString());
            ds = obj.FillGridWithParameter(para, "sp_selectImage_for_kampurn");

            if (ds.Tables[0].Rows.Count != 0)
            {

                DataTable dt = new DataTable();
                DataColumn imageid = new DataColumn("kamimg_ID", typeof(string));
                dt.Columns.Add(imageid);

                DataColumn imageCol = new DataColumn("kamimage", typeof(string));
                dt.Columns.Add(imageCol);

                int w_id = Convert.ToInt32(Session["Work_ID"].ToString());
                if (ds.Tables[0].Rows.Count != 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        dt.Rows.Add(1);

                        // dt.Rows[i][imageCol] = string.Format("<img src='Handler.ashx?id={0}' alt='' style='width:100px' />",dt.Rows[i][0].ToString());
                        //dt.Rows[i][imageCol] = string.Format("<img src='readrealimage.aspx?id=" + w_id + "&flag=" + 7 + "' alt='' style='width:100px' />");
                        dt.Rows[i][imageCol] = string.Format("<img src='readrealimage.aspx?id=" + w_id + "&flag=" + 7 + "&kamimg_id=" + ds.Tables[0].Rows[i][0].ToString() + "' alt='' style='width:100px' />");
                        //Image4.ImageUrl = "readrealimage.aspx?id=" + w_id + "&flag=" + 6 + "&wid=" + 78;
                    }
                }
                else
                {

                }
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "noImage();", true);
                lblmsg.Text = "No images to display";
            }
        }
        catch (Exception ex)
        {

        }
    }


    //private void BindDataList()
    //{
    //    string sqlCmd = "SELECT imageid FROM Images";
    //    DataBaseHelper DBHelper = new DataBaseHelper();
    //    DataTable dt = DBHelper.GetTable(sqlCmd);
    //    //adding new column to display image
    //    DataColumn imageCol = new DataColumn("images", typeof(string));
    //    dt.Columns.Add(imageCol);

    //    if (dt.Rows.Count > 0)
    //    {
    //        for (int i = 0; i < dt.Rows.Count; i++)
    //        {
    //            dt.Rows[i][imageCol] = string.Format
    //    ("<img src='Handler.ashx?id={0}' alt='' style='width:100px' />",
    //        dt.Rows[i][0].ToString());
    //        }
    //    }
    //    DataList1.DataSource = dt;
    //    DataList1.DataBind();
    //}

    protected void btn_Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kam_Purn_kelayche_Cert.aspx");
    }
}
