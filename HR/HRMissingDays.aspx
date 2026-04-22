<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRMissingDays.aspx.cs" Inherits="databasemile3.HR.HRMissingDays" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR - Missing Days Deduction</title>

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
            width: 860px;
            max-width: 95%;
        }

        .card-header {
            margin-bottom: 18px;
        }

        .card-title {
            margin: 0;
            font-size: 26px;
            color: #0f172a;
            font-weight: 700;
        }

        .card-subtitle {
            margin: 0;
            margin-top: 4px;
            font-size: 13px;
            color: #6b7280;
        }

        .grid {
            margin-top: 18px;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #e5e7eb;
        }

        .grid table {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th, .grid td {
            padding: 10px 12px;
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
        }

        .form-row label {
            font-size: 14px;
            font-weight: 600;
            color: #374151;
        }

        .form-row input {
            margin-top: 6px;
            width: 160px;
            padding: 7px 10px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            font-size: 13px;
        }

        .btn-modern {
            padding: 7px 18px;
            border-radius: 999px;
            border: none;
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            color: #ffffff;
            font-size: 13px;
            font-weight: 600;
            margin-left: 8px;
            cursor: pointer;
            transition: 0.15s;
            box-shadow: 0 6px 14px rgba(37, 99, 235, 0.35);
        }

        .btn-modern:hover {
            filter: brightness(1.07);
            transform: translateY(-1px);
        }

        .message {
            margin-top: 12px;
            font-size: 14px;
            font-weight: 600;
        }

        .message-success { color: #16a34a; }
        .message-error { color: #dc2626; }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="page-wrapper">
            <div class="card">

                <div class="card-header">
                    <h2 class="card-title">Employees with Pending Missing Days Deductions</h2>
                    <p class="card-subtitle">Review employees and process deduction payments</p>
                </div>

                <div class="grid">
                    <asp:GridView ID="gvPendingEmployees" runat="server" AutoGenerateColumns="false"
                        CssClass="table" GridLines="None" EmptyDataText="No pending missing days deductions found.">
                        <Columns>
                            <asp:BoundField DataField="emp_ID" HeaderText="Employee ID" />
                            <asp:BoundField DataField="employee_name" HeaderText="Employee Name" />
                            <asp:BoundField DataField="num_deductions" HeaderText="# Deductions" />
                            <asp:BoundField DataField="total_amount" HeaderText="Total Amount" DataFormatString="{0:C}" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-row">
                    <label>Process Employee ID:</label><br />
                    <asp:TextBox ID="txtEmpId" runat="server" />
                    <asp:Button ID="btnSave" runat="server" Text="Process Missing Days"
                        OnClick="btnSave_Click" CssClass="btn-modern" />
                </div>

                <asp:Label ID="lblResult" runat="server" CssClass="message"></asp:Label>

            </div>
        </div>
    </form>
</body>
</html>
