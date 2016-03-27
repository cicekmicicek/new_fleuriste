using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cicek3
{
    public partial class Malzeme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Kullanici"]) == "") { Response.Redirect("Giris.aspx"); Response.End(); }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int a = int.Parse(TextBox1.Text);
            }
            catch (Exception ex)
            {

                cUIAraclari.cLog.Write(ex,7);
            }
        }
    }
}