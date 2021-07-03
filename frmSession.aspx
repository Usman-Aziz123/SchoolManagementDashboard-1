<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSession.aspx.cs" Inherits="School_Dashboard.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">




        <!-- Page Heading -->
      <h1><u><b><i>SESSION MASTER DATA</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div class="form-group">

                    <asp:Label ID="lbl_sessname" runat="server" Text="Session"></asp:Label>
                    <asp:TextBox ID="txt_sessname" runat="server" type="text" placeholder="Session" class="form-control border-0 shadow form-control-lg text-violet" Width="253px" Style="margin-bottom: 0.4em"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="SNameValidator" runat="server" ErrorMessage="Session is Required" ControlToValidate="txt_sessname" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">

                    <asp:Label ID="lbl_isc" runat="server" Text="IsCurrent"></asp:Label>
                    <asp:CheckBox ID="chkbox_iscurrent" runat="server"   />

                </div>
                <div>
                    <v>
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
                        <div>
                         <br />
            <asp:GridView ID="GridViewSession" runat="server" AutoGenerateColumns="False" DataKeyNames="SessionID" DataSourceID="SqlDataSource1" Height="133px"  Width="745px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" CellSpacing="2" OnSelectedIndexChanged="GridViewSession_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField SelectText="*" ShowSelectButton="True" />
                    <asp:BoundField DataField="SessionID" HeaderText="SessionID" InsertVisible="False" ReadOnly="True" SortExpression="SessionID" />
                    <asp:BoundField DataField="SessionName" HeaderText="SessionName" SortExpression="SessionName" />
                    <asp:BoundField DataField="IsCurrent" HeaderText="IsCurrent" SortExpression="IsCurrent" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
                         </asp:GridView>


                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Session] WHERE [SessionID] = @SessionID" InsertCommand="INSERT INTO [tbl_Session] ([SessionName], [IsCurrent]) VALUES (@SessionName, @IsCurrent)" SelectCommand="SELECT * FROM [tbl_Session]" UpdateCommand="UPDATE [tbl_Session] SET [SessionName] = @SessionName, [IsCurrent] = @IsCurrent WHERE [SessionID] = @SessionID">
                             <DeleteParameters>
                                 <asp:Parameter Name="SessionID" Type="Int32" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter Name="SessionName" Type="String" />
                                 <asp:Parameter Name="IsCurrent" Type="String" />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="SessionName" Type="String" />
                                 <asp:Parameter Name="IsCurrent" Type="String" />
                                 <asp:Parameter Name="SessionID" Type="Int32" />
                             </UpdateParameters>
                         </asp:SqlDataSource>


        </div>
    </div>
                </div>
            </div>
        </div>

</asp:Content>
