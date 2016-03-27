using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace cicek3
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            //ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            //{
            //    Path = "http://code.jquery.com/jquery-1.10.2.min.js",
            //    DebugPath = "http://code.jquery.com/jquery-1.10.2.min.js",
            //    CdnPath = "http://code.jquery.com/jquery-1.10.2.min.js",
            //    CdnDebugPath = "http://code.jquery.com/jquery-1.10.2.min.js"
            //});
        }
        void Session_Start(object sender,EventArgs e)
        {
            cUIAraclari.cLog = new cLogging(false);
        }
        void Session_End(object sender, EventArgs e)
        {
            cUIAraclari.cLog.Dispose();
        }
    }
}