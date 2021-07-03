<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmReportCurrentResult.aspx.cs" Inherits="School_Dashboard.WebForm24" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <br />
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server"  Width="50%" ></rsweb:ReportViewer>
    
    <table class="w-100">
        <tr>
            <td style="width: 386px">
                <asp:Label ID="Label1" runat="server" Text="MarksObtained : "></asp:Label>
                <asp:Label ID="lbl_marksobtained" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Out Of : "></asp:Label>
                <asp:Label ID="lbl_outof" runat="server"></asp:Label>
            </td>
            <td>  
                <asp:Label ID="Label3" runat="server" Text="Grade : "></asp:Label>
                <asp:Label ID="lbl_grade" runat="server"></asp:Label>
            </td>
             <td>  
                <asp:Label ID="Label4" runat="server" Text="Percentage : "></asp:Label>
                <asp:Label ID="lbl_percentage" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <div>




    </div>


</asp:Content>
