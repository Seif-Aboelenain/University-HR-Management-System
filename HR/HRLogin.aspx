<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRLogin.aspx.cs" Inherits="databasemile3.HR.HRLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR Login</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #1d4ed8, #9333ea);
            margin: 0;
            padding: 0;
        }

        .page-wrapper {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dashboard {
            background: rgba(15, 23, 42, 0.03);
            padding: 28px 32px;
            border-radius: 16px;
            box-shadow: 0 20px 55px rgba(15, 23, 42, 0.4);
            width: 420px;
            max-width: 95%;
            border: 1px solid rgba(255, 255, 255, 0.08);
        }

        .dash-header {
            margin-bottom: 18px;
            text-align: left;
        }

        .dash-title {
            font-size: 24px;
            margin: 0;
            color: #f9fafb;
        }

        .dash-subtitle {
            font-size: 13px;
            margin: 4px 0 0;
            color: #e5e7eb;
        }

        .chip {
            display: inline-block;
            margin-top: 10px;
            padding: 4px 10px;
            border-radius: 999px;
            background: #e0f2fe;
            color: #0369a1;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.04em;
        }

        .form-row {
            margin-bottom: 14px;
        }

        .form-row label {
            display: block;
            font-weight: 600;
            margin-bottom: 4px;
            color: #f9fafb;
            font-size: 13px;
        }

        .form-row input[type="text"],
        .form-row input[type="password"] {
            width: 100%;
            padding: 7px 10px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            box-sizing: border-box;
            font-size: 13px;
        }

        .btn-modern {
            display: inline-block;
            padding: 7px 18px;
            border-radius: 999px;
            border: none;
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            color: #ffffff;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 6px;
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.45);
            transition: transform 0.1s ease, box-shadow 0.1s ease, filter 0.1s ease;
            width: 100%;
            text-align: center;
        }

        .btn-modern:hover {
            filter: brightness(1.05);
            transform: translateY(-1px);
            box-shadow: 0 10px 22px rgba(37, 99, 235, 0.6);
        }

        .btn-modern:active {
            transform: translateY(0);
            box-shadow: 0 4px 10px rgba(37, 99, 235, 0.4);
        }

        .message {
            margin-top: 10px;
            font-weight: 600;
            font-size: 13px;
            color: #fecaca;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-wrapper">
            <div class="dashboard">
                <div class="dash-header">
                    <h1 class="dash-title">HR Login</h1>
                    <p class="dash-subtitle">Sign in to access the HR control panel.</p>
                    <span class="chip">HR • Secure Access</span>
                </div>

                <div class="form-row">
                    <label for="txtEmail">Email or ID</label>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </div>

                <asp:Button ID="btnLogin" runat="server"
                            Text="Login"
                            CssClass="btn-modern"
                            OnClick="btnLogin_Click" />

                <div class="message">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
