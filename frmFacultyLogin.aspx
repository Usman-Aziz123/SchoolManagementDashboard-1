<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmFacultyLogin.aspx.cs" Inherits="School_Dashboard.frmFacultyLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SCHOOL DASHBOARD</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" >
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png?3">
    <!-- Tweaks for older IEs-->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
    <div class="page-holder d-flex align-items-center">
      <div class="container">
        <div class="row align-items-center py-5">
          <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">
            <div class="pr-lg-5"><img src="img/illustration.svg" alt="" class="img-fluid"></div>
          </div>
          <div class="col-lg-5 px-lg-4">
            <h2 class="mb-4">Welcome!</h2>
              <form id="loginForm" runat="server">


        <div class="form-group mb-4">
            <asp:Label ID="Label1" runat="server" Text="Faculty ID"></asp:Label>
            <asp:TextBox ID="txt_fid" runat="server" class="form-control border-0 shadow form-control-lg text-violet" style="width: 40%; margin-bottom: 0" placeholder="Faculty ID" OnTextChanged="txt_fid_TextChanged"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_fid" ErrorMessage="Faculty ID Required!" placeholder="Student Name" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_fid" ErrorMessage="Numbers Allowed Only!" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        <div class="form-group mb-4">
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txt_pass" runat="server" class="form-control border-0 shadow form-control-lg text-violet" style="width: 40%; margin-bottom: 0" type="password"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password Required!" ControlToValidate="txt_pass" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
                  <br />
        <div class="form-group mb-4">
            <div class="custom-control custom-checkbox">
                <input id="customCheck1" type="checkbox" checked class="custom-control-input">
                <label for="customCheck1" class="custom-control-label">Remember Me</label>
            </div>
        </div>
            </div>
                  <asp:Button ID="btn_login" runat="server" Text="Login" class="btn btn-primary shadow px-5" OnClick="btn_login_Click"/>
              </form>
              </div>
            </div>
          </div>
        
        <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
    <script src="js/front.js"></script>
        </div>
</body>
</html>
