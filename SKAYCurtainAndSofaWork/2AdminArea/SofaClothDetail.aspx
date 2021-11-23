<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="SofaClothDetail.aspx.cs" Inherits="_2AdminArea_SofaDetailDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style>
                .Skyimagedetail {
                    height: 575px;
                    width: 100%;
                }

                .SkyimageList {
                    height: 300px;
                    width: 100%;
                }

                @media screen and (max-width: 480px) {
                    .Skyimagedetail {
                        height: 370px;
                        width: 100%;
                    }

                    .SkyimageList {
                        height: 350px;
                        width: 100%;
                    }
                }
            </style>

    <div class="container mainContent">
       
        <div class="d-flex justify-content-center">
            <div class="col-sm-10 mb-3">
                <div class="mb-0">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                        <span id="spnAlertSuccess" runat="server"><i class="fa fa-check-circle"></i> Item Edited Successfuly.</span>
                        <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>

                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                        <span id="spnAlertError" runat="server"><i class="fa fa-times-circle"></i> Somthing went wrong! Try again.</span>
                        <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
                <div class="card shadow-lg ">
                    <div class="row">
                        <div class="col-md-6">
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
                                            <h6>ቁጥር: <%= SofaClothIdNumber %> </h6>
                                        </div>
                                        <%--<img src="../Handlers/SofaClothPhotoHandler.ashx?IdNumber=1" height="450" width="350" alt="Sofa Cloth Photo" />--%>
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

                        <div class="col-md-6">
                            <div class="row justify-content-center m-1">
                                <div class="col-md-11 divToggleContent">
                                <h5 class="text-center"><span id="spnClothType" runat="server"><%= ClothCatagory %></span> ጨርቅ</h5>
                                <hr />
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> ኣቅርቦት </p>
                                    <p runat="server" id="pAvlblWidth">100 </p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> ቁመት Standard Height</p>
                                    <p runat="server" id="pAvlblStandardHeight">2.80 ሜ</p>
                                </div>
                                <hr />
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> የጨርቅ ዋጋ ለ1 ሜትር</p>
                                    <p runat="server" id="pSofaClothPricePerMeter">380</p>
                                </div>
                                <div class="d-none justify-content-between" id="divDrapeInnerPricePerMeterInfo">
                                    <p><i class="fa fa-check"></i> የገበር ዋጋ ለ1 ሜትር</p>
                                    <p runat="server" id="pDrapeGeberPricePerMeter">380</p>
                                </div>
                                <div class="d-none justify-content-between" id="divDrapeTailorPerMeter">
                                    <p><i class="fa fa-check"></i> መስፈያ ዋጋ ለ1 ሜትር </p>
                                    <p runat="server" id="pDrapeTailorPricePerMeter">100</p>
                                </div>

                                <hr id="hrsofaprice" class="d-none" />
                                <div class="d-none justify-content-between" id="divtailorOfSofa">
                                    <p><i class="fa fa-check"></i> ጠቅላላ መስፈያ ዋጋ </p>
                                    <p runat="server" id="pSofaTailor">100</p>
                                </div>

                                <hr />
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> ልዩ ስም/ቀለም</p>
                                    <p runat="server" id="pSofaName_Color">No Name</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> የጨርቁ ዓይነት Catagory </p>
                                    <p runat="server" id="pClothCatagory">Sofa/Couch</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> ጨርቁ ምን ልያሰራ ይችላል </p>
                                    <p runat="server" id="pClothUsesFor"> Sofa and Curtain</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p><i class="fa fa-check"></i> ስንት ሰዎች  <i class="fa fa-heart"></i> ወደውታል</p>
                                    <p runat="server" id="pHow_Many_Users">100 </p>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <p runat="server" id="pSofaClothDescription" style="max-height: 48px;">Description</p>
                                </div>
                            </div>

                                <div class="col-md-11 ">
                                    <div class="d-flex justify-content-between border-bottom p-1">
                                        <span id="lbtnToggleButton" class="btn btn-outline-success" ><i class="fa fa-pen"></i> Edit</span>
                                        <span class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#DeletingSofaCloth" data-bs-whatever="@getbootstrap"><i class="fa fa-trash-alt"></i> Delete</span>
                                        </div>
                                </div>
                                
                                <div class="modal fade" id="DeletingSofaCloth" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header bg-danger">
                                                <p class="text-center text-light">
                                                    <i class="fa fa-exclamation-triangle"></i>You are about deleting <%= ClothCatagory %> cloth of ID <%= SofaClothIdNumber %>
                                                from this site completly, Are you sure about this? </p>
                                            </div>
                                            <div class="modal-body">
                                                <p class="text-muted">
                                                    <strong><i class="fa fa-cat"></i>:-</strong> Deleting a cloth from the site may causes Image undisplayblity in some pages like in order detail. Eg:- if someone has an order of this item and yoou delete this you and your employees are not able to see
                                                        what the customer has. So i highly recommend you not to delete this but to <a href="SofaClothDetail.aspx?IdNumber=<%= SofaClothIdNumber %>" title="edit cloth detail"> Edit</a> it.
                                                </p>
                                            </div>
                                            <div class=" modal-footer bg-danger">
                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-sm btn-danger" runat="server" OnClick="lbtnDeleteSofaItem_Click"><i class="fa fa-check"></i> YES</asp:LinkButton>
                                                <button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal"><i class="fa fa-times"></i> NO</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <div class="col-md-11 sky-d-none divToggleContent pt-2">
                                <div class="d-flex justify-content-center">
                                    <div class="row" >
                                        <div class="row col-12 pb-1">
                                            <div class="col-6">
                                                    <label class="text-end">ኣቅርቦት</label>
                                                <div class="input-group">
                                                    <asp:TextBox ID="tbSofaWidth" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" MaxLength="5" required="required" placeholder="ጎን"></asp:TextBox>
                                                    <div class="input-group-text">ሜ</div>
                                                </div>
                                            </div>
                                            <div class="col-6 float-end pb-1">
                                                <label class="text-end">የጨርቁ ቁመት</label>
                                                <div class="input-group">
                                                    <asp:TextBox ID="tbSofaHeight" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" MaxLength="3" required="required" placeholder="ቁመት"></asp:TextBox>
                                                    <div class="input-group-text">ሜ</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12 pb-1">
                                            <label class="text-end">የጨርቁ ስም/ቀለም</label>
                                            <asp:TextBox ID="tbSofaName_Color" runat="server" class="form-control" placeholder="የጨርቅ/የቀለም ዓይነት"></asp:TextBox>
                                        </div>

                                        <div class="col-12">
                                            <label class="text-end">ዋጋ ለ1 ሜ</label>
                                            <div class="input-group">
                                                <asp:TextBox ID="tbSofaPricePerMeter" runat="server" class="form-control" MaxLength="5" onkeypress="return onlyNumberKey(event)" required="required" placeholder="ዋጋ ለ 1 ሜትር"></asp:TextBox>
                                                <div class="input-group-text">ETB</div>
                                            </div>
                                        </div>
                                        <div class="col-12" id="divDrapeInnerPricePerMeter">
                                            <label class="text-end">ዋጋ ለ1 ሜ ገበር</label>
                                            <div class="input-group">
                                                <asp:TextBox ID="tbDrapeInnerPricePerMeter" runat="server" class="form-control" MaxLength="5" onkeypress="return onlyNumberKey(event)" required="required" placeholder="ዋጋ ለ 1 ሜትር"></asp:TextBox>
                                                <div class="input-group-text">ETB</div>
                                            </div>
                                        </div>
                                        <div class="col-12" id="divddlClotheUsesFor">
                                            <label>ጨርቁ ምን ልያሰራ ይችላል？</label>
                                            <div class="input-group">
                                                <asp:DropDownList ID="ddlClotheUsesFor" CssClass="form-select form-control-sm" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                                    <asp:ListItem Selected="true" disabled> </asp:ListItem>
                                                    <asp:ListItem>Inner And Outer</asp:ListItem>
                                                    <asp:ListItem>Outer Only</asp:ListItem>
                                                    <asp:ListItem>Inner Only</asp:ListItem>
                                                    <asp:ListItem>Sofa And Curtain</asp:ListItem>
                                                    <asp:ListItem>Sofa Only</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <label for="tbSofaDescription">ስለ ጨርቁ ማብራርያ (< 100 ፍደሎች)</label>
                                            <textarea ID="tbSofaDescription" runat="server" class="form-control"  MaxLength="100" Rows="2"></textarea>
                                        </div>
                                        <div class="col-12">
                                            <label class="text-end">የጨርቁ ፎቶ</label>
                                            <asp:FileUpload ID="fupldSofaClothImage" runat="server" CssClass="form-control" />
                                        </div>
                                    
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center mt-2">
                                    <asp:Button ID="lbtnSaveSofaChange" runat="server" CssClass="btn btn-outline-primary" OnClick="lbtnSaveSofaChange_Click" Text="Save Change"/>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>

        <script type="text/javascript">
        window.onload = function () {

            var ProductCatgory = '<%= ClothCatagory %>';

            if (ProductCatgory == "Sofa") {
                document.getElementById('divDrapeInnerPricePerMeter').style.display = 'none';

                document.getElementById('hrsofaprice').className = 'sky-d-normal';
                document.getElementById('divtailorOfSofa').className = 'd-flex justify-content-between';

            }
            if (ProductCatgory == "Curtain") {
                //document.getElementById('divddlClotheUsesFor').style.display = 'none';
                document.getElementById('divDrapeTailorPerMeter').className = 'd-flex justify-content-between';
                document.getElementById('divDrapeInnerPricePerMeterInfo').className = 'd-flex justify-content-between';
            }
        };

    </script>
</asp:Content>

