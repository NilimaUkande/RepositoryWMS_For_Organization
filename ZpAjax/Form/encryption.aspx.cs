using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using BussinessLayer;
public partial class Form_encryption : System.Web.UI.Page
{
    BussinessLayer.BusinessLayerclass bl_obj = new BusinessLayerclass();
    UnicodeEncoding ByteConverter = new UnicodeEncoding();
    RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();
    byte[] plaintext;
    byte[] encryptedtext; 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
            
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        plaintext = ByteConverter.GetBytes(txtplain.Text);
        encryptedtext = bl_obj.Encryption(plaintext, RSA.ExportParameters(false), false);
        txtencrypt.Text = ByteConverter.GetString(encryptedtext);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        plaintext = ByteConverter.GetBytes(txtplain.Text);
        encryptedtext = bl_obj.Encryption(plaintext, RSA.ExportParameters(false), false);
        byte[] decryptedtex = bl_obj.Decryption(encryptedtext, RSA.ExportParameters(true), false);
        txtdecrypt.Text = ByteConverter.GetString(decryptedtex);
    }
}