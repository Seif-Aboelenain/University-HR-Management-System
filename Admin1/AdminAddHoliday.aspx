<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminAddHoliday.aspx.cs" Inherits="databasemile3.Admin1.AdminAddHoliday" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(to bottom right, #EEF2F7, #DDE3EB);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
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
        }

        .btn-submit:hover {
            background-color: #2F54CC;
        }

        .message {
            margin-top: 10px;
            font-size: 14px;
            text-align: center;
            font-weight: 600;
        }

        .error {
            color: red !important;
        }

        .success {
            color: green !important;
        }
    </style>

    <div class="card">
        <h2>Add a New Official Holiday</h2>

        <asp:Label ID="lblMsg" runat="server" CssClass="message"></asp:Label>

        <label>Holiday Name:</label>
        <asp:TextBox ID="txtHolidayName" runat="server" CssClass="textbox"></asp:TextBox>

        <label>Holiday Date (YYYY-MM-DD):</label>
        <asp:TextBox ID="txtHolidayDate" runat="server" CssClass="textbox"></asp:TextBox>

        <asp:Button 
            ID="btnAddHoliday" 
            runat="server" 
            Text="Add Holiday"
            CssClass="btn-submit"
            OnClick="btnAddHoliday_Click" />
        
    </div>
</asp:Content>
