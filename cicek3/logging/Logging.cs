using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data.Common;
using System.Data;

namespace cicek3
{
    public class cLogging:IDisposable
    {
        public TBLLOGS Logs;
        public cLogging(bool webService)
        {
            Logs = new TBLLOGS();
            Logs.ID = 0;
            if (webService)
            {
                Logs.IP = string.Empty;
                Logs.IsWeb = true;
            }
            else
            {
                Logs.IP = HttpContext.Current.Request.UserHostAddress;
                Logs.IsWeb = false;
            }
            Logs.KAYNAGI = string.Empty;
            Logs.KULLANICI_ID = 0;
            Logs.MESAJ = String.Empty;
            Logs.PAGE = string.Empty;
            //Logs.QUERY = string.Empty;
            Logs.STACKTRACE = string.Empty;
        }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public void Write(Exception pex,int piKullaniciID)
        {
            Logs.MESAJ = pex.Message;
            Logs.KAYNAGI = pex.Source;
            Logs.STACKTRACE = pex.StackTrace;
            Logs.KULLANICI_ID = piKullaniciID;
            string datenow=DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss.fff");
            Logs.OLUSMA_ZAMANI = Convert.ToDateTime(datenow);
            EkleLog();
        }

        private void EkleLog()
        {
            if (!Logs.IsWeb)
                Logs.PAGE = HttpContext.Current.Request.RawUrl.Substring(0, HttpContext.Current.Request.RawUrl.Length > 150 ? 150 : HttpContext.Current.Request.RawUrl.Length);
            else
                Logs.PAGE = "Web Servis";
            DataClassesDataContext dcdc = new DataClassesDataContext();
            dcdc.usp_EkleLog(Logs.KULLANICI_ID, Logs.MESAJ, Logs.IP, Logs.PAGE, Logs.STACKTRACE, Logs.KAYNAGI, Logs.OLUSMA_ZAMANI);
            
        }
    }
}
