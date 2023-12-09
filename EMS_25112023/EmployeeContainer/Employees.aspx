<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="EMS_25112023.EmployeeContainer.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee</title> 
    <link href="../CSS/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../CSS/toastr/toastr.css" rel="stylesheet" />

    <script src="../CSS/jquery/jquery.min.js"></script>
    <script src="../CSS/toastr/toastr.min.js"></script>
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
                        EmptyDataText="No Data!"
                        OnRowDeleting="GridEmployee_RowDeleting"
                        DataKeyNames="EmployeeId">
                        <Columns>
                            <asp:BoundField HeaderText="Emp Code" DataField="EmployeeId" />
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:BoundField HeaderText="Gender" DataField="Gender" />
                            <asp:BoundField HeaderText="Email" DataField="EmailAddress" />
                            <asp:BoundField HeaderText="Mob No" DataField="ContactNo" />
                            <asp:BoundField HeaderText="Salary" DataField="Salary" />
                            <asp:BoundField HeaderText="Department" DataField="Department" />
                            <asp:BoundField HeaderText="Bank Acc" DataField="BankAccount" />
                            <asp:BoundField HeaderText="Joining Date" DataField="DOJ" />
                            <%-- <asp:CommandField HeaderText="Action"
                                ShowDeleteButton="true"
                                ButtonType="Button"
                                ShowEditButton="true"
                                />--%>
                            <asp:TemplateField>
                                <ItemTemplate>

                                    <div class="btn-group" role="group">

                                        <asp:Button runat="server"
                                            ID="btnRemove" Text="Delete"
                                            CommandName="Delete"
                                            CssClass="btn btn-sm btn-danger" />
                                        <asp:HyperLink
                                            runat="server" ID="NavEdit"
                                            NavigateUrl= '<%# string.Format("~/EmployeeContainer/EditEmployee.aspx?id={0}",Eval("EmployeeId")) %>'
                                            CssClass="btn btn-sm btn-primary"
                                            Text="Edit">
                                        </asp:HyperLink>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </form>
    </div>

</body>
</html>
