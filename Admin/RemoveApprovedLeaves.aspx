<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RemoveApprovedLeaves.aspx.cs" Inherits="databasemile3.Admin.RemoveApprovedLeaves" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* 🌙 Sleek Dark Modern UI */
        .dark-box {
            background: #1E1E1E;
            padding: 25px;
            border-radius: 12px;
            width: 440px;
            color: white;
            font-family: 'Segoe UI', sans-serif;
            margin-top: 25px;
        }

        .dark-input {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: none;
            margin-bottom: 18px;
            background: #2D2D2D;
            color: white;
        }

        .dark-button {
            background: #3A82F7;
            border: none;
            padding: 12px 22px;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .dark-button:hover {
            background: #1E66D0;
        }

        .dark-success {
            color: #4ECF78;
            margin-top: 15px;
            font-weight: bold;
        }

        .dark-error {
            color: #FF6B6B;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>

    <div class="dark-box">
        <h3>Remove Approved Leaves</h3>

        <asp:TextBox ID="EmployeeID" runat="server" CssClass="dark-input"
            placeholder="Enter Employee ID"></asp:TextBox>

        <asp:Button ID="Button1" runat="server"
            Text="Remove Approved Leave Records"
            OnClick="Button1_Click"
            CssClass="dark-button" />

        <asp:Label ID="ResultLabel" runat="server"></asp:Label>
    </div>

</asp:Content>
