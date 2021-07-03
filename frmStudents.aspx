<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmStudents.aspx.cs" Inherits="School_Dashboard.WebForm5" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <!-- Page Heading -->
        <h1><u><b><i>STUDENT MASTER DATA</i></b></u></h1>
        <br />
        <div class="row">
            <div class="col-md-6">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="form-group">

                    <table class="w-100">
                        <tr>
                            <td style="width: 456px">
                               
                                    <asp:Label ID="lbl_sname" runat="server" Text="Student Name"></asp:Label>
                                    <asp:TextBox ID="txt_sname" runat="server" type="text" placeholder="Student Name"  class="form-control border-0 shadow form-control-lg text-violet"  Width="450px" Style="margin-bottom: 0.4em"></asp:TextBox>
                                    <asp:Label ID="lbl_msg" runat="server" ForeColor="Red"></asp:Label>
                                    <asp:RequiredFieldValidator ID="SNameValidator" runat="server" ErrorMessage="Student Name is Required" ControlToValidate="txt_sname" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                            </td>
                            <td style="width: 456px">
                                    &nbsp;
                                    <asp:Label ID="Label4" runat="server" Text="Contact"></asp:Label>
                                    &nbsp;<asp:TextBox ID="txt_contact" runat="server" type="text" placeholder="Contact" class="form-control border-0 shadow form-control-lg text-violet" MaxLength="11" Width="450px" Style="margin-bottom: 0.4em" TextMode="Phone"></asp:TextBox>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Contact is Required" ControlToValidate="txt_contact" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="9999-9999999" MaskType="Number" TargetControlID="txt_contact" />
                                    </td>
                        </tr>
                        <tr>
                            <td style="width: 456px">
                               
                                    <asp:Label ID="lbl_fname" runat="server" Text="Father Name"></asp:Label>
                                    <asp:TextBox ID="txt_fname" runat="server" type="text" placeholder="Father Name" class="form-control border-0 shadow form-control-lg text-violet" Width="450px" Style="margin-bottom: 0.4em"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FNameValidator" runat="server" ErrorMessage="Father Name is Required" ControlToValidate="txt_fname" ForeColor="Red"></asp:RequiredFieldValidator>
                                        
                                </td>
                            <td style="width: 456px">
                                    &nbsp;
                                    <asp:Label ID="lbl_pass" runat="server" Text="Password"></asp:Label>
                                    &nbsp;<asp:TextBox ID="txt_pass" runat="server" type="password" placeholder="Password" class="form-control border-0 shadow form-control-lg text-violet" Width="450px" Style="margin-bottom: 0.4em" OnTextChanged="txt_pass_TextChanged"></asp:TextBox>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="PassValidator" runat="server" ErrorMessage="Password is Required" ControlToValidate="txt_pass" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 456px">
                                            <asp:Label ID="lbl_gender" runat="server" Text="Gender"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownListGender" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="450px">
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="GenderValidator" runat="server" ErrorMessage="Gender is Required" ControlToValidate="DropDownListGender" ForeColor="Red"></asp:RequiredFieldValidator>
                                            
                                            </td>
                            <td style="width: 456px">
                                      &nbsp;
                                      <asp:Label ID="lbl_address" runat="server" Text="Address"></asp:Label>
                                                    &nbsp;<asp:TextBox ID="txt_address" runat="server" type="text" placeholder="Address" class="form-control border-0 shadow form-control-lg text-violet" TextMode="MultiLine" Width="450px" OnTextChanged="txt_address_TextChanged"></asp:TextBox>
                                                    &nbsp;
                                                    <asp:RequiredFieldValidator ID="AddressValidator" runat="server" ErrorMessage="Address is Required" ControlToValidate="txt_address" ForeColor="Red"></asp:RequiredFieldValidator>
                                                   </td>
                        </tr>
                        <tr>
                            <td style="width: 456px">
                                                <br />
                                                <asp:Label ID="lbl_dob" runat="server" Text="Date of Birth"></asp:Label>
                                                <asp:TextBox ID="txt_dob" runat="server" type="text" placeholder="Date Of Birth" class="form-control border-0 shadow form-control-lg text-violet" Width="450px" Style="margin-bottom: 0.4em" OnTextChanged="txt_dob_TextChanged"></asp:TextBox>
                                                <asp:ImageButton ID="Imagebtn_cal_dob" runat="server" onsubmit="event.preventDefault()" OnClick="imgbtn_cal_dob_Click" CausesValidation="False" Height="36px" ImageUrl="~/Images/calendar.png" Width="41px" />
                                                <table class="w-100" style="width: 54%">
                                                    <tr>
                                                        <td style="width: 109px; height: 32px;">

                                                            <asp:Label ID="lbl_year" runat="server" Text="Year" Visible="False"></asp:Label>
                                                        </td>
                                                        <td style="height: 32px">
                                                            <asp:Label ID="lbl_month" runat="server" Text="Month" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 109px">
                                                            <asp:DropDownList ID="DropDownMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownYear_SelectedIndexChanged" Visible="False" class="form-control border-0 shadow form-control-lg text-violet" Width="200px"></asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownMonth_SelectedIndexChanged" Visible="False" class="form-control border-0 shadow form-control-lg text-violet" Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Calendar ID="cal_dob" runat="server" OnSelectionChanged="cal_dob_SelectionChanged" BackColor="#000066" BorderColor="White" BorderStyle="Groove" ForeColor="White" NextPrevFormat="ShortMonth" ShowGridLines="True" Visible="False">
                                                    <NextPrevStyle BackColor="Black" BorderStyle="Groove" ForeColor="White" />
                                                    <SelectedDayStyle Font-Bold="True" ForeColor="Black" />
                                                    <TitleStyle BackColor="Black" BorderColor="White" BorderStyle="Groove" />
                                                    <TodayDayStyle BackColor="Yellow" BorderStyle="Groove" Font-Bold="True" ForeColor="Black" />
                                                    <WeekendDayStyle BackColor="#99CCFF" BorderColor="White" BorderStyle="Groove" />
                                                </asp:Calendar>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_dob" ErrorMessage="Date of Birth Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                                         </td>
                            <td style="width: 856px">
                                    &nbsp;
                                    <asp:Label ID="lbl_admission" runat="server" Text="Admission Date"></asp:Label>
                                    &nbsp;<asp:TextBox ID="txt_Admission" runat="server" type="text" placeholder="Admission date" class="form-control border-0 shadow form-control-lg text-violet" Width="450px" Style="margin-bottom: 0.4em" OnTextChanged="txt_Admission_TextChanged"></asp:TextBox>
                                    &nbsp;
                                    <asp:ImageButton ID="Imagebtn_adm" runat="server" onsubmit="event.preventDefault()" CausesValidation="False" Height="36px" ImageUrl="~/Images/calendar.png" Width="41px" OnClick="Imagebtn_adm_Click1" />
                                    &nbsp;<asp:Calendar ID="cal_adm" runat="server" OnSelectionChanged="cal_adm_SelectionChanged" BackColor="#000066" BorderColor="White" BorderStyle="Groove" ForeColor="White" NextPrevFormat="ShortMonth" ShowGridLines="True" Visible="False">
                                        <NextPrevStyle BorderStyle="groove" />
                                        <SelectedDayStyle Font-Bold="true" ForeColor="black" />
                                        <TitleStyle BackColor="black" BorderColor="white" BorderStyle="groove" />
                                        <TodayDayStyle BackColor="yellow" BorderColor="black" BorderStyle="groove" Font-Bold="true" ForeColor="black" />
                                        <WeekendDayStyle BackColor="#99ccff" BorderColor="white" BorderStyle="groove" />
                                        <%--  <ajaxtoolkit:calendarextender id="cal_adm" runat="server" />---%>
                                    </asp:Calendar>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="ADValidator" runat="server" ControlToValidate="txt_Admission" ErrorMessage="Admission Date is Requird" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                        </tr>
                        <tr>
                            <td style="width: 456px">
                                    <asp:Label ID="lbl_age" runat="server" Text="Age"></asp:Label>
                                    <asp:TextBox ID="txt_age" runat="server" type="text" placeholder="Age" class="form-control border-0 shadow form-control-lg text-violet" MaxLength="2" Width="450px" Style="margin-bottom: 0.4em" ReadOnly="True" OnTextChanged="txt_age_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AgeValidator" runat="server" ErrorMessage="Age is Required" ControlToValidate="txt_age" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            <td style="width: 856px">
                                                        &nbsp;
                                                        <asp:Label ID="lbl_Status" runat="server" Text="Status"></asp:Label>
                                                        &nbsp;<asp:DropDownList ID="DropDownListStatus" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="450px">
                                                            <asp:ListItem>Active</asp:ListItem>
                                                            <asp:ListItem>InActive</asp:ListItem>
                                                        </asp:DropDownList>
                                                        &nbsp;
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="DropDownListStatus" ErrorMessage="Status is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                        </tr>
                        <tr>
                            <td style="width: 456px">
                                    <asp:Label ID="lbl_cnic" runat="server" Text="CNIC/B-Form"></asp:Label>
                                    <asp:TextBox ID="txt_cnic" runat="server" type="Cnic" placeholder="CNIC/B-Form" class="form-control border-0 shadow form-control-lg text-violet" MaxLength="15" Width="450px" Style="margin-bottom: 0.4em"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CNICValidator" runat="server" ErrorMessage="CNIC/B-Form is Required" ControlToValidate="txt_cnic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <ajaxToolkit:MaskedEditExtender ID="txt_cnic_MaskedEditExtender" runat="server" BehaviorID="txt_cnic_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99999-9999999-9" MaskType="Number" TargetControlID="txt_cnic" />
                                </td>
                            <td style="width: 856px">&nbsp;</td>
                        </tr>
                    </table>

                    <table class="w-100">
                       <tr>
                           <td>
                               
                                    &nbsp;</td>

                       </tr>
                    </table>
                    


                    

                <br />
                <br />
                <div>
                    v>
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
                </div>
            </div>
        </div>
        <br />
        <br />
        <div>
            <asp:GridView ID="GridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID" DataSourceID="SqlDataSource1" Height="133px" OnSelectedIndexChanged="GridViewStudents_SelectedIndexChanged" Width="745px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnRowUpdating="GridViewStudents_RowUpdating">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:CommandField HeaderText="Select" SelectText="*" ShowSelectButton="True" />
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" InsertVisible="False" SortExpression="StudentID"></asp:BoundField>
                    <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName"></asp:BoundField>
                    <asp:BoundField DataField="FatherName" HeaderText="FatherName" SortExpression="FatherName"></asp:BoundField>
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender"></asp:BoundField>
                    <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact"></asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                    <asp:BoundField DataField="Cnic" HeaderText="Cnic" SortExpression="Cnic"></asp:BoundField>
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth"></asp:BoundField>
                    <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                    <asp:BoundField DataField="DateOfAdmission" HeaderText="DateOfAdmission" SortExpression="DateOfAdmission" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:TemplateField HeaderText="Action" ShowHeader="False">
                        <ItemTemplate>
                            &nbsp;<asp:ImageButton ID="imgbtn_del" runat="server" ImageUrl="~/Images/unnamed.png" Width="32px" CausesValidation="False"  />
                            <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" DisplayModalPopupID="ModalPopupExtender1" TargetControlID="imgbtn_del" />
                            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="btn_no" OkControlID="btn_yes" PopupControlID="Panel1" TargetControlID="imgbtn_del">
                            </ajaxToolkit:ModalPopupExtender>
                            <br />
                            <div class="text-left">
                                <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" Height="103px" style="background-color: #66CCFF; margin-left: 2px;" Width="280px">
                                    <div class="text-center" style="width: 277px; height: 103px">
                                        Do you want make changes?<br />
                                        <br />
                                        <asp:Button ID="btn_yes" runat="server" BorderStyle="Solid" class="btn btn-primary shadow px-5" textallign="center" Text="Yes" Width="67px" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btn_no" runat="server" BorderStyle="Solid" class="btn btn-primary shadow px-5" textallign="center" Text="No" Width="65px" />
                                    </div>
                                </asp:Panel>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
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

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SMSConnectionString %>' DeleteCommand="DELETE FROM [tbl_Student] WHERE [StudentID] = @StudentID" InsertCommand="INSERT INTO [tbl_Student] ([StudentName], [FatherName], [Gender], [Contact], [Address], [Cnic], [DateOfBirth], [Age], [DateOfAdmission], [Password], [Status]) VALUES (@StudentName, @FatherName, @Gender, @Contact, @Address, @Cnic, @DateOfBirth, @Age, @DateOfAdmission, @Password, @Status)" SelectCommand="SELECT * FROM [tbl_Student]" UpdateCommand="UPDATE [tbl_Student] SET [StudentName] = @StudentName, [FatherName] = @FatherName, [Gender] = @Gender, [Contact] = @Contact, [Address] = @Address, [Cnic] = @Cnic, [DateOfBirth] = @DateOfBirth, [Age] = @Age, [DateOfAdmission] = @DateOfAdmission, [Password] = @Password, [Status] = @Status WHERE [StudentID] = @StudentID" OnUpdating="SqlDataSource1_Updating">


                <DeleteParameters>
                    <asp:Parameter Name="StudentID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StudentName" Type="String" />
                    <asp:Parameter Name="FatherName" Type="String" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="Contact" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Cnic" Type="String" />
                    <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                    <asp:Parameter Name="Age" Type="Int32" />
                    <asp:Parameter Name="DateOfAdmission" Type="DateTime" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StudentName" Type="String" />
                    <asp:Parameter Name="FatherName" Type="String" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="Contact" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Cnic" Type="String" />
                    <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                    <asp:Parameter Name="Age" Type="Int32" />
                    <asp:Parameter Name="DateOfAdmission" Type="DateTime" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="StudentID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
        </div>
</asp:Content>
