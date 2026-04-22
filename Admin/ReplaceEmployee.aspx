<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReplaceEmployee.aspx.cs" Inherits="databasemile3.Admin.ReplaceEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* 🌸 Pastel Aesthetic UI */

        .pastel-box {
            background: #FFF6F7;
            padding: 25px;
            border-radius: 12px;
            width: 450px;
            border: 1px solid #F1A7B3;
            font-family: 'Segoe UI', sans-serif;
            margin-top: 25px;
            color: #333;
        }

        .pastel-input {
            width: 100%;
            padding: 12px;
            border: 1px solid #F1A7B3;
            border-radius: 6px;
            margin-bottom: 18px;
            background: #FFFDFD;
            color: #333;
        }

        .pastel-button {
            background: #F7C5CC;
            border: none;
            padding: 12px 22px;
            color: #333;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .pastel-button:hover {
            background: #F5A9B8;
        }

        .pastel-success {
            color: #2ECC71;
            margin-top: 15px;
            font-weight: bold;
        }

        .pastel-error {
            color: #E74C3C;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>

    <div class="pastel-box">
        <h3>Replace Employee</h3>

        <asp:TextBox ID="Emp1" runat="server" CssClass="pastel-input"
            placeholder="Enter Employee ID to Replace"></asp:TextBox>

        <asp:TextBox ID="Emp2" runat="server" CssClass="pastel-input"
            placeholder="Enter Replacement Employee ID"></asp:TextBox>

        <asp:TextBox ID="FromDate" runat="server" CssClass="pastel-input"
            placeholder="From Date (yyyy-mm-dd)"></asp:TextBox>

        <asp:TextBox ID="ToDate" runat="server" CssClass="pastel-input"
            placeholder="To Date (yyyy-mm-dd)"></asp:TextBox>

        <asp:Button ID="Button1" runat="server"
            Text="Replace Employee"
            CssClass="pastel-button"
            OnClick="Button1_Click" />

        <asp:Label ID="ResultLabel" runat="server"></asp:Label>
    </div>

</asp:Content>
