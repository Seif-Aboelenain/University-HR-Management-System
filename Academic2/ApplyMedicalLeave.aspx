<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"
 AutoEventWireup="true" CodeBehind="ApplyMedicalLeave.aspx.cs"
 Inherits="databasemile3.Academic2.ApplyMedicalLeave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <style>
 body {
 margin:0;
 padding:0;
 background: linear-gradient(135deg, #ff9a9e, #fad0c4, #fbc2eb, #a6c1ee);
 background-size:400%400%;
 animation: gradientFlow12s ease infinite;
 font-family: "Segoe UI", sans-serif;
 }

 @keyframes gradientFlow {
0% { background-position:0%50%; }
50% { background-position:100%50%; }
100% { background-position:0%50%; }
 }

 .form-wrapper {
 max-width:650px;
 margin:50px auto;
 padding:020px;
 }

 .form-card {
 background: rgba(255,255,255,0.95);
 border-radius:16px;
 padding:24px;
 border:1px solid #e2e2e2;
 box-shadow:0px6px18px rgba(0,0,0,0.18);
 backdrop-filter: blur(4px);
 }

 .form-title {
 font-size:22px;
 font-weight:700;
 margin-bottom:6px;
 color: #111827;
 }

 .form-desc {
 font-size:14px;
 color: #4B5563;
 margin-bottom:18px;
 }

 .form-row {
 margin-bottom:14px;
 display: flex;
 flex-direction: column;
 }

 .form-label {
 font-size:14px;
 color: #1F2937;
 margin-bottom:4px;
 }

 .form-input, .form-textarea {
 border-radius:8px;
 border:1px solid #CBD5E1;
 padding:8px10px;
 font-size:14px;
 outline: none;
 }

 .form-textarea {
 min-height:70px;
 resize: vertical;
 }

 .form-input:focus, .form-textarea:focus {
 border-color: #3B82F6;
 box-shadow:0002px rgba(59,130,246,0.20);
 }

 .form-checkbox-row {
 display: flex;
 align-items: center;
 gap:8px;
 margin-bottom:14px;
 }

 .form-btn {
 margin-top:8px;
 width:100%;
 padding:12px0;
 font-size:16px;
 font-weight:600;
 border-radius:10px;
 border: none;
 cursor: pointer;
 background: linear-gradient(45deg, #36D1DC, #5B86E5);
 color: #ffffff;
 transition:0.15s ease;
 }

 .form-btn:hover {
 opacity:0.9;
 transform: translateY(-1px);
 }

 .form-message {
 margin-top:12px;
 font-size:14px;
 color: #B91C1C;
 }
 </style>

 <div class="form-wrapper">
 <div class="form-card">
 <h2 class="form-title">Apply for Medical Leave</h2>
 <p class="form-desc">
 Fill in the medical leave details, including dates, type and document information.
 </p>

 <div class="form-row">
 <span class="form-label">Start Date</span>
 <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-input" />
 </div>

 <div class="form-row">
 <span class="form-label">End Date</span>
 <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-input" />
 </div>

 <div class="form-row">
 <span class="form-label">Medical Type (e.g. sick, maternity)</span>
 <asp:TextBox ID="txtMedicalType" runat="server" CssClass="form-input" />
 </div>

 <div class="form-checkbox-row">
 <asp:CheckBox ID="chkInsurance" runat="server" />
 <span class="form-label">Covered by insurance?</span>
 </div>

 <div class="form-row">
 <span class="form-label">Disability details (if any)</span>
 <asp:TextBox ID="txtDisabilityDetails" runat="server"
 TextMode="MultiLine" CssClass="form-textarea" />
 </div>

 <div class="form-row">
 <span class="form-label">Document description</span>
 <asp:TextBox ID="txtDocumentDescription" runat="server" CssClass="form-input" />
 </div>

 <div class="form-row">
 <span class="form-label">Document file name</span>
 <asp:TextBox ID="txtFileName" runat="server" CssClass="form-input" />
 </div>

 <asp:Button ID="btnSubmitMedical" runat="server"
 Text="Submit Medical Leave"
 CssClass="form-btn"
 OnClick="btnSubmitMedical_Click" />

 <asp:Label ID="lblMessage" runat="server" CssClass="form-message" />
 </div>
 </div>

</asp:Content>
