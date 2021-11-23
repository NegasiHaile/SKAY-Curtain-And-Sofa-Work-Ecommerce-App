<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="DrapeSamples.aspx.cs" Inherits="_4CustomerArea_DrapeSamples" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" container mainContent">
         <style>
                .Skyimagedetail {
                    height: 550px;
                    width: 100%;
                }

                .SkyimageList {
                    height: 250px;
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
        <div class="row">
            <asp:Repeater ID="rptrAllDrapeSamples" runat="server">
                <ItemTemplate>

                    <div class="col-md-3 mt-3">
                        <div class="border shadow-lg">
                            <a href="#"><img class="SkyimageList" data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("Id") %>" src="../Handlers/SampleImagesHandler.ashx?Id=<%# Eval("Id") %>" alt="Sofa..<%# Eval("Id") %>" />
                            </a>
                            <div class="m-2">
                                <div class="d-flex justify-content-center border-bottom">
                                                    <span><strong><%# Eval("Sample_SubCatagory") %></strong></span>
                                                </div>
                                <div class="d-flex justify-content-between">
                                     <span class="font-weight-bold">* Window Width: </span><span><%# Eval("Drp_Wndw_Sf_TtlMeter") %> ሜ</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                     <span class="font-weight-bold">* Shirinked By: </span><span><%# Eval("ShirinkPer") %> Per ሜ</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* Total Cost: </span><span><%# Eval("TotalCost") %> ብር</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span>* ቁጥር: <strong><%# Eval("Id") %></strong></span>
                                    <span class="font-weight-bold">* Material Id: <strong> <%# Eval("IdsOfTools") %></strong> </span>
                                </div>
                                <div class=" d-flex justify-content-between mt-1">
                                     <span id="lbtnSeeSofaSampledetail" class="btn btn-sm btn-outline-primary"  data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("Id") %>">
                                        <i class="fa fa-list"></i> Detail</span>
                                    <asp:LinkButton id="lbtnCurtainMyModal" runat="server" CssClass="btn btn-sm btn-outline-success" CommandArgument='<%# Eval("Id") %>' OnClick="lbtnCurtainMyModal_Click"><i class="fa fa-heart"></i> My Model</asp:LinkButton>
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
                                        <img src="../Handlers/SampleImagesHandler.ashx?Id=<%# Eval("Id") %>" class="Skyimagedetail" />
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

