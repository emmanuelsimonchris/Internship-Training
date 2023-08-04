<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="GVD.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 
<head runat="server">

    <title>Details.NMDC</title>
    <style>
        body {
            position: relative;
            z-index: 1;
        }
        
        h1 {
            text-align: center;
            color: palevioletred;
        }
        
        p {
            text-align: center;

        }
         

        #overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.5);
            z-index: 1;
        }
        header{
            background-color:cornflowerblue;
            color:white
            
        }
        body{
            background-color:#2222;
        }
    </style>
</head>
<body>
    <script type="text/javascript" src="js/JScript.js" ></script>
    <header>
        <p> NMDC Limited</p>
    </header>
    <h1>Employee Details</h1>
    <p>Please check the details and edit if required and write a remark</p>
    <form id="form2" runat="server">
        <div class="form">
    <asp:GridView ID="gvDetails" runat="server" CssClass="table" AutoGenerateColumns="False"
                DataKeyNames="FilePath"  OnRowEditing="gvDetails_RowEditing" 
                ShowFooter="True" ShowHeaderWhenEmpty="True" Width="100%" OnRowUpdating="gvDetails_RowUpdating" style="margin-left: 0px" OnRowDeleting="gvDetails_RowDeleting" >
                <Columns>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqTxtFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is Required!" ValidationGroup="saveGroup" Display="Dynamic"></asp:RequiredFieldValidator>

                        </EditItemTemplate>


                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("LastName") %>'></asp:Label>

                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="reqTxtLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is Required!" ValidationGroup="saveGroup" Display="Dynamic"></asp:RequiredFieldValidator>




                        </EditItemTemplate>
 

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Age">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Age") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            
                        <asp:TextBox ID="txtMail" Text='<%# Bind("Age") %>' runat="server">

                        
                        </asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTxtMail" runat="server" ControlToValidate="txtMail" ErrorMessage="Field is Required!" ValidationGroup="saveGroup" Display="Dynamic"></asp:RequiredFieldValidator>


                        </EditItemTemplate>
                       

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Designation">
                    <ItemTemplate>
                      
                       <asp:Label Text='<%# Eval("Designation") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtYIS" Text='<%# Bind("Designation") %>' runat="server">


                        </asp:TextBox>
             <asp:RequiredFieldValidator ID="reqTxtYIS" runat="server" ControlToValidate="txtYIS" ErrorMessage="Field is Required!" ValidationGroup="saveGroup" Display="Dynamic"></asp:RequiredFieldValidator>


                        </EditItemTemplate>
                       </asp:TemplateField>
                <asp:TemplateField HeaderText="FilePath">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnViewFile" runat="server" OnClick="btnView_Click">View</asp:LinkButton>

                    </ItemTemplate>

                </asp:TemplateField>

            

                
                <asp:TemplateField HeaderText="Remarks">
                    <ItemTemplate>
                      
                            <asp:Label Text='<%# Eval("Remarks")%>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDes" Text='<%# Bind("Remarks") %>' runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="reqTxtDes" runat="server" ControlToValidate="txtDes" ErrorMessage="Field is Required!" ValidationGroup="saveGroup" Display="Dynamic"></asp:RequiredFieldValidator>

                        
                        </EditItemTemplate>
                       

                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="images/Edit.png" CommandName="Edit" ID ="IEdit" runat="server" ToolTip="Edit" Width="20px" Height="20px"  />
                        <asp:ImageButton ImageUrl="images/Delete.png" CommandName="Delete" ID ="IDelete" runat="server" ToolTip="Delete" Width="20px" Height="20px"  />
                        </ItemTemplate>
                    <EditItemTemplate>
                            <asp:ImageButton ImageUrl="images/Save.png" CommandName="Update" ID ="ISave" runat="server" ToolTip="Update" Width="20px" Height="20px" ValidationGroup="saveGroup"/>
                            </EditItemTemplate>
                       
                    
                </asp:TemplateField>

                    </Columns>
        </asp:GridView>

   
        </div>
    </form>
</body>
</html>
