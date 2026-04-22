<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="3choose.aspx.cs" Inherits="databasemile3.Academic._3choose" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <style>
 .choice-wrapper {
 max-width:700px;
 margin:60px auto;
 text-align: center;
 padding:20px;
 }
 .choice-card {
 display: inline-block;
 width:100%;
 background: #fff;
 border-radius:10px;
 padding:30px 20px;
 box-shadow:06px 18px rgba(0,0,0,0.12);
 }
 .choice-title { font-size:24px; margin-bottom:16px; color:#111; }
 .role-grid { display: flex; gap:16px; justify-content: center; flex-wrap: wrap; }
 .role-btn {
 flex:00200px;
 padding:14px 18px;
 font-size:16px;
 font-weight:600;
 border-radius:8px;
 text-decoration: none;
 color: #fff;
 display: inline-block;
 }
 .role-admin { background: linear-gradient(45deg,#ef4444,#f97316); }
 .role-hr { background: linear-gradient(45deg,#06b6d4,#3b82f6); }
 .role-academic { background: linear-gradient(45deg,#10b981,#059669); }
 .role-btn:hover { opacity:0.95; transform: translateY(-2px); }
 </style>

 <div class="choice-wrapper">
 <div class="choice-card">
 <div class="choice-title">Continue as</div>
 <div class="role-grid">
 <asp:HyperLink ID="hlAdmin" runat="server" NavigateUrl="~/Admin1/AdminLogin.aspx" CssClass="role-btn role-admin">Admin</asp:HyperLink>
 <asp:HyperLink ID="hlHr" runat="server" NavigateUrl="~/HR/HRLogin.aspx" CssClass="role-btn role-hr">HR</asp:HyperLink>
 <asp:HyperLink ID="hlAcademic" runat="server" NavigateUrl="~/Academic/Login.aspx" CssClass="role-btn role-academic">Academic</asp:HyperLink>
 </div>
 </div>
 </div>

</asp:Content>
