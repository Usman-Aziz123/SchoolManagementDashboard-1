<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmOnlineAdmission.aspx.cs" Inherits="School_Dashboard.frmOnlineAdmission" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>School DashBoard</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link id="new-stylesheet" rel="stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png?3">

     <link href="css/pikaday.css" rel="stylesheet" />
                <link href="css/site.css" rel="stylesheet" />
                <link href="css/theme.css" rel="stylesheet" />
    <%--    <link rel ="stylesheet" href="datepicker.min.css"/>--%>
                <script src="js/pikaday.js"></script>
    <!-- Tweaks for older IEs-->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <style type="text/css">
        /* Chart.js */
        @-webkit-keyframes chartjs-render-animation {
            from {
                opacity: 0.99
            }

            to {
                opacity: 1
            }
        }

        @keyframes chartjs-render-animation {
            from {
                opacity: 0.99
            }

            to {
                opacity: 1
            }
        }

        .chartjs-render-monitor {
            -webkit-animation: chartjs-render-animation 0.001s;
            animation: chartjs-render-animation 0.001s;
        }
        
        .auto-style2 {
            width: 456px;
            height: 32px;
        }
        .auto-style4 {
            width: 350px;
        }
        .auto-style5 {
            width: 350px;
            height: 32px;
        }
        
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <table class="w-100" border="1">
                        <tr>
                            <td class="auto-style4">
                               
                                    <asp:Label ID="lbl_sname" runat="server" Text="Student Name"></asp:Label>
                                    <asp:TextBox ID="txt_sname" runat="server" type="text" placeholder="Student Name"  class="form-control border-0 shadow form-control-lg text-violet"  Width="450px" Style="margin-bottom: 0.4em"></asp:TextBox>
                                    <asp:Label ID="lbl_msg" runat="server" ForeColor="Red"></asp:Label>
                                    <asp:RequiredFieldValidator ID="SNameValidator" runat="server" ErrorMessage="Student Name is Required" ControlToValidate="txt_sname" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                            </td>
                            <td style="width: 450px">
                                    &nbsp;
                                    <asp:Label ID="Label4" runat="server" Text="Contact"></asp:Label>
                                    &nbsp;<asp:TextBox ID="txt_contact" runat="server" type="text" placeholder="Contact" class="form-control border-0 shadow form-control-lg text-violet" MaxLength="11" Width="450px" Style="margin-bottom: 0.4em" TextMode="Phone"></asp:TextBox>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Contact is Required" ControlToValidate="txt_contact" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <ajaxtoolkit:maskededitextender ID="MaskedEditExtender1" runat="server" Mask="9999-9999999" MaskType="Number" TargetControlID="txt_contact" />
                                    </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                               
                                    <asp:Label ID="lbl_fname" runat="server" Text="Father Name"></asp:Label>
                                    <asp:TextBox ID="txt_fname" runat="server" type="text" placeholder="Father Name" class="form-control border-0 shadow form-control-lg text-violet" Width="450px" Style="margin-bottom: 0.4em"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FNameValidator" runat="server" ErrorMessage="Father Name is Required" ControlToValidate="txt_fname" ForeColor="Red"></asp:RequiredFieldValidator>
                                        
                                </td>
                            <td style="width: 450px">
                                    &nbsp;
                                    &nbsp;&nbsp;
                                            <asp:Label ID="lbl_gender" runat="server" Text="Gender"></asp:Label>
                                            <asp:DropDownList ID="DropDownListGender" runat="server" class="form-control border-0 shadow form-control-lg text-violet" Width="450px" >
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="GenderValidator" runat="server" ErrorMessage="Gender is Required" ControlToValidate="DropDownListGender" ForeColor="Red"></asp:RequiredFieldValidator>
                                            
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                            <br />
                                                <asp:Label ID="Label5" runat="server" Text="Date Of Birth  "></asp:Label>
                                                <asp:TextBox ID="txt_dob" runat="server" TextMode="Date" OnTextChanged="txt_dob_TextChanged"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="lbl_dob" runat="server"></asp:Label>
                                            <br />
                                    <asp:RequiredFieldValidator ID="AgeValidator0" runat="server" ErrorMessage="Date Of Birth is Required" ControlToValidate="txt_dob" ForeColor="Red"></asp:RequiredFieldValidator>
                                            
                                            </td>
                            <td style="width: 450px; ">
                                      &nbsp;
                                      <asp:Label ID="lbl_address" runat="server" Text="Address"></asp:Label>
                                                    &nbsp;<asp:TextBox ID="txt_address" runat="server" type="text" placeholder="Address" class="form-control border-0 shadow form-control-lg text-violet" TextMode="MultiLine" Width="450px" ></asp:TextBox>
                                                    &nbsp;
                                                    <asp:RequiredFieldValidator ID="AddressValidator" runat="server" ErrorMessage="Address is Required" ControlToValidate="txt_address" ForeColor="Red"></asp:RequiredFieldValidator>
                                                   </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                                <br />
                                    <asp:Label ID="lbl_age" runat="server" Text="Age"></asp:Label>
                                    <asp:TextBox ID="txt_age" runat="server" type="text" placeholder="Age" class="form-control border-0 shadow form-control-lg text-violet" MaxLength="2" Width="450px" Style="margin-bottom: 0.4em" ReadOnly="True" OnTextChanged="txt_age_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AgeValidator" runat="server" ErrorMessage="Age is Required" ControlToValidate="txt_age" ForeColor="Red"></asp:RequiredFieldValidator>
                                                         </td>
                            <td class="auto-style2">
                                    <asp:Label ID="lbl_cnic" runat="server" Text="CNIC/B-Form"></asp:Label>
                                    <asp:TextBox ID="txt_cnic" runat="server" type="Cnic" placeholder="CNIC/B-Form" class="form-control border-0 shadow form-control-lg text-violet" MaxLength="15" Width="450px" Style="margin-bottom: 0.4em"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CNICValidator" runat="server" ErrorMessage="CNIC/B-Form is Required" ControlToValidate="txt_cnic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <ajaxtoolkit:maskededitextender ID="txt_cnic_MaskedEditExtender" runat="server" BehaviorID="txt_cnic_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Mask="99999-9999999-9" MaskType="Number" TargetControlID="txt_cnic" />
                                </td>
                        </tr>
                        
                        
                    </table>
    <br />
    <div>
    <asp:Button ID="btn_save" class="btn btn-primary shadow px-5" runat="server" Text="Save" OnClick="btn_save_Click" />
                
    </div>
        </div>
    </form>
</body>
</html>
