<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicCalculator.aspx.cs" Inherits="EMS_25112023.Assignement.BasicCalculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Basic Calculator</title>
    <link href="../CSS/bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="row bg-primary">
            <h3 class="text-center">Basic Calculator</h3>
        </div>
        <div class="row">
            <div class="col-6 offset-3">
                <table class="table">
                    <tr>
                        <th>First Number : </th>
                        <td>
                            <asp:TextBox runat="server" ID="txtfnumber"
                                CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <th>Second Number : </th>
                        <td>
                            <asp:TextBox runat="server" ID="txtsecondnumber"
                                CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                      <tr>
                        <th>Result : </th>
                        <td>
                            <asp:TextBox runat="server" ID="txtres" ReadOnly="true"
                                CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button runat="server" Text="+" 
                                ID="btnAdd" CssClass="btn btn-primary" 
                                OnClick="btnAdd_Click"/>
                        </td>
                         <td>
                            <asp:Button runat="server" Text="-" ID="btnSub" CssClass="btn btn-primary" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
