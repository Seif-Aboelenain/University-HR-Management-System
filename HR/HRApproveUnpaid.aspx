<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRApproveUnpaid.aspx.cs" Inherits="databasemile3.HR.HRApproveUnpaid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>HR Unpaid Leave Approval</title>

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
            margin-top: 4px;
            font-size: 13px;
            color: #6b7280;
        }

        .chip {
            margin-top: 10px;
            padding: 4px 10px;
            border-radius: 999px;
            background: #e0f2fe;
            color: #0369a1;
            font-size: 11px;
            font-weight: 600;
            display: inline-block;
            text-transform: uppercase;
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
            margin-bottom: 10px;
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
    <form id="form1" runat="server">
        <div class="page-wrapper">
            <div class="card">

                <div class="card-header">
                    <h2 class="card-title">HR Unpaid Leave Approval</h2>
                    <p class="card-subtitle">Review and approve unpaid leave requests</p>
                    <span class="chip">HR Panel</span>
                </div>

                <div class="grid">
                    <asp:GridView ID="gvRequests" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="request_ID" HeaderText="Request ID" />
                            <asp:BoundField DataField="empName" HeaderText="Employee" />
                            <asp:BoundField DataField="date_of_request" HeaderText="Date of Request" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="start_date" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="end_date" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="num_days" HeaderText="Days" />
                            <asp:BoundField DataField="final_approval_status" HeaderText="Status" />
                            <asp:BoundField DataField="annualbalance" HeaderText="Annual Balance" />
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="form-row">
                    <asp:Label ID="lblRequestId" runat="server" Text="Request ID:" AssociatedControlID="txtRequestId" />
                    <asp:TextBox ID="txtRequestId" runat="server" Width="120px" />
                </div>

                <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn-modern" OnClick="btnApprove_Click" />
                <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn-modern" OnClick="btnReject_Click" />

                <div class="message">
                    <asp:Label ID="lblResult" runat="server" Text="" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>
