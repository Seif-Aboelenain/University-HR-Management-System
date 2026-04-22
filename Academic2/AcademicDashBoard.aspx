<%@ Page Title="Academic Dashboard" Language="C#" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <style>
    /* ----- GLOBAL ----- */
    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", sans-serif;
        background: linear-gradient(135deg, #ff9a9e, #fad0c4, #fbc2eb, #a6c1ee);
        background-size: 400% 400%;
        animation: gradientFlow 12s ease infinite;
    }

    @keyframes gradientFlow {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
    }

    /* ----- WRAPPER ----- */
    .dash-wrapper {
        max-width: 950px;
        margin: 40px auto;
        padding: 0 20px;
    }

    .dash-title {
        font-size: 32px;
        font-weight: bold;
        color: #fff;
        margin-bottom: 8px;
        text-shadow: 0 2px 4px rgba(0,0,0,0.4);
    }

    .dash-subtitle {
        font-size: 16px;
        color: #f5f5f5;
        margin-bottom: 25px;
        text-shadow: 0 1px 2px rgba(0,0,0,0.3);
    }

    /* ----- CARD GRID ----- */
    .card-grid {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 20px;
    }

    .dash-card {
        background: rgba(255, 255, 255, 0.92);
        border-radius: 14px;
        border: 1px solid #ddd;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        backdrop-filter: blur(5px);
        transition: 0.15s ease;
        padding: 18px;
    }

    .dash-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 8px 22px rgba(0,0,0,0.22);
    }

    .dash-card h3 {
        font-size: 18px;
        margin-bottom: 6px;
        color: #1E293B;
    }

    .dash-card p {
        font-size: 14px;
        color: #475569;
        margin-bottom: 18px;
    }

    /* ----- BUTTON ----- */
    .dash-btn {
        display: block;
        width: 100%;
        text-align: center;
        padding: 14px 0;
        font-size: 16px;
        font-weight: bold;
        border-radius: 10px;
        text-decoration: none;
        background: linear-gradient(45deg, #36D1DC, #5B86E5);
        color: white !important;
        cursor: pointer;
        transition: 0.15s ease;
    }

    .dash-btn:hover {
        transform: translateY(-2px);
        opacity: 0.9;
    }

    /* ----- RESPONSIVE ----- */
    @media (max-width: 800px) {
        .card-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 550px) {
        .card-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

 <div class="dash-wrapper">
 <h2 class="dash-title">Academic Dashboard</h2>
 <div class="card-grid"> <!--1) Apply Accidental Leave --> <div class="dash-card"> <h3>Accidental Leave</h3> <p>Submit a leave request for sudden emergencies or unexpected events.</p> <asp:HyperLink runat="server" NavigateUrl="~/Academic2/ApplyAccidentalLeave.aspx" CssClass="dash-btn"> Open </asp:HyperLink> </div> <!--2) Apply Medical Leave --> <div class="dash-card"> <h3>Medical Leave</h3> <p>Apply for sick leave, maternity leave, or health-related absence.</p> <asp:HyperLink runat="server" NavigateUrl="~/Academic2/ApplyMedicalLeave.aspx" CssClass="dash-btn"> Open </asp:HyperLink> </div> <!--3) Apply Unpaid Leave --> <div class="dash-card"> <h3>Unpaid Leave</h3> <p>Request unpaid time off when needed for personal situations.</p> <asp:HyperLink runat="server" NavigateUrl="~/Academic2/ApplyUnpaidLeave.aspx" CssClass="dash-btn"> Open </asp:HyperLink> </div> <!--4) Apply Compensation Leave --> <div class="dash-card"> <h3>Compensation Leave</h3> <p>Request compensation for working on official holidays or extra workdays.</p> <asp:HyperLink runat="server" NavigateUrl="~/Academic2/ApplyCompensationLeave.aspx" CssClass="dash-btn"> Open </asp:HyperLink> </div> <!--5) Approve Unpaid Leaves --> <div class="dash-card"> <h3>Approve Unpaid Leaves</h3> <p>Dean / upperboard can approve or reject unpaid leave applications.</p> <asp:HyperLink runat="server" NavigateUrl="~/Academic2/ApproveUnpaidLeaves.aspx" CssClass="dash-btn"> Open </asp:HyperLink> </div> <!--6) Approve Annual Leaves --> <div class="dash-card"> <h3>Approve Annual Leaves</h3> <p>Review and process annual leave requests for your department.</p> <asp:HyperLink runat="server" NavigateUrl="~/Academic2/ApproveAnnualLeaves.aspx" CssClass="dash-btn"> Open </asp:HyperLink> </div> <!--7) Dean Evaluation --> <div class="dash-card"> <h3>Dean Evaluation</h3> <p>Evaluate academic staff performance for a selected semester.</p> <asp:HyperLink runat="server" NavigateUrl="~/Academic2/DeanEvaluateEmployees.aspx" CssClass="dash-btn"> Open </asp:HyperLink> </div> </div> </div></asp:Content>
