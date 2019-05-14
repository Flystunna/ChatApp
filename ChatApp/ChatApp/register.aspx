<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ChatApp.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
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
        <a class="nav-link" href="login.aspx">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="contact.aspx">Contact</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="about.aspx">About</a>
      </li>
    </ul>
         <div class="form-inline my-2 my-lg-0">
      <asp:TextBox runat="server" id="TextBox1" class="form-control mr-sm-2" type="text" placeholder="Search"></asp:TextBox>
      <asp:Button ID="searchBTN" runat="server" class="btn btn-secondary my-2 my-sm-0" Text="Search" type="submit"></asp:Button>
    </div>
    </div>
    </div>
        <p></p>
    <div class="container">
        <div class="col-md-6">
        <h1 style="font-family:sans-serif">
        <i class="fas fa-user-plus"></i> <b>New User</b>
      </h1><br/>
            <h2><asp:Label runat="server" ID="infoLabel" ForeColor="Red"></asp:Label></h2>
            <div class="form-group">
                <label>Full Name:</label>
                <asp:TextBox runat="server" ID="txtFName" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                </div>
            <div class="form-group">
                <label>Username:</label>
                <asp:TextBox runat="server" ID="txtUname" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
          </div>
        <div class="form-group">
      <label for="exampleInputEmail1">Email address:</label>
      <asp:TextBox type="email" class="form-control" runat="server" id="txtemail" placeholder="Enter a valid Email" TextMode="Email" />
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
      <label>Password:</label>
      <asp:TextBox runat="server" type="password" class="form-control" id="txtPass" placeholder="Password"/>
    </div>
      <div class="form-group">
      <label>Confirm Password:</label>
      <asp:TextBox runat="server" type="password" class="form-control" id="txtPass2" placeholder="Confirm Password"/>
      </div>
         <div class="form-group">
      <label for="exampleTextarea">Address:</label>
     <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Address in Full" Rows="2" ID="txtAdd"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Button runat="server" Text="Register" CssClass="btn btn-primary" ID="btnRegister" OnClick="btnRegister_Click"/>
    </div>
            <p class="lead mt-4">Have An Account?<a href="/login.aspx">  Login</a></p>
    </div>
    </div>
    </form>
</body>
    <script src="public/js/bootstrap.js"></script>
    <script src="public/js/jquery-3.1.0.min.js"></script>
</html>
