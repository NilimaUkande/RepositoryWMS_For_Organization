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


using System.IO;
using System.Data.SqlClient;


public partial class Form_GR_Master : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.BindGrid();
            fillGrid();
        }
    }
    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT Id, FileDetail, Name FROM tblFiles2";
                cmd.Connection = con;
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                DataTable dt = new DataTable();
                dt.Load(dr);
                ViewState["dt"] = dt;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                
                //GridView1.DataSource = cmd.ExecuteReader();
                //GridView1.DataBind();
                con.Close();


            }
        }
    }
    protected void Upload(object sender, EventArgs e)
    {
        String FileDetail = txtfilename.Text;
        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        string contentType = FileUpload1.PostedFile.ContentType;
        using (Stream fs = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string constr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "insert into tblFiles2(FileDetail,Name, ContentType, Data) values (@FileName,@Name, @ContentType, @Data)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {

                        cmd.Connection = con;
                        cmd.Parameters.Add(new SqlParameter("@FileName", FileDetail));

                        cmd.Parameters.Add(new SqlParameter("@Name", filename));
                        cmd.Parameters.Add(new SqlParameter("@ContentType", contentType));
                        cmd.Parameters.Add(new SqlParameter("@Data", bytes));
                      
                        con.Open();
                        cmd.ExecuteNonQuery();
                     
                        con.Close();
                    }
                }
            }
        }
        Response.Redirect(Request.Url.AbsoluteUri);
      
    }

    protected void View(object sender, EventArgs e)
    {
        viewPDF.Attributes.Add("Style", "Visibility:visible");
        int id = int.Parse((sender as LinkButton).CommandArgument);
        string embed = "<object data=\"{0}{1}\" type=\"application/pdf\" width=\"800px\" height=\"600px\">";
        embed += "If you are unable to view file, you can download from <a href = \"{0}{1}&download=1\">here</a>";
        embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
        embed += "</object>";
        ltEmbed.Text = string.Format(embed, ResolveUrl("~/FileCS.ashx?Id="), id);
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {




        //second attempt
        List<string> attributeList = new List<string>();

        attributeList.Add("@Name");
        attributeList.Add("@Code");
        attributeList.Add("@Date");
        attributeList.Add("@URL");
        //attributeList.Add("@flag");

        List<string> attributeValue = new List<string>();
        // attributeValue.Add("1");
        attributeValue.Add(txtFile.Text.ToString());

        attributeValue.Add(txtCode.Text.ToString());

        attributeValue.Add(txtDate.Text.ToString());
        attributeValue.Add(txtURL.Text.ToString());
        // attributeValue.Add("a");
        DataSet ds = new DataSet();
        ds = bl_obj.ExecuteStoredFunctionWithParameters(attributeValue, "sp_insert_gr");


        if (ds.Tables.Count != 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
           // lblmsg.Text = "Record Inserted";
            fillGrid();
        }
        //else
        //{
           
        //    lblmsg.Text = "Record Not Inserted";
        //}






    }

    protected void btnedit_Click(object sender, EventArgs e)
    {

        //second attempt
        List<string> attributeList = new List<string>();
        attributeList.Add("@GR_No");
        attributeList.Add("@Name");
        attributeList.Add("@Code");
        attributeList.Add("@Date");
        attributeList.Add("@URL");
        //attributeList.Add("@flag");

        List<string> attributeValue = new List<string>();
        // attributeValue.Add("1");
        // attributeValue.Add(txtgr_no.Text.ToString());

        attributeValue.Add(txtFile.Text.ToString());

        attributeValue.Add(txtCode.Text.ToString());

        attributeValue.Add(txtDate.Text.ToString());
        attributeValue.Add(txtURL.Text.ToString());
        // attributeValue.Add("a");
        DataSet ds = new DataSet();
        ds = bl_obj.ExecuteStoredFunctionWithParameters(attributeValue, "sp_edit_gr");


        if (ds.Tables.Count != 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true);
           
           // lblmsg.Text = "Record Updated";
        }
        //else
        //{
        //    lblmsg.Text = "Record Not Updated";
        //}
    }

    protected void btndlt_Click(object sender, EventArgs e)
    {

    }

    protected void fillGrid()
    {


        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        //  plist.Add(Session["officeid"].ToString());
        ds = bl_obj.FillGridWithParameter(plist, "sp_fillGR");
        int id = (ds.Tables[0].Rows.Count) % 10;
        if (id == 0)
        {
            if (GridView2.CurrentPageIndex > 0)
            {
                GridView2.DataSource = ds;
                GridView2.CurrentPageIndex--;
                GridView2.DataBind();
            }
            else
            {

                GridView2.DataSource = ds;
                GridView2.DataBind();
            }
        }
        else
        {

            GridView2.DataSource = ds;
            GridView2.DataBind();
        }

    }

    protected void GridView1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillGrid();
        GridView2.CurrentPageIndex = e.NewPageIndex;
        GridView2.DataBind();
    }

    protected void lnkView1_Click(object sender, EventArgs e)
    {




    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(GridView2.SelectedItem.Cells[1].Text.ToString());
            ds = bl_obj.FillGridWithParameter(para, "sp_deleteGR");
            fillGrid();

        }
        catch (Exception ex)
        {

        }
    }
    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(GridView2.SelectedItem.Cells[1].Text.ToString());
            ds = bl_obj.FillGridWithParameter(para, "sp_deleteGRTab2");
            fillGrid();

        }
        catch (Exception ex)
        {

        }

    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       

        DataSet ds = new DataSet();
        List<String> para = new List<string>();
        para.Add(GridView1.DataKeys[e.RowIndex].Value.ToString());
        ds = bl_obj.FillGridWithParameter(para, "sp_deleteGRTab2");

        BindGrid();
    }


    protected void GridView1_PageIndexChanged1(object sender, EventArgs e)
    {
        BindGrid();
        //GridView1.CurrentPageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            CheckBox cb;
            DataSet ds = new DataSet();
            for (int i = 0; i < GridView2.Items.Count; i++)
            {
                List<string> para = new List<string>();
                cb = (CheckBox)GridView2.Items[i].FindControl("Cb");
                if (cb.Checked)
                {
                    select = 1;
                    para.Add(GridView2.Items[i].Cells[1].Text.ToString());
                  

                    bl_obj.FillGridWithParameter(para, "sp_deleteGR");
                  
                }
            }
             fillGrid();
                if (select == 0)
                {
                  //  lblmsg.Text = "Please select record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                }
            else{
               // lblmsg.Text = "Record Deleted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
                }
            
           
        }
        catch (Exception ex)
        {
        }

       
    }
    protected void btndeletetab2_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            CheckBox cb;
            DataSet ds = new DataSet();
          
                for (int i = 0; i < GridView1.Rows.Count; i++)
                    //for (int i = 0; i < GridView1.Items.Count; i++)
                {
                    List<string> para = new List<string>();
                    // cb = (CheckBox)GridView1.Items[i].FindControl("Cb1");
                    cb = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("Cb1");
                    if (cb.Checked)
                    {
                        select = 1;
                        //para.Add(GridView1.Items[i].Cells[1].Text.ToString());
                        para.Add(GridView1.Rows[i].Cells[1].Text);
                        //para.Add(GridView1.SelectedRow.Cells[1].Text.ToString());

                      ds=bl_obj.FillGridWithParameter(para, "sp_deleteGRTab2");
                       
                    }
                }
                BindGrid();
                    if (select == 0)
                    {
                        //Label10.Text = "Please select record";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);
                    }
            else
                    {
                       // Label10.Text = "Record Deleted";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);

                    }
                

        }
        catch (Exception ex)
        {
        }

        
    }
}


