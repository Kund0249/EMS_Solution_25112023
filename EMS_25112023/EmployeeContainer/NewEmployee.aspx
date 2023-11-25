<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewEmployee.aspx.cs" Inherits="EMS_25112023.EmployeeContainer.NewEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="../CSS/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title>Add New Employee</title>
 <%--   <style>
       /*
           universal selector (*)
           Id Selector => #[Id]
           Class Selector => .[classname]
           tag selector => tagname
       */
         
    /*   p{
            color : red;
            font-weight : bold;
       }
       .btn:hover{
          cursor:pointer;
       }
       .btn{
            color : white;
            font-weight : bold;
            height : 30px;
            width : 90px;
            border-radius : 8px;
       }

        #btnSubmit{
            background-color : lightgreen;
        }
         #btnReset{
            background-color : red;
        }*/
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
       <div class="row">
           <div class="col-12 bg-primary">
               <h2 class="text-center">Employee Registration Form</h2>
           </div>
       </div>

        <div class="row">
             <div class="col-6 offset-3">
              <table class="table">
            <tr>
                <th>Full Name</th>
                <td>
                    <asp:TextBox runat="server" ID="txtFname"
                        CssClass="form-control"></asp:TextBox>
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
                   <asp:RadioButton runat="server" ID="rdbM" GroupName="Gender" /> Male
                   <asp:RadioButton runat="server" ID="rdbF" GroupName="Gender"/> Female
                </td>
            </tr>
             <tr>
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
                  <%-- <asp:CheckBox runat="server" ID="chkBank"/> Banking
                   <asp:CheckBox runat="server" ID="chkTTH"/> TTH--%>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button runat="server" ID="btnSubmit" Text="Submit" 
                        CssClass ="btn btn-success"
                        OnClick="btnSubmit_Click"/>
                </td>
                 <td>
                    <asp:Button runat="server" ID="btnReset" Text="Reset" CssClass="btn btn-danger"/>
                </td>
            </tr>
        </table>

                 <asp:Label runat="server" ID="lblname"></asp:Label>
        </div>
        </div>

       
      
    </form>
</body>
</html>
