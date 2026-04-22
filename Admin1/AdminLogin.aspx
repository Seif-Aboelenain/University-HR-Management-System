<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="databasemile3.Admin1.AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, #EEF2F7, #DDE3EB);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background: #ffffff;
            width: 360px;
            padding: 35px 40px;
            border-radius: 14px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
            text-align: left;
            border: 1px solid #e6e9ef;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2F3A4A;
            font-weight: 650;
            font-size: 24px;
        }

        label {
            font-weight: 600;
            margin-bottom: 6px;
            display: block;
            color: #374151;
            font-size: 14px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 11px;
            border-radius: 6px;
            border: 1px solid #C7CCD6;
            font-size: 14px;
            margin-bottom: 20px;
            background-color: #F9FAFB;
            transition: 0.25s ease;
        }

        input:focus {
            border-color: #3A6DFF;
            outline: none;
            box-shadow: 0 0 6px rgba(58, 109, 255, 0.35);
            background: #ffffff;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: #3A6DFF;
            border: none;
            color: #ffffff;
            font-size: 15px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.25s ease;
        }

        .btn-login:hover {
            background-color: #2F54CC;
        }

        .security-note {
            text-align: center;
            margin-top: 15px;
            font-size: 12px;
            color: #6B7280;
            line-height: 1.4;
        }

        .link-dashboard {
            display: block;
            margin-top: 14px;
            text-align: center;
            color: #0A84FF;
            text-decoration: none;
            font-weight: 600;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <div class="login-box">

        <!-- Safe lock icon (no SVG) -->
        <div style="text-align:center; font-size:48px; color:#3A6DFF; margin-bottom:8px;">
            🔒
        </div>

        <h2>Admin Login</h2>

        <label>Username</label>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

        <label>Password</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>


        <div class="security-note">
            ⚠️ Do not share your username or password.<br />
            This system is monitored for security.
        </div>

    </div>
</form>
</body>
</html>
