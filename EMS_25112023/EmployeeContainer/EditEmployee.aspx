<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="EditEmployee.aspx.cs"
    Inherits="EMS_25112023.EmployeeContainer.EditEmployee"
    MasterPageFile="~/Layouts/Employee_Layout.Master" %>


<asp:Content ContentPlaceHolderID="ChildPage" runat="server">
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-12 bg-primary">
                <h2 class="text-center">Employee Modification Form</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-6 offset-3">
                <asp:HiddenField runat="server" ID="hdfEmpId" />
                <table class="table">
                    <tr>
                        <th>Full Name</th>
                        <td>
                            <asp:TextBox runat="server" ID="txtFname"
                                CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="txtFname"
                                ErrorMessage="Please enter name."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="txtFname"
                                ErrorMessage="Only alphabest allowed."
                                ValidationExpression="[a-zA-Z\s]*"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>

                        </td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th>Contact No.</th>
                        <td>
                            <asp:TextBox runat="server" ID="txtMob" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="txtMob"
                                ErrorMessage="Please enter mobile number."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="txtMob"
                                ErrorMessage="invalid mobile number."
                                ValidationExpression="[6-9]{1}[0-9]{9}"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>Department</th>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlDepartment"
                                CssClass="form-control"
                                DataValueField="DepartmentId"
                                DataTextField="DepartmentName">
                                <%--  <asp:ListItem Value="-1">Select Department</asp:ListItem>
                                     <asp:ListItem Value="1">Department Manager</asp:ListItem>
                                     <asp:ListItem Value="2">Finance & Account</asp:ListItem>
                                     <asp:ListItem Value="3">Brokerage Managert</asp:ListItem>
                                     <asp:ListItem Value="4">System ADMIN</asp:ListItem>--%>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="ddlDepartment"
                                ErrorMessage="Please select department."
                                InitialValue="-1"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>DOJ</th>
                        <td>
                            <asp:TextBox runat="server" ID="txtDoj" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th>Gender</th>
                        <td>
                            <asp:RadioButtonList runat="server" ID="rdbGender"
                                RepeatDirection="Horizontal">
                                <asp:ListItem Value="M">Male</asp:ListItem>
                                <asp:ListItem Value="F">Female</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="rdbGender"
                                ErrorMessage="Please select gender."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%-- <tr>
                        <th>Skills</th>
                        <td>
                            <asp:CheckBoxList runat="server" ID="chkSkils"
                                RepeatDirection="Horizontal"
                                RepeatColumns="4">
                                <asp:ListItem Value="C#">C#</asp:ListItem>
                                <asp:ListItem Value="asp">ASP.Net</asp:ListItem>
                                <asp:ListItem Value="mvc">MVC</asp:ListItem>
                                <asp:ListItem Value="angular">Angular</asp:ListItem>
                                <asp:ListItem Value="pyt">Python</asp:ListItem>
                                <asp:ListItem Value="java">Java</asp:ListItem>
                                <asp:ListItem Value="android">Android</asp:ListItem>
                                <asp:ListItem Value="winapp">Windows App</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>--%>

                    <tr>
                        <th>Salary</th>
                        <td>
                            <asp:TextBox runat="server" ID="txtSalary"
                                CssClass="form-control">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="txtSalary"
                                ErrorMessage="Please enter salary number."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:RangeValidator runat="server"
                                ControlToValidate="txtSalary"
                                ErrorMessage="Salary must be in between 10000 to 100000"
                                MinimumValue="10000"
                                MaximumValue="100000"
                                Type="Integer"
                                Display="Dynamic"
                                ForeColor="Red">
                            </asp:RangeValidator>
                        </td>
                    </tr>

                    <tr>
                        <th>Bank Account</th>
                        <td>
                            <asp:TextBox runat="server"
                                ID="txtbankaccount" CssClass="form-control"
                                TextMode="Password">

                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="txtbankaccount"
                                ErrorMessage="Please enter bank account number."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>

                        </td>
                    </tr>

                    <tr>
                        <th>Confirm Bank Account</th>
                        <td>
                            <asp:TextBox runat="server" ID="txtrebankaccount"
                                CssClass="form-control"
                                TextMode="Password">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="txtrebankaccount"
                                ErrorMessage="Please enter bank account number."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:CompareValidator runat="server"
                                ControlToValidate="txtrebankaccount"
                                ControlToCompare="txtbankaccount"
                                ErrorMessage="bank account number does not match."
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:CompareValidator>

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Button runat="server" ID="btnSubmit" Text="Submit"
                                CssClass="btn btn-success"
                                OnClick="btnSubmit_Click" />
                        </td>

                    </tr>
                </table>

            </div>
        </div>



    </form>
</asp:Content>


