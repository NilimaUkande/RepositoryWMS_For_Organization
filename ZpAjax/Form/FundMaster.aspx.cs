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
using BussinessLayer;


public partial class Form_FundMaster : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BussinessLayer.BusinessLayerclass();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Group_Id"] == null)
                Response.Redirect("~/Form/login.aspx");
            if (!Page.IsPostBack)
            {

                filllekhashirsh();
                // clareall();
                //  btnUpdated.Enabled = false;
                //  fillgrid();
                ddlyear();

                txtNidhi.Text = "";
                ddlyear1.ClearSelection();
                DropDownList1.ClearSelection();
                ddlYojana.ClearSelection();
                btndelete.Enabled = true;
                btnAdd.Enabled = true;
                btnUpdated.Enabled = false;
            }
        }
        catch (Exception ex)
        {

        }
        btndelete.Enabled = false;
    }





    //new Added

    public void filllekhashirsh()
    {
        DataSet ds = new DataSet();
        DropDownList1.DataValueField = "HDID";
        DropDownList1.DataTextField = "HeadDescription";
        ds = bl_obj.FillGrid("ddl_prashakiyamanyata");
        DropDownList1.DataSource = ds.Tables[0];
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, (new ListItem("---Select---", "0")));
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillyojana();
        ddlyear1.ClearSelection();
        // fillgrid();
    }

    public void fillyojana()
    {
        List<string> para = new List<string>();
        DataSet ds = new DataSet();
        para.Add(DropDownList1.SelectedValue.ToString());
        ds = bl_obj.FillGridWithParameter(para, "sp_selectyojana");
        ddlYojana.DataValueField = "YojanaID";
        ddlYojana.DataTextField = "YojanaName";
        if (ds.Tables[0].Rows.Count != 0)
        {
            ddlYojana.Items.Clear();
            ddlYojana.DataSource = ds.Tables[0];
            ddlYojana.DataBind();
            ddlYojana.Items.Insert(0, (new ListItem("-----Select-----", "0")));
            ddlYojana.Enabled = true;
            RequiredFieldValidator4.Visible = true;

        }
        else
        {
            RequiredFieldValidator4.Visible = false;
            ddlYojana.Items.Clear();
            ddlYojana.Enabled = false;
        }

        //if (ddlYojana.Items.Count.ToString() != " " || ddlYojana.Items.Count.ToString() != "0")

        //// if (ddlYojana.SelectedValue.ToString() != " ")
        //{
        //    RequiredFieldValidator4.Visible = true;
        //}
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        fillgrid();
        datagrid.CurrentPageIndex = e.NewPageIndex;
        datagrid.DataBind();
        btndelete.Enabled = true;
        btnAdd.Enabled = true;
        btnUpdated.Enabled = false;
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtNidhi.Text = "";
        ddlyear1.ClearSelection();
        DropDownList1.ClearSelection();
        ddlYojana.ClearSelection();
        btndelete.Enabled = true;
        btnAdd.Enabled = true;
        btnUpdated.Enabled = false;
        ddlYojana.Enabled = true;
        //fundGrid.Attributes.Add("style","visibility:hidden");
    }

    public void ddlyear()
    {
        DataSet ds = new DataSet();
        ddlyear1.DataValueField = "YearId";
        ddlyear1.DataTextField = "Year";
        ds = bl_obj.FillGrid("FillDDL_year1");
        ddlyear1.DataSource = ds;
        ddlyear1.DataBind();
        ddlyear1.Items.Insert(0, new ListItem("--Select--", "0"));
    }

 
    protected void datagrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList1.ClearSelection();
            TextBox1.Text = datagrid.SelectedItem.Cells[2].Text.ToString();
            DropDownList1.Items.FindByText(datagrid.SelectedItem.Cells[3].Text.ToString()).Selected = true;
           // ddlYojana.ClearSelection();
           // ddlYojana.Items.FindByText(datagrid.SelectedItem.Cells[4].Text.ToString()).Selected = true;
            ddlyear1.ClearSelection();
            ddlyear1.Items.FindByText(datagrid.SelectedItem.Cells[5].Text.ToString()).Selected = true;
            txtNidhi.Text = datagrid.SelectedItem.Cells[6].Text.ToString();

            // ddllekhashirsha.Enabled = false;

        }
        catch (Exception ex)
        {
        }
        btnUpdated.Enabled = true;
        btnAdd.Enabled = false;
        btndelete.Enabled = false;

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {

            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add("1");
            string headid = DropDownList1.SelectedValue.ToString();
            // string headid = DDL_Head.SelectedValue.ToString();
            string YojanaID = "0";
            if (ddlYojana.SelectedValue.ToString() == "" || ddlYojana.SelectedValue.ToString() == "0")
            {
                YojanaID = "0";
            }
            else
            {
                YojanaID = ddlYojana.SelectedValue.ToString();
            }

            string Year_ID = ddlyear1.SelectedValue.ToString();


            para.Add(headid);
            para.Add(YojanaID);
            para.Add(Year_ID);


            para.Add(txtNidhi.Text);
            para.Add("a");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_FundMaster");

            if (ds.Tables[0].Rows[0][0].ToString() != "")
            {
               // lblMsg.Visible = true;
              //  lblMsg.Text = "Record Inserted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
            }
            else
            {
              //  lblMsg.Visible = true;

              //  lblMsg.Text = "Record Already Exist";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

            }

            fillgrid();
            txtNidhi.Text = "";
            // ddlyear1.ClearSelection();
             // DropDownList1.ClearSelection();
             //ddlYojana.ClearSelection();
            btndelete.Enabled = true;
            btnAdd.Enabled = true;
            btnUpdated.Enabled = false;
            ddlYojana.Enabled = true;

        }
        catch (Exception ex)
        {

        }

        btndelete.Enabled = true;
    }
    protected void btnUpdated_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(TextBox1.Text);
            para.Add(DropDownList1.SelectedValue.ToString());
            para.Add(ddlYojana.SelectedValue.ToString());

            para.Add(ddlyear1.SelectedValue.ToString());
            para.Add(txtNidhi.Text);
            para.Add("u");
            ds = bl_obj.ExecuteStoredFunctionWithParameters(para, "sp_FundMaster");

            if (ds.Tables[0].Rows[0][0].ToString() != "")
            {

               // lblMsg.Text = "Record updated";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
              
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "Record();", true);

               // lblMsg.Text = "Record Already exist";
            }

            fillgrid();
            txtNidhi.Text = "";
           // ddlyear1.ClearSelection();
         //   DropDownList1.ClearSelection();
         //   ddlYojana.ClearSelection();
            btndelete.Enabled = true;
            btnAdd.Enabled = true;
            btnUpdated.Enabled = false;
        }
        catch (Exception ex)
        {

        }

    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            int select = 0;
            for (int i = 0; i < datagrid.Items.Count; i++)
            {
                CheckBox cb = (CheckBox)datagrid.Items[i].FindControl("CheckBox2");
                if (cb.Checked)
                {
                    select = 1;
                    Label2.Visible = false;
                    List<string> para = new List<string>();
                    //para.Add(datagrid.Items[i].Cells[3].Text.ToString());
                    //para.Add(datagrid.Items[i].Cells[4].Text.ToString());
                    //para.Add(datagrid.Items[i].Cells[5].Text.ToString());
                    // para.Add(datagrid.Items[i].Cells[6].Text.ToString());
                    para.Add(datagrid.Items[i].Cells[2].Text.ToString());
                    para.Add("1");
                    para.Add("1");
                    para.Add("1");
                    para.Add("1");
                    para.Add("d");
                  //  lblMsg.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
           
                    DataSet ds = bl_obj.FillGridWithParameter(para, "sp_FundMaster");
                   

                }
            }
            fillgrid();

                if (select == 0)
                {
                   // lblMsg.Visible = true;
                   // lblMsg.Text = "Select Record";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }
              
           
            txtNidhi.Text = "";
           // ddlyear1.ClearSelection();
           // DropDownList1.ClearSelection();
           // ddlYojana.ClearSelection();
            btndelete.Enabled = true;
            btnAdd.Enabled = true;
            btnUpdated.Enabled = false;

        }
        catch (Exception ex)
        {

        }
    }

    public void clareall()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true);
    }
    public void fillgrid()
    {
        try
        {
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            string headid = DropDownList1.SelectedValue.ToString();
            // string headid = DDL_Head.SelectedValue.ToString();
            //string Yojnaid = ddlYojana.SelectedValue.ToString();
            string YojanaID = "0";
            if ((ddlYojana.SelectedValue.ToString() == "") || (ddlYojana.SelectedValue.ToString() == "0"))
            {
                YojanaID = "0";
            }
            else
            {
                YojanaID = ddlYojana.SelectedValue.ToString();
            }

            string Year_ID = ddlyear1.SelectedValue.ToString();


            para.Add(headid);
            para.Add(YojanaID);
            para.Add(Year_ID);



            if (Year_ID == "")
            {
                datagrid.Visible = false;
            }
            else
            {
                ds = bl_obj.FillGridWithParameter(para, "sp_Fill_FundMaster");
                //datagrid.DataSource = ds;
                //datagrid.DataBind();

                if (ds.Tables[0].Rows.Count != 0)
                {
                    datagrid.Visible = true;
                    TextBox1.Text = ds.Tables[0].Rows[0][0].ToString();
                    int id = (ds.Tables[0].Rows.Count) % 10;
                    if (id == 0)
                    {
                        if (datagrid.CurrentPageIndex > 0)
                        {

                            datagrid.DataSource = ds;
                            datagrid.CurrentPageIndex--;
                            datagrid.DataBind();

                        }
                        else
                        {
                            datagrid.DataSource = ds;
                            datagrid.DataBind();
                        }
                    }
                    else
                    {
                        datagrid.DataSource = ds;
                        datagrid.DataBind();
                    }
                }
                else
                {
                    datagrid.DataSource = ds;
                    datagrid.DataBind();
                }
            }




        }
        catch (Exception ex)
        { }

    }

    protected void ddlyear1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlYojana.Items.Count.ToString() != " " || ddlYojana.Items.Count.ToString() != "0")
        {
            RequiredFieldValidator4.Visible = true;
        fundGrid.Attributes.Add("style", "visibility:visible");
        fillgrid();
        }
        else
        {
            fundGrid.Attributes.Add("style", "visibility:visible");
            fillgrid();
        }

        btndelete.Enabled = true;
    }
    protected void ddlYojana_SelectedIndexChanged(object sender, EventArgs e)
    {
        //fillgrid();
        ddlyear1.ClearSelection();
    }
}
