<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFaculty.Master" AutoEventWireup="true" CodeBehind="frmMarkSheet.aspx.cs" Inherits="School_Dashboard.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">

        <!-- Page Heading -->
        <h1><b><u>MarkSheet</u></b></h1>
        <div class="row">
            <div class="col-md-6">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                <div>

                    <asp:Label ID="Label1" runat="server" Text="Session"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="SessionName" DataValueField="SessionID" Enabled="False" CssClass="mr-0"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:School ManagementConnectionString %>" SelectCommand="select SessionID, SessionName from tbl_Session where IsCurrent=1"></asp:SqlDataSource>

                </div>

                <br />

                <div>
                    <asp:Label ID="Label2" runat="server" Text="Class"></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="ClassName" DataValueField="ClassID"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:School ManagementConnectionString %>" SelectCommand="SELECT [ClassID], [ClassName] FROM [tbl_Class]" DeleteCommand="DELETE FROM [tbl_Class] WHERE [ClassID] = @ClassID" InsertCommand="INSERT INTO [tbl_Class] ([ClassName]) VALUES (@ClassName)" UpdateCommand="UPDATE [tbl_Class] SET [ClassName] = @ClassName WHERE [ClassID] = @ClassID">
                        <DeleteParameters>
                            <asp:Parameter Name="ClassID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ClassName" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="ClassID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>

                <br />

                <div>
                    <asp:Label ID="lbl_sid" runat="server" Text="Student"></asp:Label>
                    <asp:DropDownList ID="DropDownListSID" runat="server" DataSourceID="SqlDataSource1" DataTextField="StudentName" DataValueField="StudentID"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:School ManagementConnectionString %>" SelectCommand="SELECT [StudentID], [StudentName] FROM [tbl_Student]" DeleteCommand="DELETE FROM [tbl_Student] WHERE [StudentID] = @StudentID" InsertCommand="INSERT INTO [tbl_Student] ([StudentName]) VALUES (@StudentName)" UpdateCommand="UPDATE [tbl_Student] SET [StudentName] = @StudentName WHERE [StudentID] = @StudentID">
                        <DeleteParameters>
                            <asp:Parameter Name="StudentID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="StudentName" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="StudentName" Type="String" />
                            <asp:Parameter Name="StudentID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    </div>

                <br />

                <div>
                    <asp:Label ID="lbl_course" runat="server" Text="Course"></asp:Label>
                    <asp:DropDownList ID="DropDownListCourse" runat="server" DataSourceID="SqlDataSource3" DataTextField="CourseName" DataValueField="CourseID"></asp:DropDownList>


                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:School ManagementConnectionString %>" DeleteCommand="DELETE FROM [tbl_Course] WHERE [CourseID] = @CourseID" InsertCommand="INSERT INTO [tbl_Course] ([CourseName]) VALUES (@CourseName)" SelectCommand="SELECT * FROM [tbl_Course]" UpdateCommand="UPDATE [tbl_Course] SET [CourseName] = @CourseName WHERE [CourseID] = @CourseID">
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


                </div>

                <br />

                <div>


                </div>

                <div>

                      <asp:Button ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click" />

                </div>

            <br />

            <div>

                <asp:GridView ID="GridViewMarkSheet" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="MarksheetID" DataSourceID="SqlDataSource2" ForeColor="Black">
                    <Columns>
                        <asp:BoundField DataField="MarksheetID" HeaderText="MarksheetID" InsertVisible="False" ReadOnly="True" SortExpression="MarksheetID" />
                        <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                        <asp:BoundField DataField="FacultyID" HeaderText="FacultyID" SortExpression="FacultyID" />
                        <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
                        <asp:BoundField DataField="ClassID" HeaderText="ClassID" SortExpression="ClassID" />
                        <asp:BoundField DataField="Marks" HeaderText="Marks" SortExpression="Marks" />
                        <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                        <asp:BoundField DataField="ExamTypeID" HeaderText="ExamTypeID" SortExpression="ExamTypeID" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:School ManagementConnectionString %>" SelectCommand="SELECT * FROM [tbl_MarkSheet]"></asp:SqlDataSource>

            </div>


            </div>

         </div>
    </div>
</asp:Content>
