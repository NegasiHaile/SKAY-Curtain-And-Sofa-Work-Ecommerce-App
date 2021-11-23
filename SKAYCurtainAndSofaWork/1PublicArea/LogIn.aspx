<%@ Page Title="" Language="C#" MasterPageFile="~/1PublicArea/PublicArea.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="_1PublicArea_LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container main-cnt" style="margin-top: 100px;">
        <div class="row justify-content-center">
            <div class="col-md-8 mb-3">
                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertLogInError" runat="server">
                    <span id="spnLogInError" runat="server"><i class="fa fa-exclamation-triangle"></i> Phone number or password wrong!</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <div class="card shadow-lg">
                    <header class="card-header">
                            <div class="text-center">
                                <img class="loginAvatar" src="../5Assets/3Images/Avatar3.png" /> 
                            <h5 class="text-center skywelcome">Welcome</h5>
                            </div>
                                <%--<h6 class="text-center skywelcome hide-at-lg">Login Here</h6>--%>
                        </header>
                    <article class="card-body">
                        <div class="row mb-sm-2 mt-1">
                            <label for="tbUserPhoneNumber" class="col-sm-3 col-form-label text-sm-end">Phone No | ስልክ ቁጥር</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="tbUserPhoneNumber" runat="server" class="form-control" required="required" MaxLength="13" onkeypress="return onlyNumberKey(event)"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-sm-2">
                            <label for="tbUserPassword" class="col-sm-3 col-form-label text-sm-end">Password | የይለፍ ቃል</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="tbUserPassword" runat="server" TextMode="password" class="form-control" required="required"></asp:TextBox>
                            </div>
                        </div>

                        <div class="mb-sm-2">
                            <p class="text-center">
                                <asp:CheckBox ID="cbRememberMe" runat="server" />
                                <span>Remember me</span>
                            </p>
                        </div>
                        <div class="mb-3">
                            <h6 class="text-center">
                                <asp:Button ID="btnLogIn" runat="server" class="btn login-button" Text="login" OnClick="btnLogIn_Click" /></h6>
                        </div>

                        <div class="mt-1">
                            <p class="text-end">
                                <a href="ForgotPassword.aspx">Forgot Password?</a>
                            </p>
                        </div>
                    </article>
                    
            <div class="border-top card-body text-center cont-bg">
                <p class="text-muted">I haven't an account <a href="SignUp.aspx">Create New</a>.</p>
            </div>
            <!-- card-body end .// -->
                </div>
                <!-- card.// -->
            </div>
        </div>
    </div>

</asp:Content>

