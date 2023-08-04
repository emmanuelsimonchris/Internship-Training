<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="GVD.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
        body {
            background-color: #222222;
            font-family: 'Arial', sans-serif;
        }
        
        h1 {
            text-align: center;
            color: antiquewhite;
        }
        
        h2 {
            text-align: center;
        }
        
        p {
            text-align: center;
            color: antiquewhite;
        }
        
        table {
            margin: auto;
            background-color: #222222;
            border-collapse: collapse;
            width: 1000px;
            color: antiquewhite;
        }
   
        input[type="text"], input[type="file"] {
            width: 250px;
            padding: 5px;
        }
        
        input[type="submit"] {
            padding: 10px 20px;
            background-color: lawngreen;
            color: #ffffff;
            border: none;
            cursor: pointer;
        }
        
        .error-message {
            color: #ff0000;
            font-size: 12px;
        }
        
        td {
            padding: 10px;
            border: 1px solid #dddddd;
            text-align: left;
        }
        
        .logo {
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
        }

        .auto-style1 {
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
            width: 62px;
            margin-left: 0px;
            height: 64px;
        }
        
        header {
            background-color: cornflowerblue;
            color: white;
            text-align: center;
            font-weight: bold;
        }
        
        .auto-style2 {
            height: 69px;
            color:black;
        }
    </style>
</head>
    
<body>
    <form id="form1" runat="server">
        <div>
            <header class="auto-style2">
                <img src="NMDC-Limited.jpg" class="auto-style1" alt="Logo" />
                NMDC Limited
                (A Govt Of India Organisation)
            </header>
            
            <h1>User Registration Form</h1>
            <h2>
                
            </h2>
            
            <p>Please Enter the Following Details Carefully</p>
            
            <table align="center">
                <tr>
                    <td>First Name</td>
                    <td>
                        <asp:TextBox ID="txtFirstName12" runat="server" placeholder="Please Enter Your First Name" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name Required" ControlToValidate="txtFirstName12"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>
                        <asp:TextBox ID="txtLastName12" runat="server" placeholder="Please Enter Your Last Name" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name Required" ControlToValidate="txtLastName12"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Age</td>
                    <td>
                        <asp:TextBox ID="txtAge12" runat="server" placeholder="Please Enter Your Age" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Age Required" ControlToValidate="txtAge12"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Designation</td>
                    <td>
                        <asp:TextBox ID="txtDes12" runat="server" placeholder="Please Enter Your Designation" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Designation is Required" ControlToValidate="txtDes12"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server" placeholder="Please Enter a Valid Email" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Address" ControlToValidate="txtEmail" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Please Enter Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Please Upload a PDF File Only</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Please Re-Check The Details carefully before you submit</td>
                    <td>
                        <asp:Button ID="Submit" runat="server" Text="Submit" BackColor="LightGreen" OnClick="Submit_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
