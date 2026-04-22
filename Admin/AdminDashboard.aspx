<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="databasemile3.Admin.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body { background: #121212; }

        .dashboard-header {
            color: white;
            font-family: 'Segoe UI';
            margin-bottom: 25px;
        }

        .dashboard-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
            padding: 20px;
        }

        .card {
            background: #1E1E1E;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #333;
            box-shadow: 0 0 12px rgba(0,0,0,0.5);
            text-align: center;
            font-family: 'Segoe UI';
            color: white;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 16px rgba(0, 138, 255, 0.4);
        }

        .card h3 {
            margin-bottom: 10px;
            color: #0A84FF;
        }

        .card p {
            color: #BBB;
            font-size: 14px;
        }

        .dark-btn {
            display: inline-block;
            margin-top: 12px;
            padding: 10px 18px;
            background: #0A84FF;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }

        .dark-btn:hover {
            background: #0066CC;
        }
    </style>

    <h2 class="dashboard-header">Admin Dashboard</h2>

    <div class="dashboard-container">

        <div class="card">
            <h3>Attendance Yesterday</h3>
            <p>Fetch attendance records for yesterday</p>
            <a href="AttendanceYesterday.aspx" class="dark-btn">Open</a>
        </div>

        <div class="card">
            <h3>Winter Performance</h3>
            <p>Performance of all employees in Winter semesters</p>
            <a href="PerformanceWinter.aspx" class="dark-btn">Open</a>
        </div>

        <div class="card">
            <h3>Holiday Attendance</h3>
            <p>Remove attendance during official holidays</p>
            <a href="RemoveHolidayAttendance.aspx" class="dark-btn">Open</a>
        </div>

        <div class="card">
            <h3>Day-Off Attendance</h3>
            <p>Remove unattended day-off records</p>
            <a href="RemoveDayOff.aspx" class="dark-btn">Open</a>
        </div>

        <div class="card">
            <h3>Approved Leaves</h3>
            <p>Remove attendance for approved leaves</p>
            <a href="RemoveApprovedLeaves.aspx" class="dark-btn">Open</a>
        </div>

        <div class="card">
            <h3>Replace Employee</h3>
            <p>Record employee replacements</p>
            <a href="ReplaceEmployee.aspx" class="dark-btn">Open</a>
        </div>

        <div class="card">
            <h3>Update Status</h3>
            <p>Update employment status (active/onleave)</p>
            <a href="UpdateEmploymentStatus.aspx" class="dark-btn">Open</a>
        </div>

    </div>

</asp:Content>
