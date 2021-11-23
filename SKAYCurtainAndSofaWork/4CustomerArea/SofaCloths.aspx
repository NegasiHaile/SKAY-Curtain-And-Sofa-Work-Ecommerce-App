<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="SofaCloths.aspx.cs" Inherits="_4CustomerArea_SofaCloths" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <style>
                .Skyimagedetail {
                    height: 500px;
                    width: 100%;
                }

                .SkyimageList {
                    height: 220px;
                    width: 100%;
                }

                @media screen and (max-width: 480px) {
                    .Skyimagedetail {
                        height: 370px;
                        width: 100%;
                    }

                    .SkyimageList {
                        height: 300px;
                        width: 100%;
                    }
                }
            </style>
    <div class=" container-fluid card mainContent">

        <div class="d-flex justify-content-center border-bottom">
            <div>
                <h5 class="text-center"> ከስር ያሉ የሶፋ ጨርቆች  ናቸው። </h5>
            
                <p class="text-center"> <strong>N.B</strong> እነዝህ ጨርቆች ለፈለጉት የሶፋዎ ክፍል መሆን ይችላሉ፤ ስለዚ ጨርቅ ይምረጡና <strong>'ትዛዝ ማዘጋጃ'</strong> የምል ማፈንጠርያ በመጫን ትዛዝዎን ይመዝግቡ።  </p>
            </div>
        </div>
        <!-- Button trigger modal -->
        <div class="row">
            <asp:Repeater ID="rptrAllSofaCloths" runat="server">
                <ItemTemplate>

                    <div class="col-md-3 mt-3">
                        <div class="card shadow-lg ">
                            <a href="#"><img class="SkyimageList rounded-top" data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("IdNumber") %>" src="../Handlers/SofaClothPhotoHandler.ashx?IdNumber=<%# Eval("IdNumber") %>" alt="Sofa..<%# Eval("IdNumber") %>" />
                            </a>
                            <div class="m-2">
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* Availablity</span> <span class="font-weight-bold"><%# Eval("Width") %> ሜ</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* ዋጋ በ ሜትር</span> <span class="font-weight-bold"><%# Eval("PricePerMeter") %> ብር</span>
                                </div>
                                <div class="d-flex justify-content-between border-bottom">
                                    <span>* መዝገብ ቁጥር: <strong><%# Eval("IdNumber") %></strong></span>
                                    <span><i class="fa fa-heart" style="color: #ff6818;"></i><%# Eval("How_Many_Users") %></span>
                                </div>
                                <div class=" d-flex justify-content-between mt-1">
                                     <span id="lbtnSeeSofaSampledetail" class="btn btn-sm btn-outline-primary"  data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("IdNumber") %>">
                                        <i class="fa fa-cat"></i> ጥልቅ መረጃ</span>
                                    <a href="SofaClothDetail_custom.aspx?IdNumber=<%# Eval("IdNumber") %>" class="btn btn-sm btn-outline-success"><i class="fa fa-pen-alt"></i> ትዛዝ ማዘጋጃ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal -->
                   <div class="modal fade" id="exampleModal<%# Eval("IdNumber") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <span class="modal-title" id="idNumber">ቁጥር: <%# Eval("IdNumber") %></span>
                                    <button type="button" class="btn-close btn-link" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div id="carouselExampleIndicators<%# Eval("IdNumber") %>" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-item active">
                                        <img class="Skyimagedetail" data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("IdNumber") %>" src="../Handlers/SofaClothPhotoHandler.ashx?IdNumber=<%# Eval("IdNumber") %>" alt="Curtain..<%# Eval("IdNumber") %>" />
                                        <div class="m-2">

                                            <div class="d-flex justify-content-center">
                                                <span class="font-weight-bold"><strong>* መዝገብ ቁጥር : <%# Eval("IdNumber") %> </strong></span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* ልዩ ስም/ቀለም </span><span class="font-weight-bold"><%# Eval("Name_Color") %></span>
                                            </div>

                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* የጨርቁ ይዘት </span><span class="font-weight-bold"><%# Eval("SubCatagory").ToString() == "Inner And Outer"? "ዋና ጨርቅ ከነገበሩ":Eval("SubCatagory")  %></span>
                                            </div>
                                            <hr />
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* ኣቅርቦት（Availablity）</span> <span class="font-weight-bold"><%# Eval("Width") %> ሜ</span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* ጨርቅ ዋጋ </span><span class="font-weight-bold"><%# Eval("PricePerMeter") %> ETB</span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="font-weight-bold">* ስንት ተጠቅመውበታል <i style="color: #ff6818;" class="fa fa-heart"></i> : </span><span class="font-weight-bold"> <%# Eval("How_Many_Users") %> ሰዎች</span>
                                            </div>
                                            <hr />
                                            <div class="d-flex justify-content-center">
                                                <span class="font-weight-bold"><%# Eval("Description") %> </span>
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
</asp:Content>

