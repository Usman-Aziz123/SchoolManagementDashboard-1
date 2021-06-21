<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmStudClassInfo.aspx.cs" Inherits="School_Dashboard.WebForm2"  EnableEventValidation="false"  %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <!-- Page Heading -->
              <h1><u><b><i>STUDENT CLASS INFORMATION</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                <div>
                    <asp:Label ID="lbl_StudID" runat="server" Text="Student ID" ></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownListsname" class="form-control border-0 shadow form-control-lg text-violet"   Width="250px" runat="server">
                    </asp:DropDownList>

                    <ajaxToolkit:CascadingDropDown ID="DropDownListsname_CascadingDropDown" runat="server" BehaviorID="DropDownListsname_CascadingDropDown" TargetControlID="DropDownListsname" Category="Student"  LoadingText="Loading Students" PromptText="Select Student" ServiceMethod="BindRemainingStudents" ServicePath="~/WebServiceCascading.asmx" />

                </div>
                <div>
                    <asp:Label ID="lbl_Class" runat="server" Text="Class"></asp:Label>
                    <asp:DropDownList ID="DropDownListClass" runat="server" class="form-control border-0 shadow form-control-lg text-violet"   Width="250px">
                    </asp:DropDownList>
                    <ajaxToolkit:CascadingDropDown ID="DropDownListClass_CascadingDropDown" runat="server" BehaviorID="DropDownListClass_CascadingDropDown" TargetControlID="DropDownListClass" Category="Class"  LoadingText="Loading Class" PromptText="Select Class" ServiceMethod="BindAllClass" ServicePath="~/WebServiceCascading.asmx">
                    </ajaxToolkit:CascadingDropDown>
                    <asp:RequiredFieldValidator ID="rfv_class" runat="server" ControlToValidate="DropDownListClass" ErrorMessage="Class Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <asp:Label ID="lbl_Section" runat="server" Text="Section Name"></asp:Label>
                    <asp:DropDownList ID="DropDownListSection" runat="server" class="form-control border-0 shadow form-control-lg text-violet"  Width="250px">
                    </asp:DropDownList>
                    <ajaxToolkit:CascadingDropDown ID="DropDownListSection_CascadingDropDown" Category="Section" runat="server" BehaviorID="DropDownList2_CascadingDropDown" TargetControlID="DropDownListSection" LoadingText="Loading Section" PromptText="Select Section" ServiceMethod="BindAdmSection" ServicePath="~/WebServiceCascading.asmx" ParentControlID="DropDownListClass">
                    </ajaxToolkit:CascadingDropDown>
                    <asp:RequiredFieldValidator ID="rfv_section" runat="server" ControlToValidate="DropDownListSection" ErrorMessage="Section Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <br />
                <asp:Button ID="btn_Save" runat="server"  Text="Save" OnClick="btn_Save_Click" class="btn btn-primary shadow px-5" />
                <br />
                <br />

                </div>
            <div>

                <table class="w-100">
                    <tr>
                        <td style="width: 382px">
                            <asp:Label ID="Label2" runat="server" Text="Student Class Information" Font-Bold="True" Font-Size="X-Large" Font-Underline="True"></asp:Label>
                            <asp:GridView ID="GridViewSCI" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewSCI_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                <Columns>
                                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                                    <asp:BoundField DataField="ClassID" HeaderText="ClassID" SortExpression="ClassID" />
                                    <asp:BoundField DataField="SectionID" HeaderText="SectionID" SortExpression="SectionID" />
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#383838" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT [StudentID], [ClassID], [SectionID] FROM [tbl_StudClassInfo]"></asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>

            </div>
        </div>
        

            </div>
    


</asp:Content>
