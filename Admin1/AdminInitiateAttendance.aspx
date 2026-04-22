<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminInitiateAttendance.aspx.cs" Inherits="databasemile3.Admin1.AdminInitiateAttendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Initiate Attendance</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(to bottom right, #EEF2F7, #DDE3EB);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: #ffffff;
            width: 420px;
            padding: 35px 40px;
            border-radius: 14px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
            text-align: center;
        }

        h2 {
            font-size: 26px;
            font-weight: 650;
            color: #2F3A4A;
            margin-bottom: 25px;
        }

        .btn-init {
            width: 100%;
            padding: 12px;
            background-color: #3A6DFF;
            border: none;
            color: #ffffff;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            margin-top: 10px;
            font-weight: 600;
            transition: 0.25s ease;
        }

        .btn-init:hover {
            background-color: #2F54CC;
        }

        .message {
            margin-top: 15px;
            font-size: 14px;
            font-weight: 600;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <div class="card">

        <h2>Initiate Attendance for Today</h2>

        <asp:Label ID="lblMsg" runat="server" CssClass="message"></asp:Label>

        <asp:Button 
            ID="btnInit" 
            runat="server" 
            Text="Initiate Attendance" 
            CssClass="btn-init"
            OnClick="btnInit_Click" />
    </div>
</form>
</body>
</html>
