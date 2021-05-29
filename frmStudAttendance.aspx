<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmStudAttendance.aspx.cs" Inherits="School_Dashboard.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">




        <!-- Page Heading -->
             <h1><u><b><i>STUDENT ATTENDANCE DATA</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

               
                <table class="w-100" style="height: 79px; width: 76%">
                    <tr>
                        <td style="width: 328px; background-color: #FFFF99">Select Class</td>
                        <td style="width: 1055px; background-color: #FFFF99">
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="ClassName" DataValueField="ClassID" Width="228px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT DISTINCT [ClassName], [ClassID] FROM [tbl_Class]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 328px; height: 39px; background-color: #FFFF99">Select Section</td>
                        <td style="width: 1055px; height: 39px; background-color: #FFFF99">
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="232px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lbl_dd" runat="server"></asp:Label>
                <br />
                <br />
                <div>

                    
                    <table class="w-20" style="width: 32%; height: 31px; color: #000000; background-color: #FFFF99;" border="1">
                        <tr>
                            <td style="width: 176px" class="text-center">
                                <asp:RadioButton ID="btnrd_present" runat="server" Text="Present" />
                            </td>
                            <td class="text-center" style="width: 187px">
                                <asp:RadioButton ID="rdbtn_absent" runat="server" Text="Absent" />
                            </td>
                        </tr>
                    </table>

                    
                </div>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <br />
                <br />

               
                </div>
            </div>
         </div>

</asp:Content>
