<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmOpenSessionClass.aspx.cs" Inherits="School_Dashboard.WebForm14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">

        <!-- Page Heading -->
              <h1><u><b><i>OPENING SESSION MASTER DATA</i></b></u></h1>
        <br />
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <br />

                <h2><b><u>Header Information</u></b></h2>
                <br />

                <div class="form-group">
                    <asp:Label ID="lbl_sname" runat="server" Text="Session"></asp:Label>
                    <asp:DropDownList ID="DropDownListSname" runat="server" DataSourceID="SqlDataSource4" DataTextField="SessionName" DataValueField="SessionID" Width="179px" class="form-control border-0 shadow form-control-lg text-violet"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Session] WHERE [SessionID] = @SessionID" InsertCommand="INSERT INTO [tbl_Session] ([SessionName], [IsCurrent]) VALUES (@SessionName, @IsCurrent)" SelectCommand="sp_GetCurrentSession" UpdateCommand="UPDATE [tbl_Session] SET [SessionName] = @SessionName, [IsCurrent] = @IsCurrent WHERE [SessionID] = @SessionID" SelectCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="SessionID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="IsCurrent" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="IsCurrent" Type="Boolean" />
                            <asp:Parameter Name="SessionID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <br />
                <div>
                    <asp:Label ID="lbl_class" runat="server" Text="Class"></asp:Label>
                    <asp:DropDownList ID="DropDownListClass" runat="server" DataTextField="ClassName" DataValueField="ClassID" Width="179px" class="form-control border-0 shadow form-control-lg text-violet" OnSelectedIndexChanged="DropDownListClass_SelectedIndexChanged"></asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListClass" ErrorMessage="Class is Required" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <br />
                <br />
                
                <h2><b><u>Detail Information</u></b></h2>

                <div>
                    <asp:Label ID="Label1" runat="server" Text="Section Name"></asp:Label>
                    <asp:DropDownList ID="DropDownListSection" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="176px" DataTextField="SectionName" DataValueField="SectionID" AutoPostBack="True" ></asp:DropDownList>
                </div>
                <br />
                <div>
                    <asp:Label ID="lbl_course" runat="server" Text="Course"></asp:Label>
                    <asp:DropDownList ID="DropDownListCourse" runat="server" DataSourceID="SqlDataSource2" class="form-control border-0 shadow form-control-lg text-violet" DataTextField="CourseName" DataValueField="CourseID" Width="179px"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownListCourse" ErrorMessage="Course is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT [CourseName], [CourseID] FROM [tbl_Course]" DeleteCommand="DELETE FROM [tbl_Course] WHERE [CourseID] = @CourseID" InsertCommand="INSERT INTO [tbl_Course] ([CourseName]) VALUES (@CourseName)" UpdateCommand="UPDATE [tbl_Course] SET [CourseName] = @CourseName WHERE [CourseID] = @CourseID">
                        <DeleteParameters>
                            <asp:Parameter Name="CourseID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="CourseName" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CourseName" Type="String" />
                            <asp:Parameter Name="CourseID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <asp:Label ID="lbl_Faculty" runat="server" Text="Faculty"></asp:Label>
                    &nbsp;<asp:DropDownList ID="DropDownListFaculty" runat="server" DataSourceID="SqlDataSource3" DataTextField="FacultyName" DataValueField="FacultyID" class="form-control border-0 shadow form-control-lg text-violet" Width="257px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownListFaculty" ErrorMessage="Faculty is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT [FacultyName], [FacultyID] FROM [tbl_Faculty]" DeleteCommand="DELETE FROM [tbl_Faculty] WHERE [FacultyID] = @FacultyID" InsertCommand="INSERT INTO [tbl_Faculty] ([FacultyName]) VALUES (@FacultyName)" UpdateCommand="UPDATE [tbl_Faculty] SET [FacultyName] = @FacultyName WHERE [FacultyID] = @FacultyID">
                        <DeleteParameters>
                            <asp:Parameter Name="FacultyID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="FacultyName" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="FacultyName" Type="String" />
                            <asp:Parameter Name="FacultyID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <asp:Button ID="btn_add" runat="server" class="btn btn-primary shadow px-5" Text="Add" OnClick="btn_add_Click" />
                </div>
                <br />
                <div>
                    <asp:GridView ID="GridViewOpening" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" Height="76px" Width="432px" GridLines="Vertical">
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
                    <asp:Button ID="btn_save" class="btn btn-primary shadow px-5" runat="server" Text="Save" OnClick="btn_save_Click" />

                </div>
            </div>
        </div>
    </div>


</asp:Content>
