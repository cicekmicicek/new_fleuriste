using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiniCore;
namespace cicek3
{
    public partial class Notification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Kullanici"]) == "") { Response.Redirect("Giris.aspx"); Response.End(); }
            UserTbl kullanici = new UserTbl();
            kullanici = (UserTbl)Session["Kullanici"];
            etkinlik = UyariIslemleri.UyariDoldur(kullanici.user_Id);   
            RptEtkilesim = UyariIslemleri.UyariEtkilesim(RptEtkilesim,kullanici.user_Id);
            
        }
        string[,] etkinlik;
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Cell.Controls.Clear();
            }
            else
            {
                Label lbl = new Label();
                lbl.CssClass = "css_appointment";
                string etkin = etkinlik[e.Day.Date.Month, e.Day.Date.Day];
                if (etkin != "")
                {
                    lbl.Text = "<br />";
                    lbl.Text += etkin;
                    e.Cell.Controls.Add(lbl);
                }
            }
        }
    }
}