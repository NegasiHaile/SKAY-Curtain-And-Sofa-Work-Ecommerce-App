<%@ Page Title="" Language="C#" MasterPageFile="~/1PublicArea/PublicArea.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="_1PublicArea_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid main-cnt">
        <div class="m-sm-5">
            <h5 class=" text-center skywelcome">Feel free to contact us with any of contacts bellow.</h5>
            <hr />
            <div class="row justify-content-center">
                <div class="col-sm-4 mt-3">
                    <div class="card shadow-lg contactusMinHeight">
                        <header class="card-header pt-4">
                            <p class="text-center"><span class="skyicon"><i class="fa fa-phone"></i></span></p>
                            <h6 class=" text-center skywelcome">Phone Contacts</h6>
                        </header>
                        <div class="card-body">

                            <p class="text-center pb-2">
                                <span class="skywelcome">* SaliteMihret Branch</span><br />
                                <span class=" ml-3"><i class="fa fa-mobile-alt"></i> +251 913 994 581</span><br />
                                <span class=" ml-3"><i class="fa fa-mobile-alt"></i> +251 936 373 144</span><br />
                            </p>

                            <p class="text-center pb-2">
                                <span class="skywelcome">* Jemo Mikeal Branch</span><br />
                                <span class=" ml-3"><i class="fa fa-mobile-alt"></i> +251 930 222 233</span><br />
                                <span class=" ml-3"><i class="fa fa-mobile-alt"></i> +251 940 677 928</span><br />
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 mt-3">
                    <div class="card shadow-lg contactusMinHeight">
                        <header class="card-header pt-4">
                            <p class="text-center"><span class="skyicon"><i class="fa fa-mail-bulk"></i></span></p>
                            <h6 class=" text-center skywelcome">Email Contacts</h6>
                        </header>
                        <div class="card-body">
                            <p class="text-center mt-3">
                                <span class=" mb-3"><i class="fa fa-mail-bulk"></i> JOSSY AREGAWI: <a href="https://mail.google.com/mail/u/0/#inbox">jossyobra269@gmail.com</a></span><br />
                                <br />
                                <span class=" mb-3"><i class="fa fa-mail-bulk"></i> Senait Mokonen: <a href="https://mail.google.com/mail/u/0/#inbox">SeniMok123@gmail.com</a></span><br />
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 mt-3">
                    <div class="card shadow-lg contactusMinHeight">
                        <header class="card-header pt-4">
                            <p class="text-center"><span class="skyicon"><i class="fa fa-map"></i></span></p>
                            <h6 class=" text-center skywelcome">Social Media</h6>
                        </header>
                        <div class="card-body">
                            <div class=" d-flex justify-content-center">
                                <div>
                                    <span class="fab fa-facebook"></span><a class="text-decoration-none mb-3" href="#"> Seni Curtain & Sofa Textile work</a><br />
                                <br />
                                <span class="fab fa-telegram"></span><a class="text-decoration-none mb-3" href="#"> Seni Curtain & Sofa work</a><br />
                                <br />
                                <span class="fab fa-twitter"></span><a class="text-decoration-none mb-3" href="#"> Seni Curtain & Sofa work</a><br />
                                <br />
                                <span class="fab fa-instagram"></span><a class="text-decoration-none" href="#"> Seni Curtain & Sofa work</a><br />
                                <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnSuccessAlertText" runat="server"><i class="fa fa-check"></i> Your Message has been sent successfuly.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnErrorAlertText" runat="server"><i class="fa fa-times"></i> Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <div class="card shadow-lg mt-3">
                <header class="card-header">
                    <h6 class=" text-center skywelcome">If any Feedback, Message us here. </h6>
                </header>

                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4 mb-2">
                            <label>Full Name</label>
                            <asp:TextBox ID="tbFeedBackerName" runat="server" class="form-control" required="required" onkeypress="return onlyLetterKey(event)"></asp:TextBox>
                        </div>
                        <div class="col-sm-4 mb-2">
                            <label>Phone Number</label>
                            <asp:TextBox ID="tbFeedBackerPhoneNo" runat="server" class="form-control" required="required" MaxLength="10" onkeypress="return onlyNumberKey(event)"></asp:TextBox>
                        </div>
                        <div class="col-sm-4 mb-2">
                            <label>Subject</label>
                            <asp:TextBox ID="tbFeedBackSubject" runat="server" class="form-control" required="required"></asp:TextBox>
                        </div>

                        <div class="col-sm-12 mb-2">
                            <label>Message <small> (< 300 Characters)</small></label>
                            <asp:TextBox ID="tbFeedBackDetail" runat="server" TextMode="multiline" Rows="5" class="form-control" required="required"></asp:TextBox>
                        </div>
                    </div>

                    <div class="justify-content-center mt-3 mb-2">
                        <h6 class="text-center">
                            <asp:Button ID="btnSendFeedBack" runat="server" class="btn login-button" Text="Send" OnClick="btnSendFeedBack_Click" /></h6>
                    </div>
                </div>
            </div>

            
        </div>
    </div>
</asp:Content>

