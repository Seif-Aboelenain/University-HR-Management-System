<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApplyAnnual.aspx.cs" Inherits="databasemile3.Academic.ApplyAnnual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <style>
 body { background: #121212; font-family: 'Segoe UI'; margin:0; padding:0; }
 .dark-box { 
 background: #1E1E1E; 
 padding:25px; 
 border-radius:12px; 
 width:60%; 
 margin:40px auto; 
 border:1px solid #333; 
 color: white; 
 }
 .dark-btn { 
 background: #0A84FF; 
 padding:10px20px; 
 border: none; 
 color: white; 
 border-radius:6px; 
 cursor: pointer; 
 font-weight: bold; 
 margin-top:10px;
 }
 .dark-btn:hover { background: #0066CC; }
 .input-dark { 
 background: #2A2A2A; 
 border:1px solid #444; 
 padding:10px; 
 width:60%; 
 border-radius:6px; 
 color: white; 
 margin-bottom:15px; 
 }
 </style>

 <div class="dark-box">
 <h2>Apply for Annual Leave</h2>

 <asp:TextBox ID="txtReplacement" runat="server" CssClass="input-dark" placeholder="Replacement Employee ID"></asp:TextBox><br />

 <asp:TextBox ID="txtStart" runat="server" CssClass="input-dark" placeholder="Start Date (YYYY-MM-DD)"></asp:TextBox><br />

 <asp:TextBox ID="txtEnd" runat="server" CssClass="input-dark" placeholder="End Date (YYYY-MM-DD)"></asp:TextBox><br />

 <asp:Button ID="btnApply" runat="server" Text="Submit Annual Leave" CssClass="dark-btn" OnClick="btnApply_Click" /><br /><br />

 <asp:Label ID="lblApplyMsg" runat="server" ForeColor="LightGray"></asp:Label>
 </div>
</asp:Content>

