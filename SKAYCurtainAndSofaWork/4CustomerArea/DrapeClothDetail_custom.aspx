<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="DrapeClothDetail_custom.aspx.cs" Inherits="_4CustomerArea_DrapeClothDetail_custom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   

    <div class="container mainContent" style="font-family: Calibri;">
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
        <div class="d-flex justify-content-center">
            <div class="col-sm-12 mb-3">
                 <div class="card shadow-lg ">
                    <div class="card-header">
                        <div class="d-flex justify-content-between">
                            <h6>መለያ ቁጥር: <%= CurtainClothIdNumber %> </h6>
                            <div>
                                <span class="btn btn-sm btn-outline-info" data-bs-toggle="modal" data-bs-target="#StaticHelpModal"><i class="fa fa-info-circle"></i> Help</span>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5 ">
                            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-bs-target="#carouselExampleIndicators" class="active" data-bs-slide-to="<%= CurtainClothIdNumber %>"></li>
                                    <asp:Repeater ID="rptrcarouselExampleIndicators" runat="server">
                                        <ItemTemplate>
                                            <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%# Eval("Id") %>"></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="../Handlers/SofaClothPhotoHandler.ashx?IdNumber=<%= CurtainClothIdNumber %>" class="Skyimagedetail" alt="Sofa Cloth.. <%= CurtainClothIdNumber %>" />
                                        <div class="carousel-caption d-md-block">
                                            <h6>የጨርቅ  ቁጥር: <%= CurtainClothIdNumber %> </h6>
                                        </div>
                                    </div>
                                    <asp:Repeater ID="rptrSofaSamples" runat="server">
                                        <ItemTemplate>
                                            <div class="carousel-item">
                                                <img src="../Handlers/SampleImagesHandler.ashx?Id=<%# Eval("Id") %>" class="Skyimagedetail" alt="..." />
                                                <div class="carousel-caption d-md-block">
                                                    <h5>Id: <%# Eval("Id") %></h5>
                                                    <p>በ <%# Eval("IdsOfTools") %> ጨርቅ የተሰራ.</p>
                                                    <a href="SampleDetail.aspx?Id=<%# Eval("Id") %>" class="btn btn-outline-Pa-Sky"> <i class="fa fa-search-location"></i> Find This</a>
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

                        <div class="row col-md-7">
                            <div class="col-md-6 rounded shadow-sm p-4 pb-1">
                                <p class="text-center"><strong><span><%= ClothCatagory %> </span>cloth detail</strong></p>
                                <hr />
                                <div class="d-flex justify-content-center">
                                        <div class="row">
                                    
                                    <div class="d-flex justify-content-between">
                                        <p><i class="fa fa-check"></i> Availabel Width</p>
                                        <span><span runat="server" id="spnAvlblWidth">100</span> <span> ሜ</span></span>
                                    </div>
                                <h5 class="text-center border-bottom"> ዋጋ ለ1 ሜትር </h5>
                                <div class="d-flex justify-content-between" runat="server" id="divOuterCloth">
                                    <p><i class="fa fa-check"></i> ዋና ጨርቅ </p>
                                    <span><span runat="server" id="spnDrapeOuterClothPricePerMeter">380</span> <span>ETB</span></span>
                                </div>
                                <div class="d-flex justify-content-between"  runat="server" id="divInnerCloth">
                                    <p><i class="fa fa-check"></i> ገበር ጨርቅ </p>
                                    <span><span runat="server" id="spnDrapeInnerClothPricePerMeter">380</span> <span>ETB</span></span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> መስፈያ</p>
                                    <span><span runat="server" id="spnDrapeTailorPerMeter">100</span> <span>ETB</span></span>
                                </div>
                                <div class="d-flex justify-content-between border-bottom">
                                    <p><i class="fa fa-check"></i> ቅናሽ </p>
                                    <span><span runat="server" id="spnDiscount">7.5</span> <span>ETB</span></span>
                                </div>
                                <div class="d-flex justify-content-between mt-1">
                                    <p style="padding: 5px; width: 100%; font-size: 13px; border: solid 1px #0094ff; border-left: solid 5px #0094ff; border-radius: 1px;"><small><strong>N.B</strong> ቅናሽ ምደረግሎት እኛጋ የምያሰሩ ከሆነ ነው። </small></p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> Drilling for 1 window</p>
                                    <span><span runat="server" id="spnDrapeDrillingFor1Window">30</span> <span>ETB</span></span>
                                </div>

                                <div class="d-flex border-bottom">
                                </div>

                                <div class="d-flex justify-content-between mt-1">
                                    <p><i class="fa fa-check"></i> ልዩ ስም/ቀለም</p>
                                    <p runat="server" id="pSofaName_Color">No Name</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> How May <i  style="color: #ff6818" class="fa fa-heart"></i> This</p>
                                    <p><span runat="server" id="pHow_Many_Users"> 100 </span> Customers</p>
                                </div>

                                <div class=" d-flex">
                                    <p runat="server" id="pSofaClothDescription" style="max-height: 67px; overflow-y: scroll;">Description</p>
                                </div>
                                    </div>
                                </div>
                            </div>

                            <%--<div class="row col-md-6">--%>
                            <div class="col-md-6  rounded shadow-sm p-4 pb-1">
                                <div class="col-12 divToggleContent">
                                    <p class="text-center text-center "> <strong>ስለመስኮትዎ ከስር ያስገቡ</strong> </p>
                                    <hr />
                                    <div class="d-flex justify-content-center">
                                        <div class="row">
                                            <div class="col-12 mt-1">
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-text">Width </div>
                                                    <asp:TextBox ID="tbWindowWidth" runat="server" class="form-control form-control-sm" onkeypress="return onlyNumberKey(event)" onkeyup="calculateCost();"
                                                        MaxLength="5" required="required" placeholder="የመስኮትዎ ስፋት በ ሜ？"></asp:TextBox>
                                                    <div class="input-group-text">m</div>
                                                </div>
                                            </div>
                                            <div class="col-12 mt-2">
                                                <div class="input-group input-group-sm">
                                                    <span class="input-group-text">height</span>
                                                    <asp:TextBox ID="tbWindowHeight" runat="server" class="form-control form-control-sm" onkeypress="return onlyNumberKey(event)" onkeyup="calculateCost();"
                                                        MaxLength="5" required="required" placeholder="የመስኮትዎ ቁመት በ ሜ？"></asp:TextBox>
                                                    <div class="input-group-text">m</div>
                                                </div>
                                            </div>
                                            <div class="col-12 mt-1">
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-text" >Shrink</div>
                                                    <asp:DropDownList ID="ddlShrinkPer" CssClass="form-select form-control-sm" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require" onclick="calculateCost();" >
                                                        <asp:ListItem Selected="true" disabled>በስንት ይሽብሽብ？</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>2.5</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-12 mt-2 ">
                                                <asp:CheckBox ID="cbEndsefaEfeligakehu" runat="server" onclick="calculateCost();" />
                                                <span>እንዲሰፋ እፈሊጋለሁ</span>
                                            </div>
                                            <div class="input-group input-group-sm">
                                                    <div class="mt-2 mr-2 pb-1" >
                                                        <asp:CheckBox ID="cbCurtainMeskeya" runat="server" onclick="calculateCost();" /> <span>መስቀያ እፈሊጋለሁ</span>
                                                    </div>
                                                    <asp:DropDownList ID="ddlMeskeyaType" CssClass="form-select form-control-sm" style="margin-left: 3px; border-left: solid 5px #dbdbdb;" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require" onclick="calculateCost();">
                                                        <asp:ListItem Selected="true" disabled> መስቀያ ይምረጡ </asp:ListItem>
                                                        <asp:ListItem>PVC</asp:ListItem>
                                                        <asp:ListItem>Pipe</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            
                                            <div class="col-12 mt-2 ">
                                                <asp:CheckBox ID="cbDrilling" runat="server" onclick="calculateCost();" />
                                                <span>የሚሰቅል ባለሞያ እፈልጋለሁ</span>
                                            </div>
                                            <div class="col-12 mt-2">
                                                <div class="input-group input-group-sm">
                                                    <span class="input-group-text">For</span>
                                                    <asp:TextBox ID="tbForHowManyWindows" runat="server" class="form-control form-control-sm" onkeypress="return onlyNumberKey(event)" onkeyup="calculateCost();"
                                                        MaxLength="5" required="required" placeholder="ለስንት መስኮት？"></asp:TextBox>
                                                    <span class="input-group-text">Windows</span>
                                                </div>
                                            </div>
                                            <small><strong>N.B </strong>ለተለየ የመስኮት ዓይነት ደግመው ይምሉ።</small>
                                            <div class="col-12 mt-2">
                                                <label class="text-end">ማብራርያ / ማለት የምፈልጉት ካለ </label>
                                                <asp:TextBox ID="tbItemDescription" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="2"> </asp:TextBox>
                                            </div>

                                            <div class=" d-flex col-12 justify-content-between mt-2">
                                                <span>Actual Price: </span><span style="color: #ff6818; font-size: 20px; font-weight: bold;"><span id="spnActualPriceHolder" runat="server">0.00</span> <span>ETB</span></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 mt-2">
                                    <div class="d-flex justify-content-between">
                                        <span id="lbtnToggleButton" class="btn btn-outline-success" onclick="calculateCost()">Calculation</span>
                                        <%--<asp:LinkButton ID="btnItemAddToCart" runat="server" CssClass="btn btn-outline-primary" OnClick="btnItemAddToCart_Click">ተስማምቻለሁ</asp:LinkButton>--%>
                                        <asp:Button ID="btnItemAddToCart" runat="server" CssClass="btn btn-outline-primary" Text="ተስማምቻለሁ" OnClick="btnItemAddToCart_Click" />
                                    </div>
                                </div>
                                <hr />

                                <div class="col-12  mt-1 sky-d-none divToggleContent">
                                    <h6 class="text-center">Calculation of the cost</h6>

                                    <div class="col-12 mb-1 border-bottom">
                                        <div class="d-flex justify-content-between">
                                            <span><i class="fa fa-check"></i> የመጋረጃ ዋጋ = </span>     <span > <span id="spnCurtainPrice" runat="server"> 600</span> ETB </span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <span><i class="fa fa-check"></i> የመስፈያ ዋጋ = </span>   <span > <span id="spnTailorPrice" runat="server"> 600</span> ETB </span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <span><i class="fa fa-check"></i> የመስቀያ ዋጋ = </span>  <span > <span id="spnMeskeyaPrice" runat="server"> 600</span> ETB </span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <span><i class="fa fa-check"></i> ለምሰቅል ባለሞያ = </span>  <span > <span id="spnDrillingPrice" runat="server"> 600</span> ETB </span>
                                        </div>
                                         <div class="col-12  border-bottom">
                                        <div class="d-flex justify-content-between">
                                            <span><i class="fa fa-check"></i> የመስኮት ብዛት = </span> <span>  <span id="spnNumberOfWindows" runat="server"> 3</span> መስኮት  </span>
                                        </div>
                                    </div>
                                    </div>

                                   

                                    <div class="col-12 mb-3 border-bottom">
                                        <div class="d-flex justify-content-between mb-1">
                                       <strong> <span><i class="fa fa-check"></i> ጠቅላላ ዋጋ  </span></strong>
                                        <span><strong> =  ( <span id="spnSumOfAllPrices" runat="server"> 600 </span> * <span id="spnNumberOfWindowssss" runat="server"> 2 </span> )
                                        = <span id="spnTotalPrice" runat="server" class=" text-danger text-decoration-line-through"> 8760.0 </span> ETB  </strong> </span>
                                        </div>
                                    </div>

                                    <div class="col-12 mb-3">
                                        <div class="d-flex justify-content-between">
                                                <span><i class="fa fa-check"></i><strong> ጠቅላላ ቅናሽ :</strong></span> <span> <strong> <span id="spnTotalDiscount" runat="server"> 32243</span> ETB </strong></span>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-between mb-3">
                                        <span style="color: #0094ff; font-size: 16px; width: 100%; border: solid 1px #2AC97A; border-left: solid 8px #2AC97A; padding: 7px;">
                                            <i class="fa fa-info-circle"></i><strong> Price to pay =</strong> <span id="spnClcTotalPriceInActual">7200.5 </span> 
                                            - <span id="spnClcTotalDiscountInActual">123 </span>
                                            = <strong><span id="spnClcActualPrice" class="text-underline" style=" font-size: 18px; font-weight: bold; text-underline-position: below;">7077.5 </span> ETB</strong>  </span>
                                    </div>

                                    <hr />
                                    <div class="d-flex justify-content-center mb-2">
                                        <asp:LinkButton  ID="lbtnDeleteSofaItem" runat="server" CssClass="btn btn-outline-danger" OnClientClick="return ConfirmationForDelete();"><i class="fa fa-trash-alt"></i> ኣልፈልግም</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

         <!-- Hidden Fields Starts here -->
        <div class="col-12">
            <asp:HiddenField runat="server" ID="hfActualPriceHolder" value=""></asp:HiddenField>
            <asp:HiddenField ID="hfTailorChoiceHolder" runat="server" />
            <asp:HiddenField ID="hfMeskeyaChoiceHolder" runat="server" />
            <asp:HiddenField ID="hfDrillCoiceHolder" runat="server" />
            <span id="spnPVCPriceHolder" runat="server" class="d-none"></span>
            <span id="spnPipePriceHolder" runat="server" class="d-none"></span>
        </div>
        <!-- Hidden Fields Ends here -->

        <!-- Help Modal -->
        <div class="modal fade" id="StaticHelpModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="StaticHelpModalLable" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header bg-info">
                        <h6 class="modal-title" id="StaticHelpModalLable" style="color: #333; font-family: serif;"><i class="fa fa-info-circle"></i>Help about how you can order Curtains </h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h6><i class="fa fa-cat"></i>How you can order curtain</h6>
                        <ul>
                            <li>1, Try to know your windows measurments.</li>
                            <li>2, Decide which one of our cloth curtains you perfer.</li>
                            <li>3, Insert the details of your window and hit the ተስማምቻለሁ button. (Isert repeatedly for different windows detail).</li>
                            <li>4, Go to your cart and look over it, then click the 'Order Cart' Button.</li>
                            <li>5, Pay the prepaymant </li>
                        </ul>
                        <b>Then wait patiently for your order to get deliver.</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                        <a href="DrapeCloths.aspx" class="btn btn-outline-primary">Find Curtains </a>
                    </div>
                </div>
            </div>
        </div>
       </div>
    <script type="text/javascript">

        window.onload = function () {
            document.getElementById('<%= ddlMeskeyaType.ClientID %>').style.display = 'none';
        }

       function calculateCost() {
           

           var WidthOfYourWindow = document.getElementById('<%= tbWindowWidth.ClientID %>').value || 0;

           var HeightOfYourWindow = document.getElementById('<%= tbWindowHeight.ClientID %>').value || 2.8;

           var AllowedWdithForhanger = getAllowedHangerMeter();

           // Cupturing the value of Shrink value starts //
           if (document.getElementById('<%= ddlShrinkPer.ClientID %>').value == "በስንት ይሽብሽብ？") {
                var ShrunkPer = 2.5;
           }
           else {
               var ShrunkPer = document.getElementById('<%= ddlShrinkPer.ClientID %>').value;
           }
           // Cupturing the value of Shrink value ends //

           var HowManyWindows = document.getElementById('<%= tbForHowManyWindows.ClientID %>').value || 1;

           var CurtainOuterPrice = document.getElementById('<%= spnDrapeOuterClothPricePerMeter.ClientID %>').innerText;
           var CurtainInnerPrice = document.getElementById('<%= spnDrapeInnerClothPricePerMeter.ClientID %>').innerText;

           
           var tailorPricePerMeter = 0;
           var ClothDiscountPerMeter = 0;
           var MeskeyaPrice = 0;
           var DrillingPrice = 0;

           if (document.getElementById('<%= cbEndsefaEfeligakehu.ClientID %>').checked) {
               tailorPricePerMeter = document.getElementById('<%= spnDrapeTailorPerMeter.ClientID %>').innerText;
               ClothDiscountPerMeter = document.getElementById('<%= spnDiscount.ClientID %>').innerText;
               // Assign  Tailor choice to hidden file
               document.getElementById('<%= hfTailorChoiceHolder.ClientID %>').value = "YES";
           }
           else {
               document.getElementById('<%= hfTailorChoiceHolder.ClientID %>').value = "NO";
           }
           if (document.getElementById('<%= cbCurtainMeskeya.ClientID %>').checked) {
               document.getElementById('<%= ddlMeskeyaType.ClientID %>').style.display = 'block';
               if (document.getElementById('<%= ddlMeskeyaType.ClientID %>').value == "PVC") {
                   MeskeyaPrice = document.getElementById('<%= spnPVCPriceHolder.ClientID %>').innerText;
                   }
               if (document.getElementById('<%= ddlMeskeyaType.ClientID %>').value == "Pipe") {
                   MeskeyaPrice = document.getElementById('<%= spnPipePriceHolder.ClientID %>').innerText;
               }
               // Assign Meskeya type to hidden file
                document.getElementById('<%= hfMeskeyaChoiceHolder.ClientID %>').value = document.getElementById('<%= ddlMeskeyaType.ClientID %>').value; 
           }
           else {
               document.getElementById('<%= ddlMeskeyaType.ClientID %>').style.display = 'none';
           }

           if (document.getElementById('<%= cbDrilling.ClientID %>').checked) {
               DrillingPrice = document.getElementById('<%= spnDrapeDrillingFor1Window.ClientID %>').innerText;
               // Assign Drilling YES choice to hidden file
                document.getElementById('<%= hfDrillCoiceHolder.ClientID %>').value = "YES";
           }
           else {
               // Assign Drilling NO choice to hidden file
               document.getElementById('<%= hfDrillCoiceHolder.ClientID %>').value = "NO";
           }
           var Hanger;
           var OuterTotalPrice = 0;
           var InnerTotalPrice = 0;
           var OuterCurtainOnlyPrice = 0;
           var InnerCurtainOnlyPrice = 0;
           var OuterTailorPrice = 0;
           var InnerTailorPrice = 0;
           var OuterHanger = 0;
           var InnerHanger = 0;

           //var TtlPrice;

           if (parseFloat(CurtainOuterPrice) > 0) {

               OuterTotalPrice = ((((parseFloat(CurtainOuterPrice) + parseFloat(tailorPricePerMeter))
                                      * (parseFloat(WidthOfYourWindow) * parseFloat(ShrunkPer))
                                    ) + (parseFloat(AllowedWdithForhanger) * parseFloat(MeskeyaPrice))
                                  ) + parseFloat(DrillingPrice)
                                ) * parseFloat(HowManyWindows);
               OuterCurtainOnlyPrice = (parseFloat(CurtainOuterPrice) * parseFloat(WidthOfYourWindow) * parseFloat(ShrunkPer) * parseFloat(HowManyWindows));
               OuterTailorPrice = (parseFloat(WidthOfYourWindow) * parseFloat(ShrunkPer) * parseFloat(tailorPricePerMeter) * parseFloat(HowManyWindows));
               OuterHanger = (parseFloat(MeskeyaPrice) * parseFloat(AllowedWdithForhanger) * parseFloat(HowManyWindows));
           }

           if (parseFloat(CurtainInnerPrice) > 0) {
               InnerTotalPrice = ((((parseFloat(CurtainInnerPrice) + parseFloat(tailorPricePerMeter))
                                      * (parseFloat(WidthOfYourWindow) * parseFloat(ShrunkPer))
                                    ) + (parseFloat(AllowedWdithForhanger) * parseFloat(MeskeyaPrice))
                                  ) + parseFloat(DrillingPrice)
                                ) * parseFloat(HowManyWindows);
               InnerCurtainOnlyPrice = ((parseFloat(CurtainInnerPrice) * parseFloat(WidthOfYourWindow) * parseFloat(ShrunkPer)) * parseFloat(HowManyWindows));
               InnerTailorPrice = (parseFloat(WidthOfYourWindow) * parseFloat(ShrunkPer) * parseFloat(tailorPricePerMeter) * parseFloat(HowManyWindows));
               InnerHanger = (parseFloat(MeskeyaPrice) * parseFloat(AllowedWdithForhanger) * parseFloat(HowManyWindows));
           }
           var DrillingCase = parseFloat(DrillingPrice) * parseFloat(HowManyWindows);
           if (CurtainOuterPrice == 0 || CurtainInnerPrice == 0)
               DrillingCase = 0;

           var YourToatlPrice = Math.round((OuterTotalPrice + InnerTotalPrice) - DrillingCase);


           var YourDiscount = (( (parseFloat(WidthOfYourWindow) * parseFloat(ShrunkPer))
                                    * (parseFloat(ClothDiscountPerMeter))
                              ) * parseFloat(HowManyWindows));

           document.getElementById('<%= spnActualPriceHolder.ClientID %>').innerText = Math.round(YourToatlPrice - YourDiscount);


           document.getElementById('<%= spnCurtainPrice.ClientID %>').innerText = OuterCurtainOnlyPrice + InnerCurtainOnlyPrice;
           document.getElementById('<%= spnTailorPrice.ClientID %>').innerText = OuterTailorPrice + InnerTailorPrice;
           document.getElementById('<%= spnMeskeyaPrice.ClientID %>').innerText = OuterHanger + InnerHanger;
           document.getElementById('<%= spnDrillingPrice.ClientID %>').innerText = (parseFloat(DrillingPrice) * parseFloat(HowManyWindows));
            /////////// ////////////////////////////////////////////////////////////////////////
           document.getElementById('<%= spnNumberOfWindows.ClientID %>').innerText = (parseFloat(HowManyWindows));
           
           document.getElementById('<%= spnSumOfAllPrices.ClientID %>').innerText = (parseFloat(YourToatlPrice) / parseFloat(HowManyWindows));
           document.getElementById('<%= spnNumberOfWindowssss.ClientID %>').innerText = (HowManyWindows);
           document.getElementById('<%= spnTotalPrice.ClientID %>').innerText = (YourToatlPrice);

           document.getElementById('<%= spnTotalDiscount.ClientID %>').innerText = (YourDiscount);

           document.getElementById('spnClcTotalPriceInActual').innerText = (YourToatlPrice);
           document.getElementById('spnClcTotalDiscountInActual').innerText = (YourDiscount);
           document.getElementById('spnClcActualPrice').innerText = (YourToatlPrice - YourDiscount);


           // Passing values to cide behind
           document.getElementById('<%= hfActualPriceHolder.ClientID %>').value = (YourToatlPrice - YourDiscount);
           //////////////////

       }

        function getAllowedHangerMeter() {
            var AllowedMeters = [0, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 4.25, 4.5, 4.75, 5, 5.25, 5.5, 5.75, 6];

            var TheWindowWdith = document.getElementById('<%= tbWindowWidth.ClientID %>').value || 0;

            var width = AllowedMeters.find(GetAllowedWdith);

            var i;
            for (i = 0; i < AllowedMeters.length; i++) {
                if (AllowedMeters[i] == TheWindowWdith) {
                    width = AllowedMeters[i];
                    break;
                }
            }

            return width;
        }

        function GetAllowedWdith(value, index, array) {
            var TheWindowWdith = document.getElementById('<%= tbWindowWidth.ClientID %>').value ;
            return value > TheWindowWdith;
        }
    </script>
</asp:Content>

