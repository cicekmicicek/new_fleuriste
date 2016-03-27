using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Globalization;

/// <summary>
/// Summary description for MessageBox
/// </summary>
public class MessageBox
{
    public enum MesajTipleri
    {
        Error,
        Info,
        Warning,
        Success
    }

    public class MessageBoxInfo
    {
        MesajTipleri mesajTipi = MesajTipleri.Info;

        bool onDOMReady = false;
        bool otoKapa = true;
        int sure = 3500;
        string mesaj = "";

        public string Mesaj
        {
            get
            {
                mesaj = mesaj.Replace(Environment.NewLine, "<br/>");
                return mesaj;
            }
            set { mesaj = value; }
        }

        public int Sure
        {
            get { return sure; }
            set { sure = value; }
        }

        public bool OtoKapa
        {
            get { return otoKapa; }
            set { otoKapa = value; }
        }

        public MesajTipleri MesajTipi
        {
            get
            {
                return mesajTipi;
            }
            set { mesajTipi = value; }
        }

        public bool OnDOMReady
        {
            get { return onDOMReady; }
            set { onDOMReady = value; }
        }
    }


    public MessageBox()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static void Show(string mesaj, MesajTipleri mesajTipi, string msgTur)
    {
        MessageBoxInfo _mesaj = new MessageBoxInfo
        {
            Mesaj = mesaj,
            MesajTipi = mesajTipi
        };
        Show(_mesaj, msgTur);
    }
    public static void Show(string mesaj, MesajTipleri mesajTipi, string msgTur, bool otoKapa)
    {
        MessageBoxInfo _mesaj = new MessageBoxInfo
        {
            Mesaj = mesaj,
            MesajTipi = mesajTipi,
            OtoKapa = otoKapa
        };
        Show(_mesaj, msgTur);
    }
    public static void Show(string mesaj, MesajTipleri mesajTipi, string msgTur, bool otoKapa, int sure)
    {
        MessageBoxInfo _mesaj = new MessageBoxInfo
        {
            Mesaj = mesaj,
            MesajTipi = mesajTipi,
            OtoKapa = otoKapa,
            Sure = sure
        };
        Show(_mesaj, msgTur);
    }
    public static void Show(string mesaj, MesajTipleri mesajTipi, string msgTur, int sure)
    {
        MessageBoxInfo _mesaj = new MessageBoxInfo
        {
            Mesaj = mesaj,
            MesajTipi = mesajTipi,
            Sure = sure
        };
        Show(_mesaj, msgTur);
    }
    public static void Show(MessageBoxInfo mesaj, string msgTur)
    {
        string _mesaj = "0";
        //string msgTur = "0";
        switch (msgTur)
        {
            case "0":
                _mesaj = string.Format(
            @"notif({{
                msg: ""{0}"",
                type: ""{1}"",
                autohide: {2},
                timeout: {3},
                position: ""center"",
                width: ""all"",
                heigt: 100
            }});",
                             mesaj.Mesaj,
                             mesaj.MesajTipi.ToString().ToLower(CultureInfo.InvariantCulture),
                             mesaj.OtoKapa ? "true" : "false",
                             mesaj.Sure);
                break;
            case "1":
                _mesaj = string.Format(@"notif({{ msg: ""{0}"", type: ""{1}""}});", mesaj.Mesaj, mesaj.MesajTipi.ToString().ToLower(CultureInfo.InvariantCulture));
                break;
            case "2":
                _mesaj = string.Format(@"notif({{msg: ""{0}"",type: ""{1}"",position: ""center""}});", mesaj.Mesaj, mesaj.MesajTipi.ToString().ToLower(CultureInfo.InvariantCulture));
                break;
            case "3":
                _mesaj = string.Format(@"notif({{msg: ""{0}"",type: ""{1}"",position: ""left""}});", mesaj.Mesaj, mesaj.MesajTipi.ToString().ToLower(CultureInfo.InvariantCulture));
                break;
            case "4":
                _mesaj = string.Format(
@"notif({{
  type: ""{0}"",
  msg: ""{1}"",
  position: ""center"",
  width: ""500"",
  height: ""60"",
  autohide: false
}});", mesaj.MesajTipi.ToString().ToLower(CultureInfo.InvariantCulture), mesaj.Mesaj);
                break;
            case "5":
                _mesaj = string.Format(
@"notif({{
  type: ""{0}"",
  msg: ""{1}"",
  position: ""center"",
  opacity:""0.8""
}});", mesaj.MesajTipi.ToString().ToLower(CultureInfo.InvariantCulture), mesaj.Mesaj);
                break;
            case "6":
                _mesaj = string.Format(
@"notif({{
  type: ""{0}"",
  msg: ""{1}"",
  position: ""center"",
  width: 100,
  autohide: false,
  multiline: true
        }});", mesaj.MesajTipi.ToString().ToLower(CultureInfo.InvariantCulture), mesaj.Mesaj);
                break;
            case "7":
                _mesaj = string.Format(
@"notif({{
  msg: ""{0}"",
  position: ""left"",
  bgcolor: ""#294447"",
  color: ""#F19C65""
}});", mesaj.Mesaj);
                break;
            case "8":
                _mesaj = string.Format(
@"notif({{
  type: ""{0}"",
  msg: ""{1}"",
  position: ""center"",
  clickable: ""true""
}});", mesaj.MesajTipi.ToString().ToLower(CultureInfo.InvariantCulture), mesaj.Mesaj);
                break;
            default: break;
        }

        Page page = HttpContext.Current.Handler as Page;
        bool async = false;
        try
        {
            async = ScriptManager.GetCurrent(page).IsInAsyncPostBack;
        }
        catch { }

        if (mesaj.OnDOMReady)
        {
            if (async)
            {
                ScriptManager.RegisterClientScriptBlock(page, page.GetType(), Guid.NewGuid().ToString(),
                            _mesaj, true);
            }
            else
            {
                ClientScriptManager csm = page.Page.ClientScript;
                csm.RegisterClientScriptBlock(page.GetType(), Guid.NewGuid().ToString(),
                           _mesaj, true);
            }
        }
        else
        {
            if (async)
            {
                ScriptManager.RegisterClientScriptBlock(page, page.GetType(), Guid.NewGuid().ToString(),
                        _mesaj, true);
            }
            else
            {
                ClientScriptManager csm = page.Page.ClientScript;
                csm.RegisterClientScriptBlock(page.GetType(), Guid.NewGuid().ToString(),
                    _mesaj, true);
            }
        }
    }
}