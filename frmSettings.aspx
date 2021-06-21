<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSettings.aspx.cs" Inherits="School_Dashboard.WebForm26" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="container-fluid">

        <!-- Page Heading -->
 <h1><u><b><i>Settings></b></u></h1>
<br />       
         <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div class="form-group">
                    <asp:LinkButton ID="lbtn_cp" runat="server" OnClick="lbtn_cp_Click">Change Password</asp:LinkButton>
                    </div>
                </div>
             </div>
          </div>


</asp:Content>

