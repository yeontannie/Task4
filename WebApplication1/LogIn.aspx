<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="WebApplication1.LogIn" %>

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

</head>

<body>

    <nav class="navbar navbar-expand-md navbar-light bg-light border">
        <a class="navbar-brand" href="/"><span class="blue">W</span><span class="red">E</span><span class="yellow">B</span> <span class="green">App</span></a>
        <button aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbar" data-toggle="collapse" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav ml-auto mt-2">
                <asp:HyperLink ID="HyperLink1" runat="server" href="Register.aspx">Register</asp:HyperLink>
            </ul>
        </div>
    </nav>

    <main class="container p-5">
        <form id="form1" runat="server">
            <div class="form-group">
                &nbsp;<asp:TextBox ID="TextBox1" runat="server" placeholder="Username" type="input"></asp:TextBox>
            </div>
            <div class="form-group">
                &nbsp;<asp:TextBox ID="TextBox2" runat="server" placeholder="Password" type="password"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" runat="server" CssClass="badge-primary" Height="30px" OnClick="Button1_Click" Text="Log In" Width="72px" />
    </form>
    </main>
</body>
</html>

