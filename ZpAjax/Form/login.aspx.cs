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

public partial class login : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl = new BussinessLayer.BusinessLayerclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();

        if (!User.Identity.IsAuthenticated)
        {
            Cache.Remove("allthekedar");
            //Login lg = (Login).FindControl("zp_login");
            //TextBox tb = (TextBox)lg.FindControl("UserName");
            //SetFocus(tb);
            TextBox usernametxt = (TextBox)this.zp_login.FindControl("UserName");
            SetFocus(usernametxt);

        }

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        try
        {
            string userName = zp_login.UserName.ToString();
            string Password = zp_login.Password.ToString();
            Session["username"] = userName;
            Session["password"] = Password;
            List<string> Paramlist = new List<string>();
            Paramlist.Add(userName);
            Paramlist.Add(Password);
            DataSet ds = new DataSet();
            ds = bl.login(Paramlist);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["User_Id"] = ds.Tables[0].Rows[0][0].ToString();
                Session["group_id"] = ds.Tables[0].Rows[0][3].ToString();
                Session["officeid"] = ds.Tables[0].Rows[0][4].ToString();
                Session["office_name"] = ds.Tables[0].Rows[0][7].ToString();
                Session["District_id"] = ds.Tables[0].Rows[0][8].ToString();
                Session["Work_ID"] = "";
                Session["Head_ID"] = "";
                string gr = Session["group_id"].ToString();
                string of = Session["officeid"].ToString();
                string uid = Session["User_Id"].ToString();
                if (ds.Tables[0].Rows[0][3].ToString() == "2" || ds.Tables[0].Rows[0][3].ToString() == "3")
                {
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                    Response.Redirect("HomePage.aspx", false);
                }
                else if (ds.Tables[0].Rows[0][3].ToString() == "1")
                {
                    Response.Redirect("AdminPage.aspx", false);
                }
                else if (ds.Tables[0].Rows[0][3].ToString() == "7")
                {
                    Response.Redirect("HomePageForAccountUser.aspx", false);
                }
            }
            else
            {
                // Label1.Text = "Check Username & Password.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "isActive", "login_error();", true);
                

            }


        }
        catch (Exception ex)
        {
            Label1.Text = ex.ToString();
        }
       

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dvbwyg0n.ttf");
    }






}
