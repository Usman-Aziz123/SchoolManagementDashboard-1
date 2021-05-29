<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmFacultyDetails.aspx.cs" Inherits="School_Dashboard.WebForm19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container-fluid">

        <!-- Page Heading -->
        <h1><u><b><i>FACULTY DETAILS</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div>
                    <asp:Label ID="lbl_name" runat="server" Text="Faculty Name" ></asp:Label>
                    <asp:TextBox ID="txt_fid" runat="server" class="form-control border-0 shadow form-control-lg text-violet" ReadOnly="True"></asp:TextBox>
                    </div>
                <br />
                <div>
                    <asp:Label ID="lbl_class" runat="server" Text="Class Name" ></asp:Label>
                    <asp:DropDownList ID="DropDownListClass" runat="server" DataSourceID="SqlDataSource2" DataTextField="ClassName" DataValueField="ClassID" class="form-control border-0 shadow form-control-lg text-violet"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT [ClassID], [ClassName] FROM [tbl_Class]"></asp:SqlDataSource>

                </div>
                 <br />
                <div>
                    <asp:Label ID="lbl_section" runat="server" Text="Section Name" ></asp:Label>
                    <asp:DropDownList ID="DropDownListSection" runat="server" DataSourceID="SqlDataSource3" DataTextField="SectionName" DataValueField="SectionID" class="form-control border-0 shadow form-control-lg text-violet"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [tbl_Section]"></asp:SqlDataSource>

                </div>
                 <br />
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Courses"></asp:Label>
                    <asp:DropDownList ID="DropDownListCourses" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseName" DataValueField="CourseID" class="form-control border-0 shadow form-control-lg text-violet"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [tbl_Course]"></asp:SqlDataSource>
                </div>
                <br />
                <div>
                    <asp:Button ID="btn_add" runat="server" Text="Add" OnClick="btn_add_Click" class="btn btn-primary shadow px-5" />
                </div>
                <br />
                <div>
                    <asp:GridView ID="GridViewFC" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField SelectText="*" ShowSelectButton="True" />
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
                </div>
                <br />
                <div>
                    <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary shadow px-5"/>
                </div>
            </div>
            </div>
           </div>
        
</asp:Content>
