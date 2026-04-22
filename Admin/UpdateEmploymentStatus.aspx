<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateEmploymentStatus.aspx.cs" Inherits="databasemile3.Admin.UpdateEmploymentStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* 🌼 Corporate Blue Modern Style */
        .corp-box {
            background: #F3F7FF;
            padding: 25px;
            border-radius: 10px;
            width: 420px;
            border: 1px solid #B7CDF8;
            margin-top: 25px;
            font-family: 'Segoe UI', sans-serif;
        }

        .corp-title {
            color: #1F3A93;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .corp-input {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #93B2F0;
            margin-bottom: 18px;
            background: #FFFFFF;
        }

        .corp-button {
            background: #3A6FF7;
            color: white;
            padding: 12px 22px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .corp-button:hover {
            background: #2C58C7;
        }

        .corp-success {
            color: #2ECC71;
            margin-top: 15px;
            font-weight: bold;
        }

        .corp-error {
            color: #E74C3C;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>

    <div class="corp-box">
        <h3 class="corp-title">Update Employment Status</h3>

        <asp:TextBox ID="EmpID" runat="server" CssClass="corp-input"
            placeholder="Enter Employee ID"></asp:TextBox>

        <asp:Button ID="Button1" runat="server"
            Text="Update Status"
            CssClass="corp-button"
            OnClick="Button1_Click" />

        <asp:Label ID="ResultLabel" runat="server"></asp:Label>
    </div>

</asp:Content>
