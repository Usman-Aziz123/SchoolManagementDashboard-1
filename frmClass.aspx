<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmClass.aspx.cs" Inherits="School_Dashboard.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">

        <!-- Page Heading -->
 <h1><u><b><i>CLASS MASTER DATA</i></b></u></h1>
<br />       
         <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div class="form-group">
                    <asp:Label ID="lbl_cname" runat="server" Text="Class Name"></asp:Label>
                    <asp:TextBox ID="txt_class" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="253px" Style="margin-bottom: 0.4em" placeholder="Class Name"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="lbl_standid" runat="server" Text="Standard Name"></asp:Label>
                    <asp:DropDownList ID="DropDownListStandID" runat="server" DataSourceID="SqlDataSource2" DataTextField="Description" DataValueField="StandardID" Width="179px" class="form-control border-0 shadow form-control-lg text-violet"></asp:DropDownList>

                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Standard] WHERE [StandardID] = @StandardID" SelectCommand="SELECT * FROM [tbl_Standard]" InsertCommand="INSERT INTO [tbl_Standard] ([Description]) VALUES (@Description)" UpdateCommand="UPDATE [tbl_Standard] SET [Description] = @Description WHERE [StandardID] = @StandardID">
                         <DeleteParameters>
                             <asp:Parameter Name="StandardID" Type="Int32" />
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="Description" Type="String" />
                         </InsertParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="Description" Type="String" />
                             <asp:Parameter Name="StandardID" Type="Int32" />
                         </UpdateParameters>
                     </asp:SqlDataSource>

                </div>
                 <div class="form-group">
                    <asp:Label ID="lbl_secid" runat="server" Text="Section Name"></asp:Label>
                    <asp:DropDownList ID="DropDownListSecID" runat="server" DataSourceID="SqlDataSource3" DataTextField="SectionName" DataValueField="SectionID" Width="179px" class="form-control border-0 shadow form-control-lg text-violet"></asp:DropDownList>

                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Section] WHERE [SectionID] = @SectionID" SelectCommand="SELECT * FROM [tbl_Section]" InsertCommand="INSERT INTO [tbl_Section] ([SectionName]) VALUES (@SectionName)" UpdateCommand="UPDATE [tbl_Section] SET [SectionName] = @SectionName WHERE [SectionID] = @SectionID" OnSelecting="SqlDataSource3_Selecting">
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
                <div>
                    <asp:Button ID="btn_save" class="btn btn-primary shadow px-5" runat="server" Text="Save" OnClick="btn_save_Click" />
                </div>
                <br />
                <div>
                    <asp:GridView ID="GridViewClass" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="ClassID" DataSourceID="SqlDataSource1" ForeColor="Black">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ClassID" HeaderText="ClassID" InsertVisible="False" ReadOnly="True" SortExpression="ClassID" />
                            <asp:BoundField DataField="ClassName" HeaderText="ClassName" SortExpression="ClassName" />
                            <asp:BoundField DataField="StandardID" HeaderText="StandardID" SortExpression="StandardID" />
                            <asp:BoundField DataField="SectionID" HeaderText="SectionID" SortExpression="SectionID" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Class] WHERE [ClassID] = @ClassID" InsertCommand="INSERT INTO [tbl_Class] ([ClassName], [StandardID], [SectionID]) VALUES (@ClassName, @StandardID, @SectionID)" SelectCommand="SELECT * FROM [tbl_Class]" UpdateCommand="UPDATE [tbl_Class] SET [ClassName] = @ClassName, [StandardID] = @StandardID, [SectionID] = @SectionID WHERE [ClassID] = @ClassID">
                        <DeleteParameters>
                            <asp:Parameter Name="ClassID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="StandardID" Type="Int32" />
                            <asp:Parameter Name="SectionID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="StandardID" Type="Int32" />
                            <asp:Parameter Name="SectionID" Type="Int32" />
                            <asp:Parameter Name="ClassID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                </div>
            </div>
         </div>

</asp:Content>
