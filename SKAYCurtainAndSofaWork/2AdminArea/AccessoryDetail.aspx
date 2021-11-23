<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="AccessoryDetail.aspx.cs" Inherits="_2AdminArea_AccessoryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <style>
                .Skyimagedetail {
                    height: 450px;
                    width: 100%;
                }

                .SkyimageList {
                    height: 300px;
                    width: 100%;
                }

                @media screen and (max-width: 480px) {
                    .Skyimagedetail {
                        height: 330px;
                        width: 100%;
                    }

                    .SkyimageList {
                        height: 350px;
                        width: 100%;
                    }
                }
            </style>
    <div class="container mainContent">
        <div class="row d-flex justify-content-center">
            <div class="col-sm-9">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnAlertSuccess" runat="server"><i class="fa fa-check-circle"></i> Item Edited Successfuly.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnAlertError" runat="server"><i class="fa fa-times-circle"></i> Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>

            <div class="col-sm-10">
                <div class="card shadow-lg mb-3">
                    <div class="card-header">
                        <h6>ቁጥር: <%= AccessoryId %> </h6>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-sm-5">
                            <img src="../Handlers/AccessoriesPhotoHandler.ashx?Id=<%= AccessoryId %>" class="Skyimagedetail" alt="Accessory Image.. <%= AccessoryId %>" />
                        </div>

                        <div class="col-sm-7">
                            <div class="m-2">
                                <h5 class="text-center">Accessory</h5>
                                <hr />
                                <div class="d-flex justify-content-between p-1">
                                    <span><i class="fa fa-check"></i> የኣክሰሰሪው ዓይነት </span>
                                    <span runat="server" id="spnAcceType"> Holder </span>
                                </div>
                                <div class="d-flex justify-content-between p-1">
                                    <span><i class="fa fa-check"></i> ልዩ ስም/ቀለም </span>
                                    <span runat="server" id="spnAcceName_Color"> Yellow Monkey </span>
                                </div>
                                <hr />
                                <div class="d-flex justify-content-between p-1">
                                    <span><i class="fa fa-check"></i> ኣቅርቦት Availabelity </span>
                                    <span runat="server" id="spnAcceAvailability">100 </span>
                                </div>
                                <div class="d-flex justify-content-between p-1">
                                    <span><i class="fa fa-check"></i> ዋጋ </span>
                                    <span><span runat="server" id="spnAccePrice">200 </span> ETB</span>
                                </div>
                                <hr />
                                
                        <div class="d-flex justify-content-between p-1">
                            <span><i class="fa fa-check"></i> ስንት ሰዎች <i class="fa fa-heart"></i> ወደዉታል</span>
                            <span><span runat="server" id="spanHow_Many_Users">100 </span> ሰዎች</span>
                        </div>
                                <br />
                                <div class="d-flex justify-content-center p-1">
                                    <span runat="server" id="spnAcceDescription"> Description</span>
                                </div>
                                <hr />
                            </div>

                            <div class="m-2">
                                <div class="d-flex justify-content-between">
                                    <span id="lbtnToggleButton" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#AccessoryEditArea" data-bs-whatever="@getbootstrap"><i class="fa fa-edit"></i> Edit</span>
                                    <asp:linkbutton id="lbtnDeleteSofaItem" runat="server" cssclass="btn btn-outline-danger" onclientclick="return ConfirmationForDelete();"><i class="fa fa-trash-alt"></i> Delete</asp:linkbutton>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        
                        <div class="modal fade" id="AccessoryEditArea" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h6 class="modal-title" id="exampleModalLabel"><i class="fa fa-edit"></i>Edit Accessory</h6>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body m-sm-2">
                                            <div class="col-sm-12 mb-2">
                                                <label>የኣክሰሰሪው ዓይነት</label>
                                                <asp:dropdownlist id="ddlAcceType" cssclass="form-control" runat="server" datatextfield="CHOOSE" datavaluefield="BACK" required="require">
                                                    <asp:ListItem>Holder</asp:ListItem>
                                                    <asp:ListItem>Hanger</asp:ListItem>
                                                    <asp:ListItem>Tier</asp:ListItem>
                                                    <asp:ListItem>Jowelery</asp:ListItem>
                                                </asp:dropdownlist>
                                            </div>
                                            <div class="mb-2">
                                                <label>ልዩ ስም/ቀለም</label>
                                                <asp:textbox id="tbAcceName_Color" runat="server" class="form-control"  required="required"></asp:textbox>
                                            </div>

                                            <div class="mb-2">
                                                <label>ዋጋ ለ 1 ሜ/ፍሬ</label>
                                                <asp:textbox id="tbAccePricePerMeterOrOne" runat="server" MaxLength="5" class="form-control" onkeypress="return onlyNumberKey(event)" required="required"></asp:textbox>
                                            </div>

                                            <div class="mb-2">
                                                <label>ኣቅርቦት (Availbility)</label>
                                                <asp:textbox id="tbAcceAvailableQuantityOrMeter" runat="server"  MaxLength="5" class="form-control" onkeypress="return onlyNumberKey(event)" required="required"></asp:textbox>
                                            </div>
                                            <div class="mb-2">
                                                <label>የኣክሰሰሪው ፎቶ</label>
                                                <asp:fileupload id="fupldAccePhoto" runat="server" class="form-control"/>
                                            </div>
                                        <div class="mb-2">
                                            <label for="tbAcceDescription">ስለ ኣክሰሰሪው ማብራርያ (< 100 ፍደሎች)</label>
                                            <textarea id="tbAcceDescription" runat="server" class="form-control" maxlength="100" rows="2"></textarea>
                                        </div>
                                            <div class="d-flex justify-content-center m-2">
                                                <asp:Button id="lbtnSaveSofaChange" runat="server" cssclass="btn btn-outline-primary" OnClick="lbtnSaveSofaChange_Click" text="Save Change" />
                                            </div>
                                    </div>
                                    
                                        <div class="modal-footer">
                                            <small class="text-center">.....</small>
                                            <%--<button type="button" class="btn btn-primary">Send message</button>--%>
                                        </div>
                                </div>
                            </div>
                        </div>
    </div>
</asp:Content>

