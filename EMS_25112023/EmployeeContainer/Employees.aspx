<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="EMS_25112023.EmployeeContainer.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee</title>
    <link href="../CSS/bootstrap/css/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <div class="container-fluid">
        <form id="form1" runat="server">
            <div class="row">
                <div class="col-md-10 offset-1">
                    <asp:GridView runat="server" ID="GridEmployee"
                        AutoGenerateColumns="false"
                        CssClass="table mt-5"
                        ShowHeaderWhenEmpty="true"
                        EmptyDataText="No Data!">
                        <Columns>
                            <asp:BoundField HeaderText="Emp Code" DataField="EmployeeId" />
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:BoundField HeaderText="Gender" DataField="Gender" />
                            <asp:BoundField HeaderText="Email" DataField="EmailAddress" />
                            <asp:BoundField HeaderText="Mob No" DataField="ContactNo" />
                            <asp:BoundField HeaderText="Salary" DataField="Salary" />
                            <asp:BoundField HeaderText="Department" DataField="Department" />
                            <asp:BoundField HeaderText="Bank Acc" DataField="BankAccount"/>
                            <asp:BoundField HeaderText="Joining Date" DataField="DOJ"/>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </form>
    </div>

</body>
</html>
