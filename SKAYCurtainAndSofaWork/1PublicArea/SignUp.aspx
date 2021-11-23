<%@ Page Title="" Language="C#" MasterPageFile="~/1PublicArea/PublicArea.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="_1PublicArea_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container main-cnt" style="margin-top: 100px;">
        <div class="row justify-content-center">

            <div class="col-md-8 mb-3">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnSuccessAlertText" runat="server"><i class="fa fa-check"></i> Your detail has been added.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnErrorAlertText" runat="server"><i class="fa fa-times"></i> Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>


                <div class="card shadow-lg">
                    <header class="card-header cont-bg">
                        <%--<a href="LogIn.aspx" class="btn btn-outline-primary"><i class="fas fa-user"></i>| Login</a>--%>
                        <h6 class="mt-2 text-center skywelcome"> Sign Up</h6>
                    </header>
                    <article class="card-body card-body-responsve">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-sm-6 mb-2">
                                    <asp:TextBox ID="tbFullName" runat="server" class="form-control" required="required" placeholder="Full Name" onkeypress="return onlyLetterKey(event)"></asp:TextBox>
                                </div>
                                <div class="col-sm-6 mb-2">
                                    <asp:TextBox ID="tbPhoneNumber" runat="server" class="form-control" required="required" placeholder="Phone Number" onkeypress="return onlyNumberKey(event)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 mb-2">
                                    <asp:TextBox ID="tbEmail" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                                </div>
                                <div class="form-group col-sm-6 mb-2">
                                    <label style="font-weight: bold;" class="form-label">Gender</label>
                                    <div class="d-inline">
                                        <label class=" form-check-inline">
                                            <asp:RadioButton runat="server" ID="rbMaleGender" type="radio" GroupName="gender" Checked="true" />
                                            <span>Male </span>
                                        </label>
                                        <label class=" form-check-inline">
                                            <asp:RadioButton runat="server" ID="rbFemaleGender" type="radio" GroupName="gender" />
                                            <span>Female </span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-2">
                                <asp:TextBox ID="tbAddress" runat="server" class="form-control" required="required" placeholder="your Address"></asp:TextBox>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 mb-2">
                                <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" class="form-control" required="required" placeholder="Create Password"></asp:TextBox>
                            <span class="text-danger" id="txtPasswordNotMatch" style="display: none;"><i class="fa fa-times-circle"></i> Password not match!</span>
                            <span class="text-success" id="txtPasswordMatch" style="display: none;"><i class="fa fa-check-circle"></i> Password match!</span>
                        
                                     </div>
                                <div class="col-sm-6 mb-2">
                                <asp:TextBox ID="tbRetypePassword" runat="server" TextMode="Password" class="form-control" required="required" placeholder="Retype Password" onkeyup="passwordMatch();"></asp:TextBox>
                            </div>
                            </div>

                            <div id="ddddd">
                                <div class="justify-content-center mt-3">
                                <h6 class="text-center">
                                    <asp:Button ID="btnSignup" runat="server" class="btn login-button" Text="Sign Up" OnClick="btnSignup_Click" /></h6>
                            </div>
                            </div>
                        </div>


                    </article>
                    <!-- card-body end .// -->
                    <div class="border-top card-body text-center cont-bg">
                        <p class="text-muted">I alreaady have an account <a href="LogIn.aspx">Login</a>. </p>
                    </div>


                </div>
                <!-- card.// -->
            </div>

        </div>
    </div>
     <script type="text/javascript">
        //window.onload = function () {
        //    document.getElementById("txtPasswordNotMatch").style.display = 'none';
        //    document.getElementById("txtPasswordMatch").style.display = 'none';
        //   document.getElementById("ddddd").style.display = 'none';
        //}
        function passwordMatch() {
            var password = document.getElementById('<%= tbPassword.ClientID %>').value;
            var Retype_Password = document.getElementById('<%= tbRetypePassword.ClientID %>').value;
            if (password == Retype_Password)
            {
                document.getElementById("txtPasswordNotMatch").style.display = 'none';
                document.getElementById("txtPasswordMatch").style.display = 'block';
                //document.getElementById("ddddd").style.display = 'block';
            }
            else
            {
                document.getElementById("txtPasswordMatch").style.display = 'none';
                //document.getElementById("ddddd").style.display = 'none';
                document.getElementById("txtPasswordNotMatch").style.display = 'block';
            }

        }
    </script>
</asp:Content>

