using System;
using System.Data;
using System.Text;
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
using BusinessLayer;

public partial class Forms_Thekedar_Master : System.Web.UI.Page
{
    BusinessLayerclass obj = new BusinessLayerclass();
    BussinessLayer.ThekedarMaster bl = new ThekedarMaster();
    protected void Page_Load(object sender, EventArgs e)
    {try
            {
        if (Session["Group_Id"] == null)
            Response.Redirect("~/Form/login.aspx");

        if (!Page.IsPostBack)
        {
            
                txt_ThekedarName.Focus();
                ClearAll();
                btn_Update.Enabled = false;
                FillGrid();
            //DropDownList1.Enabled = false;
            }
        }
            catch (Exception ex)
            { }
      
    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        try
        {
            setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
            para.Add(DataGrid1.SelectedItem.Cells[2].Text);
            para.Add(txt_ThekedarName.Text);
            para.Add(txt_Address.Text);
            para.Add(txt_PhNo.Text);
            para.Add(txtfax.Text);
            para.Add(txtmobileno.Text);
            para.Add(txt_VatNo.Text);
            para.Add(txt_PanNo.Text);
            para.Add(txt_Code.Text);
            para.Add(txtdinno.Text);
            if (TextBox1.Text != "")
            {
                string st = obj.convertDate(TextBox1.Text);
                para.Add(st.ToString());
            }
            else
            {
                para.Add(TextBox1.Text);
            
            }
            para.Add(txt_BnkName.Text.Trim());
            para.Add(txttypeofacc.Text.Trim());
            para.Add(txt_BnkAcNo.Text.Trim());
            para.Add(RadioButtonList1.SelectedValue.ToString());
            para.Add("1");
            para.Add(DropDownList1.SelectedValue.ToString());
            if (txtvalidity.Text != "")
            {
                string date = obj.convertDate(txtvalidity.Text);
                para.Add(date.ToString());
            }
            else
            {
                para.Add(txtvalidity.Text);
            }
            para.Add(txtnondanikr.Text.Trim());
            para.Add(RadioButtonList2.SelectedValue.ToString());
            ds = bl.UpdateThekedarMaster(para);
            //lblMsg.Text = "Record Updated";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "update();", true); 
              
            FillGrid();
            ClearAll();
            btn_Delete.Enabled = true;
        }
        catch (Exception ex)
        {
           // lblMsg.Text = ex.ToString();
        }
    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            CheckBox cb;
            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                List<string> para = new List<string>();
                cb = (CheckBox)DataGrid1.Items[i].FindControl("CheckBox1");
                if (cb.Checked)
                {
                    para.Add(DataGrid1.Items[i].Cells[2].Text.ToString());
                    ds =bl.DeleteThekedarMaster(para);
                    //lblMsg.Text = "Record Deleted";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "delet();", true);
            
                }
                else
                {
                  //  lblMsg.Text = "Select Record To Delete";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "confirmtodel();", true);

                }
            }
           
            ClearAll();
            FillGrid();
        }
        catch (Exception ex)
        {          
        }
    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        try
        {
           // setzero();
            DataSet ds = new DataSet();
            List<string> para = new List<string>();
                para.Add("1");
                para.Add(txt_ThekedarName.Text.Trim());
                para.Add(txt_Address.Text.Trim());
                para.Add(txt_PhNo.Text.Trim());
                para.Add(txtfax.Text.Trim());
                para.Add(txtmobileno.Text.Trim());
                para.Add(txt_VatNo.Text.Trim());
                para.Add(txt_PanNo.Text.Trim());
                para.Add(txt_Code.Text.Trim());
                para.Add(txtdinno.Text.Trim());
                para.Add(txtnondanikr.Text.Trim());
                string date1 = obj.convertDate(TextBox1.Text);
                para.Add(date1.ToString());
                para.Add(txt_BnkName.Text.Trim());
                para.Add(txttypeofacc.Text.Trim());
                para.Add(txt_BnkAcNo.Text.Trim());
                para.Add("O");
                para.Add("1");
                para.Add(DropDownList1.SelectedValue.ToString());
                string date = obj.convertDate(txtvalidity.Text);
                para.Add(date.ToString());
                para.Add(RadioButtonList2.SelectedValue.ToString());
                bl.InsertThekedarMaster(para);
                //lblMsg.Text = "Record Inserted";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "add();", true);
               
                FillGrid();
                ClearAll();
            }
        catch (Exception ex)
        {
          
        }
    }
    public void FillGrid()
    {
        List<string> para = new List<string>();
        para.Add(RadioButtonList2.SelectedValue.ToString());
        DataSet ds = new DataSet();
        ds = obj.FillGridWithParameter(para, "Fill_ThekedarMaster");
        Cache.Insert("thekedar",ds);
        int id = (ds.Tables[0].Rows.Count) % 20;
        if (id == 0)
        {
            if (DataGrid1.CurrentPageIndex > 0)
            {
                DataGrid1.DataSource = ds;
                DataGrid1.CurrentPageIndex--;
                DataGrid1.DataBind();
            }
            else
            {
                DataGrid1.DataSource = ds;
                DataGrid1.DataBind();
            }
        }
        else
        {
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
    }
    public void ClearAll()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "show_control();", true); 
    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {
        btn_Update.Enabled = true;
        btn_Add.Enabled = false;
        btn_Delete.Enabled = false;
        txt_ThekedarName.Text = DataGrid1.SelectedItem.Cells[3].Text;
        txt_Address.Text = DataGrid1.SelectedItem.Cells[4].Text;
        txt_PhNo.Text = DataGrid1.SelectedItem.Cells[5].Text;
        txtfax.Text = DataGrid1.SelectedItem.Cells[6].Text;
        txtmobileno.Text = DataGrid1.SelectedItem.Cells[7].Text;
        txt_VatNo.Text = DataGrid1.SelectedItem.Cells[8].Text;
        txt_PanNo.Text = DataGrid1.SelectedItem.Cells[9].Text;
        txt_Code.Text = DataGrid1.SelectedItem.Cells[10].Text;
        txtdinno.Text = DataGrid1.SelectedItem.Cells[11].Text;
        txtnondanikr.Text = DataGrid1.SelectedItem.Cells[12].Text;
        TextBox1.Text = DataGrid1.SelectedItem.Cells[13].Text;
        txt_BnkName.Text = DataGrid1.SelectedItem.Cells[14].Text;
        txttypeofacc.Text = DataGrid1.SelectedItem.Cells[15].Text;
        txt_BnkAcNo.Text = DataGrid1.SelectedItem.Cells[16].Text;
        //RadioButtonList1.Items.FindByValue(DataGrid1.SelectedItem.Cells[17].Text).Selected = true;
        DropDownList1.ClearSelection();
      //  DropDownList1.Items.FindByValue(DataGrid1.SelectedItem.Cells[19].Text).Selected = true;
        txtvalidity.Text = DataGrid1.SelectedItem.Cells[20].Text;
        RadioButtonList2.Items.FindByValue(DataGrid1.SelectedItem.Cells[21].Text).Selected = true;
    }
    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        DataSet ds = (DataSet)Cache.Get("thekedar");
        Cache.Insert("thekedar", ds);
        DataGrid1.DataSource = ds;
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataGrid1.DataBind();
    }  
    protected void btnreset_Click(object sender, EventArgs e)
    {
        ClearAll();
        txt_ThekedarName.Focus();
        btn_Add.Enabled = true;
        btn_Update.Enabled = false;
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (RadioButtonList1.SelectedItem.Value == "S" || RadioButtonList1.SelectedItem.Value == "M" ||RadioButtonList1.SelectedItem.Value=="g")
        //{
        //    DropDownList1.Enabled = true;
        //}
        //else if (RadioButtonList1.SelectedItem.Value == "O")
        //{
        //   // DropDownList1.Enabled = false; 
        //}
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillGrid();
    }
    public void setzero()
    {
        List<TextBox> plist = new List<TextBox>();
        plist.Add(txt_PhNo);
        plist.Add(txtfax);
        plist.Add(txtmobileno);
        plist.Add(txt_VatNo);
        plist.Add(txt_PanNo);
        plist.Add(txt_Code);
        plist.Add(txtdinno);
        plist.Add(txtnondanikr);
        plist.Add(txt_BnkName);
        plist.Add(txttypeofacc);
        plist.Add(txt_BnkAcNo);
        obj.Textboxstring(plist);
        plist.Clear();

        plist.Add(TextBox1);
        plist.Add(txtvalidity);
        obj.Textboxdate(plist);
    }
}