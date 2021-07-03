<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmLock.aspx.cs" Inherits="School_Dashboard.WebForm29" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
        <!-- Page Heading -->
        <h1><u><b><i>STUDENT MASTER DATA</i></b></u></h1>
        <br />
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="form-group">

                    <table class="w-100">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>
                                <asp:TextBox ID="txt_date" runat="server" TextMode="Date" class="form-control border-0 shadow form-control-lg text-violet"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="SessionID"></asp:Label>
                                <asp:DropDownList ID="DropDownListSession" runat="server" class="form-control border-0 shadow form-control-lg text-violet" DataSourceID="SqlDataSource1" DataTextField="SessionName" DataValueField="SessionID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT * FROM [tbl_Session] WHERE ([IsCurrent] = @IsCurrent)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownListSession" DefaultValue="True" Name="IsCurrent" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="ExamID"></asp:Label>
                                <asp:DropDownList ID="DropDownListExam" runat="server" class="form-control border-0 shadow form-control-lg text-violet" DataSourceID="SqlDataSource2" DataTextField="ExamName" DataValueField="ExamID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT * FROM [tbl_Exam] WHERE ([IsCurrent] = @IsCurrent)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownListExam" DefaultValue="True" Name="IsCurrent" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:Button ID="btn_lock" runat="server" Text="Lock"  OnClick="btn_lock_Click" class="btn btn-primary shadow px-5"/>

                            </td>
                        </tr>
                    </table>

                   </div>
                </div>
            </div>
         </div>
    

</asp:Content>
