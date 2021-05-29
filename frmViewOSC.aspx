<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmViewOSC.aspx.cs" Inherits="School_Dashboard.WebForm16" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    

    <style  type="text/css">
      .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=40);
        opacity: 0.4;
    }
    .modalPopup
    {
        background-color: #FFFFFF;
        width: 300px;
        border: 3px solid #0DA9D0;
    }

    .modalPopup
    {
        background-color: #FFFFFF;
        width: 300px;
        border: 3px solid #0DA9D0;
    }

        .auto-style1 {
            width: 648px;
        }
        .auto-style2 {
            width: 578px;
        }

        </style>

    <div class="container-fluid">


        <!-- Page Heading -->
        <h1><b><u></u></b></h1>
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div class="form-group">

                    <h1><u><b><i>SESSION DETAILS</i></b></u></h1>    
                    <br />
                    <table class="table table-bordered table-primary">
      <thead>
					<tr>
						<th class="auto-style2">Session</th>
						<th class="auto-style1">Class</th>                        <th>Actions</th>					</tr>				</thead >          <tbody>            <asp:Repeater runat="server" ID="rpt_session_class" OnItemCommand="rpt_session_class_ItemCommand">                <ItemTemplate>                    <tr>                        <td>                            <%#DataBinder.Eval(Container.DataItem,"SessionName") %>                        </td>                        <td>                            <%#   DataBinder.Eval(Container.DataItem,"ClassName")%>                        </td>                        <td>                        <asp:LinkButton ID="lnk_select"  title="Select" CommandName="Select" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"HeaderID") %>' runat="server" Text="Select" CausesValidation="false"></asp:LinkButton>                        </td>                    </tr>                </ItemTemplate>            </asp:Repeater>        </tbody>    </table>

                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>

                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="LinkButton1" PopupControlID="Panel3" CancelControlID="Button3" BackgroundCssClass="modalBackground" ></ajaxToolkit:ModalPopupExtender>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Header] WHERE [HeaderID] = @HeaderID" InsertCommand="INSERT INTO [tbl_Header] ([SessionID], [ClassID]) VALUES (@SessionID, @ClassID)" SelectCommand="SELECT * FROM [tbl_Header]" UpdateCommand="UPDATE [tbl_Header] SET [SessionID] = @SessionID, [ClassID] = @ClassID WHERE [HeaderID] = @HeaderID">
                        <DeleteParameters>
                            <asp:Parameter Name="HeaderID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SessionID" Type="Int32" />
                            <asp:Parameter Name="ClassID" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SessionID" Type="Int32" />
                            <asp:Parameter Name="ClassID" Type="Int32" />
                            <asp:Parameter Name="HeaderID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <%--<asp:Panel ID="Panel3" runat="server">--%>
                        
                        <table class="table table-bordered table-primary">      <thead>					<tr>                        <th>Section</th>						<th>Faculty</th>						<th>Course</th>                        					</tr>				</thead >          <tbody>            <asp:Repeater runat="server" ID="rpt_fac_course" >                <ItemTemplate>                    <tr>                        <td>                            <%#DataBinder.Eval(Container.DataItem,"SectionName") %>                        </td>                        <td>                            <%#DataBinder.Eval(Container.DataItem,"FacultyName") %>                        </td>                        <td>                            <%#   DataBinder.Eval(Container.DataItem,"CourseName")%>                        </td>                    </tr>                </ItemTemplate>            </asp:Repeater>        </tbody>    </table>

                        <br />
                        <br />
                    <%--</asp:Panel>--%>
                    <br />
                    <br />
                    <br />
                    <%--<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none" >
                        <asp:GridView ID="GridView2" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource2" ForeColor="Black" AutoGenerateColumns="False" DataKeyNames="DetailID">
                            <Columns>
                                <asp:BoundField DataField="DetailID" HeaderText="DetailID" InsertVisible="False" ReadOnly="True" SortExpression="DetailID" />
                                <asp:BoundField DataField="FacultyID" HeaderText="FacultyID" SortExpression="FacultyID" />
                                <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
                                <asp:BoundField DataField="HeaderID" HeaderText="HeaderID" SortExpression="HeaderID" />
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

                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Button" />

                    </asp:Panel>--%>
            </div>
                </div>
        </div>
    </div>

</asp:Content>
