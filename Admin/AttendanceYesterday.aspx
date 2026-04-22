<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AttendanceYesterday.aspx.cs" Inherits="databasemile3.Admin.AttendanceYesterday" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body { background: #121212; }
        .dark-box {
            background: #1E1E1E;
            padding: 25px;
            border-radius: 12px;
            width: 60%;
            margin-top: 30px;
            border: 1px solid #333;
            color: white;
            font-family: 'Segoe UI';
        }

        .dark-btn {
            background: #0A84FF;
            padding: 10px 20px;
            border: none;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .dark-btn:hover {
            background: #0066CC;
        }

        .grid-dark {
            background-color: #1E1E1E;
            color: white;
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        .grid-dark th {
            background-color: #333;
            padding: 10px;
        }

        .grid-dark td {
            border-bottom: 1px solid #444;
            padding: 8px;
        }
    </style>

    <div class="dark-box">
        <h2>Attendance Yesterday</h2>

        <asp:Button ID="Button1" runat="server" Text="Fetch Yesterday Attendance"
            OnClick="Button1_Click" CssClass="dark-btn" />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"
            CssClass="grid-dark"></asp:GridView>
    </div>

</asp:Content>
