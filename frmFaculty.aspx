<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmFaculty.aspx.cs" Inherits="School_Dashboard.WebForm1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container-fluid">

        <!-- Page Heading -->
        <h1><u><b><i>FACULTY MASTER DATA</i></b></u></h1>
<br />
        <div class="row">
            <div class="col-md-6">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                <table border="0" class="w-100" style="width: 88%">
                    <tr>
                        <td style="width: 452px">


                <div style="width: 464px">
                    <asp:Label ID="lbl_name" runat="server" Text="Name"></asp:Label>
                     <asp:TextBox ID="txt_name" runat="server" type="Name" placeholder="Name" class="form-control border-0 shadow form-control-lg text-violet" Width="450px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="txt_name" ErrorMessage="Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                        </td>
                        <td>
                 <div>
                    <asp:Label ID="lbl_gender" runat="server" Text="Gender"></asp:Label>
                   <asp:DropDownList ID="DropDownListGender" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="450px">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>FeMale</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="GenderValidator" runat="server" ErrorMessage="Gender is Required" ControlToValidate="DropDownListGender" ForeColor="Red"></asp:RequiredFieldValidator>
              
                     </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 452px">
                 <div>
                    <asp:Label ID="lbl_address" runat="server" Text="Address"></asp:Label>
                     <asp:TextBox ID="txt_address" runat="server" type="Name" placeholder="Address" class="form-control border-0 shadow form-control-lg text-violet" Width="450px" TextMode="MultiLine"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ErrorMessage="Address is Required" ControlToValidate="txt_address" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
                        </td>
                        <td>
                 <div>
                    <asp:Label ID="lbl_email" runat="server" Text="Email"></asp:Label>
                     <asp:TextBox ID="txt_email" runat="server" type="Email" placeholder="Email" class="form-control border-0 shadow form-control-lg text-violet" Width="450px" TextMode="Email"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email is Required" ControlToValidate="txt_email" ForeColor="Red"></asp:RequiredFieldValidator>
                 </div>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 452px">
                 <div>
                    <asp:Label ID="lbl_contact" runat="server" Text="Contact"></asp:Label>
                     <asp:TextBox ID="txt_contact" runat="server" type="Name" placeholder="Contact" class="form-control border-0 shadow form-control-lg text-violet" Width="450px" TextMode="Phone"></asp:TextBox>
                     <ajaxtoolkit:maskededitextender ID="txt_contact_MaskedEditExtender" runat="server" Mask="9999-9999999" MaskType="Number" TargetControlID="txt_contact" BehaviorID="txt_contact_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorContact" runat="server" ErrorMessage="Contact is Required" ControlToValidate="txt_contact" ForeColor="Red"></asp:RequiredFieldValidator>
                 </div>
                        </td>
                        <td>

                 <div>
                    <asp:Label ID="lbl_joindate" runat="server" Text="Join Date"></asp:Label>
                     <br />
                     <br />
                     <asp:Label ID="lbl_jd" runat="server"></asp:Label>
                     <br />
                     </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 452px">
                 <div>
                    <asp:Label ID="lbl_qualification" runat="server" Text="Qualification"></asp:Label>
                     <asp:TextBox ID="txt_qual" runat="server" type="Name" placeholder="Qualification" class="form-control border-0 shadow form-control-lg text-violet" Width="450px" ></asp:TextBox>
                     <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorQualification" runat="server" ErrorMessage="Qualification is Required" ControlToValidate="txt_qual" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
                        </td>
                        <td>
                 <div>
                    <asp:Label ID="lbl_status" runat="server" Text="Status"></asp:Label>
                   <asp:DropDownList ID="DropDownListStatus" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="450px">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>inActive</asp:ListItem>
                    </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorStatus" runat="server" ErrorMessage="Status is Required" ControlToValidate="DropDownListStatus" ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 452px">
                 <div>
                    <asp:Label ID="lbl_experience" runat="server" Text="Experience"></asp:Label>
                    <asp:TextBox ID="txt_exp" runat="server" type="Name" placeholder="Experience" class="form-control border-0 shadow form-control-lg text-violet" Width="450px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorExp" runat="server" ErrorMessage="Experience is Required" ControlToValidate="txt_exp" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                        </td>
                        <td>

                <div>
                    <asp:Label ID="lbl_chk" runat="server" Text="IsVisiting"></asp:Label>
                    <asp:CheckBox ID="chkbox_vf" runat="server" BackColor="White" ForeColor="Black" />

                </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 452px">

                 <div>
                    <asp:Label ID="lbl_pass" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="txt_pass" runat="server" type="Password" placeholder="Password" class="form-control border-0 shadow form-control-lg text-violet" Width="450px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ErrorMessage="Password is Required" ControlToValidate="txt_pass" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                        </td>
                        <td>
                            <asp:Label ID="lbl_cnic" runat="server" Text="CNIC/B-Form"></asp:Label>
                            <asp:TextBox ID="txt_cnic" runat="server" type="Cnic" placeholder="CNIC/B-Form" class="form-control border-0 shadow form-control-lg text-violet" MaxLength="15" Width="450px" Style="margin-bottom: 0.4em"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="CNICValidator" runat="server" ErrorMessage="CNIC/B-Form is Required" ControlToValidate="txt_cnic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <ajaxToolkit:MaskedEditExtender ID="txt_cnic_MaskedEditExtender" runat="server" BehaviorID="txt_cnic_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99999-9999999-9" MaskType="Number" TargetControlID="txt_cnic" />


                        </td>
                    </tr>
                </table>
                <br />
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

                </div>
            </div>
            </div>
    <br />

        <div>
            <asp:GridView ID="GridViewFaculty" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="FacultyID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewFaculty_SelectedIndexChanged" >
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:CommandField HeaderText="Select" SelectText="*" ShowSelectButton="True" />
                    <asp:BoundField DataField="FacultyID" HeaderText="FacultyID" ReadOnly="True" SortExpression="FacultyID" InsertVisible="False" />
                    <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" SortExpression="FacultyName" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                    <asp:BoundField DataField="Qualification" HeaderText="Qualification" SortExpression="Qualification" />
                    <asp:BoundField DataField="Experience" HeaderText="Experience" SortExpression="Experience" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="JoinDate" HeaderText="JoinDate" SortExpression="JoinDate" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="IsVisiting" HeaderText="IsVisiting" SortExpression="IsVisiting" />
                    <asp:BoundField DataField="Cnic" HeaderText="Cnic" SortExpression="Cnic" />
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


             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SMSConnectionString %>" DeleteCommand="DELETE FROM [tbl_Faculty] WHERE [FacultyID] = @FacultyID" InsertCommand="INSERT INTO [tbl_Faculty] ([FacultyName], [Address], [Contact], [Qualification], [Experience], [Password], [Gender], [Email], [Join Date], [Status], [IsVisiting]) VALUES (@FacultyName, @Address, @Contact, @Qualification, @Experience, @Password, @Gender, @Email, @Join_Date, @Status, @IsVisiting)" SelectCommand="SELECT * FROM [tbl_Faculty]" UpdateCommand="UPDATE [tbl_Faculty] SET [FacultyName] = @FacultyName, [Address] = @Address, [Contact] = @Contact, [Qualification] = @Qualification, [Experience] = @Experience, [Password] = @Password, [Gender] = @Gender, [Email] = @Email, [Join Date] = @Join_Date, [Status] = @Status, [IsVisiting] = @IsVisiting WHERE [FacultyID] = @FacultyID">
                 <DeleteParameters>
                     <asp:Parameter Name="FacultyID" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="FacultyName" Type="String" />
                     <asp:Parameter Name="Address" Type="String" />
                     <asp:Parameter Name="Contact" Type="String" />
                     <asp:Parameter Name="Qualification" Type="String" />
                     <asp:Parameter Name="Experience" Type="String" />
                     <asp:Parameter Name="Password" Type="String" />
                     <asp:Parameter Name="Gender" Type="String" />
                     <asp:Parameter Name="Email" Type="String" />
                     <asp:Parameter Name="Join_Date" DbType="DateTime2" />
                     <asp:Parameter Name="Status" Type="String" />
                     <asp:Parameter Name="IsVisiting" Type="Boolean" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="FacultyName" Type="String" />
                     <asp:Parameter Name="Address" Type="String" />
                     <asp:Parameter Name="Contact" Type="String" />
                     <asp:Parameter Name="Qualification" Type="String" />
                     <asp:Parameter Name="Experience" Type="String" />
                     <asp:Parameter Name="Password" Type="String" />
                     <asp:Parameter Name="Gender" Type="String" />
                     <asp:Parameter Name="Email" Type="String" />
                     <asp:Parameter DbType="DateTime2" Name="Join_Date" />
                     <asp:Parameter Name="Status" Type="String" />
                     <asp:Parameter Name="IsVisiting" Type="Boolean" />
                     <asp:Parameter Name="FacultyID" Type="Int32" />
                 </UpdateParameters>
            </asp:SqlDataSource>


             </div>
</asp:Content>
