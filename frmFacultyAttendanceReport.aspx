<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmFacultyAttendanceReport.aspx.cs" Inherits="School_Dashboard.WebForm20" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    
    <asp:TextBox ID="TextBox1" runat="server" TextMode="Search"></asp:TextBox>
    <asp:ImageButton ID="img_btn_search" runat="server" Height="24px" ImageUrl="~/Images/2e12601a7eaebd7b62771fa9efc0df90.jpg" OnClick="img_btn_search_Click" Width="30px" />
    <br />
        <rsweb:ReportViewer ID="ReportViewerFAR" runat="server"  Width="50%" ></rsweb:ReportViewer>
    <strong>
    <asp:Label ID="Label1" runat="server" Text="Days Present : " Font-Size="X-Large" style="text-decoration: underline"></asp:Label>
    <asp:Label ID="lbl_DaysPresent" runat="server" Font-Size="X-Large"></asp:Label>
    </strong>&nbsp;&nbsp;
    <strong>
    <asp:Label ID="Label2" runat="server" Text="Days Absent : " Font-Size="X-Large" style="text-decoration: underline"></asp:Label>
    <asp:Label ID="lbl_DaysAbsent" runat="server" Font-Size="X-Large"></asp:Label>

    </strong>
</asp:Content>
