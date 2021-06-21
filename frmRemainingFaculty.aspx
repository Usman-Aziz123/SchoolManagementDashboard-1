<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRemainingFaculty.aspx.cs" Inherits="School_Dashboard.WebForm17" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-fluid">

           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

          <!-- Page Heading -->
              <h1><u><b><i>FACULTY INFORMATION</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">

                        <rsweb:ReportViewer ID="ReportViewerRemainingFaculty" runat="server"  Width="100%" ></rsweb:ReportViewer>

                </div>

        </div>
          </div>
</asp:Content>
