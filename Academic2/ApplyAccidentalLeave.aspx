<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ApplyAccidentalLeave.aspx.cs"
    Inherits="databasemile3.Academic2.ApplyAccidentalLeave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
 body { margin:0; padding:0; background: linear-gradient(135deg,#ff9a9e,#fad0c4,#fbc2eb,#a6c1ee);
        background-size:400%400%; animation:gradientFlow 12s ease infinite; font-family:"Segoe UI",sans-serif; }

 @keyframes gradientFlow {
     0%{ background-position:0% 50%; }
     50%{ background-position:100% 50%; }
     100%{ background-position:0% 50%; }
 }

 .form-wrapper{ max-width:600px; margin:50px auto; padding:0 20px; }
 .form-card{ background:rgba(255,255,255,0.95); border-radius:16px; padding:24px;
             border:1px solid #e2e2e2; box-shadow:0 6px 18px rgba(0,0,0,0.18); backdrop-filter:blur(4px); }

 .form-title{ font-size:22px; font-weight:700; margin-bottom:6px; color:#111827; }
 .form-desc{ font-size:14px; color:#4B5563; margin-bottom:18px; }

 .form-row{ margin-bottom:14px; display:flex; flex-direction:column; }
 .form-label{ font-size:14px; color:#1F2937; margin-bottom:4px; }

 .form-input{ border-radius:8px; border:1px solid #CBD5E1; padding:8px 10px; font-size:14px; outline:none; }
 .form-input:focus{ border-color:#3B82F6; box-shadow:0 0 0 2px rgba(59,130,246,0.20); }

 .form-btn{ width:100%; padding:12px 0; font-size:16px; font-weight:600;
            border-radius:10px; border:none; cursor:pointer;
            background:linear-gradient(45deg,#36D1DC,#5B86E5); color:#fff; margin-top:10px; }
 .form-btn:hover{ opacity:0.9; transform:translateY(-1px); }

 .form-message{ margin-top:12px; font-size:14px; color:#B91C1C; }
</style>

<div class="form-wrapper">
 <div class="form-card">

     <h2 class="form-title">Apply for Accidental Leave</h2>
     <p class="form-desc">Choose the start and end dates for your accidental leave request.</p>

     <div class="form-row">
         <span class="form-label">Start Date</span>
         <asp:TextBox ID="txtAccStartDate" runat="server" TextMode="Date" CssClass="form-input" />
     </div>

     <div class="form-row">
         <span class="form-label">End Date</span>
         <asp:TextBox ID="txtAccEndDate" runat="server" TextMode="Date" CssClass="form-input" />
     </div>

     <!-- ✅ SUBMIT BUTTON -->
     <asp:Button ID="btnSubmit" runat="server" Text="Submit Request"
                 CssClass="form-btn" OnClick="btnSubmit_Click" />

     <!-- ✅ MESSAGE LABEL -->
     <asp:Label ID="lblAccMessage" runat="server" CssClass="form-message"></asp:Label>

 </div>
</div>

</asp:Content>
