<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaStart.aspx.cs" Inherits="AplicatieWeb.PaginaStart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aplicație web</title>
    <style type="text/css">
        #form1 {
            height: 486px;
        }
    </style>

</head>
<body style="height: 477px; width: 1427px">
    <form id="form1" runat="server">

    <asp:CustomValidator ID="CustomValidator2" runat="server" 
        ErrorMessage="Alege o înregistrare de șters">Custom Validator</asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator3" runat="server" 
        ErrorMessage="Prețul trebuie să fie un număr">CustomValidator</asp:CustomValidator>

    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ErrorMessage="Duplicat pe cheie semantică - Denumire Produs" 
        onservervalidate="CustomValidator1_ServerValidate">Custom Validator</asp:CustomValidator>
    <asp:Panel ID="Panel1" runat="server" 
        
        
        
        style="position:absolute; top: 61px; left: 51px; width: 601px; height: 409px;">
        <asp:Label ID="Label2" runat="server" Text="UM" 
            style="position:absolute; top: 51px; left: 300px;" height="19px" 
            width="65px"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Categorie" 
            style="position:absolute; top: 98px; left: 7px;" height="19px" 
            width="105px"></asp:Label>
        <asp:TextBox ID="TxtPoza" runat="server" 
            style="position:absolute; top: 208px; left: 127px;" width="111px" 
            height="22px"></asp:TextBox>
        <asp:TextBox ID="TxtDProdus" runat="server" 
            style="position:absolute; top: 52px; left: 127px; width: 111px;" 
            height="22px"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="Pret Vânzare" 
            style="position:absolute; top: 154px; left: 7px;" height="19px" 
            width="105px"></asp:Label>
        <asp:Label ID="Label5" runat="server" Text="Cotă TVA" 
            style="position:absolute; top: 101px; left: 300px;"></asp:Label>
        <asp:Label ID="Label6" runat="server" Text="Poză" 
            style="position:absolute; top: 209px; left: 7px;" height="19px" 
            width="105px"></asp:Label>
        <asp:TextBox ID="TxtPret" runat="server" 
            style="position:absolute; top: 151px; left: 127px;" width="111px" 
            height="22px"></asp:TextBox>
        <asp:DropDownList ID="DdlUM" runat="server" 
            
            style="position:absolute; top: 50px; left: 372px; height: 17px; width: 56px;">
            <asp:ListItem> </asp:ListItem>
            <asp:ListItem>Kg</asp:ListItem>
            <asp:ListItem>Buc</asp:ListItem>
            <asp:ListItem>MP</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DdlTVA" runat="server" 
            
            style="position:absolute; top: 101px; left: 372px; height: 17px; width: 56px;">
            <asp:ListItem> </asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>24</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label7" runat="server" Text="Denumire Produs" 
            style="position:absolute; top: 52px; left: 7px;"></asp:Label>
        <asp:DropDownList ID="DdlCategorie" runat="server" 
            style="position:absolute; top: 101px; left: 127px;" height="22px" 
            width="111px" DataSourceID="SursaDCategorieDropDown" DataTextField="DCategorie" 
            DataValueField="DCategorie">
        </asp:DropDownList>


        <asp:Button ID="btnEditeaza" runat="server" Text="Editează" 
            style="position:absolute; top: 150px; left: 301px; width: 78px; height: 34px;" 
            onclick="btnEditeaza_Click"/>
        <asp:Button ID="btnAdauga" runat="server" onclick="btnAdauga_Click" Text="Adaugă" 
            
            
            
            
            
            style = "position:absolute; top: 150px; left: 397px; width: 78px; height: 34px;"/>
        <asp:Panel ID="PanouConfirmare" runat="server" 
            
            style="position:absolute; top: 205px; left: 381px; height: 92px; width: 191px;" 
            Visible="False">
            <asp:Label ID="Label9" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
            <asp:Button ID="btnDa" runat="server" Text="DA" 
                
                style="position:absolute; top: 47px; left: 28px; height: 30px; width: 52px;" 
                onclick="btnDa_Click" CausesValidation="False" UseSubmitBehavior="False"/>
            <asp:Button ID="btnNu" runat="server" Text="NU" 
                style="position:absolute; top: 47px; left: 102px; height: 30px; width: 52px;" 
                onclick="btnNu_Click" CausesValidation="False" UseSubmitBehavior="False"/>
        </asp:Panel>
    </asp:Panel>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="DdlCategorie" ErrorMessage="Alege categorie">&nbsp;</asp:RequiredFieldValidator>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="TxtPret" ErrorMessage="Completează preț vânzare">&nbsp;</asp:RequiredFieldValidator>
   
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="DdlUM" ErrorMessage="Alege UM">&nbsp;</asp:RequiredFieldValidator>

    <asp:AccessDataSource ID="SursaDCategorieDropDown" runat="server" 
        DataFile="~/App_Data/BD1.mdb" 
        SelectCommand="SELECT [DCategorie] FROM [Categorii]">
    </asp:AccessDataSource>
    
    <asp:AccessDataSource ID="SursaProdus" runat="server" 
        DataFile="~/App_Data/BD1.mdb" 
        SelectCommand="SELECT IdProdus FROM [Produse] WHERE DProdus = ?" 
        DeleteCommand="DELETE FROM [Produse] WHERE [IdProdus] = ?" 
        InsertCommand="INSERT INTO [Produse] ([DProdus], [UM], [CotaTVA], [PretVanzare], [IdCategorie], [SpPoza]) VALUES (?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Produse] SET [DProdus] = ?, [UM] = ?, [CotaTVA] = ?, [PretVanzare] = ?, [IdCategorie] = ?, [SpPoza] = ? WHERE [IdProdus] = ?">
       
        <SelectParameters>
            <asp:Parameter Name="DProdus" Type="String" />
        </SelectParameters>

        <DeleteParameters>
            <asp:Parameter Name="IdProdus" Type="Int32" />
        </DeleteParameters>

        <InsertParameters>
            <asp:Parameter Name="DProdus" Type="String" />
            <asp:Parameter Name="UM" Type="String" />
            <asp:Parameter Name="CotaTVA" Type="Decimal" />
            <asp:Parameter Name="PretVanzare" Type="Decimal" />
            <asp:Parameter Name="IdCategorie" Type="Int32" />
            <asp:Parameter Name="SpPoza" Type="String" />
        </InsertParameters>

        <UpdateParameters>
            <asp:Parameter Name="DProdus" Type="String" />
            <asp:Parameter Name="UM" Type="String" />
            <asp:Parameter Name="CotaTVA" Type="Decimal" />
            <asp:Parameter Name="PretVanzare" Type="Decimal" />
            <asp:Parameter Name="IdCategorie" Type="Int32" />
            <asp:Parameter Name="SpPoza" Type="String" />
            <asp:Parameter Name="IdProdus" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>

    <asp:AccessDataSource ID="SursaGridProduse" runat="server" 
        DataFile="~/App_Data/BD1.mdb" 
        SelectCommand="SELECT Produse.DProdus, Produse.UM, Produse.CotaTVA, Produse.PretVanzare, Categorii.DCategorie, Produse.SpPoza FROM (Categorii INNER JOIN Produse ON Categorii.IdCategorie = Produse.IdCategorie)">
        </asp:AccessDataSource>
   
    <asp:Button ID="btnSterge" runat="server" Text="Șterge" 
        style = "position:absolute; top: 212px; left: 545px; height: 34px; width: 78px;" 
        onclick="btnSterge_Click" UseSubmitBehavior="False" 
        CausesValidation="False"/>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ControlToValidate="DdlTVA" ErrorMessage="Alege Cotă TVA">&nbsp;</asp:RequiredFieldValidator>
       
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        style="position:absolute; top: 327px; left: 59px; width: 270px; height: 59px;" 
        ForeColor="Red"/>

    <asp:Label ID="Label8" runat="server" 
        Text="Aplicație simplă pentru Insert, Update, Delete" 
        style="position:absolute; top: 25px; left: 410px;" Font-Size="X-Large" 
        ForeColor="Blue"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" 
        style="position: absolute; top: 121px; left: 767px; height: 125px; width: 286px;" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SursaGridProduse" 
        ForeColor="#333333" GridLines="None" AllowPaging="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" PageSize="5">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="DProdus" HeaderText="DProdus" 
                SortExpression="DProdus" />
            <asp:BoundField DataField="UM" HeaderText="UM" 
                SortExpression="UM" />
            <asp:BoundField DataField="CotaTVA" HeaderText="CotaTVA" 
                SortExpression="CotaTVA" />
            <asp:BoundField DataField="PretVanzare" HeaderText="PretVanzare" 
                SortExpression="PretVanzare" />
            <asp:BoundField DataField="DCategorie" HeaderText="DCategorie" 
                SortExpression="DCategorie" />
            <asp:BoundField DataField="SpPoza" HeaderText="SpPoza" 
                SortExpression="SpPoza" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

    </form>

</body>

</html>
