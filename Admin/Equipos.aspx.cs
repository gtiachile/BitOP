using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BitOp.Admin
{
    public partial class Equipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) { BitOP.Global.MenuControl.getMenu((Menu)Master.FindControl("NavigationMenu"), (Login)Master.FindControl("Login1"), BitOP.Global.Perfil); }                  
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            DropDownList DropDownPlanta = (DropDownList)FormView1.FindControl("DropDownListPlanta1");
            e.Values["Planta"] = DropDownPlanta.SelectedValue;
            DropDownList DropDownArea = (DropDownList)FormView1.FindControl("DropDownList4");
            e.Values["Area"] = DropDownArea.SelectedValue;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
    }
}