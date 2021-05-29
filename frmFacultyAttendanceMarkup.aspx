<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmFacultyAttendanceMarkup.aspx.cs" Inherits="School_Dashboard.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-fluid">
          <%--  <link rel ="stylesheet" href="datepicker.min.css"/>
                <script src="datepicker.min.js"></script>--%>


        <!-- Page Heading -->
        <h1><u><b><i>FACULTY ATTENDANCE DATA</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <br />

                <h2><b><u>Status MarkUP</u></b></h2>
                <br />

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Faculty Name"></asp:Label>
                    <asp:DropDownList ID="DropDownListFname" runat="server" DataSourceID="SqlDataSource1" DataTextField="FacultyName" DataValueField="FacultyID" class="form-control border-0 shadow form-control-lg text-violet" Width="227px"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Faculty] WHERE [FacultyID] = @FacultyID" InsertCommand="INSERT INTO [tbl_Faculty] ([FacultyName]) VALUES (@FacultyName)" SelectCommand="SELECT [FacultyID], [FacultyName] FROM [tbl_Faculty]" UpdateCommand="UPDATE [tbl_Faculty] SET [FacultyName] = @FacultyName WHERE [FacultyID] = @FacultyID">
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
                    </div>
                <div>
                    <asp:Label ID="Label2" runat="server" Text="DateDay"></asp:Label>
                    &nbsp;<asp:Label ID="lbl_dd" runat="server"></asp:Label>
                    <br />
                    <br />
                </div>
                <div>

                    <table class="w-20" style="width: 32%; height: 31px; color: #000000; background-color: #FFFF99;" border="1">
                        <tr>
                            <td class="text-center" style="width: 186px">
                                <asp:RadioButton ID="btnrd_present" runat="server" Text="Present" GroupName="g1" />
                            </td>
                            <td class="text-center" style="width: 245px">
                                <asp:RadioButton ID="btnrd_absent" runat="server" Text="Absent" GroupName="g1" />
                            </td>
                        </tr>
                    </table>

                </div><br />
                <div>
                    <asp:Button ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click" class="btn btn-primary shadow px-5" />
                </div>
                <br />
                <br />

                <div>
                    <asp:GridView ID="GridViewStatus" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" DataKeyNames="FAStatusID" style="margin-top: 0px" OnSelectedIndexChanged="GridViewStatus_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField SelectText="*" ShowSelectButton="True" />
                            <asp:BoundField DataField="FAStatusID" HeaderText="FAStatusID" SortExpression="FAStatusID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="FacultyID" HeaderText="FacultyID" SortExpression="FacultyID" />
                            <asp:BoundField DataField="DateDay" HeaderText="DateDay" SortExpression="DateDay" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
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

                    
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT * FROM [tbl_FacultyAttendance]" DeleteCommand="DELETE FROM [tbl_FacultyAttendance] WHERE [FAStatusID] = @FAStatusID" InsertCommand="INSERT INTO [tbl_FacultyAttendance] ([FacultyID], [DateDay], [Status]) VALUES (@FacultyID, @DateDay, @Status)" UpdateCommand="UPDATE [tbl_FacultyAttendance] SET [FacultyID] = @FacultyID, [DateDay] = @DateDay, [Status] = @Status WHERE [FAStatusID] = @FAStatusID">
                        <DeleteParameters>
                            <asp:Parameter Name="FAStatusID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="FacultyID" Type="Int32" />
                            <asp:Parameter Name="DateDay" Type="DateTime" />
                            <asp:Parameter Name="Status" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="FacultyID" Type="Int32" />
                            <asp:Parameter Name="DateDay" Type="DateTime" />
                            <asp:Parameter Name="Status" Type="String" />
                            <asp:Parameter Name="FAStatusID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    
                </div>
                </div>
            </div>
        </div>

</asp:Content>
