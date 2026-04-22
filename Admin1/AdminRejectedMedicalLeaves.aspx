<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRejectedMedicalLeaves.aspx.cs" Inherits="databasemile3.Admin1.AdminRejectedMedicalLeaves" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rejected Medical Leaves</title>

    <style>
        .container {
            width: 90%;
            margin: 40px auto;
            font-family: Arial;
        }
        .title {
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: bold;
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

        <h2 class="title">All Rejected Medical Leaves</h2>

        <asp:GridView ID="gvRejectedMedical" runat="server" CssClass="grid" AutoGenerateColumns="true"></asp:GridView>

        <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>

    </div>
</form>
</body>
</html>
