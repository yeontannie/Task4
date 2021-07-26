<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- documentation at http://getbootstrap.com/docs/4.1/, alternative themes at https://bootswatch.com/ -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">

    <link href="/static/style.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <title>Web App</title>

    <style type="text/css">
        .auto-style1 {
            color: #FFFFFF;
            background-color: #387BFE;
        }
    </style>

</head>

<body>

    <nav class="navbar navbar-expand-md navbar-light bg-light border">
        <a class="navbar-brand" href="/"><span class="blue">W</span><span class="red">E</span><span class="yellow">B</span> <span class="green">App</span></a>
        <button aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbar" data-toggle="collapse" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav ml-auto mt-2">
                <asp:HyperLink ID="HyperLink1" runat="server" href="LogIn.aspx">Log In</asp:HyperLink>
            </ul>
        </div>
    </nav>
    <main class="container p-5">
        <form id="form1" runat="server">
            <div class="form-group">
&nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="188px" placeholder="Username"></asp:TextBox>
                <p id="validy"></p>
            </div>
            <div class="form-group">
                &nbsp;<asp:TextBox ID="TextBox3" runat="server" placeholder="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                &nbsp;<asp:TextBox ID="TextBox4" runat="server" placeholder="Password" type="password"></asp:TextBox>
            </div>
            <div class="form-group">
                &nbsp;<asp:TextBox ID="TextBox5" runat="server" placeholder="Confirmation" type="password"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style1" Height="28px" Text="Register" Width="104px" OnClick="Button1_Click" />
    </form>

        <script>
        function namecheck() {
            var username = document.getElementById("username").value;
            var validy = document.getElementById("validy");
            $.get("/check?username=" + username, function(data)
            { if (data == false) {
                alert("Username is already taken");
                event.preventDefault(); }
            })
        }
        </script>
    </main>
</body>

</html>

