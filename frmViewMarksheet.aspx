<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmViewMarksheet.aspx.cs" Inherits="School_Dashboard.WebForm24" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server"  Width="50%" ></rsweb:ReportViewer>
    
    <table class="w-100">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Total : "></asp:Label>
                <asp:Label ID="lbl_total" runat="server"></asp:Label>
            </td>
            <td>  
                <asp:Label ID="Label3" runat="server" Text="Grade : "></asp:Label>
                <asp:Label ID="lbl_grade" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />


</asp:Content>
