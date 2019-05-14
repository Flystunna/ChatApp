<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reset.aspx.cs" Inherits="ChatApp.Reset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password </title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
     <link href="public/css/bootstrappulse.css" rel="stylesheet" />
    <link href="public/css/font-awesome.min.css" rel="stylesheet" />
    <script src="public/js/jquery-3.1.0.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="jumbotron">
            <h2>Recover Password</h2>
            <br />
            <h4>Please enter your email address, if registered, we will send you instructions to reset your password</h4>
        </div><br />
        <div class="col-md-5">
            <h1><asp:Label runat="server" CssClass="text-center" ID="infoLabel"></asp:Label></h1>   
        <div class="form-group">
            <label>Your Email: </label>
                <asp:TextBox runat="server" placeholder="Enter a valid Email Address"  ID="txtEmailId" CssClass="form-control" TextMode="Email"></asp:TextBox>
              </div>
            <asp:Button runat="server" Text="Send Email" ID="txtSend" CssClass="btn btn-primary" OnClick="txtSend_Click" /><br />  
            
        </div>
        </div>
    </form>
</body>
     <script src="public/js/bootstrap.js"></script>
    <script src="public/js/jquery-3.1.0.min.js"></script>
</html>
