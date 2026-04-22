<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyPerformance.aspx.cs" Inherits="databasemile3.Academic.MyPerformance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <style>
 body{ background:#121212; font-family:'Segoe UI'; margin:0; padding:0; }
 .dark-box{ background:#1E1E1E; padding:25px; border-radius:12px; width:60%; margin:40px auto; border:1px solid #333; color:white; }
 .dark-btn{ background:#0A84FF; padding:10px20px; border:none; color:white; border-radius:6px; cursor:pointer; font-weight:bold; margin-top:10px; }
 .dark-btn:hover{ background:#0066CC; }
 .input-dark{ background:#2A2A2A; border:1px solid #444; padding:8px; width:50%; border-radius:6px; color:white; margin-bottom:10px; }
 .grid-dark{ background-color:#1E1E1E; color:white; border-collapse:collapse; width:100%; margin-top:20px; }
 .grid-dark th{ background-color:#333; padding:10px; }
 .grid-dark td{ border-bottom:1px solid #444; padding:8px; }
 </style>

 <div class="dark-box">
 <h2>Your Performance</h2>

 <asp:Label ID="lblEmp" runat="server"></asp:Label><br /><br />

 <asp:DropDownList ID="ddlSemester" runat="server" CssClass="input-dark">
 <asp:ListItem Value="W24">Winter2024</asp:ListItem>
 <asp:ListItem Value="S24">Spring2024</asp:ListItem>
 <asp:ListItem Value="W25">Winter2025</asp:ListItem>
 </asp:DropDownList><br />

 <asp:Button ID="btnLoadPerf" runat="server" CssClass="dark-btn" Text="Load Performance" OnClick="btnLoadPerf_Click" /><br /><br />

 <asp:GridView ID="gvPerf" runat="server" AutoGenerateColumns="true" CssClass="grid-dark"></asp:GridView>

 <asp:Label ID="lblPerfMsg" runat="server" ForeColor="LightGray"></asp:Label>
 </div>
</asp:Content>
