<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="GVD.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

    <style>
        header {
            background-color: cornflowerblue;
            color: white;
            text-align: center;
            font: bold;
            font-size: inherit;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #FF4545;
            font-family: 'Roboto', sans-serif;
        }

        h1 {
            align-content: center;
            font-display: auto;
            text-align: center;
            font-family: 'Helvetica', sans-serif;
            color:antiquewhite;
        }

        .auto-style1 {
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
            align-content: center;
            width: 119px;
            margin-left: 572px;
            height: 115px;
        }

        .center-align {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background-color: #222222;
            color: aqua antiquewhite;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            font-family: 'Arial', sans-serif;
        }

        .form-group {
            margin-bottom: 10px;
            text-align: left;
        }
        
        .form-group label {
            font-weight: bold;
            font-family: 'Roboto', sans-serif;
            color:antiquewhite;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-family: 'Arial', sans-serif;
            color: black; /* Set text box color to black */
        }

        .center-button {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Login</h1>
            <h2><img src="NMDC-Limited.jpg" class="auto-style1" alt="Logo" /></h2>

            <div class="center-align">
                <div class="container">
                    <div class="form-group">
                        <label><i class="fas fa-user"></i> User Name:</label>
                        <br />
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email Address" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email Address is required" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label><i class="fas fa-lock"></i> Password:</label>
                        <br />
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter Password" Width="317px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    </div>
                    <div class="center-button">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" BackColor="LightGreen" OnClick="btnLogin_Click" Width="116px" Height="50px" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
