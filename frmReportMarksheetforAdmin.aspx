<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmReportMarksheetforAdmin.aspx.cs" Inherits="School_Dashboard.WebForm28" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <br />

    <br />
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server"  Width="50%" ></rsweb:ReportViewer>

    <br />
    <div>
        
                
    </div>
    
       
</asp:Content>
