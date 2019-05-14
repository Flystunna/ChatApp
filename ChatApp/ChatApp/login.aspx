<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ChatApp.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
     <link href="public/css/bootstrappulse.css" rel="stylesheet" />
    <link href="public/css/font-awesome.min.css" rel="stylesheet" />
    <script src="public/js/jquery-3.1.0.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href=""><h2>NavBar</h2></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
    </ul>
         <div class="form-inline my-2 my-lg-0">
      <asp:TextBox runat="server" id="TextBox1" class="form-control mr-sm-2" type="text" placeholder="Search"></asp:TextBox>
      <asp:Button ID="searchBTN" runat="server" class="btn btn-secondary my-2 my-sm-0" Text="Search" type="submit"></asp:Button>
    </div>
    </div>
    </div>
        <p></p>
    <div>
   <div class="row mt-5">
  <div class="col-md-6 m-auto">
    <div class="card card-body">
      <h1 class="text-center mb-3"><i class="fas fa-sign-in-alt"></i>Login</h1><br/>  
        <h2><asp:Label runat="server" ID="infoLabel" ForeColor="Red"></asp:Label></h2> 
        <div class="form-group">
          <label for="email">Username:</label>
            <asp:TextBox runat="server" CssClass="form-control" placeholder="Enter your username" ID="txtUname"></asp:TextBox>
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
        <asp:TextBox runat="server" CssClass="form-control" placeholder="Enter your Password" ID="txtPass" TextMode="Password"></asp:TextBox>
        </div>
        <asp:CheckBox ID="RememberMeCheckBox" runat="server" Text="Remember Me" CssClass="checkbox" />
        <asp:Button type="submit" ID="btnLogin" runat="server" Text="Login" class="btn btn-primary btn-block" OnClick="btnLogin_Click"></asp:Button>
      <p class="lead mt-4">
        No Account? <a href="/register.aspx">Register</a><br/>
        Forgot Password? <a href="/forgot.aspx">Reset Password</a>
      </p>
    </div>
  </div>
</div>  
    </div>
    </form>
</body>
     <script src="public/js/bootstrap.js"></script>
    <script src="public/js/jquery-3.1.0.min.js"></script>
</html>
