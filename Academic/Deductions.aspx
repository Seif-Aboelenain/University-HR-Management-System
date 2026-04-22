<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Deductions.aspx.cs" Inherits="databasemile3.Academic.Deductions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <style>
 body { background:#121212; font-family:'Segoe UI'; margin:0; padding:0; }
 .dark-box{ background:#1E1E1E; padding:25px; border-radius:12px; width:60%; margin:40px auto; border:1px solid #333; color:white; }
 .dark-btn{ background:#0A84FF; padding:10px20px; border:none; color:white; border-radius:6px; cursor:pointer; font-weight:bold; margin-top:10px; }
 .dark-btn:hover{ background:#0066CC; }
 .input-dark{ background:#2A2A2A; border:1px solid #444; padding:8px; width:50%; border-radius:6px; color:white; margin-bottom:10px; }
 .grid-dark{ background-color:#1E1E1E; color:white; border-collapse:collapse; width:100%; margin-top:20px; }
 .grid-dark th{ background-color:#333; padding:10px; }
 .grid-dark td{ border-bottom:1px solid #444; padding:8px; }
 </style>
 <div class="dark-box">
 <h2>Attendance Deductions</h2>

 <asp:DropDownList ID="ddlMonth" runat="server" CssClass="input-dark">
 <asp:ListItem Value="1">January</asp:ListItem>
 <asp:ListItem Value="2">February</asp:ListItem>
 <asp:ListItem Value="3">March</asp:ListItem>
 <asp:ListItem Value="4">April</asp:ListItem>
 <asp:ListItem Value="5">May</asp:ListItem>
 <asp:ListItem Value="6">June</asp:ListItem>
 <asp:ListItem Value="7">July</asp:ListItem>
 <asp:ListItem Value="8">August</asp:ListItem>
 <asp:ListItem Value="9">September</asp:ListItem>
 <asp:ListItem Value="10">October</asp:ListItem>
 <asp:ListItem Value="11">November</asp:ListItem>
 <asp:ListItem Value="12">December</asp:ListItem>
 </asp:DropDownList><br />

 <asp:Button ID="btnLoadDeductions" runat="server" Text="Load Deductions" CssClass="dark-btn" OnClick="btnLoadDeductions_Click" /><br /><br />

 <asp:GridView ID="gvDeductions" runat="server" AutoGenerateColumns="true" CssClass="grid-dark"></asp:GridView>

 <asp:Label ID="lblDedMsg" runat="server" ForeColor="LightGray"></asp:Label>
 </div>
</asp:Content>
