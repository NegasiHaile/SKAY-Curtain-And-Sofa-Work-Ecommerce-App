<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="DrapeClothRegistration.aspx.cs" Inherits="_2AdminArea_DrapeCloth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mainContent">
        <div class="row justify-content-center">
            <div class="col-md-11">
                <div class="d-flex justify-content-between p-3 bg-light mb-1 rounded shadow-lg">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-images"></i>የመጋረጃ ጨርቆች </span>
                    <div>
                        <span id="lbtnToggleButton" onclick="AddAndListToggle();"><span class="btn btn-sm btn-outline-secondary m-0"><i class='fa fa-plus'></i>ኣድስ ይመዝግቡ </span></span>
                    </div>
                </div>
            </div>

              <div class="col-md-11" id="divAlertContainer" runat="server">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnAlertSuccess" runat="server"><i class="fa fa-check"></i>Item Added Successfuly.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnAlertError" runat="server"><i class="fa fa-times"></i>Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>

            <div class="col-md-11 mb-2 sky-d-none divToggleContent">
                <div class="card rounded shadow-lg">
                    <header class="card-header cont-bg">
                        <%--<a href="LogIn.aspx" class="btn btn-outline-primary"><i class="fas fa-user"></i>| Login</a>--%>
                        <h6 class="mt-2 text-center skywelcome"><i class="fas fa-images"></i>የመጋረጃ ጨርቅ እዝህ ይመዝግቡ</h6>
                    </header>
                    <article class="card-body card-body-responsve">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-sm-3 mb-2" id="divddlClotheUsesFor">
                                    <label>የጨርቁ ዓይነት</label>
                                    <div class="input-group">
                                        <asp:DropDownList ID="ddlCurtainContains" CssClass="form-select form-control-sm" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require" onclick="HideShowCrtnRgstb();">
                                            <asp:ListItem Selected="true" disabled> </asp:ListItem>
                                                    <asp:ListItem>Inner And Outer</asp:ListItem>
                                                    <asp:ListItem>Outer Only</asp:ListItem>
                                                    <asp:ListItem>Inner Only</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-sm-3 mb-2">
                                    <label>የመጋረጃ መዝገብ ቁጥር </label>
                                    <asp:TextBox ID="tbDrapeIdNumber" runat="server" class="form-control"  MaxLength="4" required="required"></asp:TextBox>
                                </div>
                                <div class="col-sm-3 mb-2">
                                    <label>የመጋረጃ ጠቅላላ ስፋት</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="tbDrapeWidth" runat="server" class="form-control"  MaxLength="5" onkeypress="return onlyNumberKey(event)" required="required"></asp:TextBox>
                                        <div class="input-group-text">ሜ</div>
                                    </div>
                                </div>
                                <div class="col-sm-3 mb-2">
                                    <label>የጨርቁ ቁመት</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="tbDrapeHeight" runat="server" class="form-control"  MaxLength="3" onkeypress="return onlyNumberKey(event)" required="required"></asp:TextBox>
                                        <div class="input-group-text">ሜ</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4 mb-2">
                                    <label>የጨርቅ/የቀለም ዓይነት</label>
                                    <asp:TextBox ID="tbDapeClothName_Color" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-sm-4 mb-2" id="divPriceDrapeOuterCloth">
                                    <label>ዋጋ 1 ሜትር ጨርቅ</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="tbPriceDrapeOuterCloth" runat="server" class="form-control"  MaxLength="5" onkeypress="return onlyNumberKey(event)" Text="0"></asp:TextBox>
                                        <div class="input-group-text">ETB</div>
                                    </div>
                                </div>
                                <div class="col-sm-4 mb-2" id="divPeiceDrapeInnerCloth">
                                    <label>ዋጋ 1 ሜትር ገበር</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="tbPeiceDrapeInnerCloth" runat="server" class="form-control"  MaxLength="5" onkeypress="return onlyNumberKey(event)" Text="0"></asp:TextBox>
                                        <div class="input-group-text">ETB</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 mb-2">
                                    <label>የጨርቁ ፎቶ <span id="spnKenegeberu">ከነገበሩ</span></label>
                                    <asp:FileUpload ID="fupldDrapeCloth" runat="server" class="form-control" required="required" />
                                </div>
                                <div class="col-sm-6 mb-2">
                                    <label for="tbDrapeClothDescription">ስለ ጨርቁ ማብራርያ (< 100 ፍደሎች)</label>
                                    <textarea id="tbDrapeClothDescription" runat="server" class="form-control" rows="2" maxlength="100"></textarea>
                                </div>
                            </div>

                            <div class="justify-content-center mt-3">
                                <h6 class="text-center">
                                    <asp:Button ID="btnSaveDrapeClothDetail" runat="server" CssClass="btn btn-sm btn-outline-primary mb-2" OnClick="btnSaveDrapeClothDetail_Click" Text="ጨርቅ ይመዝገብ"/> 
                                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-sm btn-outline-danger mb-2"><i class="fa fa-remove-format"></i> የፃፉት ያጥፉ </asp:LinkButton></h6>
                            </div>

                        </div>

                    </article>
                    <!-- card-body end .// -->

                </div>
            <!-- card.// -->
        </div>

        <div class="col-md-11 mb-3 divToggleContent">
            <div class="card rounded shadow-lg  table-responsive p-2">
                <table id="example" class="table table-hover table-sm" style="width: 100%;"
                    data-show-refresh="true"
                    data-show-fullscreen="true">
                    <thead>
                        <tr>
                            <th>ፎቶ</th>
                            <th>ቁጥር</th>
                            <th>ቀረብ：ጎን</th>
                            <th>ቁመት</th>
                            <th>ጨርቅ ዋጋ</th>
                            <th>ገበር ዋጋ</th>
                            <th>የጨር ይዘት</th>
                            <th>ማጥፋት</th>
                            <th>ጥልቅ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptrDrapClothes" runat="server">
                            <ItemTemplate>
                                <tr class="align-text-bottom">
                                    <td>
                                        <img width="40" height="40" class="rounded" src="../Handlers/SofaClothPhotoHandler.ashx?IdNumber=<%# Eval("IdNumber") %>" />
                                    </td>
                                    <td><%# Eval("IdNumber") %></td>
                                    <td><%# Eval("Width") %> ሜ</td>
                                    <td><%# Eval("Height") %> ሜ</td>
                                    <td><%# Eval("PricePerMeter") %> ETB</td>
                                    <td><%# Eval("GeberPricePerMeter") %></td>
                                    <td><%# Eval("SubCatagory") %></td>
                                    <td>
                                        <span class="btn btn-sm btn-outline-danger" title='Deleting sofa cloth' data-bs-toggle="modal" data-bs-target="#DeletingCurtainCloth<%# Eval("IdNumber") %>" data-bs-whatever="@getbootstrap">
                                                <i class="fa fa-trash-alt"></i></span></td>
                                    </td>
                                    <td><a class="btn btn-sm btn-outline-primary" href="SofaClothDetail.aspx?IdNumber=<%# Eval("IdNumber") %>" title="Item Detail"><i class="fa fa-eye"></i></a></td>
                                
                                    <div class="modal fade" id="DeletingCurtainCloth<%# Eval("IdNumber") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <div class="modal-header bg-danger">
                                                    <p class="text-center text-light"><i class="fa fa-exclamation-triangle"></i>You are about deleting Curtain cloth of ID <%# Eval("IdNumber") %> from this site completly, Are you sure about this? </p>
                                                </div>
                                                <div class="modal-body">
                                                    <p class="text-muted">
                                                        <strong><i class="fa fa-cat"></i>:-</strong> Deleting a cloth from the site may causes Image undisplayblity in some pages like in order detail. Eg:- if someone has an order of this item and yoou delete this you and your employees are not able to see
                                                        what the customer has. So i highly recommend you not to delete this but to <a href="SofaClothDetail.aspx?IdNumber=<%# Eval("IdNumber") %>" title="edit cloth detail">Edit</a> it.
                                                    </p>
                                                </div>
                                                <div class=" modal-footer bg-danger">
                                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-sm btn-danger" runat="server" CommandArgument='<%# Eval("IdNumber") %>' OnClick="btnDeleteItemAlt_Click"><i class="fa fa-check"></i> YES</asp:LinkButton>
                                                    <button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal"><i class="fa fa-times"></i> NO</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>


                    </tbody>
                    <tfoot>
                        <tr>
                            <th>image</th>
                            <th>Number</th>
                            <th>Width</th>
                            <th>Height</th>
                            <th>Outer Price (Meter)</th>
                            <th>Inner Price (Meter)</th>
                            <th>Uses For</th>
                            <th>Delete</th>
                            <th>Detail</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

    </div>
    </div>
    <script type="text/javascript">
        window.onload = function () {
            HideShowCrtnRgstb();
        }
        function HideShowCrtnRgstb() {

            if (document.getElementById('<%= ddlCurtainContains.ClientID %>').value == "Outer Only") {
                document.getElementById("divPeiceDrapeInnerCloth").style.display = 'none';
                document.getElementById("divPriceDrapeOuterCloth").style.display = 'block';
            }
            if (document.getElementById('<%= ddlCurtainContains.ClientID %>').value == "Inner Only") {
                document.getElementById("divPriceDrapeOuterCloth").style.display = 'none';
                document.getElementById("divPeiceDrapeInnerCloth").style.display = 'block';
            }
            if (document.getElementById('<%= ddlCurtainContains.ClientID %>').value == "Inner And Outer") {
                document.getElementById("divPriceDrapeOuterCloth").style.display = 'block';
                document.getElementById("divPeiceDrapeInnerCloth").style.display = 'block';
            }
        }

    </script>
</asp:Content>

