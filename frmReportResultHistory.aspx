<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmReportResultHistory.aspx.cs" Inherits="School_Dashboard.WebForm32" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server"  Width="100%" Height="80%" BorderStyle="Solid" ></rsweb:ReportViewer>
    

</asp:Content>
