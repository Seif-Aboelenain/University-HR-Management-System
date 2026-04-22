<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRDeductions.aspx.cs" Inherits="databasemile3.HR.HRDeductions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR - Missing Hours Deductions</title>

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
            padding: 30px;
        }

        .card {
            background: #ffffff;
            padding: 28px 32px;
            border-radius: 14px;
            box-shadow: 0 18px 45px rgba(15, 23, 42, 0.35);
            width: 900px;
            max-width: 95%;
        }

        .card-header {
            margin-bottom: 18px;
        }

        .card-title {
            margin: 0;
            font-size: 26px;
            color: #0f172a;
        }

        .card-subtitle {
            margin: 0;
            font-size: 13px;
            margin-top: 4px;
            color: #6b7280;
        }

        .chip {
            padding: 4px 10px;
            border-radius: 999px;
            background: #e0f2fe;
            color: #0369a1;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            display: inline-block;
            margin-top: 10px;
        }

        .grid {
            margin-top: 16px;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #e5e7eb;
        }

        .grid table {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th,
        .grid td {
            padding: 8px 10px;
            border-bottom: 1px solid #e5e7eb;
            font-size: 13px;
        }

        .grid th {
            background: #f9fafb;
            font-weight: 600;
            color: #374151;
        }

        .grid tr:nth-child(even) td {
            background: #f9fafb;
        }

        .grid tr:hover td {
            background: #eff6ff;
        }

        .form-row {
            margin-top: 20px;
            margin-bottom: 12px;
        }

        .form-row label {
            font-size: 14px;
            font-weight: 600;
            color: #374151;
        }

        .form-row input {
            margin-left: 10px;
            padding: 6px 10px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
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
            margin-right: 8px;
            margin-top: 8px;
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.45);
            transition: 0.1s ease;
        }

        .btn-modern:hover {
            filter: brightness(1.05);
            transform: translateY(-1px);
            box-shadow: 0 10px 22px rgba(37, 99, 235, 0.6);
        }

        .message {
            margin-top: 12px;
            font-size: 13px;
            font-weight: 600;
        }

        .message-success {
            color: #16a34a;
        }

        .message-error {
            color: #dc2626;
        }
    </style>
</head>

<body>
    <form id="form2" runat="server">
        <div class="page-wrapper">
            <div class="card">

                <div class="card-header">
                    <h2 class="card-title">Missing Hours Deductions</h2>
                    <p class="card-subtitle">Review employees with pending deductions</p>
                    <span class="chip">HR Panel</span>
                </div>

                <div class="grid">
                    <asp:GridView ID="gvPendingEmployees" runat="server" AutoGenerateColumns="false"
                        EmptyDataText="No pending missing hours deductions found.">
                        <Columns>
                            <asp:BoundField DataField="emp_ID" HeaderText="Employee ID" />
                            <asp:BoundField DataField="employee_name" HeaderText="Employee Name" />
                            <asp:BoundField DataField="num_deductions" HeaderText="# Deductions" />
                            <asp:BoundField DataField="total_amount" HeaderText="Total Amount" DataFormatString="{0:C}" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-row">
                    <asp:Label ID="Label1" runat="server" Text="Process Employee ID:" />
                    <asp:TextBox ID="txtEmpId" runat="server" Width="120px" />
                </div>

                <asp:Button ID="btnSaveDeduction" runat="server" Text="Process Missing Hours"
                    CssClass="btn-modern" OnClick="btnSaveDeduction_Click" />

                <div class="message">
                    <asp:Label ID="lblResult" runat="server" Text="" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>
