<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="_2AdminArea_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid mainContent">
        <div class="d-flex justify-content-center">
            <div class="col-11 col-md-6">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnSuccessAlertText" runat="server"><i class="fa fa-check"></i> Your password changed successfuly.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnErrorAlertText" runat="server"><i class="fa fa-times"></i> Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <div class="card shadow-lg">
                    <div class="card-header">
                        <h6 class="text-center text-uppercase text-muted">Change your password.</h6>
                    </div>
                    <div class="card-body">
                         <div class="m-1">
                             <label>Old Password</label>
                             <asp:TextBox ID="tbOldPassword" runat="server" CssClass="form-control" required="required" TextMode="Password"></asp:TextBox>
                         </div>
                        <div class="m-1">
                             <label>New Password</label>
                             <asp:TextBox ID="tbNewPassword" runat="server" CssClass="form-control" required="required" TextMode="Password"></asp:TextBox>
                         </div>
                        <div class="m-1">
                             <label>Retype New Password</label>
                             <asp:TextBox ID="tbRetypeNewPassword" runat="server" CssClass="form-control" required="required" TextMode="Password" onkeyup="passwordMatch();"></asp:TextBox>
                         <span class="text-danger" id="txtPasswordNotMatch"><i class="fa fa-times-circle"></i> Password not match!</span>
                            <span class="text-success" id="txtPasswordMatch"><i class="fa fa-check-circle"></i> Password match!</span>
                        </div>
                        <div class="m-1">
                            <div class="d-flex justify-content-center pt-2">
                                <asp:Button ID="btnChangePassword" runat="server" Text="Save Change" CssClass="btn btn-primary" OnClick="btnChangePassword_Click" />
                            </div>
                         </div>
                    </div>
                    <div class="card-footer">
                        <small class="text-center"> Make sure your new password is mutch & contain the following to make your password strong. <br />
                            <i class="fa fa-cat"></i> password has to contain:<br />
                            1, Lowercase letter
                            2, Upercase letter
                            3, Number
                            4, Special character
                            5, At least 6 charactes
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("txtPasswordNotMatch").style.display = 'none';
            document.getElementById("txtPasswordMatch").style.display = 'none';
        }
        function passwordMatch() {
            var New_password = document.getElementById('<%= tbNewPassword.ClientID %>').value;
            var Retype_New_Password = document.getElementById('<%= tbRetypeNewPassword.ClientID %>').value;
            if (New_password == Retype_New_Password)
            {
                document.getElementById("txtPasswordNotMatch").style.display = 'none';
                document.getElementById("txtPasswordMatch").style.display = 'block';
            }
            else
            {
                document.getElementById("txtPasswordMatch").style.display = 'none';
                document.getElementById("txtPasswordNotMatch").style.display = 'block';
            }

        }
    </script>
</asp:Content>

