<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSection.aspx.cs" Inherits="School_Dashboard.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">




        <!-- Page Heading -->
        <h1><u><b><i>SECTION MASTER DATA</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div>
                    <asp:Label ID="lbl_section" runat="server" Text="Section Name"></asp:Label>
                    <asp:TextBox ID="txt_Sectionname" runat="server" placeholder="Session" class="form-control border-0 shadow form-control-lg text-violet" Width="253px" Style="margin-bottom: 0.4em"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Secion Name Required" ForeColor="Red" ControlToValidate="txt_Sectionname"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <table class="w-100">
                        <tr>
                            <td style="width: 100px">
                    <asp:Button ID="btn_save" runat="server" Text="Save" class="btn btn-primary shadow px-5" OnClick="btn_save_Click"  />
                            </td>
                            <td>
               <asp:Button ID="btn_reset" class="btn btn-primary shadow px-5" runat="server" Text="Reset" OnClick="btn_reset_Click"  />

                            </td>
                        </tr>
                    </table>
                  

                </div>
                <div>
                    <asp:GridView ID="GridViewSection" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="SectionID" DataSourceID="SqlDataSource1" ForeColor="Black" OnSelectedIndexChanged="GridViewSection_SelectedIndexChanged" >
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="*" />
                            <asp:BoundField DataField="SectionID" HeaderText="SectionID" InsertVisible="False" ReadOnly="True" SortExpression="SectionID" />
                            <asp:BoundField DataField="SectionName" HeaderText="SectionName" SortExpression="SectionName" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Section] WHERE [SectionID] = @SectionID" InsertCommand="INSERT INTO [tbl_Section] ([SectionName]) VALUES (@SectionName)" SelectCommand="SELECT * FROM [tbl_Section]" UpdateCommand="UPDATE [tbl_Section] SET [SectionName] = @SectionName WHERE [SectionID] = @SectionID">
                        <DeleteParameters>
                            <asp:Parameter Name="SectionID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SectionName" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SectionName" Type="String" />
                            <asp:Parameter Name="SectionID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                </div>
            </div>
        </div>
    
</asp:Content>
