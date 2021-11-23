<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="CustomersList.aspx.cs" Inherits="_2AdminArea_CustomersList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" container mainContent">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="d-flex justify-content-between p-3 bg-white mb-1 rounded shadow-lg">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-couch"></i> የደንበኞች ዝርዝር </span>
                    <div class="justify-content-between">
                        <span > ብዛት: </span>
                        <span> <strong><%= NoOfCustomes %></strong> </span>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnSuccessAlertText" runat="server"><i class="fa fa-check-circle"></i> Employee Detail Has been Updated.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnErrorAlertText" runat="server"><i class="fa fa-times-circle"></i> Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
       
            <div class="col-md-12">
                <div class="card rounded shadow-lg  table-responsive p-2">
                    <br />
                    <table id="example" class="table table-hover table-sm" style="width: 100%;"
                        data-show-refresh="true"
                        data-show-fullscreen="true">
                        <thead>
                            <tr>
                                <th>Full Name</th>
                                <th>Phone</th>
                                <th>Gender</th>
                                <th>Email</th>
                                <th>Adress</th>
                                <th>Account Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptrCustomersList" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("FullName") %></td>
                                        <td><%# Eval("PhoneNumber") %></td>
                                        <td><%# Eval("Gender") %></td>
                                        <td><%# Eval("Email") %></td>
                                        <td><%# Eval("FullAddress") %></td>
                                        <td><%# Eval("Account_Status") %></td>
                                        <td>
                                            <div class=" d-flex justify-content-between">
                                                <%# Eval("Account_Status").ToString() == "ON" ? "<span class='btn btn-sm btn-outline-danger' title='Block Account' data-bs-toggle='modal' data-bs-target='#BlockAccount"+Eval("PhoneNumber")+"' data-bs-whatever='@getbootstrap'><i class='fa fa-user-lock'></i> </span>": 
                                                        "<span class='btn btn-sm btn-outline-primary' title='Activate Account' data-bs-toggle='modal' data-bs-target='#ActivateAccount"+Eval("PhoneNumber")+"' data-bs-whatever='@getbootstrap'><i class='fa fa-lock-open'></i> </span>" %>
                                            </div>
                                        </td>
                                    </tr>
                                    <div class="modal fade" id="BlockAccount<%# Eval("PhoneNumber") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <div class="modal-header bg-danger">
                                                    <p class="text-center text-light"><i class="fa fa-user-lock"></i> You are about blocking <%# Eval("FullName") %>'s ccount, Area you sure you want to block this customer?
                                                    </p>
                                                </div>
                                                <div class="modal-body">
                                                    <p class="text-muted"><strong><i class="fa fa-cat"></i> :-</strong>BLocking an account means, the customer will not access the SKY website for any reason. if you block this customer he cant order anything from <strong> SKY Curtain and Sofa textile work</strong>.</p>
                                                </div>
                                                <div class=" modal-footer bg-danger">
                                                    <asp:LinkButton ID="btnDeleteItemAlt" CssClass="btn btn-sm btn-danger" runat="server" CommandArgument='<%# Eval("PhoneNumber") %>' OnClick="btnBlockAccount_Click"><i class="fa fa-check"></i> YES</asp:LinkButton>
                                                    <button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal"> <i class="fa fa-times"></i> NO</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="ActivateAccount<%# Eval("PhoneNumber") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <div class="modal-header bg-success">
                                                    <p class="text-center text-white"><i class="fa fa-lock-open"></i> You are about activating <%# Eval("FullName") %>'s account which is previously blocked, Are you sure about this?</p>
                                                </div>
                                                <div class="modal-body">
                                                    <p class="text-muted"><strong ><i class="fa fa-cat"></i> :-</strong> Activating An Account means, the customer will able to access the SKY website from now-on. And you are allowing the customer to do anything that like other customers can do.</p>
                                                </div>
                                                <div class=" modal-footer bg-success">
                                                    <asp:LinkButton ID="lbtnActivateAccount" CssClass="btn btn-sm btn-success" runat="server" CommandArgument='<%# Eval("PhoneNumber") %>' OnClick="lbtnActivateAccount_Click"><i class="fa fa-check"></i> YES</asp:LinkButton>
                                                    <button type="button" class="btn btn-sm btn-success" data-bs-dismiss="modal"> <i class="fa fa-times"></i> NO</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Full Name</th>
                                <th>Phone</th>
                                <th>Gender</th>
                                <th>Email</th>
                                <th>Adress</th>
                                <th>Account Status</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

