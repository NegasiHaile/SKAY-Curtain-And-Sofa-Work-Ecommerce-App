<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="_2AdminArea_AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .icon-color{
            color: #1e6fea;
        }
    </style>
    <div class=" container-fluid mainContent">
        <div class="my-5 border-bottom pb-1">
            <h4 class="tex-muted">Dashboard</h4>
        </div>
        <div class="d-flex justify-content-center">
            <div class="col-12">
                <div class="row">
                    <div class="col-md-3 mb-2">
                        <div class="card shadow-sm">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <h5 class="text-center text-muted">የመጋረጃ ጨርቆች</h5>
                                    <h5><a href="DrapeClothRegistration.aspx" class="icon-color"><i class="fa fa-images"></i></a></h5>
                                </div>
                            </div>
                            <div class="card-body">
                                <h3 class="text-center"><%= totalCurtains %></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-2">
                        <div class="card shadow-sm">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <h5 class="text-center text-muted">የሶፋ ጨርቆች</h5>
                                    <h5><a href="SofaClothRegistration.aspx" class="icon-color"><i class="fa fa-couch"></i></a></h5>
                                </div>
                            </div>
                            <div class="card-body">
                                <h3 class="text-center"><%= totalSofas %></h3>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 mb-2">
                        <div class="card shadow-sm">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <h5 class="text-center text-muted">ኣክሰሰሪዎች</h5>
                                    <h5><a href="AccessoryRegistration.aspx" class="icon-color"><i class="fa fa-tools"></i></a></h5>
                                </div>
                            </div>
                            <div class="card-body">
                                <h3 class="text-center"><%= totalAcce %></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-2">
                        <div class="card shadow-sm">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <h5 class="text-center  text-muted">ደንበኞች</h5>
                                    <h5><a href="CustomersList.aspx" class="icon-color"><i class="fa fa-users"></i></a></h5>
                                </div>
                            </div>
                            <div class="card-body">
                                <h3 class="text-center"><%= totalCustomers %></h3>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 mb-2">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <h5 class="text-center text-muted">ትዝዛዞች</h5>
                                    <h5 class="icon-color"><i class="fa fa-shopping-bag"></i></h5>
                                </div>
                            </div>
                            <div class="card-body">
                                <h3 class="text-center"><%= totalOrders %></h3>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-2">
                        <div class="card  shadow-sm">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <h5 class="text-center text-muted">ኣስተያየቶች</h5>
                                    <h5 class="icon-color"><i class="fa fa-comment-alt"></i></h5>
                                </div>
                            </div>
                            <div class="card-body">
                                <h3 class="text-center"><%= totalFeedBacks %></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-2">
                        <div class="card  shadow-sm">
                            <div class="card-header bg-primary">
                                <div class="d-flex justify-content-between">
                                    <h5 class="text-center text-light">Web Visitors</h5>
                                    <h5 class="text-light"><i class="fa fa-eye"></i></h5>
                                </div>
                            </div>
                            <div class="card-body bg-primary">
                                <h3 class="text-center text-light">36</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <div class="col-12 col-md-10 mb-4" >
            <div class=" p-3 bg-white rounded shadow-sm">
            <h6 class="border-bottom pb-2 mb-0"><span id="spnNumberOfFunctions" runat="server"><%= totalFeedBacks %></span>
                <span>- Total feedbacks </span></h6>

                   <asp:Repeater ID="rptrFeedBacksList" runat="server">
                <ItemTemplate>
                    <div class="d-flex text-muted pt-3">
                <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#007bff" />
                    <text x="50%" y="50%" fill="#007bff" dy=".3em">iiii</text></svg>

                <div class="pb-3 small lh-sm border-bottom w-100">
                    <div class="d-flex justify-content-between">
                        <strong class="text-gray-dark"><i class="fa fa-user-alt"></i><span> <%# Eval("FullName") %></span></strong>
                    </div>
                    <span class="d-block">
                        <span class="text-gray-dark"><i class="fa fa-mobile-alt"></i><small> <%# Eval("Phone_Email") %>,</small> </span>
                        <span class="d-inline"> <%# Eval("Subject") %>, <i class="fa fa-comment-alt"></i>
                                <%# Eval("Message") %>
                    </span>
                </div>
                <div class="pb-3small lh-sm border-bottom h-auto">
                 <asp:LinkButton ID="lbtnHelpDelete" runat="server" CssClass=" text-decoration-none" ForeColor="Red"  
                     title="Delete Feedback" CommandArgument='<%# Eval("Id") %>'  
                     OnClick="lbtnDeleteFeedBack_Click"><i class="fa fa-trash-alt"></i></asp:LinkButton>
                    
                </div>
            </div>
                </ItemTemplate>
            </asp:Repeater>


            <small class="d-block text-end mt-3">
                <span class="text-info">List of all feedbaks</span>
            </small>
        </div>
        </div>
    </div>
    

</asp:Content>

