<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmChangePassword.aspx.cs" Inherits="School_Dashboard.frmChangePassword" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

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
        
        .auto-style4 {
            width: 208px;
            height: 70px;
        }
        .auto-style5 {
            height: 70px;
        }
        .auto-style6 {
            width: 100%;
            height: 200px;
        }
        
        </style>

    </head>
<body style="height: 400px">

    <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:Panel ID="Panel1" runat="server" Height="350px">
                
                <table class="auto-style6">

                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label1" runat="server" Text="Current Password"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txt_oldpass" runat="server" Width="450px" class="form-control border-0 shadow form-control-lg text-violet"></asp:TextBox>
                            <asp:Label ID="lbl_op" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label2" runat="server" Text="New Password"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txt_newpass" runat="server" Width="450px" class="form-control border-0 shadow form-control-lg text-violet"></asp:TextBox>
                            <ajaxToolkit:PasswordStrength ID="txt_newpass_PasswordStrength" runat="server" BehaviorID="txt_newpass_PasswordStrength" TargetControlID="txt_newpass" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" PreferredPasswordLength="8" PrefixText="Strength : " RequiresUpperAndLowerCaseCharacters="True" />
                            <asp:Label ID="lbl_np" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txt_conpass" runat="server" Width="450px" class="form-control border-0 shadow form-control-lg text-violet"></asp:TextBox>
                            <ajaxToolkit:PasswordStrength ID="txt_conpass_PasswordStrength" runat="server" BehaviorID="txt_conpass_PasswordStrength" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" PreferredPasswordLength="8" PrefixText="Strength : " RequiresUpperAndLowerCaseCharacters="True" TargetControlID="txt_conpass" />
                            <asp:Label ID="lbl_cp" runat="server" ForeColor="Red"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfv_conpass" runat="server" ControlToValidate="txt_conpass" ErrorMessage="Confirm Password Requird"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cv_conpass" runat="server" ControlToCompare="txt_newpass" ControlToValidate="txt_conpass" ErrorMessage="Password does not match"></asp:CompareValidator>
                        </td>
                    </tr>
                </table>
                <br />

                <div>
                    <asp:Button ID="btn_update" runat="server" Text="Update Password"  class="btn btn-primary shadow px-5" OnClick="btn_update_Click"/>
                    <ajaxToolkit:ConfirmButtonExtender ID="btn_update_ConfirmButtonExtender" runat="server" BehaviorID="btn_update_ConfirmButtonExtender" ConfirmText="Are you sure you want to make changes?" TargetControlID="btn_update" />
                </div>
            </asp:Panel>

        
    </form>
</body>
</html>
