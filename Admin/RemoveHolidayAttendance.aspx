<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RemoveHolidayAttendance.aspx.cs" Inherits="databasemile3.Admin.RemoveHolidayAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body { background: #121212; }
        .dark-box {
            background: #1E1E1E;
            padding: 25px;
            border-radius: 12px;
            width: 50%;
            margin-top: 30px;
            border: 1px solid #333;
            color: white;
            font-family: 'Segoe UI';
        }

        .dark-btn {
            background: #FF453A;
            padding: 10px 0px;
            border: none;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .dark-btn:hover {
            background: #CC2B24;
        }

        .success-msg {
            color: #32D74B;
            margin-top: 15px;
            font-weight: bold;
        }

        .error-msg {
            color: #FF453A;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>

    <div class="dark-box">
        <h2>Remove Holiday Attendance</h2>

        <asp:Button ID="Button1" runat="server"
            Text="Remove Attendance During Holidays"
            CssClass="dark-btn"
            OnClick="Button1_Click" />

        <br /><br />

        <asp:Label ID="ResultLabel" runat="server"></asp:Label>
    </div>

</asp:Content>
