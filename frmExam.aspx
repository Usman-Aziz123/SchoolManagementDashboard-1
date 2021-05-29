<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmExam.aspx.cs" Inherits="School_Dashboard.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1><u><b><i>EXAM MASTER DATA</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div class="form-group">
                    <asp:Label ID="lbl_ename" runat="server" Text="ExamName"></asp:Label>
                    <asp:TextBox ID="txt_ename" runat="server" class="form-control border-0 shadow form-control-lg text-violet"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Exam Name Required" ForeColor="Red" ControlToValidate="txt_ename"></asp:RequiredFieldValidator>
                </div>


                <div>
                <asp:Label ID="Label3" runat="server" Text="Exam Type"></asp:Label>
                 <asp:DropDownList ID="DropDownListET" runat="server" class="form-control border-0 shadow form-control-lg text-violet" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ExamTypeID"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_ExamType] WHERE [ExamTypeID] = @ExamTypeID" InsertCommand="INSERT INTO [tbl_ExamType] ([Name]) VALUES (@Name)" SelectCommand="SELECT * FROM [tbl_ExamType]" UpdateCommand="UPDATE [tbl_ExamType] SET [Name] = @Name WHERE [ExamTypeID] = @ExamTypeID">
                        <DeleteParameters>
                            <asp:Parameter Name="ExamTypeID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="ExamTypeID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>
                <br />

                <div>
                    <asp:Label ID="Label1" runat="server" Text="Start Date"></asp:Label>
                    <asp:TextBox ID="txt_sd" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="659px"></asp:TextBox>
                    <asp:ImageButton ID="imgbtn_cal_sd" runat="server" CausesValidation="False" Height="36px" ImageUrl="~/Images/calendar.png" Width="41px" OnClick="imgbtn_cal_sd_Click" />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Start Date Required" ControlToValidate="txt_sd" ForeColor="Red"></asp:RequiredFieldValidator>

                      <br />
                        <asp:Calendar ID="cal_sd" runat="server"  BackColor="#000066" BorderColor="White" BorderStyle="Groove" ForeColor="White" NextPrevFormat="ShortMonth" ShowGridLines="True" Visible="False" OnSelectionChanged="cal_sd_SelectionChanged">
                            <NextPrevStyle BackColor="Black" BorderStyle="Groove" ForeColor="White" />
                            <SelectedDayStyle Font-Bold="True" ForeColor="Black" />
                            <TitleStyle BackColor="Black" BorderColor="White" BorderStyle="Groove" />
                            <TodayDayStyle BackColor="Yellow" BorderStyle="Groove" Font-Bold="True" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#99CCFF" BorderColor="White" BorderStyle="Groove" />
                        </asp:Calendar> 
                </div>
                <div>
                        <asp:Label ID="Label2" runat="server" Text="End Date"></asp:Label>
                    <asp:TextBox ID="txt_ed" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="659px"></asp:TextBox>
                    <asp:ImageButton ID="imgbtn_cal_ed" runat="server" CausesValidation="False" Height="36px" ImageUrl="~/Images/calendar.png" Width="41px" OnClick="imgbtn_cal_ed_Click"  />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="End Date Required" ControlToValidate="txt_ed" ForeColor="Red"></asp:RequiredFieldValidator>

                      <br />
                        <asp:Calendar ID="cal_ed" runat="server"  BackColor="#000066" BorderColor="White" BorderStyle="Groove" ForeColor="White" NextPrevFormat="ShortMonth" ShowGridLines="True" Visible="False" OnSelectionChanged="cal_ed_SelectionChanged">
                            <NextPrevStyle BackColor="Black" BorderStyle="Groove" ForeColor="White" />
                            <SelectedDayStyle Font-Bold="True" ForeColor="Black" />
                            <TitleStyle BackColor="Black" BorderColor="White" BorderStyle="Groove" />
                            <TodayDayStyle BackColor="Yellow" BorderStyle="Groove" Font-Bold="True" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#99CCFF" BorderColor="White" BorderStyle="Groove" />
                        </asp:Calendar> 
                </div>
                <br />

                <div>
                    <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" class="btn btn-primary shadow px-5"/>
                </div>
                <br />
                <div>
                    <asp:GridView ID="GridViewExam" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ExamID" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewExam_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField SelectText="*" ShowSelectButton="True" />
                            <asp:BoundField DataField="ExamID" HeaderText="ExamID" InsertVisible="False" ReadOnly="True" SortExpression="ExamID" />
                            <asp:BoundField DataField="ExamName" HeaderText="ExamName" SortExpression="ExamName" />
                            <asp:BoundField DataField="ExamTypeID" HeaderText="ExamTypeID" SortExpression="ExamTypeID" />
                            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" SelectCommand="sp_GetExam" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </div>
                </div>
            </div>
      </div>
    


</asp:Content>
