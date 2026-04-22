<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveStatus.aspx.cs" Inherits="databasemile3.Academic.LeaveStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    body { background:#121212; font-family:'Segoe UI'; margin:0; padding:0; }
    .dark-box{ 
        background:#1E1E1E; 
        padding:25px; 
        border-radius:12px; 
        width:60%; 
        margin:40px auto; 
        border:1px solid #333; 
        color:white; 
    }
    .dark-btn{ 
        background:#0A84FF; 
        padding:10px 20px; 
        border:none; 
        color:white; 
        border-radius:6px; 
        cursor:pointer; 
        font-weight:bold; 
        margin-top:10px; 
    }
    .dark-btn:hover{ background:#0066CC; }
    .grid-dark{ 
        background-color:#1E1E1E; 
        color:white; 
        border-collapse:collapse; 
        width:100%; 
        margin-top:20px; 
    }
    .grid-dark th{ background-color:#333; padding:10px; }
    .grid-dark td{ border-bottom:1px solid #444; padding:8px; }
</style>

<div class="dark-box">
    <h2>Leave Request Status</h2>

    <asp:Button ID="btnLoadStatus" runat="server"
                Text="Load Status"
                CssClass="dark-btn"
                OnClick="btnLoadStatus_Click" /><br /><br />

    <asp:GridView ID="gvLeaves" runat="server"
                  AutoGenerateColumns="true"
                  CssClass="grid-dark"></asp:GridView>

    <asp:Label ID="lblStatusMsg" runat="server" ForeColor="LightGray"></asp:Label>
</div>

</asp:Content>
