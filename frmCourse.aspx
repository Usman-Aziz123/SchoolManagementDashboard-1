<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmCourse.aspx.cs" Inherits="School_Dashboard.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">

        <!-- Page Heading -->
        <h1><u><b><i>COURSE MASTER DATA</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
               <div>
                   <asp:Label ID="lbl_name" runat="server" Text="Course Name" ></asp:Label>
                   <asp:TextBox ID="txt_coursename" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="253px" Style="margin-bottom: 0.4em"></asp:TextBox>
                   <asp:Label ID="lbl_msg" runat="server" ForeColor="Red"></asp:Label>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_coursename" ErrorMessage="Course Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                   <br />
               </div>
                <div>
                    <asp:Button ID="btn_save" class="btn btn-primary shadow px-5" runat="server" Text="Save" OnClick="btn_save_Click" />
                </div>
                <div>
                    <br />
                    <asp:GridView ID="GridViewCourse" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="CourseID" DataSourceID="SqlDataSource1" ForeColor="Black" OnSelectedIndexChanged="GridViewCourse_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="*" />
                            <asp:BoundField DataField="CourseID" HeaderText="CourseID" InsertVisible="False" ReadOnly="True" SortExpression="CourseID" />
                            <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Course] WHERE [CourseID] = @CourseID" InsertCommand="INSERT INTO [tbl_Course] ([CourseName]) VALUES (@CourseName)" SelectCommand="SELECT * FROM [tbl_Course]" UpdateCommand="UPDATE [tbl_Course] SET [CourseName] = @CourseName WHERE [CourseID] = @CourseID">
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
                    </div>
            </div>
         </div>
    
</asp:Content>
