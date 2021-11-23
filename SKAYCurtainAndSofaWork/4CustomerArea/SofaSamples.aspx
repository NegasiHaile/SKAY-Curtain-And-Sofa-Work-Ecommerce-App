<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="SofaSamples.aspx.cs" Inherits="_4CustomerArea_SofaSamples" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" container-fluid mainContent">
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
            <asp:Repeater ID="rptrAllSofaSamples" runat="server">
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
                                     <span class="font-weight-bold">* Total Meter This Cost: </span><span class="font-weight-bold"><%# Eval("Drp_Wndw_Sf_TtlMeter") %> ሜ</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* Total Cost: </span><span class="font-weight-bold"><%# Eval("TotalCost") %> ብር</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* Material Id: </span><span class="font-weight-bold"><%# Eval("IdsOfTools") %></span>
                                </div>
                                <%--<div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* Prdc-Date: </span><span class="font-weight-bold"><%# Eval("Production_Date") %></span>
                                </div>--%>
                                <div class="d-flex justify-content-between border-bottom">
                                    <span>* ቁጥር: <strong><%# Eval("Id") %></strong></span>
                                </div>
                                <div class=" d-flex justify-content-between mt-1">
                                     <span id="lbtnSeeSofaSampledetail" class="btn btn-sm btn-outline-primary"  data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("Id") %>">
                                        <i class="fa fa-list"></i> Detail</span>
                                    <asp:LinkButton id="lbtnSofaMyModel" runat="server" CssClass="btn btn-sm btn-outline-success" CommandArgument='<%# Eval("Id") %>' OnClick="lbtnSofaMyModel_Click"><i class="fa fa-heart"></i> My Model</asp:LinkButton>
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

           <%-- <div class="col-md-3 mt-3">
                        <div class=" border shadow-lg">
                            <img class="SkyimageList" data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("Id") %>" src="../Handlers/SampleImagesHandler.ashx?Id=<%# Eval("Id") %>" alt="Sofa..<%# Eval("Id") %>" />
                            <div class="m-2">
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* Total Meter This Cost: </span><span class="font-weight-bold"><%# Eval("Drp_Wndw_Sf_TtlMeter") %> ሜ</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* Total Cost: </span><span class="font-weight-bold"><%# Eval("TotalCost") %> ብር</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* Material Id: </span><span class="font-weight-bold"><%# Eval("IdsOfTools") %> ብር</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">* Production Date: </span><span class="font-weight-bold"><%# Eval("Production_Date") %> ብር</span>
                                </div>
                                <div class="d-flex justify-content-between border-bottom">
                                    <span>* ቁጥር: <strong><%# Eval("Id") %></strong></span>
                                </div>
                                <div class=" d-flex justify-content-center mt-1">
                                    <span id="lbtnSeeSofaClothdetail" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%# Eval("Id") %>">
                                        <i class="fa fa-list"></i>See Detail</span>
                                </div>

                            </div>
                        </div>
                        </div>--%>

        </div>

    </div>
</asp:Content>

