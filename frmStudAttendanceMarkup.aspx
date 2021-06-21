<%@ Page Title=""  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmStudAttendanceMarkup.aspx.cs" Inherits="School_Dashboard.WebForm10" EnableEventValidation="false" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">

        <!-- Page Heading -->
             <h1><u><b><i>STUDENT ATTENDANCE DATA</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

               
                <table class="w-100" style="height: 134px; width: 76%; background-color: #66CCFF;" border="1">
                    <tr>
                        <td style="width: 328px; background-color: #66CCFF !important; height: 41px;" class="bg-white">Select Class</td>
                        <td style="width: 1055px; background-color: #66CCFF !important; height: 41px;" class="bg-white">
                            <asp:DropDownList ID="DropDownListClass" runat="server" class="form-control border-0 shadow form-control-lg text-violet"  DataTextField="ClassName" DataValueField="ClassID" Width="228px" >
                            </asp:DropDownList>
                            <ajaxToolkit:CascadingDropDown ID="DropDownListClass_CascadingDropDown" runat="server" Category="Class" BehaviorID="DropDownList1_CascadingDropDown" TargetControlID="DropDownListClass" LoadingText="Loading Class" PromptText="Select Class" ServiceMethod="BindFacClass" ServicePath="~/WebServiceCascading.asmx" />
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 328px; height: 39px; background-color: #66CCFF !important" class="bg-white">Select Section</td>
                        <td style="width: 1055px; height: 39px; background-color: #66CCFF !important" class="bg-white">
                            <asp:DropDownList ID="DropDownListSection" class="form-control border-0 shadow form-control-lg text-violet" runat="server" Width="232px"  DataTextField="SectionID" DataValueField="SectionID">
                            </asp:DropDownList>
                            <ajaxToolkit:CascadingDropDown ID="DropDownListSection_CascadingDropDown" Category="Section" runat="server" BehaviorID="DropDownList2_CascadingDropDown" TargetControlID="DropDownListSection" LoadingText="Loading Section" PromptText="Select Section" ServiceMethod="BindFacSection" ServicePath="~/WebServiceCascading.asmx" ParentControlID="DropDownListClass" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <table class="w-100">
                    <tr>
                        <td style="width: 88px">
                            <asp:TextBox ID="txt_dd" runat="server" TextMode="Date" CssClass="offset-sm-0" Width="253px"></asp:TextBox>
                        </td>
                        <td>
                <asp:Label ID="lbl_sid" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <div>

                    
                    <asp:Button ID="btn_load" runat="server" Text="Load" OnClick="btn_load_Click" class="btn btn-primary shadow px-5"/>
                    <br />

                    
                    <br />

                    <div>
                         <asp:Button ID="btn_Save" runat="server" Text="Save" class="btn btn-primary shadow px-5" OnClick="btn_Save_Click" />
                         <br />
                    </div>
                    <br />

                    
                </div>
                <asp:GridView ID="GridViewStudMarkup" runat="server"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="StudentID" style="margin-right: 1px" Width="436px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="*" />
                        <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
                        <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                        <asp:TemplateField HeaderText="Mark Attendance">
                            <ItemTemplate>
                                <asp:RadioButton ID="rdbtn_present" runat="server" text="Present" GroupName="g1" />
                               
                                <asp:RadioButton ID="rdbtn_absent" runat="server" Text="Absent" GroupName="g1" />

                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Wrap="True" />
                        </asp:TemplateField>
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
                <br />
                <br />

               
                </div>
            </div>
         </div>

</asp:Content>
