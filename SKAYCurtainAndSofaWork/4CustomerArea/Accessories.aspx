<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="Accessories.aspx.cs" Inherits="_4CustomerArea_Accessories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" container-fluid mainContent">
         <style>
                .Skyimagedetail {
                    height: 400px;
                    width: 100%;
                }

                .SkyimageList {
                    height: 250px;
                    width: 100%;
                }

                @media screen and (max-width: 480px) {
                    .Skyimagedetail {
                        height: 320px;
                        width: 100%;
                    }

                    .SkyimageList {
                        height: 320px;
                        width: 100%;
                    }
                }
            </style>
        <div class="d-flex justify-content-center">
            <div class="col-sm-10">
            <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                <span id="spnAlertSuccess" runat="server"><i class="fa fa-check-circle"></i> Item Added to your cart Successfuly.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                <span id="spnAlertError" runat="server"><i class="fa fa-times-circle"></i> Somthing went wrong! Try again.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
            </div>
        <div class="d-flex justify-content-center" id="divAcceDetail" runat="server">
            <div class="col-sm-10 mb-3">
                <div class="card shadow-lg ">
                    
                    <div class="row justify-content-center">
                                <div class="col-md-6">
                            <img src="../Handlers/AccessoriesPhotoHandler.ashx?Id=<%= Acce_Id %>" class="Skyimagedetail" alt="<%= Acce_Id %> Accessory..." />
                        </div>

                        <div class="col-md-6">
                            <div class="m-2 border-bottom pb-2">
                                <div class="d-flex justify-content-center border-bottom pb-2">
                                    <span class="font-weight-bold"> መለያ ቁጥር: </span><span id="spnId" runat="server"> <strong> 9</strong></span>
                                </div>
                                <div class="d-flex justify-content-between pb-2">
                                    <span class="font-weight-bold">* የኣክሰሰሪ ዓይነት: </span><span id="spnAcceType" runat="server"><%= Acce_Type %></span>
                                </div>
                                <div class="d-flex justify-content-between pb-2">
                                    <span class="font-weight-bold">* ልዩ ስም: </span><span id="spnAcceSpecialName" runat="server"> Golden</span>
                                </div>
                                <div class="d-flex justify-content-between pb-2">
                                    <span class="font-weight-bold">* Availability: </span> <span><span id="spnAcceAvailability" runat="server"></span> <%= Acce_Type == "Hanger" ? " ሜትር" : " ፍሬ" %> </span>
                                </div>
                                <div class="d-flex justify-content-between pb-2">
                                    <span class="font-weight-bold">* ዋጋ ለ 1 <%= Acce_Type == "Hanger" ? " ሜትር" : " ፍሬ" %>: </span> <span><span id="spnAccePrice" runat="server"> </span> ብር </span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* ስንት ተጠቅመውበታል: </span> <span><span id="spnHowMuchLove" runat="server"> </span> ሰዎች </span>
                                </div>
                            </div>
                            <div class="m-2">
                            <h6 class=" border-bottom pb-2 text-center"> <strong>ትዛዝዎ ከስር ያዘጋጁ！</strong></h6>
                                <div class="d-flex justify-content-between mt-3">
                                    <label><strong>ስንት <%= Acce_Type == "Hanger" ? " ሜትር" : " ፍሬ" %> ይፈልጋሉ?</strong></label>
                                    
                                    <asp:TextBox runat="server" id="tbAcceQuantity" class="form-control" onkeypress="return onlyNumberKey(event)" onkeyup="CalculatePrice();" MaxLength="5" required="required" ></asp:TextBox>
                                </div>
                               <p class="text-end">  <asp:RequiredFieldValidator ValidationGroup="AcceItemAddTocart" ControlToValidate="tbAcceQuantity" runat="server" ForeColor="red" ErrorMessage="እባክዎ የምፈልጉት ከላይ ያስገቡ！" ></asp:RequiredFieldValidator></p>
                                   <div class="d-flex justify-content-center">
                                    <span  style="font-size: 18px;">ጠቅላላ ዋጋ： <span class=" text-danger text-decoration-underline" id="spnAcceTotalPrice" runat="server"> 0.00</span> ETB</span>
                                     </div>
                            </div>
                            
                            <div class="m-2">
                                <asp:hiddenfield id="hfTotalPrice" runat="server"></asp:hiddenfield>
                            </div>

                            <div class="m-2">
                                <div class="d-flex justify-content-between mt-3">
                                    <span id="lbtnToggleButton" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#sofaSampleRegistration" data-bs-whatever="@getbootstrap"><i class="fa fa-trash-alt "></i> ኣልፈልግም</span>
                                    <asp:LinkButton ID="lbtnAddAcceItemToCart" runat="server" CssClass="btn btn-sm btn-primary" CausesValidation="true" ValidationGroup="AcceItemAddTocart"
                                        OnClick="lbtnAddAcceItemToCart_Click"><i class="fa fa-cart-plus"></i> ተስማምቻለሁ</asp:LinkButton>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       
        <div class="row">
            <asp:Repeater ID="rptrAllAccessories" runat="server">
                <ItemTemplate>

                    <div class="col-md-3 mt-3">
                        <div class="border shadow-lg">
                            <a href="#"><img class="SkyimageList" data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("Id") %>" src="../Handlers/AccessoriesPhotoHandler.ashx?Id=<%# Eval("Id") %>" alt="Sofa..<%# Eval("Id") %>" />
                            </a>
                            <div class="m-2">
                                 <div class="d-flex justify-content-center border-bottom">
                                            <span class="sample-name"><strong><%# Eval("SpecialName_color") %></strong></span>
                                        </div>
                                <div class="d-flex justify-content-between">
                                     <span class="font-weight-bold">* የኣክሰሰሪ ዓይነት: </span><span><%# Eval("Acce_Type") %></span>
                                </div>
                                <div class="d-flex justify-content-between">
                                     <span class="font-weight-bold">* Availability: </span><span><%# Eval("Available_Quantity") %> <%# Eval("Acce_Type").ToString() == "Hanger" ? " ሜትር" : " ፍሬ" %></span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* ዋጋ ለ 1 <%# Eval("Acce_Type").ToString() == "Hanger" ? " ሜትር" : " ፍሬ" %>: </span><span><%# Eval("PricePerMeter_One") %> ብር</span>
                                </div>
                                <%--<div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* Prdc-Date: </span><span class="font-weight-bold"><%# Eval("Production_Date") %></span>
                                </div>--%>
                                <div class=" d-flex justify-content-between mt-1">
                                     <span id="lbtnSeeSofaSampledetail" class="btn btn-sm btn-outline-primary"  data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("Id") %>">
                                        <i class="fa fa-cat"></i> ጥልቅ መረጃ</span>
                                    <a href="Accessories.aspx?Id=<%# Eval("Id") %>" id="lbtnSeeSofaClothdetail" class="btn btn-sm btn-outline-success"><i class="fa fa-pen-alt"></i> ትዛዝ ማዘጋጃ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="modal fade" id="exampleModal<%# Eval("Id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <span class="modal-title" id="idNumber">ቁጥር: <%# Eval("Id") %></span>
                                    <button type="button" class="btn-close btn-link" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div id="carouselExampleIndicators<%# Eval("Id") %>" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-item active">
                                        <img src="../Handlers/AccessoriesPhotoHandler.ashx?Id=<%# Eval("Id") %>" class="Skyimagedetail" />
                                        <div class="m-2">
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* የኣክሰሰሪ ዓይነት: </span><span><%# Eval("Acce_Type") %></span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* ልዩ ስም: </span><span><%# Eval("SpecialName_color") %></span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* Availability: </span><span><%# Eval("Available_Quantity") %> <%# Eval("Acce_Type").ToString() == "Hanger" ? " ሜትር" : " ፍሬ" %></span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* ዋጋ ለ 1 <%# Eval("Acce_Type").ToString() == "Hanger" ? " ሜትር" : " ፍሬ" %>: </span><span><%# Eval("PricePerMeter_One") %> ብር</span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* ስንት ተጠቅመውበታል: </span><span class="font-weight-bold"><%# Eval("HowMuch_Love") %> ሰዎች</span>
                                </div>
                                            <hr />
                                            <div class="d-flex justify-content-center">
                                                <span class="font-weight-bold"><%# Eval("Acce_Description") %> </span>
                                </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>

    </div>
    <script type="text/javascript">
        function CalculatePrice() {

            var Price = document.getElementById('<%= spnAccePrice.ClientID %>').innerText;
            var howMuch = document.getElementById('<%= tbAcceQuantity.ClientID %>').value || 0;
            document.getElementById('<%= hfTotalPrice.ClientID %>').value = (parseFloat(Price) * parseFloat(howMuch));
            document.getElementById('<%= spnAcceTotalPrice.ClientID %>').innerText = (parseFloat(Price) * parseFloat(howMuch));
        }
    </script>
</asp:Content>

