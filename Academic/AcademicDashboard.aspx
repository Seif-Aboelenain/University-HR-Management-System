<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AcademicDashboard.aspx.cs"
    Inherits="databasemile3.Academic.AcademicDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    body {
        background: #121212;
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;
    }

    .dashboard-box {
        background: #1E1E1E;
        padding: 35px;
        border-radius: 14px;
        width: 50%;
        min-width: 320px;
        margin: 70px auto;
        border: 1px solid #2a2a2a;
        color: white;
        text-align: center;
        box-shadow: 0 0 18px rgba(0,0,0,0.55);
        animation: fadeIn 0.6s ease-out;
    }

    h2 {
        margin-bottom: 25px;
        font-size: 26px;
        font-weight: 700;
        color: #0A84FF;
    }

    /* Blue Buttons */
    .dash-btn {
        background: #0A84FF;
        padding: 14px;
        border: none;
        color: white;
        border-radius: 8px;
        cursor: pointer;
        font-weight: 600;
        font-size: 15px;
        width: 100%;
        display: block;
        margin: 10px 0;
        text-decoration: none;
        transition: 0.25s ease;
    }

    .dash-btn:hover {
        background: #0066CC;
        transform: translateY(-2px);
    }

    /* ❤️ Pink Button (Academic2) */
    .pink-btn {
        background: #ff4fa3;
        margin-top: 25px;     /* separation from the other buttons */
        padding: 15px;
        border-radius: 8px;
        color: white;
        font-weight: 700;
        display: block;
        width: 100%;
        text-align: center;
        text-decoration: none;
        transition: 0.25s ease;
        font-size: 16px;
    }

    .pink-btn:hover {
        background: #e60073;
        transform: translateY(-3px);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to   { opacity: 1; transform: translateY(0); }
    }
</style>

<div class="dashboard-box">

    <h2>Academic Dashboard</h2>

    <asp:HyperLink NavigateUrl="~/Academic/MyPerformance.aspx" runat="server" CssClass="dash-btn">
        Performance
    </asp:HyperLink>

    <asp:HyperLink NavigateUrl="~/Academic/MyAttendance.aspx" runat="server" CssClass="dash-btn">
        Attendance
    </asp:HyperLink>

    <asp:HyperLink NavigateUrl="~/Academic/LastMonthPayroll.aspx" runat="server" CssClass="dash-btn">
        Payroll
    </asp:HyperLink>

    <asp:HyperLink NavigateUrl="~/Academic/Deductions.aspx" runat="server" CssClass="dash-btn">
        Deductions
    </asp:HyperLink>

    <asp:HyperLink NavigateUrl="~/Academic/ApplyAnnual.aspx" runat="server" CssClass="dash-btn">
        Apply Annual Leave
    </asp:HyperLink>

    <asp:HyperLink NavigateUrl="~/Academic/LeaveStatus.aspx" runat="server" CssClass="dash-btn">
        Leave Status
    </asp:HyperLink>

    <!-- 💖 NEW PINK BUTTON (SEPARATED) -->
    <asp:HyperLink NavigateUrl="~/Academic2/AcademicDashboard.aspx" runat="server" CssClass="pink-btn">
        Go to Academic2 →
    </asp:HyperLink>

</div>

</asp:Content>
