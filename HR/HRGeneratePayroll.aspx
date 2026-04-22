<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRGeneratePayroll.aspx.cs" Inherits="databasemile3.HR.HRGeneratePayroll" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR - Generate Payroll</title>

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
        }

        .card-subtitle {
            margin: 0;
            font-size: 13px;
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

        .form-row {
            margin-bottom: 14px;
        }

        .form-row label {
            display: block;
            font-weight: 600;
            margin-bottom: 4px;
            color: #374151;
            font-size: 13px;
        }

        .form-row input[type="text"],
        .form-row input[type="date"] {
            width: 100%;
            padding: 7px 10px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            box-sizing: border-box;
            font-size: 13px;
        }

        /* Buttons */
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
            margin-top: 6px;
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.45);
            transition: transform 0.1s ease, box-shadow 0.1s ease, filter 0.1s ease;
        }

        .btn-modern:hover {
            filter: brightness(1.05);
            transform: translateY(-1px);
            box-shadow: 0 10px 22px rgba(37, 99, 235, 0.6);
        }

        .btn-modern:active {
            transform: translateY(0);
            box-shadow: 0 4px 10px rgba(37, 99, 235, 0.4);
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

        .grid th, .grid td {
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

        .message {
            margin-top: 10px;
            font-weight: 600;
            font-size: 13px;
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
    <form id="form1" runat="server">
        <div class="page-wrapper">
            <div class="card">

                <div class="card-header">
                    <div>
                        <h2 class="card-title">Generate Monthly Payroll</h2>
                        <p class="card-subtitle">Process salary payments for any employee within a selected period.</p>
                    </div>
                    <span class="chip">Payroll</span>
                </div>

                <div class="form-row">
                    <label>Employee ID:</label>
                    <asp:TextBox ID="txtEmpId" runat="server" />
                </div>

                <div class="form-row">
                    <label>From Date (yyyy-mm-dd):</label>
                    <asp:TextBox ID="txtFromDate" runat="server" />
                </div>

                <div class="form-row">
                    <label>To Date (yyyy-mm-dd):</label>
                    <asp:TextBox ID="txtToDate" runat="server" />
                </div>

                <asp:Button ID="btnGenerate" runat="server"
                            Text="Generate Payroll"
                            CssClass="btn-modern"
                            OnClick="Generate_Click" />

                <asp:Label ID="lblResult" runat="server" CssClass="message" />

                <div class="grid">
                    <asp:GridView ID="gvPayroll" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="payment_date" HeaderText="Payment Date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="final_salary_amount" HeaderText="Final Salary" />
                            <asp:BoundField DataField="from_date" HeaderText="From" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="to_date" HeaderText="To" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="comments" HeaderText="Comments" />
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
