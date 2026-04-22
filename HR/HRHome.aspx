<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HRHome.aspx.cs" Inherits="databasemile3.HR.HRHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    width: 1000px;
    max-width: 95%;
}


        .dash-header {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-bottom: 20px;
        }

       .dash-title {
    font-size: 26px;
    margin: 0;
    color: #f9fafb;   
}

.dash-subtitle {
    font-size: 13px;
    margin: 2px 0 0;
    color: #e5e7eb;  
}

        .dash-chip {
            padding: 4px 10px;
            border-radius: 999px;
            background: #e0f2fe;
            color: #0369a1;
            font-size: 11px;
            font-weight: 600;
            letter-spacing: 0.06em;
            text-transform: uppercase;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 16px;
            margin-top: 8px;
        }

        .action-card {
    border-radius: 14px;
    padding: 16px 18px;
    border: 1px solid rgba(255, 255, 255, 0.2);
    background: linear-gradient(145deg, rgba(37, 99, 235, 0.12), rgba(147, 51, 234, 0.10));
    box-shadow: 0 10px 24px rgba(15, 23, 42, 0.25);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 120px;
}


        .action-title {
    font-size: 15px;
    font-weight: 600;
    color: #f9fafb;    
    margin-bottom: 4px;
}

.action-desc {
    font-size: 12px;
    color: #e5e7eb;
    margin-bottom: 10px;
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
            margin-top: 4px;
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

        .btn-modern-secondary {
            background: linear-gradient(135deg, #6b7280, #4b5563);
            box-shadow: 0 6px 16px rgba(55, 65, 81, 0.45);
        }

        .btn-modern-danger {
            background: linear-gradient(135deg, #dc2626, #b91c1c);
            box-shadow: 0 6px 16px rgba(220, 38, 38, 0.45);
        }
    </style>

 <div class="page-wrapper">
 <div class="dashboard">
 <div class="dash-header">
 <div>
 <h1 class="dash-title">Welcome, HR!</h1>
 <p class="dash-subtitle">Review leaves, manage deductions, and generate payroll from one place.</p>
 </div>
 <span class="dash-chip">HR • Dashboard</span>
 </div>

 <div class="card-grid">
 <div class="action-card">
 <div>
 <div class="action-title">Missing Hours Deductions</div>
 <div class="action-desc">View and process deductions for yesterday</div>
 </div>
 <asp:Button ID="btnDeductions" runat="server"
 Text="Open"
 CssClass="btn-modern btn-modern-secondary"
 PostBackUrl="~/HR/HRDeductions.aspx" />
 </div>

 <div class="action-card">
 <div>
 <div class="action-title">Missing Days Deductions</div>
 <div class="action-desc">Handle deductions for absent days that are not justified.</div>
 </div>
 <asp:Button ID="btnMissingDays" runat="server"
 Text="Open"
 CssClass="btn-modern btn-modern-secondary"
 PostBackUrl="~/HR/HRMissingDays.aspx" />
 </div>

 <div class="action-card">
 <div>
 <div class="action-title">Unpaid Leave Deductions</div>
 <div class="action-desc">Generate deductions related to approved unpaid leave requests.</div>
 </div>
 <asp:Button ID="btnUnpaidDeduction" runat="server"
 Text="Open"
 CssClass="btn-modern btn-modern-secondary"
 PostBackUrl="~/HR/HRUnpaidDeduction.aspx" />
 </div>

 <div class="action-card">
 <div>
 <div class="action-title">Approve Annual / Accidental</div>
 <div class="action-desc">Review and decide on annual and accidental leave requests.</div>
 </div>
 <asp:Button ID="btnApproveAnAcc" runat="server"
 Text="Open"
 CssClass="btn-modern"
 PostBackUrl="~/HR/HRApproveAnAcc.aspx" />
 </div>

 <div class="action-card">
 <div>
 <div class="action-title">Approve Unpaid Leaves</div>
 <div class="action-desc">Approve or reject unpaid leave requests that reached HR.</div>
 </div>
 <asp:Button ID="btnApproveUnpaid" runat="server"
 Text="Open"
 CssClass="btn-modern"
 PostBackUrl="~/HR/HRApproveUnpaid.aspx" />
 </div>

 <div class="action-card">
 <div>
 <div class="action-title">Approve Compensation Leaves</div>
 <div class="action-desc">Validate compensation requests for working on official days off.</div>
 </div>
 <asp:Button ID="btnApproveComp" runat="server"
 Text="Open"
 CssClass="btn-modern btn-modern-secondary"
 PostBackUrl="~/HR/HRApproveComp.aspx" />
 </div>

 <div class="action-card">
 <div>
 <div class="action-title">Generate Payroll</div>
 <div class="action-desc">Calculate final salaries including bonuses and all deductions.</div>
 </div>
 <asp:Button ID="btnGeneratePayroll" runat="server"
 Text="Open"
 CssClass="btn-modern btn-modern-danger"
 PostBackUrl="~/HR/HRGeneratePayroll.aspx" />
 </div>
 </div>
 </div>
 </div>
</asp:Content>
