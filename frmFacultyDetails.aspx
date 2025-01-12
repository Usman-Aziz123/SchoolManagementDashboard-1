﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmFacultyDetails.aspx.cs" Inherits="School_Dashboard.WebForm19" enableEventValidation="False" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container-fluid">

        <!-- Page Heading -->
        <h1><u><b><i>FACULTY DETAILS</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div>
                    <asp:Label ID="lbl_name" runat="server" Text="Faculty ID" ></asp:Label>
                    <asp:DropDownList ID="DropDownListfname" runat="server" class="form-control border-0 shadow form-control-lg text-violet" DataSourceID="SqlDataSource1" DataTextField="FacultyName" DataValueField="FacultyID" Width="450px"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT [FacultyID], [FacultyName] FROM [tbl_Faculty]"></asp:SqlDataSource>
                    </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListfname" ErrorMessage="Faculty Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <div>
                    <asp:Label ID="lbl_class" runat="server" Text="Class Name" ></asp:Label>
                    <asp:DropDownList ID="DropDownListClass" runat="server" class="form-control border-0 shadow form-control-lg text-violet" DataSourceID="SqlDataSource2" DataTextField="ClassName" DataValueField="ClassID" Width="450px"></asp:DropDownList>


                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [tbl_Class]"></asp:SqlDataSource>


                </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownListClass" ErrorMessage="Class Required" ForeColor="Red"></asp:RequiredFieldValidator>
                 <br />
                <div>
                    <asp:Label ID="lbl_section" runat="server" Text="Section Name" ></asp:Label>
                    <asp:DropDownList ID="DropDownListSection" runat="server" class="form-control border-0 shadow form-control-lg text-violet" DataSourceID="SqlDataSource3" DataTextField="SectionName" DataValueField="SectionID" Width="450px"></asp:DropDownList>


                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [tbl_Section]"></asp:SqlDataSource>


                </div>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownListSection" ErrorMessage="Section Required" ForeColor="Red"></asp:RequiredFieldValidator>
                 <br />
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Courses"></asp:Label>
                    <asp:DropDownList ID="DropDownListCourses" runat="server" class="form-control border-0 shadow form-control-lg text-violet" DataSourceID="SqlDataSource5" DataTextField="CourseName" DataValueField="CourseID" Width="450px"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [tbl_Course]"></asp:SqlDataSource>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListCourses" ErrorMessage="Courses Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <div>
                    <asp:Button ID="btn_add" runat="server" Text="Add" OnClick="btn_add_Click" class="btn btn-primary shadow px-5" />
                </div>
                <br />
                <div>
                    <asp:GridView ID="GridViewFC" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
                    <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary shadow px-5"/>
                </div>
                <br />
                <div>
                    <asp:GridView ID="GridViewFacDetails" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewFacDetails_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField SelectText="*" ShowSelectButton="True" HeaderText="Select" />
                            <asp:BoundField DataField="FacultyID" HeaderText="FacultyID" SortExpression="FacultyID" />
                            <asp:BoundField DataField="ClassID" HeaderText="ClassID" SortExpression="ClassID" />
                            <asp:BoundField DataField="SectionID" HeaderText="SectionID" SortExpression="SectionID" />
                            <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
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
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT [FacultyID], [ClassID], [SectionID], [CourseID] FROM [tbl_FacultyDetail]">
                    </asp:SqlDataSource>
                </div>
            </div>
            </div>
           </div>
        
</asp:Content>
