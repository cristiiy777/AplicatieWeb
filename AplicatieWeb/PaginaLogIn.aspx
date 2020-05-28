<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaLogIn.aspx.cs" Inherits="AplicatieWeb.PaginaLogIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LogIn</title>
    <style type="text/css">
        #form1
        {
            height: 306px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Utilizator" 
        style="position: absolute; top: 84px; left: 57px;"></asp:Label>
    <asp:TextBox ID="TxtParola" runat="server" 
        style="position: absolute; top: 133px; left: 129px;" TextMode="Password"></asp:TextBox>
    <asp:Label ID="Label2" runat="server" Text="Parolă" 
        style="position: absolute; top: 137px; left: 59px;"></asp:Label>
    <asp:TextBox ID="TxtUtilizator" runat="server" 
        style="position: absolute; top: 81px; left: 130px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Completează parola" 
        style="position: absolute; top: 134px; left: 300px; width: 21px;" 
        ControlToValidate="TxtParola">&nbsp;</asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Completează utilizator" 
        
        style="position: absolute; top: 81px; left: 301px; width: 14px;" 
        ControlToValidate="TxtUtilizator">&nbsp;</asp:RequiredFieldValidator>

    <asp:Button ID="BtnLogin" runat="server" Text="Login" 
        
        style="position: absolute; top: 198px; height: 26px; width: 63px; left: 145px;" 
        Font-Names="Arial Black" Font-Size="Medium" onclick="BtnLogin_Click"/>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        style="position: absolute; top: 192px; left: 258px;" ForeColor="Red"/>

    <asp:AccessDataSource ID="ADS1" runat="server" 
        DataFile="~/App_Data/BD1.mdb" SelectCommand="SELECT * FROM [Utilizatori]">
    </asp:AccessDataSource>

    <asp:CustomValidator ID="CV1" runat="server"  
        style="position: absolute; top: 82px; left: 355px; width: 218px; height: 20px;" 
        onservervalidate="CV1_ServerValidate">&nbsp;</asp:CustomValidator>

    </form>
</body>
</html>
