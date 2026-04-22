<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminEmpPerDept.aspx.cs" Inherits="databasemile3.Admin1.AdminEmpPerDept" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employees Per Department</title>

    <style>
        .container {
            width: 90%;
            margin: 40px auto;
            font-family: Arial;
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .grid {
            border-collapse: collapse;
            width: 100%;
        }
        .grid th, .grid td {
            border: 1px solid #aaa;
            padding: 8px;
        }
        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">

            <h2 class="title">Number of Employees Per Department</h2>

            <asp:GridView 
                ID="gvDeptCount" 
                runat="server" 
                AutoGenerateColumns="true"
                CssClass="grid">
            </asp:GridView>

            <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>

        </div>
    </form>
</body>
</html>
