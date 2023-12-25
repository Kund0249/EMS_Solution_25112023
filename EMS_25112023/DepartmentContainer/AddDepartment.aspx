<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="AddDepartment.aspx.cs"
    Inherits="EMS_25112023.DepartmentContainer.AddDepartment"
    MasterPageFile="~/Layouts/Employee_Layout.Master" %>

<%--<asp:Content runat="server" ContentPlaceHolderID="HeadSection">
    <link href="../CSS/toastr/toastr.css" rel="stylesheet" />
    <script src="../CSS/jquery/jquery.min.js"></script>
    <script src="../CSS/toastr/toastr.min.js"></script>
</asp:Content>--%>

<asp:Content runat="server" ContentPlaceHolderID="ChildPage">

   
        <div class="container-fluid">
            <asp:HiddenField runat="server" ID="hdfDeptId" />
            <div class="row">
                <div class="col-6 offset-3">
                    <table class="table">
                        <tr>
                            <th>Department Code</th>
                            <td>
                                <asp:TextBox runat="server" ID="txtDeptCode" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server"
                                    ControlToValidate="txtDeptCode"
                                    ErrorMessage="Please Enter Department Code"
                                    ForeColor="Red"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server"
                                    ControlToValidate="txtDeptCode"
                                    ErrorMessage="Please Enter valid 4 char Department Code"
                                    ForeColor="Red"
                                    ValidationExpression="[A-Z]{2,6}"
                                    Display="Dynamic">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Department Name</th>
                            <td>
                                <asp:TextBox runat="server" ID="txtDeptName" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server"
                                    ControlToValidate="txtDeptName"
                                    ErrorMessage="Please Enter Department Name"
                                    ForeColor="Red"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server"
                                    ControlToValidate="txtDeptName"
                                    ErrorMessage="only Alphabets are allowed."
                                    ForeColor="Red"
                                    ValidationExpression="[a-zA-Z\s]{2,20}"
                                    Display="Dynamic">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button runat="server" ID="btnSubmit" Text="Save"
                                    CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                            </td>
                            <td>
                                <asp:Button runat="server" ID="btnReset" Text="Reset"
                                    CausesValidation="false"
                                    CssClass="btn btn-danger" OnClick="btnReset_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row mt-5">
                <hr />
                <div class="col-6 offset-3">
                    <asp:GridView runat="server" ID="GridDepartment"
                        AutoGenerateColumns="false"
                        ShowHeaderWhenEmpty="true"
                        EmptyDataText="No Data!"
                        CssClass="table"
                        OnRowDeleting="GridDepartment_RowDeleting"
                        OnSelectedIndexChanged="GridDepartment_SelectedIndexChanged"
                        DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField HeaderText="Department Code" DataField="DeptCode" />
                            <asp:BoundField HeaderText="Department Name" DataField="DeptName" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <div class="btn-group btn-group-sm" role="group">
                                        <asp:Button runat="server"
                                            Text="Remove" CommandName="delete"
                                            CssClass="btn btn-sm btn-danger"
                                            CausesValidation="false" />

                                        <asp:Button runat="server"
                                            Text="Edit" CommandName="select"
                                            CssClass="btn btn-sm btn-primary"
                                            CausesValidation="false" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
 
</asp:Content>

