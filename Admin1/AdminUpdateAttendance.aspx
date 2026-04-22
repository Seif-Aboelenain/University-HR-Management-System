<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUpdateAttendance.aspx.cs" Inherits="databasemile3.Admin1.AdminUpdateAttendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Attendance</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(to bottom right, #EEF2F7, #DDE3EB);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: #fff;
            width: 420px;
            padding: 35px 40px;
            border-radius: 14px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        h2 {
            text-align: center;
            font-size: 26px;
            font-weight: 650;
            margin-bottom: 25px;
            color: #2F3A4A;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #374151;
            font-size: 14px;
        }

        .textbox {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #C7CCD6;
            font-size: 14px;
            margin-bottom: 18px;
            background-color: #F9FAFB;
            transition: 0.25s;
        }

        .textbox:focus {
            border-color: #3A6DFF;
            outline: none;
            box-shadow: 0 0 6px rgba(58,109,255,0.35);
            background-color: #fff;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #3A6DFF;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.25s;
        }

        .btn-submit:hover {
            background-color: #2F54CC;
        }

        .message {
            margin-top: 12px;
            text-align: center;
            font-size: 14px;
            font-weight: 600;
        }
    </style>

</head>

<body>
    <form id="form1" runat="server">
        <div class="card">

            <h2>Update Attendance</h2>

            <asp:Label ID="lblMsg" runat="server" CssClass="message"></asp:Label>

            <label>Employee ID:</label>
            <asp:TextBox ID="txtEmpID" runat="server" CssClass="textbox"></asp:TextBox>

            <label>Check-in Time:</label>
            <asp:TextBox ID="txtCheckIn" runat="server" placeholder="HH:MM:SS" CssClass="textbox"></asp:TextBox>

            <label>Check-out Time:</label>
            <asp:TextBox ID="txtCheckOut" runat="server" placeholder="HH:MM:SS" CssClass="textbox"></asp:TextBox>

            <asp:Button ID="btnUpdate" runat="server" Text="Update Attendance" CssClass="btn-submit" OnClick="btnUpdate_Click" />

        </div>
    </form>
</body>
</html>
