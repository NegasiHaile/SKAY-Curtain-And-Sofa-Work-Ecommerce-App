<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="_4CustomerArea_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .SkyimageList {
            height: 155px;
            width: 100%;
            border-radius: 2px;
        }

        @media screen and (max-width: 480px) {


            .SkyimageList {
                height: 200px;
                width: 100%;
            }
        }
    </style>
    <div class="container mainContent">

        <div class="col-12">
            <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                <span id="spnAlertSuccess" runat="server"><i class="fa fa-check-circle"></i>Item Edited Successfuly.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                <span id="spnAlertError" runat="server"><i class="fa fa-times-circle"></i>Somthing went wrong! Try again.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <!-- Card -->
                <div class="mb-3">
                    <div class="pt-4">

                        <h5 class="mb-2">Items In Cart (<span> <%= ItemsInCart %> </span>)</h5>

                        <hr class="mb-3" />
                        <div id="spnCartIfo" runat="server" class="d-flex justify-content-center mt-5" 
                            style="width: 80%; height: 300px;">
                            <img src="../5Assets/svg/emptycart.svg" />
                        </div>
                        <asp:Repeater ID="rptrCart" runat="server">
                            <ItemTemplate>
                                <div class="row mb-2">
                                    <div class="col-sm-4 col-lg-3 col-xl-3">
                                        <div class="view zoom overlay z-depth-1 mb-3 mb-md-0">
                                            <div class="carousel-item active">
                                                <img class="img-fluid SkyimageList" src='../Handlers/<%# Eval("Target_Task").ToString() == "Sofa" ? "SampleImagesHandler.ashx": Eval("Target_Task").ToString() == "Curtain" ? "SampleImagesHandler.ashx" : "AccessoriesPhotoHandler.ashx"%>?Id=<%# Eval("Model_Id") %>' title='<%# Eval("Target_Task").ToString() == "Sofa" ? "የሶፋዎ ሞደል ኣልምረጡም" : " የመስኮትዎ ሞደል ኣልምረጡም" %>' />
                                                <div class="carousel-caption d-md-block">
                                                    <h5>Id: <%# Eval("Model_Id") %></h5>
                                                    <p>You <%# Eval("Target_Task") %> Model</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 col-lg-9 col-xl-9">
                                        <div>
                                            <div class="row justify-content-between">
                                                <div class="col-sm-6">
                                                    <div>
                                                        <div class="d-flex justify-content-between">
                                                            <p class="mb-2"><strong><i class="fa fa-check"></i> የትዛዝ ዓይነት: </strong></p>
                                                            <p class="mb-2 text-muted text-uppercase small"><%# Eval("Target_Task") %></p>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <p class="mb-2"><strong><i class="fa fa-check"></i> የጨርቅ ዓይነት: </strong></p>
                                                            <p class="mb-2 text-muted text-uppercase small"><%# Eval("Material_id").ToString() == "" ? "ኣልመረጡም" : Eval("Material_id") %> </p>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <p class="mb-2"><strong><i class="fa fa-check"></i><%# Eval("Target_Task").ToString() == "Sofa" ? " በስንት ጨርቅ" : Eval("Target_Task").ToString() == "Curtain" ? " የመስኮት ብዛት" : "Else" %>: </strong></p>
                                                            <p class="mb-2 text-muted text-uppercase small"><%# Eval("Target_Task").ToString() == "Sofa" ? "በ " : ""%> <%# Eval("Item_Quantity") %></p>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <p><strong><i class="fa fa-check"></i><%# Eval("Target_Task").ToString() == "Sofa" ? " ስንት ሜትር ጨርቅ" : " የመስኮት ስፋት" %> : </strong></p>
                                                            <p class="mb-2 text-muted text-uppercase small"><%# Eval("TotalMeter_WindowWidth") %> ሜ</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-5">
                                                    <div class="def-number-input number-input safari_only mb-0 w-100">
                                                        <div class="d-flex justify-content-between">
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <p class="mb-2"><strong><i class="fa fa-check"></i> ዋጋ: </strong></p>
                                                            <p class="mb-2"><span><%# Eval("TotalPrice") %> ETB</span></p>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <p class="mb-2"><strong><i class="fa fa-check"></i> ስፌት: </strong></p>
                                                            <p class="mb-2 text-muted text-uppercase small"><%# Eval("Tailor_Function") %></p>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <p class="mb-2"><strong><i class="fa fa-check"></i> Status:</strong></p>
                                                            <p class="mb-2 text-muted text-uppercase small"><span><%# Eval("Cart_Status") %></span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row justify-content-between align-items-center">
                                                <div class="col-sm-12">
                                                    <div>
                                                        <div class="d-flex justify-content-between">
                                                            <a href="Cart_Detail.aspx?Cart_Id=<%# Eval("Cart_Id") %>" class="btn btn-sm btn-outline-success text-center text-uppercase"><i class="fas fa-heart mr-1"></i>Item Detail </a>
                                                            <asp:LinkButton ID="lbtnRemoveItemFromCart" runat="server" CssClass="btn btn-sm btn-outline-danger small text-uppercase" CommandArgument='<%# Eval("Cart_Id") %>' 
                                                                OnClick="lbtnRemoveItemFromCart_Click"><i class="fas fa-trash-alt mr-1"></i> Remove Item</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class=" dropdown-divider"></div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <!-- Card -->

            </div>
            <div class="col-md-4 border-start">

                <!-- Card -->
                <div class="mb-3">
                    <div class="pt-4">

                        <h5 class="mb-2">Cart Total Price</h5>
                        <hr />
                        <div class="p-1">
                            <div class="d-flex justify-content-between border-bottom">
                                <p><i class="fa fa-hashtag"></i> Number of Items: </p>
                                <p><%= ItemsInCart %> Items</p>
                            </div>
                            <div class="d-flex justify-content-between border-bottom pt-2">
                                <p><i class="fa fa-cat"></i> የሚከፍሉት ጠቅላላ ዋጋ: </p>
                                <span> <strong><span id="spnTotalPriceToPay" runat="server">0.00 </span></strong> ETB</span>
                            </div>
                            <div class="d-flex justify-content-between pt-2">
                                <p><i class="fa fa-cat"></i> ቅድመ ክፍያ(ቀብድ): </p>
                                <span>ከ <strong><span id="spnPrePay" runat="server">0.00 </span></strong> ETB የማያንስ</span>
                            </div>
                            <div class="d-flex justify-content-between border-bottom">
                                <p><i class="fa fa-cat"></i> ቀሪ ክፍያ: </p>
                                <span>ከ <strong><span id="spnAmountToPayInDeliver" runat="server">0.00 </span></strong> ETB በታች</span>
                            </div>

                            <div class="d-flex justify-content-between">
                                <asp:LinkButton ID="lbtnClearCart" runat="server" CssClass="btn btn-sm btn-danger small text-uppercase mt-1" OnClick="lbtnClearCart_Click"><i class="fas fa-trash-alt mr-1"></i> Clear Cart</asp:LinkButton>
                                <asp:LinkButton ID="lbtnOrderCart" runat="server" CssClass="btn btn-sm btn-success text-center text-uppercase mt-1" OnClick="lbtnOrderCart_Click"><i class="fas fa-cat mr-1"></i> Order Cart </asp:LinkButton>
                            </div>
                            <hr />
                        </div>

                    </div>

                    <p class="text-primary mb-0" style="padding: 10px; border: solid 1px #0094ff; border-left: solid 8px #0094ff; border-radius: 2px;">
                        <i class="fas fa-info-circle mr-1"></i> Do not delay the purchase, adding
            items to your cart does not mean booking them.
                    </p>
                </div>
                <!-- Card -->

            </div>
            <!--Grid column-->

        </div>
        <!-- Grid row -->
    </div>

</asp:Content>

