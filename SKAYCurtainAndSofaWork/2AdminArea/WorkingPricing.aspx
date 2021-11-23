<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="WorkingPricing.aspx.cs" Inherits="_2AdminArea_WorkingPricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" container mainContent">
        <%--Top Horizontal Lable Starts--%>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="d-flex justify-content-between p-3 bg-white mb-1  rounded shadow-sm">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-funnel-dollar"></i> የለሎች ስራዎች ዋጋ </span>
                    <asp:LinkButton ID="lbtnAddNewFunctionPrice" runat="server" class="btn btn-sm btn-outline-primary m-0" data-bs-toggle="modal" data-bs-target="#PricingFunctions" data-bs-whatever="@getbootstrap">
                            <i class="fa fa-plus"></i> New </asp:LinkButton>
                </div>
            </div>
        </div>
         <%--Top Horizontal Lable Ends--%>

         <%--Transaction alert  Starts--%>
        <div class="col-md-12" id="div1" runat="server">
            <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                <span id="spnAlertSccess" runat="server"><i class="fa fa-check"></i>Price Added Successfuly.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                <span id="spnAlertError" runat="server"><i class="fa fa-times"></i>Somthing went wrong! Try again.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
        <%--Transaction alert  ends--%>


        <%--Functional price Registration modal Starts--%>
        <div class="modal fade" id="PricingFunctions" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="exampleModalLabel"><i class="fa fa-money-check-alt"></i> የለሎች ስራዎች ዋጋ</h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="ddlPricingFunctionType" class="form-label">Function</label>
                                <asp:DropDownList ID="ddlPricingFunction" CssClass="form-control form-select" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require"
                                     CausesValidation="true" ValidationGroup="AddPrice">
                                    <asp:ListItem Selected="true" disabled></asp:ListItem>
                                    <asp:ListItem>Drilling</asp:ListItem>
                                    <asp:ListItem>Drape Tailor</asp:ListItem>
                                    <asp:ListItem>Sofa Tailor</asp:ListItem>
                                    <asp:ListItem>Sofa wearing</asp:ListItem>
                                    <asp:ListItem>Discount</asp:ListItem>
                                    <asp:ListItem>VAT</asp:ListItem>
                                    <asp:ListItem>Delivery per KM</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label for="tbTotalMeter" class="form-label">Price (ETB)</label>
                                <asp:TextBox ID="tbFunctionPricePerMeter" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" required="required"
                                     CausesValidation="true" ValidationGroup="AddPrice"></asp:TextBox>
                            </div>
                            <div class="col-md-12">
                                <label for="tbTotalCost" class="form-label">Desscription</label>
                                <asp:TextBox ID="tbFunctionPricingDescription" runat="server" class="form-control" TextMode="MultiLine" Rows="3" required="required"
                                     CausesValidation="true" ValidationGroup="AddPrice"></asp:TextBox>
                            </div>
                            <div class="d-flex justify-content-center">
                                <asp:Button ID="btnFunctionPrice" runat="server" CssClass="btn btn-primary" Text="Save Price" OnClick="btnFunctionPrice_Click" 
                                     CausesValidation="true" ValidationGroup="AddPrice" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <small><i class="fa fa-check"></i>This Price is a common Price, Insert The price per meter or one time Work.</small>
                        <%--<button type="button" class="btn btn-primary">Send message</button>--%>
                    </div>
                </div>
            </div>
        </div>
        <%--Functional price Registration modal ends--%>


        <%--Functional Price list Starts--%>
        <div class=" p-3 bg-white rounded shadow-sm">
            <h6 class="border-bottom pb-2 mb-0"><span id="spnNumberOfFunctions" runat="server">3</span>
                <span>- ስራዎች </span></h6>

            <asp:Repeater ID="rptrFuctionsPrices" runat="server">
                <ItemTemplate>
                    <div class="d-flex text-muted pt-3">
                        <svg class="bd-placeholder-img flex-shrink-0 me-2 mt-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#007bff" />
                            <text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>

                        <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
                            <div class="d-flex justify-content-between">
                                <strong class="text-gray-dark">ቁጥር: <span><%# Eval("Id") %></span></strong>
                            </div>
                            <span class="d-block">

                             <span class="text-gray-dark">ስራ: <strong > <%# Eval("FunctionName") %>,</strong> </span>
                                <span class="text-gray-dark">ዋጋ <%# Eval("FunctionName").ToString() == "Drilling"? "ለ1 መስኮት":Eval("FunctionName").ToString() == "Drape Tailor"? "ለ1 ሜ መስኮት": "" %>: <strong><%# Eval("PricePermeterOrTask") %> ETB,</strong> </span>
                                <span class="d-inline"> <i class="fa fa-cat"></i> <%# Eval("FunctionDescription") %> </span></span>
                        </div>
                        <div class="pb-3small lh-sm border-bottom h-auto">
                            <a class="btn btn-sm btn-outline-success mb-1" data-bs-toggle="modal" data-bs-target="#PricingFunctions<%# Eval("Id") %>" data-bs-whatever="@getbootstrap">
                                <i class="fa fa-edit"></i></a>
                        </div>
                    </div>
                    <%--Functional Price Edit Starts--%>
                    <div class="modal fade" id="PricingFunctions<%# Eval("Id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h6 class="modal-title">ቁጥር: <%# Eval("Id") %></h6> 
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row g-3">
                                        <asp:TextBox ID="tbid" runat="server" class="form-control d-none" onkeypress="return onlyNumberKey(event)" Text='<%# Eval("Id") %>'></asp:TextBox>
                                       <%-- <asp:TextBox ID="TextBox1" runat="server" Text="<%# Eval("Id") %>"></asp:TextBox>--%>
                                        <div class="col-md-6">
                                            <label for="ddlPricingFunctionType" class="form-label">የስራ ዓይነት</label>
                                        <asp:TextBox ID="tbFunctionNameEdit" runat="server" class="form-control" Text='<%# Eval("FunctionName") %>' disabled="true"></asp:TextBox>
                                            </div>
                                        <div class="col-md-6">
                                            <label for="tbTotalMeter" class="form-label">ዋጋ (ETB)</label> 
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbFunctionPricePerMeterEdit" ForeColor="Red" ErrorMessage="* required" ValidationGroup="EditingPrice"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="tbFunctionPricePerMeterEdit" runat="server" class="form-control" MaxLength="4" onkeypress="return onlyNumberKey(event)" Text='<%# Eval("PricePermeterOrTask") %>'></asp:TextBox>
                                        </div>
                                        <div class="col-md-12">
                                            <label for="tbTotalCost" class="form-label">Desscription (< 150 letters)</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbFunctionPricingDescriptionEdit" ForeColor="Red" ErrorMessage="* required" ValidationGroup="EditingPrice"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="tbFunctionPricingDescriptionEdit" runat="server" class="form-control" Text='<%# Eval("FunctionDescription") %>' 
                                                TextMode="MultiLine" Rows="3"></asp:TextBox>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <asp:LinkButton id="btnFunctionalPriceSaveChange" runat="server" class="btn btn-primary" OnClick="btnFunctionalPriceSaveChange_Click"
                                                  CausesValidation="true" ValidationGroup="EditingPrice"> <i class="fa fa-save"></i> Save Change </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <small><i class="fa fa-check-circle"></i> This Price is a common Price, Insert The price per meter or one time Work.</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--Functional Price Edit Ends--%>
                </ItemTemplate>
            </asp:Repeater>

            <small class="d-block text-end mt-3">
                <a href="#">All Functions</a>
            </small>
        </div>
        <%--Functional Price list Starts--%>
    </div>
    
</asp:Content>

