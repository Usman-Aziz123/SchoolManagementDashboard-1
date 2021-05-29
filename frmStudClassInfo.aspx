<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmStudClassInfo.aspx.cs" Inherits="School_Dashboard.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <!-- Page Heading -->
              <h1><u><b><i>STUDENT CLASS INFORMATION</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">

                <div>
                    <asp:Label ID="lbl_StudID" runat="server" Text="Student ID" ></asp:Label>
                    <asp:TextBox ID="txt_sid" runat="server" OnTextChanged="TextBox1_TextChanged" ReadOnly="True" class="form-control border-0 shadow form-control-lg text-violet" BackColor="Gray"></asp:TextBox>

                </div>
                <div>
                    <asp:Label ID="lbl_Class" runat="server" Text="Class"></asp:Label>
                    <asp:DropDownList ID="DropDownListClass" runat="server" class="form-control border-0 shadow form-control-lg text-violet" DataSourceID="SqlDataSource2" DataTextField="ClassName" DataValueField="ClassID" Width="249px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Class] WHERE [ClassID] = @ClassID" InsertCommand="INSERT INTO [tbl_Class] ([ClassName]) VALUES (@ClassName)" SelectCommand="SELECT [ClassID], [ClassName] FROM [tbl_Class]" UpdateCommand="UPDATE [tbl_Class] SET [ClassName] = @ClassName WHERE [ClassID] = @ClassID">
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

                <div>
                    <asp:Label ID="lbl_Section" runat="server" Text="Section Name"></asp:Label>
                    <asp:DropDownList ID="DropDownListSection" runat="server" class="form-control border-0 shadow form-control-lg text-violet" DataSourceID="SqlDataSource3" DataTextField="SectionName" DataValueField="SectionID" Width="250px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Section] WHERE [SectionID] = @SectionID" InsertCommand="INSERT INTO [tbl_Section] ([SectionName]) VALUES (@SectionName)" SelectCommand="SELECT [SectionID], [SectionName] FROM [tbl_Section]" UpdateCommand="UPDATE [tbl_Section] SET [SectionName] = @SectionName WHERE [SectionID] = @SectionID" OnSelecting="SqlDataSource3_Selecting">
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
                <br />
                <asp:Button ID="btn_Save" runat="server"  Text="Save" OnClick="btn_Save_Click" class="btn btn-primary shadow px-5" />
                <br />
                <br />


                <div>
                    <asp:GridView ID="GridViewSCI" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="SCIID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewSCI_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField SelectText="*" ShowSelectButton="True" />
                            <asp:BoundField DataField="SCIID" HeaderText="SCIID" InsertVisible="False" ReadOnly="True" SortExpression="SCIID" />
                            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                            <asp:BoundField DataField="ClassID" HeaderText="ClassID" SortExpression="ClassID" />
                            <asp:BoundField DataField="SectionID" HeaderText="SectionID" SortExpression="SectionID" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="SELECT * FROM [tbl_StudClassInfo]">
                    </asp:SqlDataSource>
                </div>
                
                </div>
            
        </div>
        

            </div>
    


</asp:Content>
