<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRemoveDeductions.aspx.cs"
    Inherits="databasemile3.Admin1.AdminRemoveDeductions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Remove Deductions for Resigned Employees</title>

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
            width: 480px;
            padding: 40px 45px;
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

        .btn-remove {
            width: 100%;
            padding: 12px;
            background-color: #3A6DFF;
            border: none;
            color: #fff;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.25s ease;
        }

        .btn-remove:hover {
            background-color: #2F54CC;
        }

        .msg {
            margin-top: 20px;
            font-size: 15px;
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

        <h2>Remove Deductions for Resigned Employees</h2>

        <asp:Button 
            ID="btnRemove" 
            runat="server"
            Text="Remove Deductions"
            CssClass="btn-remove"
            OnClick="btnRemove_Click" />

        <asp:Label 
            ID="lblMessage" 
            runat="server" 
            CssClass="msg"></asp:Label>

    </div>
</form>
</body>
</html>
