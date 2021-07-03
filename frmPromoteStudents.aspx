<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPromoteStudents.aspx.cs" Inherits="School_Dashboard.WebForm31" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <strong><em>

 <h1><u><b><i>Promotion Form</i></b></u></h1>
    </em></strong>

    <br />
    <br />

    <div>
        <asp:Label ID="Label5" runat="server" Text="Session  "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="SessionName" DataValueField="SessionID" class="form-control border-0 shadow form-control-lg text-violet" Width="250px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="sp_GetCurrentSession" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>
    <br />

    <table class="w-100">
        <tr>
            <td style="width: 300px">
                <asp:Label ID="Label1" runat="server" Text="Student ID"></asp:Label>
&nbsp;
                <asp:TextBox ID="txt_sid" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="250px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Student Name"></asp:Label>
&nbsp;
                <asp:TextBox ID="txt_sname" class="form-control border-0 shadow form-control-lg text-violet" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 300px">
                <asp:Label ID="Label3" runat="server" Text="Class"></asp:Label>
&nbsp;
                <asp:DropDownList ID="DropDownListClass" runat="server" DataTextField="ClassName" DataValueField="ClassID" class="form-control border-0 shadow form-control-lg text-violet" Width="250px" DataSourceID="SqlDataSource1">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [tbl_Class]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Section"></asp:Label>
&nbsp;
                <asp:DropDownList ID="DropDownListSection" runat="server" DataSourceID="SqlDataSource2" DataTextField="SectionName" DataValueField="SectionID" class="form-control border-0 shadow form-control-lg text-violet" Width="250px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT [ClassID], sec.[SectionID],SectionName FROM [tbl_ClassSectionDetails] csd 
join tbl_Section sec on sec.SectionID=csd.SectionID
 WHERE ([ClassID] = @ClassID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListSection" Name="ClassID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table> <br />
    <div>
        <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary shadow px-5" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_reset" runat="server" Text="Reset" OnClick="btn_Reset_Click" class="btn btn-primary shadow px-5" />

    </div>
    <br />
    <div>
        <asp:GridView ID="GridViewPassingStudents" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="StudentID" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewPassingStudents_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField HeaderText="Select" SelectText="*" ShowSelectButton="True" />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
                <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                <asp:BoundField DataField="Percentage" HeaderText="Percentage" SortExpression="Percentage" />
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

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="sp_GetPassingStudents" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>

</asp:Content>
