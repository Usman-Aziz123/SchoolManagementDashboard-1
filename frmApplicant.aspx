<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmApplicant.aspx.cs" Inherits="School_Dashboard.frmApplicant" %>
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
        
        .auto-style1 {
            margin-right: 0px;
            width: 591px;
            height: 666px;
        }
        .auto-style2 {
            width: 470px;
        }
        
        .auto-style8 {
            height: 100px;
            width: 580px;
        }
        
    </style>
    </head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <table class="auto-style1" border="1">
            <tr>
                <td class="auto-style2">
        <div class="auto-style8">
            <asp:Label ID="Label1" runat="server" Text="Name : "></asp:Label>
            <asp:TextBox ID="txt_name" runat="server" placeholder="Name" class="form-control border-0 shadow form-control-lg text-violet"  Width="450px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" ErrorMessage="Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                <div class="auto-style8">
            <asp:Label ID="Label2" runat="server" Text="Email : "></asp:Label>
            <asp:TextBox ID="txt_email" runat="server" class="form-control border-0 shadow form-control-lg text-violet"  placeholder="Email" Width="450px" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_email" ErrorMessage="Email Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
                </td>
            </tr>
              <tr>
                <td class="auto-style2">
                <div class="auto-style8">
            <asp:Label ID="Label3" runat="server" Text="Contact : "></asp:Label>
            <asp:TextBox ID="txt_contact" runat="server" class="form-control border-0 shadow form-control-lg text-violet"  placeholder="Email" Width="450px" TextMode="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_contact" ErrorMessage="Contact Required" ForeColor="Red"></asp:RequiredFieldValidator>
                 <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Mask="9999-9999999" MaskType="Number" TargetControlID="txt_contact" />

        </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                <div class="auto-style8">
            <asp:Label ID="lbl_address" runat="server" Text="Address  : "></asp:Label>
            <asp:TextBox ID="txt_address" runat="server" class="form-control border-0 shadow form-control-lg text-violet"  placeholder="Address" Width="450px" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_address" ErrorMessage="Address Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                <div class="auto-style8">
            <asp:Label ID="lbl_age" runat="server" Text="Age : "></asp:Label>
            <asp:TextBox ID="txt_age" runat="server" class="form-control border-0 shadow form-control-lg text-violet"  placeholder="Age" Width="450px"></asp:TextBox>
        </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                <div class="auto-style8">
            <asp:Label ID="Label5" runat="server" Text="Experience : "></asp:Label>
            <asp:TextBox ID="txt_exp" runat="server" class="form-control border-0 shadow form-control-lg text-violet"  placeholder="Experience" Width="450px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_exp" ErrorMessage="Experience Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                <div class="auto-style8">
            <asp:Label ID="Label6" runat="server" Text="Description : "></asp:Label>
            <asp:TextBox ID="txt_description" runat="server" class="form-control border-0 shadow form-control-lg text-violet"  placeholder="Description" Width="450px" TextMode="MultiLine"></asp:TextBox>
        </div>
                </td>
            </tr>
        </table>
        <table class="w-100">
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="File Upload"></asp:Label>
&nbsp;
                    <asp:FileUpload ID="FileUpload1" runat="server" class="form-control border-0 shadow form-control-lg text-violet" placeolder="FileUpload" Width="450px"/>
                    <asp:Label ID="lbl_message" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FileUpload1" ErrorMessage="File Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <div>
        <asp:Button ID="btn_Save" runat="server" Text="Save" class="btn btn-primary shadow px-5" OnClick="btn_Save_Click" />
    </div>
    </form>
   
</body>
</html>
