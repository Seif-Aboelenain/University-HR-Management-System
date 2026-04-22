<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="databasemile3.Admin1.AdminHome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Home</title>

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom right, #f2f4f8, #e6e9ef);
        }

        /* ---------------- NAVBAR ---------------- */
        .navbar {
            position: sticky;
            top: 0;
            z-index: 999;
            padding: 14px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            backdrop-filter: blur(18px);
            background: rgba(255,255,255,0.88);
            border-bottom: 1px solid #d7dce5;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
        }

        .nav-title {
            font-size: 21px;
            font-weight: 700;
            color: #2F3A4A;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logout-btn {
            padding: 9px 18px;
            background: #EF4444;
            color: white;
            text-decoration: none;
            font-weight: 600;
            border-radius: 6px;
            transition: 0.25s;
        }

        .logout-btn:hover {
            background: #d42d2d;
        }

        /* ---------------- WRAPPER ---------------- */
        .wrapper {
            max-width: 1050px;
            margin: 45px auto;
            padding: 0 20px;
            animation: fadeIn 0.8s ease forwards;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(12px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            font-size: 32px;
            font-weight: 700;
            color: #2F3A4A;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #5f6c7b;
            font-size: 15px;
            margin-bottom: 35px;
        }

        /* ---------------- CARDS ---------------- */
        .card {
            background: white;
            padding: 30px 36px;
            border-radius: 16px;
            margin-bottom: 28px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            border-left: 5px solid #3A6DFF;
            transition: 0.25s;
        }

        .card:nth-child(2) { border-left-color: #f7a600; }
        .card:nth-child(3) { border-left-color: #8b5cf6; }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.12);
        }

        .card-title {
            font-size: 20px;
            font-weight: 700;
            color: #2F3A4A;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 18px;
        }

        /* ---------------- BUTTONS + LINKS ---------------- */
        a.link {
            display: block;
            margin: 6px 0;
            color: #3A6DFF;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            transition: 0.25s;
        }

        a.link:hover {
            color: #2F54CC;
            text-decoration: underline;
        }

        .asp-btn {
            padding: 10px 18px;
            background-color: #3A6DFF;
            color: white;
            border: none;
            border-radius: 6px;
            margin: 6px 4px 12px 0;
            font-weight: 600;
            cursor: pointer;
            transition: 0.25s;
        }

        .asp-btn:hover {
            background: #264dcc;
        }

        /* ---------------- NEXT BUTTON (NEW) ---------------- */
        .next-btn {
            padding: 12px 22px;
            background: #3A6DFF;
            color: white;
            font-weight: 700;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
            transition: 0.25s ease;
            display: inline-block;
            margin-bottom: 50px;
        }

        .next-btn:hover {
            background: #264dcc;
            transform: translateY(-2px);
        }

        /* ---------------- FOOTER ---------------- */
        .footer {
            text-align: center;
            color: #677586;
            font-size: 14px;
            margin-top: 40px;
            padding-bottom: 20px;
        }

        /* ---------------- RESPONSIVE ---------------- */
        @media (max-width:768px) {
            .card { padding: 24px; }
            h2 { font-size: 26px; }
            .asp-btn { width: 100%; }
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <div class="navbar">
        <div class="nav-title">
            <i class="fa-solid fa-shield-halved"></i> Admin Panel
        </div>
        <a href="AdminLogin.aspx" class="logout-btn">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>

    <form id="form1" runat="server">
        <div class="wrapper">

            <h2>Welcome Admin!</h2>
            <div class="subtitle">You have successfully logged in.</div>

            <!-- CARD1 -->
            <div class="card">
                <div class="card-title">
                    <i class="fa-solid fa-users"></i> Employee Management
                </div>

                <a class="link" href="AdminViewEmployees.aspx">
                    <i class="fa-solid fa-eye"></i> View All Employees
                </a>

                <asp:Button ID="btnDeptCount" runat="server"
                    Text="Employees Per Department"
                    CssClass="asp-btn"
                    OnClick="btnDeptCount_Click" />

                <asp:Button ID="btnRejectedMed" runat="server"
                    Text="View Rejected Medical Leaves"
                    CssClass="asp-btn"
                    OnClick="btnRejectedMed_Click" />

                <a class="link" href="AdminRemoveDeductions.aspx">
                    <i class="fa-solid fa-user-minus"></i> Remove Deductions for Resigned Employees
                </a>
            </div>

            <!-- CARD2 -->
            <div class="card">
                <div class="card-title">
                    <i class="fa-solid fa-clock"></i> Attendance
                </div>

                <a class="link" href="AdminUpdateAttendance.aspx">
                    <i class="fa-solid fa-pen"></i> Update Attendance
                </a>

                <a class="link" href="AdminInitiateAttendance.aspx">
                    <i class="fa-solid fa-rotate-right"></i> Initiate Today’s Attendance
                </a>
            </div>

            <!-- CARD3 -->
            <div class="card">
                <div class="card-title">
                    <i class="fa-solid fa-calendar-days"></i> Holidays
                </div>

                <a class="link" href="AdminAddHoliday.aspx">
                    <i class="fa-solid fa-plus"></i> Add New Official Holiday
                </a>
            </div>

            <!-- NEW BUTTON: NEXT TO ADMIN PART 2 -->
            <div style="text-align:center; margin-top:40px;">
                <asp:HyperLink ID="hlNextPart2" runat="server" NavigateUrl="~/Admin/AdminDashboard.aspx" CssClass="next-btn">
                    Next to Admin Part 2 →
                </asp:HyperLink>
            </div>

            <div class="footer">
                ©2025 University HR Management System — Admin Dashboard
            </div>

        </div>
    </form>

</body>
</html>
