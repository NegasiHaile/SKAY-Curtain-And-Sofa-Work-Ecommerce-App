 <%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="_2AdminArea_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>SKY Orders List</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .SkyimageList {
            height: 125px;
            width: 100%;
            border-radius: 2px;
        }

        @media screen and (max-width: 580px) {
            .SkyimageList {
                height: 250px;
                width: 100%;
            }
        }

        .collapsible {
                padding: 2px;   
            cursor: pointer;
            outline: none;
        }

            .active, .collapsible:hover {
                border-radius: 1px;
                background-color: #f3f3fb;
            }

        .contentcolps {
            display: none;
            overflow: hidden;
            /*background-color: #4CAF50;*/
        }
    </style>
    <div class=" container mainContent">
        <div class="col-12">
            <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                <span id="spnAlertSuccess" runat="server"><i class="fa fa-check"></i>Item Edited Successfuly.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                <span id="spnAlertError" runat="server"><i class="fa fa-times"></i> Somthing went wrong! Try again.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
        <h6 class="text-center"> List of New orders</h6>
            <hr />
       
            <div class="card rounded shadow-lg  table-responsive p-2">
                <table id="example" class="table table-hover table-sm" style="width: 100%;">
                <thead>
                    <tr class="text-uppercase text-muted">
                        <th>Customer Name</th>
                        <th>Phone #</th>
                        <th>Orders</th>
                        <th>Order Date</th>
                        <th>$ ጠቅላላ ዋጋ</th>
                        <th>$ ቀብድ</th>
                        <th>$ ቀሪ</th>
                        <th class="text-end">ቀጠሮ</th>
                        <th class="text-end">Status</th>
                    </tr>
                </thead>
                <tbody>                    
                    <asp:Repeater ID="rptrOrders" runat="server" OnItemDataBound="rptrOrders_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td><span style="color:#4CAF50; cursor: pointer;" data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("Custom_Phone_Number") %>"><i class="fa fa-plus-circle"></i></span> <%# Eval("FullName") %></td>
                                <td class="d-none"><%# Eval("Order_Id") %></td>
                                <td><%# Eval("Custom_Phone_Number") %></td>
                                <td><%# Eval("Slected_Items") %></td>
                                <td><%# Eval("Order_Date") %></td>
                                <td><%# Eval("Total_Price") %> ETB</td>
                                <td><%# Eval("Holding_Amount") %> ETB</td>
                                <td><%# Eval("Left_Amount") %> ETB</td>
                                <td class="text-uppercase text-end"  style="color: #f44336;"><small><%# Eval("Appointmet_Date").ToString() == "" ? "Pendding" : Eval("Appointmet_Date") %></small></td>
                                <td class="text-end"><%# Eval("Order_Status") %></td>
                                <asp:Label ID="lblCustomPhoneNo" runat="server" CssClass="d-none" Text='<%#Eval("Custom_Phone_Number")%>'></asp:Label>
                            
                                
                                <div class="modal fade"  data-bs-backdrop="static" data-bs-keyboard="false" id="exampleModal<%# Eval("Custom_Phone_Number") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-xl">
                                        <div class="modal-content">
                                            <div class="modal-header bg-success" style=" color: #e1e1e1;">
                                                <h6 class=" font-monospace"><span> <i class="fa fa-user-alt"></i> <%# Eval("FullName") %>'s Order, <i class="fa fa-phone-alt"></i> <%# Eval("Custom_Phone_Number") %>. <i class="fa fa-map-marker-alt"></i> <%# Eval("FullAddress") %></span></h6>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="row modal-body">
                                                <div class="col-md-8">
                                                    <div class="mb-3">
                                                        <div class="pt-4">

                                                            <h5 class="mb-2 text-muted text-uppercase"> List of Items</h5>
                                                            <hr />
                                                            <asp:Repeater runat="server" ID="rptrCartsPerOrder" OnItemDataBound="rptrCartsPerOrder_OnItemDataBound">
                                                                <ItemTemplate>
                                                                    <div class="row mb-2 border-bottom pb-1">
                                                                        <div class="col-sm-4 col-lg-3 col-xl-3">
                                                                            <div class="view zoom overlay z-depth-1 mb-3 mb-md-0">
                                                                                <div class="carousel-item active">
                                                                                    <img class="img-fluid SkyimageList" src='../Handlers/<%# Eval("Target_Task").ToString() == "Sofa" ? "SampleImagesHandler.ashx": Eval("Target_Task").ToString() == "Curtain" ? "SampleImagesHandler.ashx" : "AccessoriesPhotoHandler.ashx"%>?Id=<%# Eval("Model_Id") %>' title='<%# Eval("Target_Task").ToString() == "Sofa" ? " ኣልመረጠም" : " ኣልመረጠም" %>' />
                                                                                    <div class="carousel-caption d-md-block">
                                                                                        <h5>Id: <%# Eval("Model_Id") %></h5>
                                                                                        <p> <%# Eval("Target_Task") %> Model</p>
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
                                                                                                <p class="text-muted small"><i class="fa fa-check"></i> የትዛዝ ዓይነት:</p>
                                                                                                <p class="text-uppercase small"><strong><%# Eval("Target_Task") %></strong></p>
                                                                                            </div>
                                                                                            <div class="d-flex justify-content-between">
                                                                                                <%# Eval("Target_Task").ToString() == "Sofa" ? "<p class='text-muted small'><i class='fa fa-check'></i> የጨርቅ ዓይነት:" : Eval("Target_Task").ToString() == "Curtain" ? "<p class='text-muted small'><i class='fa fa-check'></i> የጨርቅ ዓይነት:": " " %>
                                                                                                <p class="text-uppercase small">  <%# Eval("Material_id").ToString() == "" ? "ኣልመረጡም" : Eval("Target_Task").ToString() == "Sofa" ? Eval("Material_id"):Eval("Target_Task").ToString() == "Curtain" ? Eval("Material_id"): "" %></p>
                                                                                            </div>
                                                                                            <div class="d-flex justify-content-between">
                                                                                                <p class="text-muted text-uppercase small"><i class="fa fa-check"></i><%# Eval("Target_Task").ToString() == "Sofa" ? " ስንት ሜትር ጨርቅ" : Eval("Target_Task").ToString() == "Curtain" ? " የመስኮት ስፋት":Eval("Target_Task").ToString() == "Sofa" ? " ስንት ሜትር " : " ለስንት መስኮት" %> : </p>
                                                                                                <p class="text-muted text-uppercase small"><%# Eval("TotalMeter_WindowWidth") %> <%# Eval("Target_Task").ToString() == "Sofa" ? "ሜ": Eval("Target_Task").ToString() == "Curtain" ? "ሜ": Eval("Target_Task").ToString() == "Hanger" ? "ሜ": "መስኮት" %></p>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-5">
                                                                                        <div class="def-number-input number-input safari_only mb-0 w-100">
                                                                                            <div class="d-flex justify-content-between">
                                                                                            </div>
                                                                                            <div class="d-flex justify-content-between">
                                                                                                <p class="text-muted small"><%# Eval("Target_Task").ToString() == "Sofa" ? "<i class='fa fa-check'></i> በስንት ጨርቅ:" : Eval("Target_Task").ToString() == "Curtain" ? "<i class='fa fa-check'></i> የመስኮት ብዛት:" : "" %></p>
                                                                                                <p class="text-uppercase small"><%# Eval("Target_Task").ToString() == "Sofa" ? "በ " : ""%> <%# Eval("Target_Task").ToString() == "Sofa" ? Eval("Item_Quantity"):Eval("Target_Task").ToString() == "Curtain"? Eval("Item_Quantity"): "" %></p>
                                                                                            </div>
                                                                                            <div class="d-flex justify-content-between">
                                                                                                <p class="text-muted small"><i class="fa fa-check"></i> ዋጋ: </p>
                                                                                                <p class="text-uppercase small"><span><%# Eval("TotalPrice") %> ETB</span></p>
                                                                                            </div>
                                                                                            <div class="d-flex justify-content-between">
                                                                                                <p class="text-muted small"><i class="fa fa-check"></i> <%# Eval("Target_Task").ToString() == "Sofa" ? " ስፌት " : Eval("Target_Task").ToString() == "Curtain" ? "ስፌት": "ይሰራል/Drill ?"%> :</p>
                                                                                                <p class="text-uppercase small"><%# Eval("Tailor_Function") %></p>
                                                                                            </div>
                                                                                            <%--<div class="d-flex justify-content-between">
                                                                                                <span><a href="#" class="text-decoration-none small text-uppercase"><i class="fas fa-list mr-1"></i> Item Detail </a></span>
                                                                                                <a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop<%# Eval("Custom_Phone_Number") %>" class=" text-decoration-none small text-danger text-uppercase"><i class="fas fa-trash-alt mr-1"></i> Reject Item </a>
                                                                                            </div>--%>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                
                                                                        <div class="col-12">
                                                                            <span class="collapsible"><a href="#" class="text-decoration-none small text-uppercase"><i class="fas fa-plus-circle mr-1"></i> Item Detail </a></span>
                                                                            <div class="contentcolps">
                                                                                <asp:Label ID="lblCartId" runat="server" CssClass="d-none" Text='<%#Eval("Cart_Id")%>'></asp:Label>
                                                                                <asp:Repeater ID="rptrSelecetedItems" runat="server">
                                                                                    <ItemTemplate>
                                                                                        <div class="col-12 mb-2 border-bottom pb-1">
                                                                                            <div class="row">
                                                                                                <div class="col-2">
                                                                                                    <img class="img-fluid rounded" style="width: 100%; height: 60px;" src='../Handlers/SofaClothPhotoHandler.ashx?IdNumber=<%# Eval("Item_Id") %>' />
                                                                                                </div>
                                                                                                <div class="col-sm-5">
                                                                                                    <div class="d-flex justify-content-between">
                                                                                                       <span>* የጨርቅ መዝገብ ቁጥር:</span> <span><%# Eval("Item_Id") %></span>
                                                                                                    </div>
                                                                                                    <div class="d-flex justify-content-between">
                                                                                                       <span>* ሶፋ ክፍል/መሸብሽብያ: </span> <span> <%# Eval("Shirink_ForWhatPartOfSofa") %></span>
                                                                                                    </div>
                                                                                                    <div class="d-flex justify-content-between">
                                                                                                       <span>* ስንት ሜትር:</span> <span><%# Eval("wndw_ClothSofa_Meter") %></span>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="col-sm-5">
                                                                                                    <div class="d-flex justify-content-between">
                                                                                                       <span>* ዋጋ:</span> <span><%# Eval("Price") %></span>
                                                                                                    </div>
                                                                                                    <div class="d-flex justify-content-between">
                                                                                                       <span>* Drill ?:</span> <span><%# Eval("Drilling_Clothing") %></span>
                                                                                                    </div>
                                                                                                    <div class="d-flex justify-content-between">
                                                                                                       <span>* መስቀያ:</span> <span><%# Eval("Meskeya_Tailoring") %></span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
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
                                                <div class="col-md-4 border-start">

                                                    <!-- Card -->
                                                    <div class="mb-3">
                                                        <div class="pt-4">
                                                            <h5 class="mb-2 text-muted text-uppercase"> Order Summery</h5>
                                                            <hr />
                                                            <div class="p-1">
                                                                <div class="d-flex justify-content-between border-bottom">
                                                                    <p class="text-muted"><i class="fa fa-cat"></i> ትዛዝ መዝገብ ቁጥር: </p>
                                                                    <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("Order_Id") %>'></asp:Label>
                                                                </div>
                                                                <div class="d-flex justify-content-between border-bottom">
                                                                    <h6 class="text-muted text-uppercase"><i class="fa fa-hashtag"></i> Number of Items: </h6>
                                                                    <h6><strong>3  </strong> Items</h6>
                                                                </div>
                                                                <div class="d-flex justify-content-between border-bottom pt-2">
                                                                    <p><i class="fa fa-cat"></i> የሚከፈል ጠቅላላ ዋጋ: </p>
                                                                    <span><asp:Label ID="lblTotalPriceToPay" runat="server" Text='<%# Eval("Total_Price") %>'></asp:Label>  ብር</span>
                                                                </div>
                                                                <div class="d-flex justify-content-between pt-2">
                                                                    <div class="col-6">
                                                                        <p><i class="fa fa-cat"></i> ቅድመ ክፍያ(ቀብድ): </p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <div class="input-group input-group-sm">
                                                                            <asp:TextBox ID="tbHoldingAmount" CssClass="form-control form-control-sm" MaxLength="7" runat="server" onkeypress="return onlyNumberKey(event)" Text='<%# Eval("Holding_Amount") %>'></asp:TextBox>
                                                                           <span class="input-group-text" title="payment Status"><%# Eval("Payment_Status").ToString() == "New"? "<i class='text-danger fa fa-times-circle'  title='ቀብድ ኣልተከፈለም'></i>": "<i class='text-success fa fa-check-circle'  title='ቀብድ ተከፍለዋል'></i>" %></span> 
                                                                            <asp:LinkButton ID="lbtnPrePayPaid" runat="server" CssClass="btn btn-success small text-uppercase input-group-text" OnClick="lbtnPrePayPaid_Click"><i class="fas fa-pen-alt"></i></asp:LinkButton> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="d-flex justify-content-between pt-2">
                                                                    <div class="col-6">
                                                                    <p><i class="fa fa-cat"></i> ቀሪ ክፍያ: </p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <div class="input-group input-group-sm">
                                                                            <asp:Label ID="lblLeftAmmount" CssClass="form-control form-control-sm" runat="server" Text='<%# Eval("Left_Amount") %>'></asp:Label>
                                                                           <span class="input-group-text" title="payment Status"><%# Eval("Payment_Status").ToString() == "Fully Covered"? " <i class='float-end text-success fa fa-check-circle'  title='ተከፍለዋል'></i>": " <i class='float-end text-danger fa fa-times-circle'  title='ኣልተከፈለም'></i>" %></span> 
                                                                            <asp:LinkButton ID="lbtnLeftAmountPaid" runat="server" CssClass="btn btn-success small text-uppercase input-group-text" OnClick="lbtnLeftAmountPaid_Click"><i class="fas fa-pen-alt"></i></asp:LinkButton> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="d-flex justify-content-between pt-2">
                                                                    <div class="col-6">
                                                                    <p><i class="fa fa-cat"></i> ቀጠሮ: </p>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <div class="input-group input-group-sm">
                                                                            <asp:TextBox ID="tbAppoointment" runat="server" CssClass="form-control form-control-sm" TextMode="Date" Text='<%# Eval("Appointmet_Date").ToString() == ""? "Pendding": Eval("Appointmet_Date") %>'></asp:TextBox>
                                                                            <asp:LinkButton ID="lbtnAppointment" runat="server" CssClass="btn btn-success small text-uppercase input-group-text" OnClick="lbtnAppointment_Click"><i class="fas fa-pen-alt"></i></asp:LinkButton> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="d-flex justify-content-between border-bottom pt-2" style="color: #2d48e6; font-size: 17px;">
                                                                    <p><i class="fa fa-cat"></i> Order Status: </p>
                                                                    <span><asp:Label ID="lblOrderStatus" runat="server" Text='<%# Eval("Order_Status") %>'></asp:Label> </span>
                                                                </div>
                                                                <%--<div class="d-flex justify-content-center border-bottom pb-1">
                                                                    
                                                                   <asp:LinkButton ID="lbtnFullyCivered" runat="server" CssClass='<%# Eval("Payment_Status").ToString() == "Holding-Paid"? "btn btn-sm btn-outline-primary small text-uppercase mt-1" :"d-none" %>'><i class="fas fa-cat mr-1"></i> ቀሪ ተከፍለዋል </asp:LinkButton>
                                                                  </div>--%>
                                                                <div class="mt-2">
                                                                <label>Comment about the order (< 200 Characters)</label>
                                                                <asp:TextBox id="tbOrderId" runat="server" rows="2" TextMode="Multiline" class="form-control" maxlength="199" Text='<%# Eval("Comment") %>'></asp:TextBox>
                                                            </div>
                                                                <div class="d-flex justify-content-between">
                                                                    <asp:LinkButton ID="lbtnRejectOrder" runat="server" CssClass="btn btn-sm btn-danger small text-uppercase mt-1" OnClick="lbtnRejectOrder_Click"><i class="fas fa-trash-alt mr-1"></i> Reject Order</asp:LinkButton>
                                                                    <asp:LinkButton ID="lbtnAcceptOrder" runat="server" CssClass="btn btn-sm btn-success text-center text-uppercase mt-1" OnClick="lbtnAcceptOrder_Click"><i class="fas fa-cat mr-1"></i> Accept Order </asp:LinkButton>
                                                                </div>
                                                                <hr />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Card -->
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-sm btn-outline-danger" data-bs-dismiss="modal" aria-label="Close"><i class="fa fa-times"></i> Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="staticBackdrop<%# Eval("Custom_Phone_Number") %>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel"><%# Eval("FullName") %></h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <%# Eval("Cart_Ids") %>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-sm btn-outline-danger" data-bs-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
</tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
                <tfoot>
                    <tr class="text-uppercase text-muted">
                        <th>Ordered By</th>
                        <th>Phone #</th>
                        <th>Orders</th>
                        <th>Order Date</th>
                        <th>$ ጠቅላላ ዋጋ</th>
                        <th>$ ቀብድ</th>
                        <th>$ ቀሪ</th>
                        <th class="text-end">ቀጠሮ</th>
                        <th class="text-end">Status</th>
                    </tr>
                </tfoot>
            </table>
        </div>

    </div>
<script>
    var coll = document.getElementsByClassName("collapsible");
    var i;

    for (i = 0; i < coll.length; i++) {
      coll[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var contentcolps = this.nextElementSibling;
        if (contentcolps.style.display === "block") {
            contentcolps.style.display = "none";
        } else {
            contentcolps.style.display = "block";
        }
      });
    }
</script>
</asp:Content>

