﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BitOp
{
    public partial class Inicio : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                ViewState["LoginErrors"] = 0;
//                BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil);
            }
        }

    }
}