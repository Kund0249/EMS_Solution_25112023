<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EMS_25112023.Assignement.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title>Member Form</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row bg-primary">
                <h2 class="text-center">Welcome to QuickXpert Infotech</h2>
            </div>
            <div class="row">
                <div class="col-4 offset-1">
                    <div class="mt-5">
                        <div class="card ">
                            <div class="card-header">
                                <h3 class="text-center">Login</h3>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="txtUserId" class="form-label">UserIds</label>
                                    <asp:TextBox ID="txtUserId"
                                        runat="server"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="txtpassword" class="form-label">Password</label>
                                    <asp:TextBox ID="txtpassword"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="Password">
                                    </asp:TextBox>
                                </div>
                                 <div class="mb-3">
                                    <asp:Button runat="server" Text="Login" 
                                        CssClass="btn btn-lg btn-primary"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4 offset-1">
                     <div class="mt-5">
                        <div class="card ">
                            <div class="card-header">
                                <h3 class="text-center">Registration</h3>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="txtUserId" class="form-label">Email</label>
                                    <asp:TextBox ID="txtemail"
                                        runat="server"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="txtemail"
                                        ErrorMessage="Please enter email"
                                        Display="Dynamic"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator runat="server"
                                        ControlToValidate="txtemail"
                                        ErrorMessage="Please enter valid email"
                                        Display="Dynamic"
                                        ValidationExpression="[a-zA-Z0-9]*[@]{1}[a-zA-Z]{2,}[.]{1}[a-zA-Z]*"
                                        ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>
                                 <div class="mb-3">
                                    <label for="txtUserId" class="form-label">Mobile No.</label>
                                    <asp:TextBox ID="TextBox3"
                                        runat="server"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="txtpassword" class="form-label">Password</label>
                                    <asp:TextBox ID="TextBox2"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="Password">
                                    </asp:TextBox>
                                </div>
                                 <div class="mb-3">
                                    <asp:Button runat="server" Text="Register" 
                                        CssClass="btn btn-lg btn-warning"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
