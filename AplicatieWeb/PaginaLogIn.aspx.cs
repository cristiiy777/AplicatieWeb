using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace AplicatieWeb
{
    public partial class PaginaLogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) //important
            {
                Response.Redirect("PaginaStart.aspx");
            }
        }

        protected void CV1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection con = new OleDbConnection();
            OleDbCommand cmd = new OleDbCommand();
            OleDbDataReader rdr;
            con.ConnectionString = ADS1.ConnectionString;
            cmd.Connection = con;
            cmd.CommandText = "Select IdUtilizatori, Parola from Utilizatori Where Nume='" + TxtUtilizator.Text + "'";
            con.Open();
            rdr = cmd.ExecuteReader();
            if (!rdr.Read())
            {
                CV1.ErrorMessage = "Utilizator eronat"; args.IsValid = false;
                con.Close(); return;
            }
            else if (rdr.GetString(1) != TxtParola.Text)
            {
                CV1.ErrorMessage = "Parola eronata"; args.IsValid = false;
                con.Close(); return;
            }
        }




    }
}