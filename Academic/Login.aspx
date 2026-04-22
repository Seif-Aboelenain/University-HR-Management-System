<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="databasemile3.Academic.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <style>
 body { background: #121212; margin:0; padding:0; font-family:'Segoe UI'; }
 .dark-box{ background:#1E1E1E; padding:25px; border-radius:12px; width:40%; margin:80px auto; border:1px solid #333; color:white; text-align:center; }
 .dark-btn{ background:#0A84FF; padding:10px20px; border:none; color:white; border-radius:6px; cursor:pointer; font-weight:bold; width:50%; }
 .dark-btn:hover{ background:#0066CC; }
 .input-dark{ background:#2A2A2A; border:1px solid #444; padding:10px; width:70%; border-radius:6px; color:white; margin-bottom:15px; }
 </style>

 <div class="dark-box">
 <h2>Employee Login</h2>

 <asp:TextBox ID="txtEmpID" runat="server" CssClass="input-dark" placeholder="Employee ID"></asp:TextBox><br />
 <asp:TextBox ID="txtPassword" runat="server" CssClass="input-dark" TextMode="Password" placeholder="Password"></asp:TextBox><br />

 <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="dark-btn" OnClick="btnLogin_Click" /><br /><br />

 <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
 </div>
</asp:Content>
