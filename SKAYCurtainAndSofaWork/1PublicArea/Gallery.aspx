<%@ Page Title="" Language="C#" MasterPageFile="~/1PublicArea/PublicArea.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="_1PublicArea_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .v-scrollable{
            max-height: 800px; overflow-y: scroll;
        }
        .sample-name{
            color:#212121; font-family: 'HoloLens MDL2 Assets';
        }
        @media screen and (max-width: 580px) {
            .v-scrollable {
                max-height: 880px;
            }
        }
    </style>
    <div class="container-fluid main-cnt">
        <div class="container mt-2 mb-5">
            <h5 class="text-center text-muted">ይህ የ SENI Sofa & Curtain Textile Work  ስራዎች ምስል የምለጠፍበት ገፅ ነው.</h5>
            <p class="text-center text-muted d-none d-md-block">
                ከዝህ በታች ያሉ ምስሎች የመጋረጃ፤ የሶፋና የመጋረጃ ኣክሰሰሪዎች በተለያየ ኣሰራር በልምድ ያላቸው ሰራተኞቻችን ተሰርተው ለደንበኞቻችን ያደርናቸው ስራዎች ናቸው። እርስዎም ከነዝህ ስራዎች የምፈሉጉት ካለ 
                <a href="../1PublicArea/SignUp.aspx">ይዘዙንና</a> በጥራት ሰርተን ከ48 ሰኣታት በማይበልጥ ግዜ እቤትዎ እናደርስሎታለን።
            </p>
            <hr />
            <div class="products">
                <div class="tab-content mb-3" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="d-flex justify-content-center p-3 mb-3 align-items-center bg-light">
                            <h6 class="font-weight-bold text-uppercase">መጋረጃዎች </h6>
                        </div>
                        <div class="row g-3 v-scrollable">
                            <asp:Repeater ID="rptrGalleryCurtains" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-3">
                                        <div class="card">
                                            <img src="../Handlers/SampleImagesHandler.ashx?Id=<%# Eval("Id") %>" class="card-img-top" style="height: 250px" />
                                            <div class="card-body">

                                                <div class="d-flex justify-content-center border-bottom">
                                                    <span class="sample-name"><strong><%# Eval("Sample_SubCatagory") %></strong></span>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <span class="font-weight-bold">* የመስኮት ስፋት： </span><span class="font-weight-bold"><%# Eval("Drp_Wndw_Sf_TtlMeter") %>ሜ</span>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <span class="font-weight-bold">* በስንት ተሸበሸበ？： </span><span class="font-weight-bold">በ <%# Eval("ShirinkPer") %>ሜ</span>
                                                </div>
                                                <%--<div class="d-flex justify-content-between">
                                            <span class="font-weight-bold">* የጨርቅ ዋጋ በ ሜትር： </span> <span class="font-weight-bold"><%# Eval("") %>ብር</span>
                                        </div>--%>
                                                <div class="d-flex justify-content-between">
                                                    <span class="font-weight-bold">* ጠቅላላ ዋጋ： </span><span class="font-weight-bold"><%# Eval("TotalCost") %> ብር</span>
                                                </div>
                                                <div class="col-12 mt-1">
                                                    <a href="#" class="btn btn-sm login-button w-100" runat="server"><i class="fa fa-cat"></i>See Detail</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                </div>

                <%-- ///////////////////////////// Drape End Sofa Starts ////////////////////////// --%>

                <div class="tab-content mb-3">
                    <div class="tab-pane fade show active" id="divSkySofas" role="tabpanel" aria-labelledby="home-tab">
                        <div class="d-flex justify-content-center p-3 bg-warning mb-3 align-items-center">
                            <h6 class="font-weight-bold text-uppercase">ሶፋዎች </h6>
                        </div>
                        <div class="row g-3 v-scrollable">
                            <asp:Repeater ID="rptrGallerySofas" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-3">
                                        <div class="card">
                                            <img src="../Handlers/SampleImagesHandler.ashx?Id=<%# Eval("Id") %>" class="card-img-top" style="height: 250px" />
                                            <div class="card-body">
                                                <div class="d-flex justify-content-center border-bottom">
                                                    <span class="sample-name"><strong><%# Eval("Sample_SubCatagory") %></strong></span>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <span class="font-weight-bold">* የፈጀው ጨርቅ</span> <span class="font-weight-bold"><%# Eval("Drp_Wndw_Sf_TtlMeter") %>ሜ</span>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <span class="font-weight-bold">* የጨርቅ ዋጋ በ ሜትር</span> <span class="font-weight-bold">$380</span>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <span class="font-weight-bold">* ጠቅላላ ዋጋ</span> <span class="font-weight-bold"><%# Eval("TotalCost") %> ብር</span>
                                                </div>
                                                <div class="col-12 mt-1">
                                                    <a href="#" class="btn btn-sm login-button w-100" runat="server"><i class="fa fa-cat"></i>See Detail</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>

                </div>


                <%-- ///////////////////////////// Sofa End Accessories Starts ////////////////////////// --%>

                <div class="tab-content" id="divSkyAccessories">
                    <div class="tab-pane fade show active" role="tabpanel" aria-labelledby="home-tab">
                        <div class="d-flex justify-content-center p-3 bg-success mb-3 align-items-center">
                            <h6 class="font-weight-bold text-uppercase">ኣክሰሰሪዎች </h6>
                        </div>
                        <div class="row g-3 v-scrollable">
                            <asp:Repeater ID="rptrGalleryAcce" runat="server">
                                <ItemTemplate>
                            <div class="col-md-3">
                                <div class="card">
                                    <img src="../Handlers/AccessoriesPhotoHandler.ashx?Id=<%# Eval("Id") %>" alt="Accessory..<%# Eval("Id") %>" class="card-img-top" style="max-height: 250px" />
                                    <div class="card-body">
                                        <div class="d-flex justify-content-center border-bottom">
                                            <span class="sample-name"><strong><%# Eval("SpecialName_color") %></strong></span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <span class="font-weight-bold">* የኣክሰሰሪ ዓይነት： </span><span class="font-weight-bold"><%# Eval("Acce_Type") %></span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <span class="font-weight-bold">* ዋጋ በ ሜትር： </span><span class="font-weight-bold"><%# Eval("PricePerMeter_One") %></span>
                                        </div>
                                        <div class="col-12 mt-1">
                                            <a href="#" class="btn btn-sm login-button w-100" runat="server"><i class="fa fa-cat"></i>See Detail</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                        </div>
                    </div>

                </div>

                <%-- ///////////////////////////// Accessories End ////////////////////////// --%>
            </div>
        </div>
    </div>
    
</asp:Content>

