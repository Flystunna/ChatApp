<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="ChatApp.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chatt</title>
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
        <a class="nav-link" href="register.aspx">Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.aspx">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="contact.aspx">Contact</a>
      </li>
    </ul>
         <div class="form-inline my-2 my-lg-0">
      <asp:TextBox runat="server" id="TextBox1" class="form-control mr-sm-2" type="text" placeholder="Search"></asp:TextBox>
      <asp:Button ID="searchBTN" runat="server" class="btn btn-secondary my-2 my-sm-0" Text="Search" type="submit"></asp:Button>
    </div>
    </div>
    </div>
        

    </form>
</body>
     <script src="public/js/bootstrap.js"></script>
    <script src="public/js/jquery-3.1.0.min.js"></script>
</html>
