<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="AddNewAdmin.aspx.cs" Inherits="_2AdminArea_AddNewAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" container-fluid mainContent">
        <div class="d-flex justify-content-center">
            <div class="col-md-5">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnSuccessAlertText" runat="server"><i class="fa fa-check"></i> The super adminstrator is successfuly registered.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnErrorAlertText" runat="server"><i class="fa fa-times"></i> Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h6>Add New Super Adminstrator</h6>
                    </div>
                    <div class="card-body">
                        <div class="col-12 m-1">
                            <label>Phone Number</label>
                            <asp:TextBox ID="tbSAPhoneNumber" runat="server" CssClass="form-control" required="required" MaxLength="13" onkeypress="return onlyNumberKey(event)"></asp:TextBox>
                        </div>
                        <div class="col-12 m-1">
                            <label>Email</label>
                            <asp:TextBox ID="tbSAEmail" runat="server" CssClass="form-control" TextMode="Email" required="required"></asp:TextBox>
                        </div>
                        <div class="col-12 m-1">
                            <label>Password</label>
                            <asp:TextBox ID="tbSAPassword" runat="server" CssClass="form-control" TextMode="password" placeholder="Default 'SA@SeniCurtain'"></asp:TextBox>
                        </div>
                        <div class="col-12 m-1">
                            <div class="d-flex justify-content-center">
                                <asp:Button ID="btnAddNewAdmin" runat="server" Text="Add Admin" CssClass="btn btn-outline-primary" OnClick="btnAddNewAdmin_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <small>You added a new admin means you are giveng him a permision to do anything you can do.</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

