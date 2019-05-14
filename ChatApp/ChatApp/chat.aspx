<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chat.aspx.cs" Inherits="ChatApp.chat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chat</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
     <link href="public/css/bootstrappulse.css" rel="stylesheet" />
    <link href="public/css/font-awesome.min.css" rel="stylesheet" />
    <script src="public/js/jquery-3.1.0.js"></script>
     <style type="text/css">
         body {
             background-image:url(lap.jpg);
         }
        .OnlineCSS {
            position: relative;
            border: 0px solid #079404;
            height: 7px;
            width: 7px;
            border-radius: 50%;
            background-color: #079404;
            float: right;
            margin-top: 3%;
        }

        .OfflineCSS {
            position: relative;
            border: 0px solid #878080;
            height: 7px;
            width: 7px;
            border-radius: 50%;
            background-color: #c2bbbb;
            float: right;
            margin-top: 3%;
        }
        .SenderClass {
            left: 55%;
            background: #0b59ce;
            color: #ffffff;
            border: 1px solid #0b59ce;
        }

        .ReceiverClass {
            left: -55%;
            background: #c46909;
            color: #ffffff;
            border: 1px solid #c46909;
        }

        .MainChatListClass {
            padding: 5px;
            width: 250px;
            position: relative;
            border-radius: 5px;
            word-wrap: break-word;
            margin-top: 5px;
        }

        .SenderClass::after {
            content: ' ';
            position: absolute;
            width: 0;
            height: 0;
            left: 243px;
            top: 0px;
            border: 10px solid;
            border-color: transparent transparent #0b59ce #0b59ce;
        }

        .ReceiverClass::after {
            content: ' ';
            position: absolute;
            width: 0;
            height: 0;
            right: 243px;
            top: 3px;
            border: 10px solid;
            border-color: #c46909 #c46909 transparent transparent;
        }
    </style>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick">
            </asp:Timer>
            <asp:Panel ID="Panel2" runat="server">
                <div>
                    <h5 class="alert alert-dark" style="text-align: center">
                        <span>Hello <%=Server.HtmlEncode(CurrentSender.Text)%></span>
                        <br />
                        <asp:Button ID="Logout" runat="server" Text="logout" OnClick="logout_Click" CssClass="btn btn-danger" Height="30px" />
                    </h5>
                    <p class="alert alert-success" style="text-align: center">
                        <asp:Button ID="Button1" Text="Profile Page" runat="server"  CssClass="btn btn-info" OnClick="Button1_Click"  /></p>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel1" runat="server">
                <div style="max-height: 520px; padding: 5px" class="col-lg-12">
                    <asp:Label ID="CurrentSender" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="CurrentRecevier" runat="server" Text="" Visible="false"></asp:Label>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:RegistrationConnectionString %>' SelectCommand="SELECT [MsgSender] FROM [MsgTable2] WHERE (([RecevierSeen] = 0) AND ([MsgReceiver] = @MsgReceiver))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CurrentSender" PropertyName="Text" Name="MsgReceiver" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <span>Unread Messages </span>
                            <span>
                                <asp:Label ID="UnreadMsgCountLabel" runat="server" CssClass="badge"></asp:Label>
                            </span>
                        </div>
                      
                        <div class="list-group">
                            <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource3" Width="100%">
                                <ItemTemplate>
                                    <asp:LinkButton Text='<%# Eval("MsgSender") %>' runat="server" ID="MsgSenderLabel" OnClick="UsernameLabel_Click" CssClass="list-group-item" />
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:RegistrationConnectionString %>' SelectCommand="SELECT [Username] FROM [users2] WHERE ([Username] <> @Username) AND OnlineStatus = 1" >
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CurrentSender" PropertyName="Text" Name="Username" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="panel panel-success">
                        <div class="panel-heading">Online Users</div>
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="100%" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                            <ItemTemplate>
                                <div class="list-group-item">
                                    <asp:LinkButton Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" OnClick="UsernameLabel_Click" CssClass=" " />
                                    <div class="OnlineCSS" />
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:RegistrationConnectionString %>' SelectCommand="SELECT [Username] FROM [users2] WHERE ([Username] <> @Username) AND (OnlineStatus = 0  or OnlineStatus is null)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CurrentSender" PropertyName="Text" Name="Username" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="panel panel-info">
                        <div class="panel-heading">Offline Users</div>
                        <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource2" Width="100%">
                            <ItemTemplate>
                                <div class="list-group-item">
                                    <asp:LinkButton Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" OnClick="UsernameLabel_Click" />
                                    <div class="OfflineCSS"></div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger EventName="Tick" ControlID="Timer1" />
        </Triggers>
    </asp:UpdatePanel>
            </div>
            <div class="col-md-9">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <h4 style="text-align: center" class="alert alert-dark"><%= GetWelcomeBanner(CurrentRecevier.Text)%></h4>
                <span style="float: right"></span>
            </div>
            <asp:Panel runat="server" ID="chatPanel">
                <div style="vertical-align: middle; min-height: 350px;">
                    <div>
                        <asp:DataList ID="DataList2" runat="server" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatLayout="Table" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
                            <ItemTemplate>
                                <div class="<%# GetStyleForMsgList(Eval("MsgSender").ToString()) %>  MainChatListClass">
                                    <asp:Label ID="Label1" runat="server" Text='<%# GetPerfactName(Eval("MsgSender").ToString()) %>'></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ChatMsg") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="padding: 5px 15px 5px 5px">
        <asp:Panel ID="MsgPanel" CssClass="panel panel-default" runat="server" DefaultButton="sendBTN">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <script>
                        function loadingIconVisible() {
                            document.getElementById('<%=LoadingImage.ClientID%>').style.opacity = 1;
                        }
                    </script>
                    <div class="form-group">
                     <asp:TextBox ID="MSGTextBox" runat="server" placeholder="Enter message" Height="46px" CssClass="form-control"></asp:TextBox> 
                        </div>                           
                    <div class="form-group">
                      <asp:Button ID="sendBTN" runat="server" Text="Send" OnClick="sendBTN_Click" Height="46px" CssClass="btn btn-info btn-block" OnClientClick="loadingIconVisible()" />
                      <asp:Image ID="LoadingImage" runat="server" ImageUrl="~/icon/loadingIcon.gif" ImageAlign="Right" />
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
            </div>
        </div>   
    </div>
        </div>
    </form>
</body>
    <script src="public/js/bootstrap.js"></script>
    <script src="public/js/jquery-3.1.0.min.js"></script>
</html>
