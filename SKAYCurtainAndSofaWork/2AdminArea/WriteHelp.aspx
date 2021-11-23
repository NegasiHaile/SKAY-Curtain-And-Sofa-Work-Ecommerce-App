<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="WriteHelp.aspx.cs" Inherits="_2AdminArea_WriteHelp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .collapsible {
            background-color: #777;
            color: white;
            cursor: pointer;
            padding: 15px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            border-radius: 1px;
        }

            .active, .collapsible:hover {
                background-color: #333;
            }

        .content {
            padding: 0 18px;
            display: none;
            overflow: hidden;
            background-color: #f1f1f1;
            margin-bottom: 3px;
        }

        .content p {
            font-family: Arial;
        }
    </style>
    <div class="container mainContent">
        <div class="col-12">
            <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                <span id="spnAlertSuccess" runat="server"><i class="fa fa-check"></i>Successfuly done.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                <span id="spnAlertError" runat="server"><i class="fa fa-times"></i>try again!</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="d-flex justify-content-between p-3 bg-light mb-1 rounded shadow-lg">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-info-circle"></i>Add new help </span>
                    <div>
                        <span id="lbtnToggleButton" onclick="AddAndListToggle();"><span class="btn btn-sm btn-outline-secondary m-0"><i class='fa fa-plus'></i>ኣድስ ይመዝግቡ </span></span>
                    </div>
                </div>
            </div>
            <div class="col-md-12 divToggleContent sky-d-none">
                <div class=" p-3 bg-light mb-1 rounded shadow-lg">
                    <div class="row">
                        <div class="col-sm-6">
                            <label>Help Subject (< 100 charactes) </label>
                            <asp:TextBox CssClass="form-control" ID="tbhelpSubject" runat="server" MaxLength="100" required="required"></asp:TextBox>
                        </div>
                        <div class="col-sm-6">
                            <label>Help Detail (< 600 charactes) </label>
                            <textarea id="tbHelpDetail" class="form-control" runat="server" maxlength="249" cols="20" rows="3" required="required"></textarea>
                        </div>
                        <div class="col-12 pt-2">
                            <div class="d-flex justify-content-center">
                                <asp:Button CssClass="btn btn-primary" ID="btnAddNewHelp" runat="server" Text="Add Help" OnClick="btnAddNewHelp_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 divToggleContent">
                <div class="shadow-lg rounded bg-light p-2">
                    <asp:Repeater ID="rptrHelpsList" runat="server">
                        <ItemTemplate>
                            <h5 class="collapsible"><%# Eval("Help_Subject") %></h5>
                            <div class="content pb-2">
                                <p class="text-muted"><%# Eval("Help_Detail") %></p>

                                <div class="d-flex justify-content-center">
                                    <div class="col-sm-3">
                                        <div class="d-flex justify-content-between">
                                            <span style="color: green; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("Id") %>"><i class="fa fa-edit"></i>Edit</span>
                                            <asp:LinkButton ID="lbtnHelpDelete" runat="server" CssClass=" text-decoration-none" ForeColor="Red" OnClick="lbtnHelpDelete_Click"><i class="fa fa-trash-alt"></i> Delete</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal<%# Eval("Id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title text-muted" id="exampleModalLabel">Edit help
                                                    <asp:Label ID="lblHelpId" CssClass="d-none" runat="server" Text='<%# Eval("Id") %>'></asp:Label></h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-12 mb-2">
                                                        <label class="text-muted">Help Subject (< 100 charactes) </label>
                                                        <asp:TextBox CssClass="form-control" ID="tbEditHelpSubject" runat="server" MaxLength="100" required="required" Text='<%# Eval("Help_Subject") %>' ValidationGroup='vgEditHelp<%# Eval("Id") %>'></asp:TextBox>
                                                    </div>
                                                    <div class="col-12 mb-2">
                                                        <label class="text-muted">Help Detail (< 600 charactes) </label>
                                                        <asp:TextBox ID="tbEditHelpDetail" class="form-control" runat="server" TextMode="MultiLine" Rows="4" required="required" Text='<%# Eval("Help_Detail") %>' ValidationGroup='vgEditHelp<%# Eval("Id") %>'></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <asp:LinkButton ID="lbtnHelpEditSaveChange" runat="server" CssClass="btn btn-primary" Text="Save changes" OnClick="lbtnHelpEditSaveChange_Click" CausesValidation="true" ValidationGroup='vgEditHelp<%# Eval("Id") %>'> Save Changes</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>




        <script>
            var coll = document.getElementsByClassName("collapsible");
            var i;

            for (i = 0; i < coll.length; i++) {
                coll[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var content = this.nextElementSibling;
                    if (content.style.display === "block") {
                        content.style.display = "none";
                    } else {
                        content.style.display = "block";
                    }
                });
            }
        </script>
    </div>
</asp:Content>

