<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmFacultyReport.aspx.cs" Inherits="School_Dashboard.WebForm21" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
        <rsweb:reportviewer ID="ReportViewerFaculty" runat="server"  Width="50%" ></rsweb:reportviewer>
    <strong>
    <asp:Label ID="Label1" runat="server" Text="Total Faculty : " Font-Size="X-Large" style="text-decoration: underline"></asp:Label>
    <asp:Label ID="lbl_totalstudents" runat="server" Font-Size="X-Large"></asp:Label>
    </strong>&nbsp;&nbsp;
    <strong>
    <asp:Label ID="Label2" runat="server" Text="Active Faculty : " Font-Size="X-Large" style="text-decoration: underline"></asp:Label>
    <asp:Label ID="lbl_activestuds" runat="server" Font-Size="X-Large"></asp:Label>

    <br />
<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" Text="Visiting Faculty : "></asp:Label>
<asp:Label ID="lbl_vf" runat="server" Font-Size="X-Large"></asp:Label>

    </strong>
</asp:Content>
