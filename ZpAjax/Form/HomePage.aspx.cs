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

public partial class Form_HomePage : System.Web.UI.Page
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
                //fillddltaluka();

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
    //public void fillddltaluka()
    //{
    //    DataSet ds1 = new DataSet();
    //    List<string> para = new List<string>();
    //    DropDownList2.DataValueField = "TalukaId";
    //    DropDownList2.DataTextField = "TalukaName";
    //    para.Add(Session["District_id"].ToString());
    //    ds1 = bl_Obj.FillGridWithParameter(para, "sp_Taluka_fill_gav");
    //    DropDownList2.DataSource = ds1.Tables[0];
    //    DropDownList2.DataBind();
    //    DropDownList2.Items.Insert(0, (new ListItem("----select----", "")));
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        fillmaingridform();
       
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillyojana();
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
        //if (!(DropDownList2.SelectedValue.ToString() == "0" || DropDownList2.SelectedValue.ToString() == ""))
        //{
            para_name.Add("@TalukaId");
            list.Add("1");
            //list.Add(DropDownList2.SelectedValue.ToString());
        //}
        para_name.Add("@officeid");
        list.Add("1");//officeid
        ds1 = bl_Obj.FillGridWithName_Parameter(para_name, list, "Sp_Meeting_search");

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
        //DropDownList2.ClearSelection();
        DropDownList1.ClearSelection();
        ddlYojana.ClearSelection();
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
}
