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
//using BusinessLayer;
using BussinessLayer;
public partial class ChangePassword : System.Web.UI.Page
{
    //BusinessMaster obj_Business = new BusinessMaster();
    BussinessLayer.BusinessLayerclass obj_Business = new BusinessLayerclass();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lb_msg.Visible = false;
            txt_NewPass.Enabled = false;
            txt_ReenterPass.Enabled = false;
            RequiredFieldValidator20_ValidatorCalloutExtender.Enabled = true ;
        }

    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        obj_Business.ChangePassword(txt_NewPass.Text, Session["User_Id"].ToString());
        RequiredFieldValidator20_ValidatorCalloutExtender.Enabled = false;
        lb_msg.Visible = false;
        ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "changedpwd();", true);
            
    }
    protected void txt_ExistingPass_TextChanged(object sender, EventArgs e)
    {
        CheckPassword();
    }
    public void CheckPassword()
    {
        DataSet ds = obj_Business.CheckPassExisting(txt_ExistingPass.Text, Session["User_Id"].ToString());
        if (ds.Tables[0].Rows.Count> 0)
        {
            lb_msg.Visible = false;
           // txt_ExistingPass.Visible=false;
            //Label1.Visible = false;
            txt_ExistingPass.Enabled = false;
          
            txt_NewPass.Enabled = true ;
            txt_ReenterPass.Enabled = true ;

        }
        else
        {
            //lb_msg.Text = "Please Enter Correct Password";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "incorrectpwd();", true);
            lb_msg.Visible = false ;
            txt_NewPass.Enabled = false ;
            txt_ReenterPass.Enabled = false;
            txt_ExistingPass.Enabled = false;
           // txt_ExistingPass.Visible = true ;
           // Label1.Visible = true ;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        txt_ExistingPass.Visible = true;
        Label1.Visible = true;
        txt_NewPass.Enabled = false;
        txt_ReenterPass.Enabled = false;
        lb_msg.Visible = false;

    }
}
