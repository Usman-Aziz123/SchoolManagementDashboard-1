<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmStudentsReport.aspx.cs" Inherits="School_Dashboard.WebForm22" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server"  Width="100%" Height="80%" BorderStyle="Solid" ></rsweb:ReportViewer>
    <br />
    <br />
    <strong>
    <asp:Label ID="Label1" runat="server" Text="Total Students : " Font-Size="X-Large" style="text-decoration: underline"></asp:Label>
    <asp:Label ID="lbl_totalstudents" runat="server" Font-Size="X-Large"></asp:Label>
    </strong>&nbsp;&nbsp;
    <strong>
    <asp:Label ID="Label2" runat="server" Text="Active Students : " Font-Size="X-Large" style="text-decoration: underline"></asp:Label>
    <asp:Label ID="lbl_activestuds" runat="server" Font-Size="X-Large"></asp:Label>

    </strong>

</asp:Content>
