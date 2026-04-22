<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRUnpaidDeduction.aspx.cs" Inherits="databasemile3.HR.HRUnpaidDeduction" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>HR - Unpaid Leave Deduction</title>

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
            display: flex;
            justify-content: space-between;
            align-items: center;
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
            letter-spacing: 0.04em;
        }

        .grid {
            margin-top: 14px;
            border-radius: 10px;
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
            display: block;
            font-weight: 600;
            color: #374151;
            font-size: 13px;
            margin-bottom: 6px;
        }

        .form-row input {
            width: 200px;
            padding: 7px 10px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
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
            margin-top: 12px;
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.45);
            transition: transform 0.1s ease, box-shadow 0.1s ease, filter 0.1s ease;
        }

        .btn-modern:hover {
            filter: brightness(1.06);
            transform: translateY(-1px);
            box-shadow: 0 10px 22px rgba(37, 99, 235, 0.55);
        }

        .message {
            margin-top: 14px;
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
                    <div>
                        <h2 class="card-title">Unpaid Leave Deductions</h2>
                        <p class="card-subtitle">Employees with pending unpaid deductions</p>
                    </div>
                    <span class="chip">HR • Deductions</span>
                </div>

                <div class="grid">
                    <asp:GridView ID="gvPendingEmployees" runat="server" AutoGenerateColumns="false"
                                  GridLines="None" EmptyDataText="No pending unpaid deductions found.">
                        <Columns>
                            <asp:BoundField DataField="emp_ID" HeaderText="Employee ID" />
                            <asp:BoundField DataField="employee_name" HeaderText="Employee Name" />
                            <asp:BoundField DataField="num_deductions" HeaderText="# Deductions" />
                            <asp:BoundField DataField="total_amount" HeaderText="Total Amount" DataFormatString="{0:F2}" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-row">
                    <label for="txtEmpId">Process Employee ID:</label>
                    <asp:TextBox ID="txtEmpId" runat="server"></asp:TextBox>
                </div>

                <asp:Button ID="btnSave" runat="server"
                            Text="Calculate &amp; Save Deduction"
                            CssClass="btn-modern"
                            OnClick="btnSave_Click" />

                <div class="message">
                    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
