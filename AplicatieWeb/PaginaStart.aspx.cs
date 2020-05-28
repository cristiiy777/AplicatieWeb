using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;


namespace AplicatieWeb
{
    public partial class PaginaStart : System.Web.UI.Page
    {

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = SursaGridProduse.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select IdProdus from Produse where DProdus='" + TxtDProdus.Text + "'";
            OleDbDataReader rd;
            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read()) args.IsValid = false; //daca gaseste ceva atunci este deja exista. deci e duplicat
            else args.IsValid = true;
            con.Close();
        }

     
        protected void btnEditeaza_Click(object sender, EventArgs e)
        {
            PanouConfirmare.Visible = false;
            string idDescriere = " ";
            string idProdus = " ";
            string dProdus = " ";
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = SursaGridProduse.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "Select IdCategorie from Categorii where DCategorie = '" + DdlCategorie.Text + "'";
            idDescriere = cmd.ExecuteScalar().ToString();
            cmd.CommandText = "Select IdProdus from Produse where DProdus = '" + GridView1.SelectedRow.Cells[1].Text + "'";
            idProdus = cmd.ExecuteScalar().ToString();
            con.Close();

            dProdus = GridView1.SelectedRow.Cells[1].Text;

            if (dProdus.Equals(TxtDProdus.Text))
            {
                CustomValidator1.IsValid = true;
            }
            
            //Cand editam un produs, daca vrem sa-i schimbam numele iar el deja exista, e duplicat pe cheie semantica. Daca il editam
            //Si nu ii schimbam numele, adica cel din TxtDProdus ramane tot aceas cu cel din grid, tot duplicat ar fi aparut
            //De asta validam controlul


            SursaProdus.UpdateParameters[0].DefaultValue = TxtDProdus.Text;
            SursaProdus.UpdateParameters[1].DefaultValue = DdlUM.Text;
            SursaProdus.UpdateParameters[2].DefaultValue = DdlTVA.Text;
            SursaProdus.UpdateParameters[3].DefaultValue = TxtPret.Text;
            SursaProdus.UpdateParameters[4].DefaultValue = idDescriere;

            if (TxtPoza.Text.Equals(null))
                SursaProdus.UpdateParameters[5].DefaultValue = "";
            else
                SursaProdus.UpdateParameters[5].DefaultValue = TxtPoza.Text;

            SursaProdus.UpdateParameters[6].DefaultValue = idProdus;

            if (Page.IsValid)
            {
                SursaProdus.Update();
                GridView1.DataBind();
            }
         
        }

        protected void btnAdauga_Click(object sender, EventArgs e)
        {
            PanouConfirmare.Visible = false;
            string idDescriere = " ";
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = SursaGridProduse.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select IdCategorie from Categorii where DCategorie = '" + DdlCategorie.Text + "'";
            con.Open();
            idDescriere = cmd.ExecuteScalar().ToString();
            con.Close();
            
            SursaProdus.InsertParameters[0].DefaultValue = TxtDProdus.Text;
            SursaProdus.InsertParameters[1].DefaultValue = DdlUM.Text;
            SursaProdus.InsertParameters[2].DefaultValue = DdlTVA.Text;
            if (TxtPret.Text.All(Char.IsDigit))
                SursaProdus.InsertParameters[3].DefaultValue = TxtPret.Text;
            else
                CustomValidator3.IsValid = false;
            SursaProdus.InsertParameters[4].DefaultValue = idDescriere;

            if(TxtPoza.Text.Equals(null))
                SursaProdus.InsertParameters[5].DefaultValue = " ";
            else
                SursaProdus.InsertParameters[5].DefaultValue = TxtPoza.Text;


            if (Page.IsValid) 
            {
                SursaProdus.Insert();
                GridView1.DataBind();
                NullControale();
                Response.Write("<script>alert('Înregistrare adăugată cu succes!')</script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TxtDProdus.Text = GridView1.SelectedRow.Cells[1].Text;
            DdlUM.Text = GridView1.SelectedRow.Cells[2].Text;
            DdlTVA.Text = GridView1.SelectedRow.Cells[3].Text;
            TxtPret.Text = GridView1.SelectedRow.Cells[4].Text;
            DdlCategorie.Text = GridView1.SelectedRow.Cells[5].Text;
            TxtPoza.Text = GridView1.SelectedRow.Cells[6].Text.Replace("&nbsp;", " ");
            PanouConfirmare.Visible = false;
        }

        protected void NullControale()
        {
            TxtDProdus.Text = string.Empty;
            DdlUM.SelectedIndex = 0;
            DdlTVA.SelectedIndex = 0;
            TxtPret.Text = string.Empty;
            DdlCategorie.SelectedIndex = 0;
            TxtPoza.Text = string.Empty;
        }

        protected void btnSterge_Click(object sender, EventArgs e)
        {
            
            string idProdus = " ";

            if (TxtDProdus.Text == " ")
            {
                CustomValidator2.IsValid = false;
                return;
            }

            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = SursaGridProduse.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "Select IdProdus from Produse where DProdus = '" + GridView1.SelectedRow.Cells[1].Text + "'";
            idProdus = cmd.ExecuteScalar().ToString();
            con.Close();
            
            PanouConfirmare.Visible = true;
            Label9.Text = "Ești sigur că vrei să ștergi produsul " + GridView1.SelectedRow.Cells[1].Text + " ?";
        }

        protected void btnDa_Click(object sender, EventArgs e)
        {
            string idProdus = " ";
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = SursaGridProduse.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "Select IdProdus from Produse where DProdus = '" + GridView1.SelectedRow.Cells[1].Text + "'";
            idProdus = cmd.ExecuteScalar().ToString();
            con.Close();
            
            SursaProdus.DeleteParameters[0].DefaultValue = idProdus;
            SursaProdus.Delete();
            NullControale();
            GridView1.DataBind();
            PanouConfirmare.Visible = false;
        }

        protected void btnNu_Click(object sender, EventArgs e)
        {
            PanouConfirmare.Visible = false;
        }
    
    }
}