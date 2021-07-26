<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home"%>

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
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-md navbar-light bg-light border">
            <a class="navbar-brand" href="/"><span class="blue">W</span><span class="red">E</span><span class="yellow">B</span> <span class="green">App</span></a>
            <button aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbar" data-toggle="collapse" type="button">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="navbar-nav ml-auto mt-2">
                    <li class="nav-item"><a class="nav-link" href="LogIn.aspx">Log Out</a></li>
                </ul>
            </div>
        </nav>
        <asp:Panel ID="Panel1" runat="server">
            <asp:Button ID="Button1" runat="server" Height="28px" OnClick="Button1_Click" Text="Block" Width="104px" />
            <asp:Button ID="Button2" runat="server" Height="28px" OnClick="Button2_Click1" Text="Unblock" Width="104px" />
            <asp:Button ID="Button3" runat="server" Height="28px" OnClick="Button3_Click" Text="Delete" Width="104px" />
        </asp:Panel>

        <table style="margin:0 auto; margin-top:50px">
            <tr>
                <td> 
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="750px" >
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkboxSelectAll"  AutoPostBack="true" OnCheckedChanged="chkboxSelectAll_CheckedChanged" runat="server"/>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkEmp" runat="server"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="user_id" HeaderText="ID" ReadOnly="true" />
                        <asp:BoundField DataField="username" HeaderText="Name" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="dateofreg" HeaderText="Date of registration" />
                        <asp:BoundField DataField="lastlogin" HeaderText="Date of last login" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="StatusLabel" runat="server" Text='<% #StatusValue(Eval("Status").ToString()) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#0066CC" Font-Bold="true" ForeColor="White" Height="30px" />
                    <PagerStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" Wrap="false" />
                    <SelectedRowStyle BackColor="669999" Font-Bold="true" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedAscendingCellStyle BackColor="#CAC9C9" />
                    <SortedAscendingHeaderStyle BackColor="#00547E" />
                </asp:GridView></td>
            </tr>
        </table>
    </form>
    </body>
</html>