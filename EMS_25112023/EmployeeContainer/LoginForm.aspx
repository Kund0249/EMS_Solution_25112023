<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="EMS_25112023.EmployeeContainer.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QuickXpert</title>
    <link href="../CSS/bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <h1 style="background-color:antiquewhite">QuickXpert Infotech</h1>
        </div>
        <div class="row">
        <div class="col-4">
<table>
    <thead><h2 class="text-center" style="background-color:antiquewhite">Login Form</h2></thead>
    <tr>
        <td>
            <asp:textbox runat="server" ID="txtUserId" CssClass="form-control"> UserId</asp:textbox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserId" 
                ErrorMessage="Please enter userId" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:textbox runat="server" ID="txtPass" CssClass="form-control"> UserId</asp:textbox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPass" 
                ErrorMessage="Please enter userId" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button runat="server" id="btnLogin" CssClass="btn-success" Text="Login"/>
        </td>
    </tr>
</table>
        </div>
        <div class="col-4">

        </div>
        <div class="col-4">
            <table>
                <thead><h2 class="text-center" style="background-color:antiquewhite">Registration Form</h2></thead>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="txtmob" CssClass="form-control">Mobile Number</asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtmob" ErrorMessage="Please enter mobile number"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="txtMob"
                                ErrorMessage="Invalid mobile number."
                                ValidationExpression="[6-9]{1}[0-9]{9}"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control">Email Id</asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Email Id"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="txtMob"
                                ErrorMessage="Invalid mobile number."
                                ValidationExpression="[a-zA-Z@]*"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="txtPasswpord" CssClass="form-control">Password</asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPasswpord" ErrorMessage="Please enter Email Id"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="txtPasswpord"
                                ErrorMessage="Invalid Password Please try again !..."
                                ValidationExpression="[A-Z]{1}[a-zA-Z]"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                    </td>
                </tr>
                 <tr>
        <td>
            <asp:Button runat="server" id="btnRegister" CssClass="btn-success" Text="Register"/>
        </td>
    </tr>
            </table>
        </div>
            </div>
    </form>
</body>
</html>
