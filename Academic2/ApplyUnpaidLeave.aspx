<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"
 AutoEventWireup="true" CodeBehind="ApplyUnpaidLeave.aspx.cs"
 Inherits="databasemile3.Academic2.ApplyUnpaidLeave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <style>
 body{ margin:0; padding:0; background: linear-gradient(135deg,#ff9a9e,#fad0c4,#fbc2eb,#a6c1ee); background-size:400%400%; animation:gradientFlow12s ease infinite; font-family:"Segoe UI",sans-serif }
 @keyframes gradientFlow{0%{background-position:0%50%}50%{background-position:100%50%}100%{background-position:0%50%}}
 .form-wrapper{ max-width:600px; margin:50px auto; padding:020px }
 .form-card{ background:rgba(255,255,255,0.95); border-radius:16px; padding:24px; border:1px solid #e2e2e2; box-shadow:0px6px18px rgba(0,0,0,0.18); backdrop-filter: blur(4px) }
 .form-title{ font-size:22px; font-weight:700; margin-bottom:6px; color:#111827 }
 .form-desc{ font-size:14px; color:#4B5563; margin-bottom:18px }
 .form-row{ margin-bottom:14px; display:flex; flex-direction:column }
 .form-label{ font-size:14px; color:#1F2937; margin-bottom:4px }
 .form-input{ border-radius:8px; border:1px solid #CBD5E1; padding:8px10px; font-size:14px; outline:none }
 .form-input:focus{ border-color:#3B82F6; box-shadow:0002px rgba(59,130,246,0.20) }
 .form-btn{ margin-top:8px; width:100%; padding:12px0; font-size:16px; font-weight:600; border-radius:10px; border:none; cursor:pointer; background:linear-gradient(45deg,#36D1DC,#5B86E5); color:#fff }
 .form-btn:hover{ opacity:0.9; transform:translateY(-1px) }
 .form-message{ margin-top:12px; font-size:14px; color:#B91C1C }
 </style>

 <div class="form-wrapper">
 <div class="form-card">
 <h2 class="form-title">Apply for Unpaid Leave</h2>
 <p class="form-desc">Submit an unpaid leave request with the required dates and document details.</p>

 <div class="form-row">
 <span class="form-label">Start Date</span>
 <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-input" />
 </div>

 <div class="form-row">
 <span class="form-label">End Date</span>
 <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-input" />
 </div>

 <div class="form-row">
 <span class="form-label">Document description</span>
 <asp:TextBox ID="txtDocumentDescription" runat="server" CssClass="form-input" />
 </div>

 <div class="form-row">
 <span class="form-label">Document file name</span>
 <asp:TextBox ID="txtFileName" runat="server" CssClass="form-input" />
 </div>

 <asp:Button ID="btnSubmitUnpaid" runat="server" Text="Submit Unpaid Leave" CssClass="form-btn" OnClick="btnSubmitUnpaid_Click" />
 <asp:Label ID="lblMessage" runat="server" CssClass="form-message" />
 </div>
 </div>
</asp:Content>
