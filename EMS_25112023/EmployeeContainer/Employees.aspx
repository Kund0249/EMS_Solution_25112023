<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="Employees.aspx.cs"
    Inherits="EMS_25112023.EmployeeContainer.Employees"
    MasterPageFile="~/Layouts/Employee_Layout.Master" %>


<asp:Content runat="server" ContentPlaceHolderID="ChildPage">
  
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
                                NavigateUrl='<%# string.Format("~/EmployeeContainer/EditEmployee.aspx?id={0}",Eval("EmployeeId")) %>'
                                CssClass="btn btn-sm btn-primary"
                                Text="Edit">
                            </asp:HyperLink>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

</asp:Content>



