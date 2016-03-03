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

public partial class Form_SearchPage : System.Web.UI.Page
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

                filllekhashirsh();
                fillddltaluka();
                //search
                Department();
                fillWorkType();
                //fillddlthekedar();
                // fillddltaluka();

                ddlyear();
                ddlEngineer.Enabled = false;
                ddlzpgut.Enabled = false;
                ddlpsgancode.Enabled = false;
                ddlYojana.Enabled = false;
                //search

                if (Convert.ToString(Session["Work_ID"].ToString()) == "")
                {
                    FillgridMain();
                }
                else
                {
                    FillgridMain();
                    Panel1.Visible = true;
                    workname.Attributes["style"] = "Display: block;";
                    Fillgrid();
                }

                HiddenField1.Value = "1";

                // for sending email and sms
                string user_id = Session["user_id"].ToString();
                string group_id = Session["Group_Id"].ToString();
                string currentdate = System.DateTime.Now.Day.ToString() + '/' + System.DateTime.Now.Month.ToString() + '/' + System.DateTime.Now.Year.ToString();
                string SevendaysBeforedate = bl_Obj.calculateDate(currentdate, "-7");
                string FifteendaysBeforedate = bl_Obj.calculateDate(SevendaysBeforedate, "-8");
                string ThirtydayBeforeDate = bl_Obj.calculateDate(FifteendaysBeforedate, "-15");

                List<string> ParamList = new List<string>();
                //ParamList.Add("@CurrentDate");
                //ParamList.Add("@7daysBeforeDate");
                //ParamList.Add("@15daysBeforeDate");
                //ParamList.Add("@30daysBeforeDate");

                List<string> ParamValue = new List<string>();
                //ParamValue.Add(bl_Obj.convertDate(currentdate));
                //ParamValue.Add(bl_Obj.convertDate(SevendaysBeforedate));
                //ParamValue.Add(bl_Obj.convertDate(FifteendaysBeforedate));
                //ParamValue.Add(bl_Obj.convertDate(ThirtydayBeforeDate));
                DataTable set = bl_Obj.RetriveMultipleDataSet("Alert_Window_For_HOD", ParamList, ParamValue);



                if (user_id == "14")
                {
                    DataSet ds = new DataSet();
                    DataSet ds1 = new DataSet();
                     ParamList.Clear();
                     ParamValue.Clear();
                    ParamList.Add("@user_id");
                    ParamValue.Add(Session["user_id"].ToString());
                    ParamList.Add("@Group_Id");
                    ParamValue.Add(Session["Group_Id"].ToString());
                    ParamList.Add("@CurrentDate");
                    ParamValue.Add(bl_Obj.convertDate(currentdate));
                    ds = bl_Obj.FillGrid("checkemailsms");
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        string date = ds.Tables[0].Rows[0][0].ToString().Trim();
                        string emailflag = ds.Tables[0].Rows[0][1].ToString().Trim();
                        string smsflag = ds.Tables[0].Rows[0][2].ToString().Trim();
                    }
                    else
                    {
                        DataSet ds2 = new DataSet();
                        DataSet ds3 = new DataSet();
                        ds2 = bl_Obj.FillGrid("sp_check_iscurrentlyworking");
                        for (int i = 0; i < ds2.Tables[0].Rows.Count; i++)
                        {
                            string char1 = ds2.Tables[0].Rows[i][9].ToString().Trim();
                            string emailid = ds2.Tables[0].Rows[i][7].ToString().Trim();
                            string mobileno = ds2.Tables[0].Rows[i][8].ToString().Trim();
                            Session["emailid"] = emailid.ToString();
                            Session["mobileno"] = mobileno.ToString();
                            if (char1 == "Y")
                            {
                                List<string> plist = new List<string>();
                                List<string> pvalue = new List<string>();
                                plist.Add("@user_id");
                                pvalue.Add(Session["user_id"].ToString());
                                plist.Add("@Group_Id");
                                pvalue.Add(Session["Group_Id"].ToString());
                                plist.Add("@CurrentDate");
                                pvalue.Add(bl_Obj.convertDate(currentdate));
                                DataTable dt_email = bl_Obj.RetriveMultipleDataSetEmail("sp_pending_email", pvalue);
                                bl_email.send_email_Higher_authority(dt_email, Session["emailid"].ToString());
                                bl_email.send_sms_citizen(Session["mobileno"].ToString());
                                plist.Clear();
                                pvalue.Clear();
                            }
                            string sa = "Y";
                            List<string> para1 = new List<string>();
                            para1.Add(emailid);
                            para1.Add(Session["Group_Id"].ToString());
                            para1.Add(Session["user_id"].ToString());
                            para1.Add(bl_Obj.convertDate(currentdate));
                            para1.Add(sa);
                            para1.Add(sa);
                            para1.Add(mobileno);
                            ds1 = bl_Obj.FillGridWithParameter(para1, "checkemailsms1");
                            para1.Clear();


                        }
                    }
                }
                else
                {
                    ParamList.Clear();
                    ParamValue.Clear();
                    DataSet ds = new DataSet();
                    ParamList.Add("@user_id");
                    ParamValue.Add(Session["user_id"].ToString());
                    ParamList.Add("@Group_Id");
                    ParamValue.Add(Session["Group_Id"].ToString());
                }


                // for sending email and sms


            }
        }
        catch (Exception ex)
        { }
              
    }
    public void Fillgrid()
    {
        Label2.Text = Convert.ToString(Session["Workname"]);
        try
        {
            DataSet ds = new DataSet();
            List<string> plist = new List<string>();
            plist.Add(Session["Work_ID"].ToString());
            DataSet ismudat = new DataSet();
            ismudat = bl_Obj.FillGridWithParameter(plist, "sp_work_finalDate");
            //if (ismudat.Tables[0].Rows.Count ==0)
            //{
            List<string> para = new List<string>();
            para.Add("M");
            ds = bl_Obj.FillGridWithParameter(para, "sp_Stage_select_pro1");
            if (ds.Tables.Count != 0)
            {
                if (ds.Tables[0].Rows.Count != 0)
                {
                    gv_List.DataSource = ds.Tables[0];
                    gv_List.DataBind();
                    DataSet ds_status = new DataSet();
                    List<string> plist1 = new List<string>();
                    plist1.Add(Session["Work_ID"].ToString());
                    ds_status = bl_Obj.FillGridWithParameter(plist1, "sp_select_Stage_Tracking1");
                 
                    if (ds_status.Tables.Count != 0)
                    {
                        if (ds_status.Tables[0].Rows.Count != 0)
                        {
                            for (int i = 0; i < gv_List.Items.Count; i++)
                            {
                                //gv_List.Items[i].Cells[2].Enabled = false;
                                int j;
                                for (j = 0; j < ds_status.Tables[0].Rows.Count; j++)
                                {
                                    if (gv_List.Items[i].Cells[1].Text == ds_status.Tables[0].Rows[j][0].ToString())
                                    {
                                        if (ds_status.Tables[0].Rows[0][1].ToString() == Session["Work_ID"].ToString())
                                        {
                                            Image img = (Image)gv_List.Items[i].FindControl("statusimg");
                                            img.ImageUrl = "~/Form/images/Completed.gif";
                                            gv_List.Items[i].Cells[2].Enabled = true;
                                        }
                                    }
                                }
                                if (j < gv_List.Items.Count)
                                {
                                    gv_List.Items[j].Cells[2].Enabled = true;
                                }
                            }
                        }
                    }
                }
            }
            //else
            //{

            //     List<string> para1 = new List<string>();
            //    para1.Add("M");
            //    ds = bl_Obj.FillGridWithParameter(para1,"sp_Stage_select_pro1");
            //    if (ds.Tables.Count != 0)
            //    {
            //        if (ds.Tables[0].Rows.Count != 0)
            //        {
            //            gv_List.DataSource = ds.Tables[0];
            //            gv_List.DataBind();
            //            DataSet ds_status = new DataSet();
            //            List<string> plist1 = new List<string>();
            //            plist1.Add(Session["Work_ID"].ToString());

            //            ds_status = bl_Obj.FillGridWithParameter(plist1, "sp_select_Stage_Tracking1");

            //            if (ds_status.Tables.Count != 0)
            //            {
            //                if (ds_status.Tables[0].Rows.Count != 0)
            //                {
            //                    for (int i = 0; i < gv_List.Items.Count; i++)
            //                    {
            //                        gv_List.Items[i].Cells[2].Enabled = false;
            //                        int j;
            //                        for (j = 0; j < ds_status.Tables[0].Rows.Count; j++)
            //                        {
            //                            if (gv_List.Items[i].Cells[1].Text == ds_status.Tables[0].Rows[j][0].ToString())
            //                            {
            //                                if (ds_status.Tables[0].Rows[i][1].ToString() == Session["Work_ID"].ToString())
            //                                {
            //                                    gv_List.Items[i].Cells[2].Enabled = true;
            //                                    Image img = (Image)gv_List.Items[i].FindControl("statusimg");
            //                                    img.ImageUrl = "~/Form/images/Completed.gif";
            //                                }
            //                            }
            //                        }
            //                        if (j < gv_List.Items.Count)
            //                        {
            //                            gv_List.Items[j].Cells[2].Enabled = true;
            //                        }

            //                    }
            //                }
            //            }

            //        }
            //    }

            //}
            //}    
            //else
            //{
            //    List<string> para = new List<string>();
            //    para.Add("C");
            //    ds = bl_Obj.FillGridWithParameter(para, "sp_Stage_select_pro1");
            //    if (ds.Tables.Count != 0)
            //    {
            //        if (ds.Tables[0].Rows.Count != 0)
            //        {
            //            gv_List.DataSource = ds.Tables[0];
            //            gv_List.DataBind();
            //            DataSet ds_status = new DataSet();
            //            List<string> plist1 = new List<string>();
            //            plist1.Add(Session["Work_ID"].ToString());

            //            ds_status = bl_Obj.FillGridWithParameter(plist1, "sp_select_Stage_Tracking1");

            //            if (ds_status.Tables.Count != 0)
            //            {
            //                if (ds_status.Tables[0].Rows.Count != 0)
            //                {
            //                    for (int i = 0; i < gv_List.Items.Count; i++)
            //                    {


            //                        gv_List.Items[i].Cells[2].Enabled = false;
            //                        int j;
            //                        for (j = 0; j < ds_status.Tables[0].Rows.Count; j++)
            //                        {
            //                            if (gv_List.Items[i].Cells[1].Text == ds_status.Tables[0].Rows[j][0].ToString())
            //                            {
            //                                if (ds_status.Tables[0].Rows[i][1].ToString() == Session["Work_ID"].ToString())
            //                                {
            //                                    gv_List.Items[i].Cells[2].Enabled = true;
            //                                    Image img = (Image)gv_List.Items[i].FindControl("statusimg");
            //                                    img.ImageUrl = "~/Form/images/Completed.gif";
            //                                }

            //                            }

            //                        }
            //                        if (j < gv_List.Items.Count)
            //                        {
            //                            gv_List.Items[j].Cells[2].Enabled = true;
            //                        }

            //                    }
            //                }
            //            }

            //        }
            //    }

            //}





        }
        catch (Exception ex)
        {
        }


    }
    protected void gv_List_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        int rowindex = gv_List.SelectedIndex ;
        if (rowindex != 0)
        {
            gv_List.SelectedIndex = rowindex - 1;
            Image img = (Image)gv_List.Items[rowindex - 1].FindControl("statusimg");

            string stage_status = img.ImageUrl;
            if (stage_status == "~/Form/images/Completed.gif")
            {
                gv_List.SelectedIndex = rowindex;
                Session["stage_id"] = null;
                Session["stage_id"] = gv_List.SelectedItem.Cells[1].Text;
                string str = gv_List.SelectedItem.Cells[3].Text;
                if (gv_List.SelectedItem.Cells[4].Text.ToString() == "~/Form/images/Completed.gif")
                {

                }
                Response.Redirect(str);
            }
            else
            {
                //lbl_MSG.Text = "fille previous stage";
               
            
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please fill previous stage.');", true);

               // ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "shifaras_amount_validation();", true);
            }
        }
        else
        {
            gv_List.SelectedIndex = rowindex;
            Session["stage_id"] = null;
            Session["stage_id"] = gv_List.SelectedItem.Cells[1].Text;
            string str = gv_List.SelectedItem.Cells[3].Text;
            if (gv_List.SelectedItem.Cells[4].Text.ToString() == "~/Form/images/Completed.gif")
            {

            }
            Response.Redirect(str);
        }
        
    }
    public void FillgridMain()
    {
        fillmaingridform();
        //try
        //{

        //    DataSet ds = new DataSet();

        //    List<string> plist = new List<string>();
        //    if (Session["Head_ID"].ToString() == "")
        //    {
        //        ds = bl_Obj.FillGrid("FillWorkId");
        //    }
        //    else
        //    {
        //        plist.Add(Session["Head_ID"].ToString());
        //        plist.Add(Session["Tal"].ToString());
        //        ds = bl_Obj.FillGridWithParameter(plist, "FillWorkId_parameter");
        //    }
        //    Cache.Insert("home_page",ds);
        //    int id = (ds.Tables[0].Rows.Count) % 10;
        //    if (id == 0)
        //    {
        //        if (datagrid.CurrentPageIndex > 0)
        //        {
        //            datagrid.DataSource = ds;
        //            datagrid.CurrentPageIndex--;
        //            datagrid.DataBind();
        //        }
        //        else
        //        {
        //            datagrid.DataSource = ds;
        //            datagrid.DataBind();
        //        }
        //    }
        //    else
        //    {
        //        datagrid.DataSource = ds;
        //        datagrid.DataBind();
        //    }
        //}
        //catch (Exception ex)
        //{
        //    Session["Exception"] = ex.ToString();
        //    Response.Redirect("ExceptionHandling.aspx");
        //}
    }
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        Panel1.Visible = true;
        Label1.Visible = true;
        Session["Work_ID"] = datagrid.SelectedItem.Cells[2].Text.ToString();
        Session["Workname"] = datagrid.SelectedItem.Cells[4].Text.ToString();
        DataSet ds = new DataSet();
        List<string> plist = new List<string>();
        plist.Add(Session["Work_ID"].ToString());
        ds = bl_Obj.FillGridWithParameter(plist, "sp_select_year");
        Session["year"] = ds.Tables[0].Rows[0][0].ToString();
        Session["Talukaname"] = ds.Tables[0].Rows[0][1].ToString();
        Session["Gavname"] = ds.Tables[0].Rows[0][2].ToString();
        Session["Workname"] = ds.Tables[0].Rows[0][3].ToString();

        Fillgrid();

        var workname = FindHtmlControlByIdInControl(this, "workname");

        if (workname != null)
        {
            workname.Attributes.Add("style", "visibility:visible");
        }
        
      
            }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds1 = (DataSet)Cache.Get("home_page");
        Cache.Insert("home_page", ds1);
        datagrid.DataSource = ds1;
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
    }
    public void filllekhashirsh()
    {
        DataSet ds = new DataSet();
        DropDownList1.DataValueField = "HDID";
        DropDownList1.DataTextField = "HeadDescription";
        ds = bl_Obj.FillGrid("ddl_prashakiyamanyata");
        DropDownList1.DataSource = ds.Tables[0];
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, (new ListItem("--Select--", "0")));
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        fillmaingridform();
       
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillyojana();
        ddlYojana.Enabled = true;
    }
    public void fillyojana()
    {
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(DropDownList1.SelectedValue.ToString());
        ds = bl_Obj.FillGridWithParameter(para, "sp_selectyojana");
        ddlYojana.DataValueField = "YojanaID";
        ddlYojana.DataTextField = "YojanaName";
        if (ds.Tables[0].Rows.Count != 0)
        {
            ddlYojana.Items.Clear();
            ddlYojana.DataSource = ds.Tables[0];
            ddlYojana.DataBind();
            ddlYojana.Items.Insert(0, (new ListItem("-----Select-----", "0")));
            ddlYojana.Enabled = true;
        }
        else
        {
            ddlYojana.Items.Clear();
            ddlYojana.Enabled = false;
        }
    }
    private void fillmaingridform()
{
    try
    {
        DataSet ds1 = new DataSet();
        List<string> list = new List<string>();
        List<string> para_name = new List<string>();
        if (!(DropDownList1.SelectedValue.ToString() == "0" || DropDownList1.SelectedValue.ToString() == ""))
        {
            para_name.Add("@HDID");
            list.Add(DropDownList1.SelectedValue.ToString());
        }
        if (!(ddlYojana.SelectedValue.ToString() == "0" || ddlYojana.SelectedValue.ToString() == ""))
        {
            para_name.Add("@YojanaID");
            list.Add(ddlYojana.SelectedValue.ToString());
        }
        if (!(ddltaluka.SelectedValue.ToString() == "0" || ddltaluka.SelectedValue.ToString() == ""))
        {
            para_name.Add("@TalukaId");
            list.Add(ddltaluka.SelectedValue.ToString());
        }
        para_name.Add("@officeid");
        list.Add("1");//officeid


        //search Page
        if (!(ddlzpgut.SelectedValue.ToString() == "0" || ddlzpgut.SelectedValue.ToString() == ""))
        {
            para_name.Add("@ZPGutID");
            list.Add(ddlzpgut.SelectedValue.ToString());
        }
        if (!(ddlpsgancode.SelectedValue.ToString() == "0" || ddlpsgancode.SelectedValue.ToString() == ""))
        {
            para_name.Add("@ZPGunID");
            list.Add(ddlpsgancode.SelectedValue.ToString());
        }
        if (!(DDL_Dept.SelectedValue.ToString() == "0" || DDL_Dept.SelectedValue.ToString() == ""))
        {
            para_name.Add("@DeptID");
            list.Add(DDL_Dept.SelectedValue.ToString());
        }
        //if (!(ddlgaon.SelectedValue.ToString() == "0" || ddlgaon.SelectedValue.ToString() == ""))
        //{
        //    para_name.Add("@GaonID");
        //    list.Add(ddlgaon.SelectedValue.ToString());
        //}
        if (!(ddlyear1.SelectedValue.ToString() == "0" || ddlyear1.SelectedValue.ToString() == ""))
        {
            para_name.Add("@YearID");
            list.Add(ddlyear1.SelectedValue.ToString());
        }
        if (!(ddl_wrkType.SelectedValue.ToString() == "0" || ddl_wrkType.SelectedValue.ToString() == ""))
        {
            para_name.Add("@WorkTypeID");
            list.Add(ddl_wrkType.SelectedValue.ToString());
        }
        if (!(ddlEngineer.SelectedValue.ToString() == "0" || ddlEngineer.SelectedValue.ToString() == ""))
        {
            para_name.Add("@EngID");
            list.Add(ddlEngineer.SelectedValue.ToString());
        }
        //if (!(ddlthekedar.SelectedValue.ToString() == "0" || ddlthekedar.SelectedValue.ToString() == ""))
        //{
        //    para_name.Add("@ThekedarID");
        //    list.Add(ddlthekedar.SelectedValue.ToString());
        //}





        //search Page


        ds1 = bl_Obj.FillGridWithName_Parameter(para_name, list, "Sp_Meeting_search_SearchPage");

     // lbl_MSG .Text  = ds1.Tables[0].Rows.Count.ToString();
        
      Label55.Text = ds1.Tables[0].Rows.Count.ToString();
        Cache.Insert("home_page", ds1);
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
  

    private HtmlControl FindHtmlControlByIdInControl(Control control, string id)
    {
        foreach (Control childControl in control.Controls)
        {
            if (childControl.ID != null && childControl.ID.Equals(id, StringComparison.OrdinalIgnoreCase) && childControl is HtmlControl)
            {
                return (HtmlControl)childControl;
            }

            if (childControl.HasControls())
            {
                HtmlControl result = FindHtmlControlByIdInControl(childControl, id);
                if (result != null) return result;
            }
        }

        return null;
    }
  
    protected void BtnReset_Click(object sender, EventArgs e)
    {

        //if (BtnReset != null)
        //{ //reload the page in 1 second.
        //    BtnReset.Attributes.Add("onclick", "setReloadTime(1)");
        //}
        ddltaluka.ClearSelection();
        DropDownList1.ClearSelection();
       // ddlYojana.ClearSelection();
        //ddlzpgut.ClearSelection();
        //ddlpsgancode.ClearSelection();
        DDL_Dept.ClearSelection();
       // ddlgaon.ClearSelection();
        ddlyear1.ClearSelection();
        ddl_wrkType.ClearSelection();
        //ddlEngineer.ClearSelection();
      //  ddlthekedar.ClearSelection();
        ddlEngineer.Enabled = false;
        ddlzpgut.Enabled = false;
        ddlpsgancode.Enabled = false;
        ddlYojana.Enabled = false;
        FillgridMain();
    }


    //Added for going to Specific Page number,First Page,Last Page in datagrid...25/8/2015
    protected void btnGo_Click(object sender, EventArgs e)
    {
      
        datagrid.CurrentPageIndex = Convert.ToInt16(txtGoToPage.Text)-1;
        txtGoToPage.Text = "";
        datagrid.DataBind();
        fillmaingridform();
    }

     protected void btnLast_Click(object sender, EventArgs e)
    {
        datagrid.CurrentPageIndex = (datagrid.PageCount - 1);
        datagrid.DataBind();
        fillmaingridform();
    }
    protected void btnFirst_Click(object sender, EventArgs e)
    {
        datagrid.CurrentPageIndex = 0;
        datagrid.DataBind();
        fillmaingridform();
    }






    //search page


    public void ddlyear()
    {
        DataSet ds = new DataSet();

       
        ddlyear1.DataValueField = "YearId";
        ddlyear1.DataTextField = "Year";
       
        ds = bl_Obj.FillGrid("FillDDL_year1");
        ddlyear1.DataSource = ds;
        ddlyear1.DataBind();
        ddlyear1.Items.Insert(0, new ListItem("--Select--", "0"));
    }

    public void Department()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["officeid"].ToString());//set Session Office_ID
        DDL_Dept.DataValueField = "deptid";
        DDL_Dept.DataTextField = "deptname";
        ds = bl_Obj.FillGridWithParameter(para, "sp_FillDepartment_ID");
        DDL_Dept.DataSource = ds;
        DDL_Dept.DataBind();
        DDL_Dept.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    public void fillddlpsgancode()
    {
        DataSet ds = new DataSet();
        List<string> plist1 = new List<string>();
        plist1.Add(ddlzpgut.SelectedValue.ToString());
        ddlpsgancode.DataValueField = "PSID";
        ddlpsgancode.DataTextField = "PSname";
        ds = bl_Obj.FillGridWithParameter(plist1, "sp_PSCode");
        ddlpsgancode.DataSource = ds;
        ddlpsgancode.DataBind();
        ddlpsgancode.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    public void fillddlZpgutId()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> plist = new List<string>();
            plist.Add(ddltaluka.SelectedValue.ToString());
            ddlzpgut.DataValueField = "ZpGutid";
            ddlzpgut.DataTextField = "zpgut";
            ds = bl_Obj.FillGridWithParameter(plist, "sp_FillZpGutMaster");
            ddlzpgut.DataSource = ds;
            ddlzpgut.DataBind();
            ddlzpgut.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        catch (Exception ex)
        { }
    }
    public void fillddltaluka()
    {
        DataSet ds = new DataSet();
        ddltaluka.DataValueField = "TalukaId";
        ddltaluka.DataTextField = "TalukaName";
        ds = bl_Obj.FillGrid("Sp_FillTalukaName");
        ddltaluka.DataSource = ds;
        ddltaluka.DataBind();
        ddltaluka.Items.Insert(0, new ListItem("--Select--", "0"));
    }

    //public void fillddlgaon()
    //{
    //    DataSet ds = new DataSet();
    //    List<string> para = new List<string>();
    //    para.Add(ddltaluka.SelectedValue);
    //    ddlgaon.DataValueField = "GavID";
    //    ddlgaon.DataTextField = "GavName";
    //    ds = bl_Obj.FillGridWithParameter(para, "sp_GavMaster_DDLSelectPro");
    //    ddlgaon.DataSource = ds;
    //    ddlgaon.DataBind();
    //    ddlgaon.Items.Insert(0, new ListItem("--Select--", "0"));
    //}


    protected void ddltaluka_SelectedIndexChanged(object sender, EventArgs e)
    {
        //fillddlgaon();
        fillddlZpgutId();
       // fillddlZpgutId();
        ddlzpgut.Enabled = true;

    }
    //protected void ddlgaon_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    fillddlZpgutId();
    //}
    protected void ddlzpgut_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillddlpsgancode();
        ddlpsgancode.Enabled = true;
    }



     protected void ddlEngineerfill()
    {
        DataSet ds = new DataSet();
        List<string> para = new List<string>();
        para.Add(Session["officeid"].ToString());
        para.Add(DDL_Dept.SelectedValue.ToString());
        ddlEngineer.DataValueField = "engid";
        ddlEngineer.DataTextField = "Engineername";
        ds = bl_Obj.FillGridWithParameter(para, "sp_FillEngineername");
        ddlEngineer.DataSource = ds;
        ddlEngineer.DataBind();
        ddlEngineer.Items.Insert(0, new ListItem("--Select--", "0"));
    }
     protected void DDL_Dept_SelectedIndexChanged(object sender, EventArgs e)
     {
         ddlEngineerfill();
         ddlEngineer.Enabled = true;
     }

     //public void fillddlthekedar()
     //{
     //    DataSet ds2 = new DataSet();
     //    ddlthekedar.DataValueField = "ThekedarId";
     //    ddlthekedar.DataTextField = "ThekedarName";
     //    ds2 = bl_Obj.FillGrid("[Sp_FillThekedar_SearchPage]");
     //    ddlthekedar.DataSource = ds2;
     //    ddlthekedar.DataBind();
     //    ddlthekedar.Items.Insert(0, new ListItem("--Select--", "0"));
     //}
     private void fillWorkType()
     {
         DataSet ds = new DataSet();
         ds = bl_Obj.FillGrid("sp_fillworktypemaster");
         ddl_wrkType.DataValueField = "worktypeID";
         ddl_wrkType.DataTextField = "worktypeName";
         ddl_wrkType.DataSource = ds;
         ddl_wrkType.DataBind();
         ddl_wrkType.Items.Insert(0, new ListItem("--Select--", "0"));
     }
}
