<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Employee_Layout.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="EMS_25112023.Account.Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildPage" runat="server">

 
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
                                    <label for="rdbRememberme" class="form-label">Remember Me</label>
                                    <asp:CheckBox ID="rdbRememberme"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="Password">
                                    </asp:CheckBox>
                                </div>
                                 <div class="mb-3">
                                    <asp:Button runat="server" Text="Login" 
                                        CssClass="btn btn-lg btn-primary"
                                        ID="btnLogin"
                                        OnClick="btnLogin_Click"/>
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
                                </div>
                                <%-- <div class="mb-3">
                                    <label for="txtUserId" class="form-label">Mobile No.</label>
                                    <asp:TextBox ID="TextBox3"
                                        runat="server"
                                        CssClass="form-control">
                                    </asp:TextBox>
                                </div>--%>
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
                                        CssClass="btn btn-lg btn-warning"
                                        ID="btnRegister"
                                        OnClick="btnRegister_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
</asp:Content>
