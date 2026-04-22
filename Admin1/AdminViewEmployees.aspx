<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminViewEmployees.aspx.cs" Inherits="databasemile3.Admin1.AdminViewEmployees" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View All Employees</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: 40px auto;
        }

        .title {
            font-size: 28px;
            font-weight: 650;
            margin-bottom: 25px;
            color: #2F3A4A;
        }

        /* SCROLL WRAPPER */
        .table-wrapper {
            overflow-x: auto;
            white-space: nowrap;
            padding-bottom: 10px;
            border-radius: 10px;
            background: #ffffff;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.1);
        }

        /* GRIDVIEW TABLE STYLING */
        .grid {
            border-collapse: collapse;
            width: 100%;
            min-width: 900px; /* ensures table doesn't squish columns */
            font-size: 15px;
        }

        .grid th {
            background: #eef2f7;
            padding: 12px;
            text-align: left;
            font-weight: 600;
            color: #2F3A4A;
            border-bottom: 2px solid #d0d7e2;
        }

        .grid td {
            border-bottom: 1px solid #ddd;
            padding: 10px 12px;
        }

        .grid tr:nth-child(even) {
            background-color: #f9fbfd;
        }

        .grid tr:hover {
            background-color: #e8f0ff;
            transition: 0.2s;
        }

        /* ERROR MESSAGE */
        .error {
            color: red;
            font-weight: bold;
            margin-top: 15px;
            display: block;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <div class="container">

        <h2 class="title">All Employee Profiles</h2>

        <!-- WRAP GRIDVIEW IN SCROLL CONTAINER -->
        <div class="table-wrapper">
            <asp:GridView 
                ID="gvEmployees" 
                runat="server" 
                AutoGenerateColumns="true"
                CssClass="grid">
            </asp:GridView>
        </div>

        <asp:Label 
            ID="lblError" 
            runat="server" 
            CssClass="error">
        </asp:Label>

    </div>
</form>
</body>
</html>
