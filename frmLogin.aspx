<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="School_Dashboard.frmLogin" %>

<!DOCTYPE html>

<html>
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
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      <style type="text/css">
          .auto-style1 {
              text-decoration: underline;
          }
          .auto-style2 {
              width: 100%;
              height: 278px;
              margin-bottom: 0px;
          }
          .auto-style4 {
              height: 33px;
          }
          .auto-style5 {
              height: 29px;
          }
          .auto-style6 {
              height: 31px;
          }
          .auto-style7 {
              height: 27px;
          }
      </style>
  </head>
  <body>
      <header class="header">
            <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">
                <a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i class="fas fa-align-left"></i></a><a href="frmLogin.aspx" class="navbar-brand font-weight-bold text-uppercase text-base">Dashboard</a>
                <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
                    <li class="nav-item">
                        <div>
                          <asp:HyperLink ID="HyperLink5" runat="server" href="frmApplicant.aspx" CssClass="auto-style1" Font-Size="XX-Small">Careers</asp:HyperLink>
                        </div>
                        </li>
                    &nbsp;
                     <li class="nav-item">
                        <div>
                          <asp:HyperLink ID="HyperLink4" runat="server" href="frmApplicant.aspx" CssClass="auto-style1" Font-Size="XX-Small">Online Admission</asp:HyperLink>
                        </div>
                        </li>
                    </ul>
                </nav>
          </header>

      <form id="form1" runat="server">
    <div class="page-holder d-flex align-items-center">
      <div class="container">
        <div class="row align-items-center py-5">
          <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">
            <div class="pr-lg-5"><img src="img/illustration.svg" alt="" class="img-fluid"></div>
          </div>
          <div class="col-lg-5 px-lg-4">
              <br />
              <br />
              <br />
              <br />
            <h2 class="mb-4">Welcome!</h2>
              <br />
              
              <table border="0" class="auto-style2">
                  <tr>
                      <td class="auto-style5"><strong>

                  
                  <asp:HyperLink ID="HyperLink3" runat="server" href="frmAdminLogin.aspx" CssClass="auto-style1" Font-Bold="True" Font-Italic="False" Font-Size="X-Large">Admin Login</asp:HyperLink>

              </strong>

                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style4"><strong>

                  
            <asp:HyperLink ID="HyperLink1" runat="server" href="frmStudentLogin.aspx" CssClass="auto-style1" Font-Size="X-Large">Student Login</asp:HyperLink>

              </strong>

                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style6"><strong>

                  
            <asp:HyperLink ID="HyperLink2" runat="server" href="frmFacultyLogin.aspx" CssClass="auto-style1" Font-Size="X-Large">Faculty Login</asp:HyperLink>

              </strong>

                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style7">




              
              <strong>

                  
<%--                  <asp:HyperLink ID="HyperLink4" runat="server" href="frmApplicant.aspx" CssClass="auto-style1" Font-Size="XX-Small">Careers</asp:HyperLink>--%>

              </strong>

                      </td>
                  </tr>
              </table>
              <strong>

                  
                   <br />
              <br />

                  
              <br />
              <br />
             <br />
              <br />

              </strong>

             <%-- <form id="loginForm" action="index.aspx" class="mt-4">
              
                <asp:View ID="View1" runat="server"></asp:View>
              <div class="form-group mb-4">
                <input type="text" name="username" placeholder="Username or Email address" class="form-control border-0 shadow form-control-lg">
              </div>
              <div class="form-group mb-4">
                <input type="password" name="passowrd" placeholder="Password" class="form-control border-0 shadow form-control-lg text-violet">
              </div>
              <div class="form-group mb-4">
                <div class="custom-control custom-checkbox">
                  <input id="customCheck1" type="checkbox" checked class="custom-control-input">
                  <label for="customCheck1" class="custom-control-label">Remember Me</label>
                </div>
              </div>
              <button type="submit" class="btn btn-primary shadow px-5">Log in</button>
                  
            </form>--%>
              <br />
              <br />
              <br />
          </div>

        </div>
        <p class="mt-5 mb-0 text-gray-400 text-center">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Bootstrapious</a> & Your company</p>
        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)                 -->
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
    <script src="js/front.js"></script>
      </form>
  </body>
</html>
