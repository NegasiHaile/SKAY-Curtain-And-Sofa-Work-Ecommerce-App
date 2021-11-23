<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="SampleDetail.aspx.cs" Inherits="_2AdminArea_SampleDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <style>
                .Skyimagedetail {
                    height: 500px;
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
            <div class="col-sm-10">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnAlertSuccess" runat="server"><i class="fa fa-check-circle"></i> ማስተካከያው በተሳካ ሁኔታ ተከናውነዋል።</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnAlertError" runat="server"><i class="fa fa-times-circle"></i> ማስተካከያው ኣልተሳካም፤ እባክዎ ደግመው ይሞክሩ.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center">
            <div class="col-sm-10 mb-3">
                <div class="card shadow-lg ">
                    <div class="card-header">
                        <h6>መለያ ቁጥር: <%= SampleId %> </h6>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <img src="../Handlers/SampleImagesHandler.ashx?Id=<%= SampleId %>" class="Skyimagedetail" alt="<%= SampleId %> <%= SampleCatagory %>  Sample..." />
                        </div>

                        <div class="col-md-6">
                            <div class="col-sm-11 m-2">
                                <h5 class="text-center">የ <span id="spnClothType" runat="server"><%= SampleCatagory %></span> ስራ</h5>
                                <hr />
                                <div class="d-flex justify-content-between pb-2">
                                    <span><i class="fa fa-check"></i> የስራው ዓይነት </span>
                                    <span runat="server" id="spnSampleCatagory"> ሶፋ </span>
                                </div>
                                <div id="divInDrapeOnly">
                                    <div class="d-flex justify-content-between pb-2">
                                        <span><i class="fa fa-check"></i> የመስኮት ስፋት </span>
                                        <span runat="server" id="spnWindowWidth">3 Meter </span>
                                    </div>
                                    <div class="d-flex justify-content-between pb-2">
                                        <span><i class="fa fa-check"></i> በስንት ተሸበሸበ？ </span>
                                        <span runat="server" id="spnShirinkBy">  2.5  </span>
                                    </div>
                                    <div class="d-flex justify-content-between pb-2">
                                        <span><i class="fa fa-check"></i> የመጋረጃ ዓይነት </span>
                                        <span runat="server" id="spnCurtainCatagory"> Full Curtain</span>
                                    </div>
                                </div>
                                <div id="divTatolMeterItcost">
                                    
                                <div class="d-flex justify-content-between pb-2">
                                    <span><i class="fa fa-check"></i> የሶፋው ዓይነት </span>
                                    <span runat="server" id="spnSofaType"> L_SHAPE </span>
                                </div>
                                <div class="d-flex justify-content-between pb-2" >
                                    <span><i class="fa fa-check"></i> የፈጀው ጠቅላላ ሜትር </span>
                                    <span runat="server" id="spnTatolMeterItcost">13 </span>
                                </div>
                                    </div>
                                <hr />
                                <div class="d-flex justify-content-between">
                                    <span><i class="fa fa-check"></i> ጠቅላላ ዋጋ </span>
                                    <strong><span runat="server" id="spnTotalCost">100 </span></strong>
                                </div>
                                <hr />
                                <div class="d-flex justify-content-between pb-2">
                                    <span><i class="fa fa-check"></i> የጨርቅ(MATERIAL) ቁጥር </span>
                                    <span><span runat="server" id="spnIdOfClothes">s5, s23</span></span>
                                </div>
                                <div class="d-flex justify-content-between pb-2">
                                    <span><i class="fa fa-check"></i> የተሰራበት ቀን </span>
                                    <span><span runat="server" id="spnSampleDateOfProduction"> 1/03/2021 </span></span>
                                </div>
                                <hr />
                            </div>

                            <div class="col-md-11 m-1">
                                
                                <div class="d-flex justify-content-between">
                                    <span id="lbtnToggleButton" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#sofaSampleRegistration" data-bs-whatever="@getbootstrap"><i class="fa fa-edit"></i> Edit</span>
                                    <span class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#DeletingSample" data-bs-whatever="@getbootstrap"><i class="fa fa-trash-alt"></i> Delete</span>
                                </div>
                            </div>
                             <div class="modal fade" id="DeletingSample" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header bg-danger">
                                                <p class="text-center text-light">
                                                    <i class="fa fa-exclamation-triangle"></i>You are about deleting <%= SampleCatagory %> sample of ID <%= SampleId %>
                                                from this site completly, Are you sure about this? </p>
                                            </div>
                                            <div class="modal-body">
                                                <p class="text-muted">
                                                    <strong><i class="fa fa-cat"></i>:-</strong> Instead if deleting the sample it's recommendable to <a href="SampleDetail.aspx?Id=<%= SampleId %>" title="edit cloth detail">Edit</a> it.
                                                </p>
                                            </div>
                                            <div class=" modal-footer bg-danger">
                                                <asp:LinkButton ID="lbtnDeleteSampleItem" CssClass="btn btn-sm btn-danger" runat="server" OnClick="lbtnDeleteSampleItem_Click"><i class="fa fa-check"></i> YES</asp:LinkButton>
                                                <button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal"><i class="fa fa-times"></i> NO</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <div class="modal fade" id="sofaSampleRegistration" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h6 class="modal-title" id="exampleModalLabel"><i class="fa fa-couch"></i> ቁጥር <span class="text-decoration-underline"><%= SampleId %></span> 
                                        የ <span class="text-decoration-underline"><%= SampleCatagory %></span> ስራ ማስተካከያ ላይ ኖት።</h6>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row g-2">
                                            <div class="col-md-12">
                                                <label for="ddlSampleType">የስራው ዓይነት </label>
                                                <asp:DropDownList ID="ddlSampleType" runat="server" CssClass="form-select form-control" required="required">
                                                    <asp:ListItem>Sofa</asp:ListItem>
                                                    <asp:ListItem>Curtain</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                                <div class="col-md-12">
                                                <label for="tbToolsIdNumbers">ልዩ ስም</label>
                                                <asp:TextBox ID="tbSampleSpecialName" runat="server" class="form-control" required="required"></asp:TextBox>
                                            </div>
                                            <%--<div class="col-md-12" id="divSubCatagory">
                                                <label for="ddlSubCatagory">የመጋረጃው ዓይነት </label>
                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select form-control" required="required">
                                                    <asp:ListItem>መጋረጃ ከነገበሩ</asp:ListItem>
                                                    <asp:ListItem>ያለ ገበር</asp:ListItem>
                                                    <asp:ListItem>ገበር ብቻ</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>--%>
                                            <div class="col-md-12">
                                                <label for="tbToolsIdNumbers">የጨርቅ(Material) መዝገብ ቁጥር</label>
                                                <asp:TextBox ID="tbMaterialIdNumbers" runat="server" class="form-control" required="required"></asp:TextBox>
                                            </div>
                                            <div class="col-md-12">
                                                <label id="lblSofaTotalMete">ስንት ሜትር ጨርቅ ፈጀ？</label>
                                                <label id="lblWindowWidth" for="tbTotalMeter">ለስንት ሜ መስኮት ተሰራ?</label>
                                                <asp:TextBox ID="tbTotalMeter" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" required="required"></asp:TextBox>
                                            </div>
                                            <div class="col-md-12" id="divDrapeShirrinkBy">
                                                <label for="tbTotalMeter">በስንት ተሸበሸበ?</label>
                                                <asp:DropDownList ID="ddlShirrinkby" runat="server" CssClass="form-control" onkeypress="return onlyNumberKey(event)" required="required">
                                                    <asp:ListItem disabled="disabled">1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>2.5</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-12">
                                                <label for="tbTotalCost" class="form-label">ጠቅላላ ዋጋ</label>
                                                <asp:TextBox ID="tbTotalCost" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" required="required"></asp:TextBox>
                                            </div>
                                            <div class="col-md-12">
                                                <label for="fupldSampleImage">የስራው ፎቶ</label>
                                                <asp:FileUpload ID="fupldSampleImage" runat="server" class="form-control" />
                                            </div>
                                            <hr />
                                            <div class=" d-flex justify-content-center border-bottom pb-1">
                                                <asp:Button ID="btnSofaSaveSample" runat="server" CssClass="btn btn-primary" Text="Save Change" OnClick="btnSofaSaveSample_Click" />
                                            </div>
                                        </div>
                                        </div>
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

            var ProductCatgory = '<%= SampleCatagory %>';

            if (ProductCatgory == "Sofa") {
                document.getElementById('divDrapeShirrinkBy').style.display = 'none';
                document.getElementById('lblWindowWidth').style.display = 'none';
                document.getElementById('divInDrapeOnly').style.display = 'none';

            }
            if (ProductCatgory == "Curtain") {
                document.getElementById('lblSofaTotalMete').style.display = 'none';
                document.getElementById('divTatolMeterItcost').style.display = 'none';
                //document.getElementById('divDrapeInnerPricePerMeterInfo').className = 'd-flex justify-content-between';
            }
        };

    </script>
</asp:Content>

