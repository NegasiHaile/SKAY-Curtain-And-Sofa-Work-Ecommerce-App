<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="SofaClothDetail_custom.aspx.cs" Inherits="_4CustomerArea_SofaClothDetail_custom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container mainContent">
        <div class="col-12">
            <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                <span id="spnAlertSuccess" runat="server"><i class="fa fa-check-circle"></i> Item Added to the list, Now you can Check it in <a href="Cart.aspx"> Your cart</a>.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                <span id="spnAlertError" runat="server"><i class="fa fa-times-circle"></i>Somthing went wrong! Try again.</span>
                <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <div class="col-sm-12 mb-3">
                <div class="card shadow-lg ">

                    <div class="row">
                        <div class="col-lg-5 ">
                            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-bs-target="#carouselExampleIndicators" class="active" data-bs-slide-to="<%= SofaClothIdNumber %>"></li>
                                    <asp:Repeater ID="rptrcarouselExampleIndicators" runat="server">
                                        <ItemTemplate>
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%# Eval("Id") %>"></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="../Handlers/SofaClothPhotoHandler.ashx?IdNumber=<%= SofaClothIdNumber %>" class="Skyimagedetail" alt="Sofa Cloth.. <%= SofaClothIdNumber %>" />
                                        <div class="carousel-caption d-md-block">
                                            <h6>መዝገብ  ቁጥር: <%= SofaClothIdNumber %> </h6>
                                        </div>
                                    </div>
                                    <asp:Repeater ID="rptrSofaSamples" runat="server">
                                        <ItemTemplate>
                                            <div class="carousel-item">
                                                <img src="../Handlers/SampleImagesHandler.ashx?Id=<%# Eval("Id") %>" class="Skyimagedetail" alt="..." />
                                                <div class="carousel-caption d-md-block">
                                                    <h5>Id: <%# Eval("Id") %></h5>
                                                    <p>በ <%# Eval("IdsOfTools") %> ጨርቅ የተሰራ.</p>
                                                    <a href="SampleDetail.aspx?Id=<%# Eval("Id") %>" class="btn btn-outline-Pa-Sky"> <i class="fa fa-heart"></i> My Modal</a>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </a>
                            </div>
                        </div>

                        <div class="row col-lg-7">
                            <div class="col-md-6 shadow-sm p-3 rounded">
                                <h6 class="text-center"><span><%= ClothCatagory %> </span>Cloth</h6>
                                <hr />
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> Availabel Width</p>
                                    <span><span runat="server" id="pAvlblWidth">100</span> <span>ሜ</span></span>
                                </div>
                                <hr />
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> የጨርቅ ዋጋ ለ1 ሜትር</p>
                                    <span><span runat="server" id="pSofaClothPricePerMeter">380</span> <span>ETB</span></span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> ቅናሽ ለ1 ሜትር</p>
                                    <span><span runat="server" id="spnDiscount">7.5</span> <span>ETB</span></span>
                                </div>
                                <small><strong>N.B</strong> ቅናሽ ምደረግሎት እኛጋ የምያሰፉ ከሆነ ነው። </small>
                                <hr />
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> መስፈያ ዋጋ</p>
                                    <span><span runat="server" id="pTailorPerMeter">100</span> <span>ETB</span></span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> የማልበሻ ዋጋ</p>
                                    <span><span runat="server" id="spnSofaClothingPrice">30</span> <span>ETB</span></span>
                                </div>

                                <hr />
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> Special Name/Color</p>
                                    <p runat="server" id="pSofaName_Color">No Name</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> How May <i style="color: #ff6818" class="fa fa-heart"></i> This</p>
                                    <p> <span runat="server" id="pHow_Many_Users"> 100 </span> People</p>
                                </div>

                                <div class=" d-flex">
                                    <p runat="server" id="pSofaClothDescription">Description</p>
                                </div>
                            </div>

                            <div class="col-md-6  rounded shadow-sm p-3">
                                <div class="col-12 divToggleContent">
                                    <h6 id="yyy" class="text-center">የምፈልጉትን ከስር ያስገቡ</h6>
                                    <hr />
                                    <div id="divSofaInCart" runat="server" style="border: solid 1px #065ce4; padding: 5px; color: #065ce4;">
                                        <span class="text-center"><i class="fa fa-info-circle"></i> ስለ ሶፋዎ ሁኔታ ኣላስገቡም፤ እባክዎ ጨርቅ ከመምረጥዎ በፊት
                                               <span class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#ModalsofaCustomerSofsRequirments" data-bs-whatever="@getbootstrap"> 
                                                   እዝህ ተጭነው </span> ያስገቡ!</span>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        
                                        <div class="row">
                                            <div class="col-12 mt-2">
                                                <label for="tbSofaWidth">በዚህ ጨርቅ ስንት ሜ ይፈልጋሉ？</label>
                                                <asp:TextBox ID="tbSofaWidth" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" onkeyup="calculateCost();" MaxLength="5" required="required" ValidationGroup="SelectSofaItem"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbSofaWidth" ErrorMessage="በዝህ ጨርቅ የምፈልጉት ሜትር ያስገቡ!" ForeColor="Red" ValidationGroup="SelectSofaItem"></asp:RequiredFieldValidator>--%>
                                            </div>

                                            <div class="col-12 mt-2">
                                                <label for="ddlPricingFunctionType">ጨርቁ ለምን ይሁንሎት? </label>
                                                <asp:DropDownList ID="ddlForWhatPartOfTheSofa" CssClass=" form-select form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="required" ValidationGroup="SelectSofaItem">
                                                    <asp:ListItem Selected="true" disabled> </asp:ListItem>
                                                    <asp:ListItem>Body</asp:ListItem>
                                                    <asp:ListItem>Site</asp:ListItem>
                                                    <asp:ListItem>Pillow</asp:ListItem>
                                                    <asp:ListItem>Site & Pillow</asp:ListItem>
                                                    <asp:ListItem>For All</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlForWhatPartOfTheSofa" ErrorMessage="ለየትኛው የሶፋዎ ክፍል!" ForeColor="Red" ValidationGroup="SelectSofaItem"></asp:RequiredFieldValidator>
                                            --%><div class=" d-flex col-12 justify-content-between mt-1">
                                                <span>Actual Price: </span><span style="color: #ff6818; font-size: 20px; font-weight: bold;"><span id="spnActualPriceHolder" runat="server">0.00</span> <span>ETB</span></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 mt-2">
                                    <div class="d-flex justify-content-between">
                                        <span id="lbtnToggleButton" class="btn btn-sm btn-outline-success" onclick="calculateCost()"> <i class="fa fa-calculator"></i> Calculation</span>
                                        <asp:Button ID="btnSofaItemAddToCart" runat="server" CssClass="btn btn-sm btn-outline-primary" CausesValidation="true" ValidationGroup="SelectSofaItem"  OnClick="btnSofaItemAddToCart_Click" Text='ተስማምቻለሁ'/> <%--<i class="fa fa-cart-plus"></i> ተስማምቻለሁ </asp:Button>--%>
                                    </div>
                                </div>
                                <hr />

                                <div class="col-12  mt-1 sky-d-none divToggleContent">
                                    <h6 class="text-center">Calculation of the cost</h6>

                                    <div class="d-flex justify-content-between mb-3">
                                        <span><i class="fa fa-check"></i><strong> ጠቅላላ ዋጋ =</strong> <span class="text-muted">(የምፈልጉት ሜትር  X የጨርቅ ዋጋ)</span> :- 
                                (<span id="spnClcMeterYouNeed" class="spnClcMeterYouNeed"> 14 </span>X <span id="spnClcClothPrice">400 </span>) 
                                            = <strong><span id="spnClcTotalPrice" class=" text-danger text-decoration-line-through">7200.5</span> ETB</strong></span>
                                    </div>

                                    <div class="d-flex justify-content-between mb-3">
                                        <span><i class="fa fa-check"></i><strong> ጠቅላላ ቅናሽ =</strong> <span class="text-muted">የምፈልጉት ሜትር  X ቅናሽ ለ1 ሜትር </span>:- 
                                <span id="spnClcMeterYouneedInDiscount">14 </span>X <span id="spnClcDiscount">8.5 </span>
                                            = <strong><span id="spnClcTotalDiscount" class="text-primary">123 </span>ETB</strong> </span>
                                    </div>
                                    <div class="d-flex justify-content-between mb-3">
                                        <span><i class="fa fa-check"></i><strong> Price to pay =</strong> <span class="text-muted">ጠቅላላ ዋጋ  - ጠቅላላ ቅናሽ </span>:- 
                                <span id="spnClcTotalPriceInActual">7200.5 </span>- <span id="spnClcTotalDiscountInActual">123 </span>
                                            = <strong><span id="spnClcActualPrice" class="text-success">7077.5 </span>ETB</strong>  </span>
                                    </div>

                                    <hr />
                                    <div class="d-flex justify-content-center mb-2">
                                        <asp:LinkButton ID="lbtnDeleteSofaItem" runat="server" CssClass="btn btn-outline-danger" OnClientClick="return ConfirmationForDelete();"><i class="fa fa-trash-alt"></i> ኣልፈልግም</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


                    <%-- Sofa requirment insertion modal Starts here --%>
            <div class="modal fade" id="ModalsofaCustomerSofsRequirments" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #2AC97A; color: #333;">
                            <span class="text-center p-2"> የሶፋ ጨርቅ ከመምረጥዎ በፊት መጀመርያ ፍላጎትዎ ከስር ያስገቡ！</span>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="m-2 col-sm-12">
                                <label for="ddlHowMuchMeterYourSofaNeed">ሶፋዎ እስከ ስንት ሜትር ጨርቅ ይፈጃል？*</label>
                                <div class="input-group">
                                    <div class="input-group-text">እስከ</div>
                                    <asp:DropDownList ID="ddlHowMuchMeterYourSofaNeed" CssClass="form-select form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" onclick="SofaRequarimentModal();">
                                        <asp:ListItem Selected="true" disabled> </asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="input-group-text">ሜትር</div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlHowMuchMeterYourSofaNeed" ErrorMessage="ሶፋዎ ስንት ሜትር እንደምፍጅ ያስገቡ!" ForeColor="Red" ValidationGroup="SofaRequirment"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group m-2 mt-3 mb-3 col-sm-12">
                                <div class="input-group">
                                    <div class="input-group-text">ስፌት</div>
                                    <div class="form-control">
                                        <label class=" form-check-inline">
                                            <asp:RadioButton runat="server" ID="rbTailorYes" type="radio" GroupName="TailorAction" onclick="SofaRequarimentModal();"/>
                                            <span>እንድሰፋልኝ እፈልጋለሁ </span>
                                        </label>
                                        <label class=" form-check-inline">
                                            <asp:RadioButton runat="server" ID="rbTailorNo" type="radio" GroupName="TailorAction" onclick="SofaRequarimentModal();"/>
                                            <span>ጨርቅ ብቻ  </span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="m-2 mt-3 mb-3 col-sm-12" id="divAlbshEfeligalehu">
                                <div class="input-group">
                                    <div class="input-group-text">
                                        <asp:CheckBox ID="cbAlbashFeligalehu" runat="server" onclick="SofaRequarimentModal();" />
                                    </div>
                                    <span class="form-control">ከተሰፋ በኋላ የምያለብስልኝ ሰው እፈሊጋለሁ</span>
                                </div>
                            </div>
                            <div class="m-2 col-sm-12">
                                <label for="ddlByHowMuchClothesYourSofaToTailor">በስንት ዓይነት ጨርቅ ይሰራሎት？ <span>*</span></label>
                                <div class="input-group">
                                    <div class="input-group-text">በ</div>
                                    <asp:DropDownList ID="ddlByHowMuchClothesYourSofaToTailor" CssClass="form-select form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" onclick="SofaRequarimentModal();">
                                        <asp:ListItem Selected="true" disabled> </asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="input-group-text">ጨርቅ</div>
                                </div>
                                <asp:RequiredFieldValidator ID="pass" runat="server" ControlToValidate="ddlByHowMuchClothesYourSofaToTailor" ErrorMessage=" የሚፈልጉት የጨርቅ ብዛት ያስገቡ！" ForeColor="Red" ValidationGroup="SofaRequirment"></asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="m-2 col-sm-12 border-bottom">
                                <label for="ddlIdOfYourSofaModel">የሶፋዎ ሞደል ይምረጡ <span>*</span></label>
                                <div class="input-group">
                                    <a class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#ModalRequirments" data-bs-whatever="@getbootstrap"><i class="fa fa-search"></i></a>
                                    <asp:DropDownList ID="ddlIdOfYourSofaModel" CssClass="form-select form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK">
                                        <asp:ListItem Selected="true" disabled> </asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                                <small><i>የሶፋዎ ሞደል ቁጥር ለማግኘት ከላይ ያለው የመፈለግያ ምልክት ይጫኑ።</i></small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlIdOfYourSofaModel" ErrorMessage="የሶፋዎ ሞደል ያስፈልገናል!" ForeColor="Red" ValidationGroup="SofaRequirment"></asp:RequiredFieldValidator>
                            </div>
                            <div class="d-flex justify-content-center">
                                <asp:LinkButton ID="btnSaveCustomerSofaRequirment" runat="server" CssClass="btn btn-outline-primary" CausesValidation="true" ValidationGroup="SofaRequirment" OnClick="btnSaveCustomerSofaRequirment_Click"> <i class="fa fa-save"></i> Submite</asp:LinkButton>
                            </div>
                        </div>
                        <div class="modal-footer">
                            
                            <div class="d-flex justify-content-center">
                                <span class="text-center text-capitalize">The Estimated Price: <strong><span id="spanEstimatedPrice" class="text-danger text-decoration-underline"> 0.00</span>  ETB</strong></span>
                                </div>
                            <span class="btn btn-sm btn-info" onclick="SofaRequarimentModal();"><i class="fa fa-info-circle" data-bs-toggle="modal" data-bs-target="#ModalRequirments" data-bs-whatever="@getbootstrap"></i></span>
                        </div>
                    </div>
                </div>
            </div>

        <!-- Hidden Fields Starts here -->
        <div class="col-12">
            <asp:HiddenField ID="hfSofaTailorChioce" runat="server" />
            <asp:HiddenField ID="hfSofaAlbash" runat="server" />
        </div>

            <%-- Sofa requirment insertion modal Ends here --%>
        <div class="modal fade" id="ModalRequirments" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <span class="modal-title" id="idNumber">Number of Samples</span>
                        <button type="button" class="btn-close btn-link" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <asp:Repeater ID="rptrAllSofaSamples" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-3">
                                        <img src="../Handlers/SampleImagesHandler.ashx?Id=<%# Eval("Id") %>" style="width: 100%; height: 250px;" />
                                        <div class="m-2">
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* Sofa Type: </span><span class="font-weight-bold"><%# Eval("Sample_SubCatagory") %> </span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* Total Meter This Cost: </span><span class="font-weight-bold"><%# Eval("Drp_Wndw_Sf_TtlMeter") %> ሜ</span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* Total Cost: </span><span class="font-weight-bold"><%# Eval("TotalCost") %> ብር</span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* Material Id: </span><span class="font-weight-bold"><%# Eval("IdsOfTools") %></span>
                                            </div>
                                            <div class="d-flex justify-content-between border-bottom">
                                                <span>* ቁጥር: <strong><%# Eval("Id") %></strong></span>
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
    </div>
    
    <script type="text/javascript">
        
        function calculateCost() {

            tbSofaWidthYouNeed = document.getElementById('<%= tbSofaWidth.ClientID %>');

            var WidthYouentered = tbSofaWidthYouNeed.value || 0;

            pClothPriceHolder = document.getElementById('<%= pSofaClothPricePerMeter.ClientID %>');
            spnClothDiscount = document.getElementById('<%= spnDiscount.ClientID %>');
           
            var ClothDiscount = 0;


            ActualPriceHolder = document.getElementById('<%= spnActualPriceHolder.ClientID %>');

            var YourToatlPrice = (parseFloat(WidthYouentered) * parseFloat(pClothPriceHolder.innerText));
            var YourTatolDiscount = parseFloat(WidthYouentered) * parseFloat(ClothDiscount);

            ActualPriceHolder.innerText = YourToatlPrice - YourTatolDiscount;


            //////////// Calculation Starts here

            spnClcMeterYouNeed.innerText = WidthYouentered;
            spnClcClothPrice.innerText = pClothPriceHolder.innerText;

            spnClcTotalPrice.innerText = YourToatlPrice;

            spnClcMeterYouneedInDiscount.innerText = WidthYouentered;
            spnClcDiscount.innerText = ClothDiscount;
            spnClcTotalDiscount.innerText = YourTatolDiscount;

            spnClcTotalDiscountInActual.innerText = YourTatolDiscount;
            spnClcTotalPriceInActual.innerText = YourToatlPrice;
            spnClcActualPrice.innerText = ActualPriceHolder.innerText;
            /////////// Calculation Ends here

        }
        function SofaRequarimentModal() {
            
            var requiredMeter = document.getElementById('<%= ddlHowMuchMeterYourSofaNeed.ClientID %>').value || 0;
            var TailorPrice = 0;
            var SofaWearing = 0;
            var CurrentClothPrice = document.getElementById('<%= pSofaClothPricePerMeter.ClientID %>').innerText || 0;

            if (document.getElementById('<%= rbTailorYes.ClientID %>').checked) {
                document.getElementById('<%= hfSofaTailorChioce.ClientID %>').Value = "YSEFAL";
                TailorPrice = document.getElementById('<%= pTailorPerMeter.ClientID %>').innerText;
                //document.getElementById("divAlbshEfeligalehu").style.display = "block";
            }
            if (document.getElementById('<%= rbTailorNo.ClientID %>').checked) {
                document.getElementById('<%= hfSofaTailorChioce.ClientID %>').Value = "Cloth Only";
                //document.getElementById("divAlbshEfeligalehu").style.display = "none";
                TailorPrice = 0;
            }
            else {
                document.getElementById('<%= hfSofaTailorChioce.ClientID %>').Value = "Undfined";
            }

            if (document.getElementById('<%= cbAlbashFeligalehu.ClientID %>').checked) {
                document.getElementById('<%= hfSofaAlbash.ClientID %>').Value = "YES";
                SofaWearing = document.getElementById('<%= spnSofaClothingPrice.ClientID %>').innerText;
            }
            else {
                document.getElementById('<%= hfSofaAlbash.ClientID %>').Value = "NO";
                SofaWearing = 0;
            }


            document.getElementById("spanEstimatedPrice").innerText = (parseFloat(requiredMeter) * parseFloat(CurrentClothPrice)) + parseFloat(TailorPrice) + parseFloat(SofaWearing);
        }
    </script>
</asp:Content>

