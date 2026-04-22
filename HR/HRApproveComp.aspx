<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRApproveComp.aspx.cs" Inherits="databasemile3.HR.HRApproveComp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR - Approve Compensation Leave</title>

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

        .dashboard {
            background: rgba(15, 23, 42, 0.03);
            padding: 28px 32px;
            border-radius: 16px;
            box-shadow: 0 20px 55px rgba(15, 23, 42, 0.4);
            width: 950px;
            max-width: 96%;
            border: 1px solid rgba(255, 255, 255, 0.08);
        }

        .dash-header {
            margin-bottom: 18px;
        }

        .dash-title {
            font-size: 26px;
            margin: 0;
            color: #f9fafb;
        }

        .dash-subtitle {
            font-size: 13px;
            margin: 4px 0 0;
            color: #e5e7eb;
        }

        .chip {
            display: inline-block;
            margin-top: 10px;
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
            margin-top: 18px;
        }

        .form-row label {
            display: block;
            font-weight: 600;
            margin-bottom: 4px;
            color: #f9fafb;
            font-size: 13px;
        }

        .form-row input {
            width: 160px;
            padding: 7px 10px;
            border-radius: 6px;
            border: 1px solid #d1d5db;
            box-sizing: border-box;
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
            margin-left: 8px;
            margin-top: 10px;
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.45);
            transition: transform 0.1s ease, box-shadow 0.1s ease, filter 0.1s ease;
        }

        .btn-modern:hover {
            filter: brightness(1.05);
            transform: translateY(-1px);
            box-shadow: 0 10px 22px rgba(37, 99, 235, 0.6);
        }

        .btn-modern-danger {
            background: linear-gradient(135deg, #dc2626, #b91c1c);
            box-shadow: 0 6px 16px rgba(220, 38, 38, 0.45);
        }

        .message {
            margin-top: 12px;
            font-weight: 600;
            font-size: 13px;
            color: #fecaca;
        }

        .grid {
            margin-top: 18px;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.15);
        }

        .grid table {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th,
        .grid td {
            padding: 10px 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 13px;
        }

        .grid th {
            background: rgba(255, 255, 255, 0.15);
            color: #f9fafb;
            font-weight: 600;
        }

        .grid tr:nth-child(even) td {
            background: rgba(255, 255, 255, 0.05);
        }

        .grid tr:hover td {
            background: rgba(255, 255, 255, 0.12);
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="page-wrapper">
        <div class="dashboard">

            <div class="dash-header">
                <h1 class="dash-title">Approve Compensation Leave</h1>
                <p class="dash-subtitle">Handle and review employee compensation leave requests.</p>
                <span class="chip">HR • Compensation Leave</span>
            </div>

            <div class="grid">
                <asp:GridView ID="gvRequests" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="request_ID" HeaderText="Request ID" />
                        <asp:BoundField DataField="empName" HeaderText="Employee" />
                        <asp:BoundField DataField="date_of_request" HeaderText="Request Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="start_date" HeaderText="Compensation Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="num_days" HeaderText="Days" />
                        <asp:BoundField DataField="final_approval_status" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-row">
                <label for="txtRequestId">Request ID</label>
                <asp:TextBox ID="txtRequestId" runat="server"></asp:TextBox>
            </div>

            <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn-modern" OnClick="btnApprove_Click" />
            <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn-modern btn-modern-danger" OnClick="btnReject_Click" />

            <div class="message">
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </div>

        </div>
    </div>

</form>
</body>
</html>
