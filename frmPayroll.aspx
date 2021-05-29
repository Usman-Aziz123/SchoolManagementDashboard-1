<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPayroll.aspx.cs" Inherits="School_Dashboard.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">

        <!-- Page Heading -->
        <h1><b><u>STUDENTS</u></b></h1>
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="FacultyName"></asp:Label>
                    <asp:DropDownList ID="DropDownListFaculty" runat="server" DataSourceID="SqlDataSource1" DataTextField="FacultyName" DataValueField="FacultyID" Width="149px"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT [FacultyID], [FacultyName] FROM [tbl_Faculty]"></asp:SqlDataSource>
                    </div>
                <br />
                <div>
                    <asp:Label ID="Label2" runat="server" Text="Basic Pay"></asp:Label>
                    <asp:TextBox ID="txt_bp" runat="server"></asp:TextBox>
                </div>
                <br />
                <div>
                    <asp:Label ID="Label3" runat="server" Text="Allowances"></asp:Label>
                    <asp:TextBox ID="txt_all" runat="server"></asp:TextBox>
                </div>
                <br />
                <div>
                    <asp:Label ID="Label4" runat="server" Text="NetPay"></asp:Label>
                    <asp:TextBox ID="txt_np" runat="server"></asp:TextBox>
                </div>
                <br />
                <div>
                    <asp:Button ID="btn_save" runat="server" Text="Save" />
                </div>
                </div>
            </div>
        </div>
    
</asp:Content>
