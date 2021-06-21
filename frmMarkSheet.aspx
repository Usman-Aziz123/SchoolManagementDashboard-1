<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMarkSheet.aspx.cs" Inherits="School_Dashboard.WebForm13" EnableEventValidation="false" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">

        <!-- Page Heading -->
        <h1><b><u>MarkSheet</u></b></h1>
        <div class="row">
            <div class="col-md-6">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div>
                    <asp:Label ID="Label4" runat="server" Text="Exam"></asp:Label>
                    <asp:DropDownList ID="DropDownListExam" runat="server"  class="form-control border-0 shadow form-control-lg text-violet" Width="450px" DataSourceID="SqlDataSource1" DataTextField="ExamName" DataValueField="ExamID"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="select * from tbl_exam where iscurrent='true'"></asp:SqlDataSource>

               <ajaxToolkit:CascadingDropDown ID="CascadingDropDown1" runat="server" Category="Class" BehaviorID="DropDownList1_CascadingDropDown" TargetControlID="DropDownListClass" LoadingText="Loading Class" PromptText="Select Class" ServiceMethod="BindFacClass" ServicePath="~/WebServiceCascading.asmx" />

                </div>

                <div>
                    <asp:Label ID="Label2" runat="server" Text="Class"></asp:Label>
                    <asp:DropDownList ID="DropDownListClass" runat="server"  class="form-control border-0 shadow form-control-lg text-violet" Width="450px"></asp:DropDownList>

               <ajaxToolkit:CascadingDropDown ID="DropDownListClass_CascadingDropDown" runat="server" Category="Class" BehaviorID="DropDownList1_CascadingDropDown" TargetControlID="DropDownListClass" LoadingText="Loading Class" PromptText="Select Class" ServiceMethod="BindFacClass" ServicePath="~/WebServiceCascading.asmx" />

                </div>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListClass" ErrorMessage="Class Required" ForeColor="Red"></asp:RequiredFieldValidator>

                <br />

                <div>

                    <asp:Label ID="Label1" runat="server" Text="Section"></asp:Label>
                    <asp:DropDownList ID="DropDownListSection" runat="server"  class="form-control border-0 shadow form-control-lg text-violet" Width="450px"></asp:DropDownList>

                    <ajaxToolkit:CascadingDropDown ID="DropDownListSection_CascadingDropDown" Category="Section" runat="server" BehaviorID="DropDownList2_CascadingDropDown" TargetControlID="DropDownListSection" LoadingText="Loading Section" PromptText="Select Section" ServiceMethod="BindFacSection" ServicePath="~/WebServiceCascading.asmx" ParentControlID="DropDownListClass" />

                </div>

               

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownListSection" ErrorMessage="Section Required" ForeColor="Red"></asp:RequiredFieldValidator>

               

                <br />

                <div>
                    <asp:Label ID="lbl_sid" runat="server" Text="Student"></asp:Label>
                    <asp:DropDownList ID="DropDownListSID" runat="server"  class="form-control border-0 shadow form-control-lg text-violet" Width="450px"></asp:DropDownList>

                    <ajaxToolkit:CascadingDropDown ID="DropDownListSID_CascadingDropDown" runat="server" BehaviorID="DropDownListSID_CascadingDropDown" TargetControlID="DropDownListSID" Category="Student" LoadingText="Loading Students" PromptText="Select Student" ServiceMethod="BindStudentSection" ServicePath="~/WebServiceCascading.asmx" ParentControlID="DropDownListSection" />

                    </div>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownListSID" ErrorMessage="Student Required" ForeColor="Red"></asp:RequiredFieldValidator>

                <br />

                <div>
                    <asp:Label ID="lbl_course" runat="server" Text="Course"></asp:Label>
                    <asp:DropDownList ID="DropDownListCourse" runat="server"  class="form-control border-0 shadow form-control-lg text-violet" Width="450px"></asp:DropDownList>




                    <ajaxToolkit:CascadingDropDown ID="DropDownListCourse_CascadingDropDown" runat="server" BehaviorID="DropDownListCourse_CascadingDropDown" TargetControlID="DropDownListCourse" Category="Course" LoadingText="Loading Courses" PromptText="Select Course" ServiceMethod="BindFacCourses" ServicePath="~/WebServiceCascading.asmx" />




                </div>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListCourse" ErrorMessage="Course Required" ForeColor="Red"></asp:RequiredFieldValidator>

                <br />

                <div>
                    <asp:Label ID="Label3" runat="server" Text="Marks" ></asp:Label>
                    <asp:TextBox ID="txt_marks" runat="server" Width="450px" class="form-control border-0 shadow form-control-lg text-violet"></asp:TextBox>
                    </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_marks" ErrorMessage="Marks Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />

                


                <br />

                <div>


                    <asp:Button ID="btn_add" runat="server" Text="Add" class="btn btn-primary shadow px-5" OnClick="btn_add_Click" />


                </div>

                <br />
                <div>
                    <asp:GridView ID="GridViewMarksheet" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" >
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>

                </div>
                <br />

                <div>

                      <asp:Button ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click" class="btn btn-primary shadow px-5"/>

                </div>

            <br />

            <div>

            </div>


            </div>

         </div>
    </div>
</asp:Content>
