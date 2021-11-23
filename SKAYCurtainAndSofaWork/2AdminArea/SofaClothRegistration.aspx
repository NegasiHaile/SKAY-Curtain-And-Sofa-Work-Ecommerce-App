<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="SofaClothRegistration.aspx.cs" Inherits="_2AdminArea_ProductRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
       
    <div class="container mainContent">
        <div class="row justify-content-center">

            <div class="col-md-11">
                <div class="d-flex justify-content-between p-3 bg-white mb-1 rounded shadow-lg">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-couch"></i> የተለያዩ የሶፋ ጨርቆች </span>
                    <div>
                        <span id="lbtnToggleButton"  onclick="AddAndListToggle();"><span class="btn btn-sm btn-outline-secondary m-0"><i class='fa fa-plus'></i> ኣድስ ይመዝግቡ </span></span>
                    </div>
                </div>
            </div>


            <div class="col-md-11" id="divAlertContainer" runat="server">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnAlertSuccess" runat="server"><i class="fa fa-check"></i> Item Added Successfuly.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnAlertError" runat="server"><i class="fa fa-times"></i> Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>


            <div class="col-md-11 mb-2 sky-d-none divToggleContent">
                <div class="card rounded shadow-lg">
                    <header class="card-header cont-bg">
                        <h6 class="mt-2 text-center skywelcome"><i class="fas fa-couch"></i> የሶፋ ጨርቅ እዝህ ይመዝግቡ</h6>
                    </header>
                    <article class="card-body card-body-responsve">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-sm-4 mb-2">
                                        <label>የጨርቁ መዝገብ ቁጥር </label>
                                    <asp:TextBox ID="tbSofaIdNumber" runat="server" maxlength="4"  class="form-control" required="required"></asp:TextBox>
                                </div>
                                <div class="col-sm-4 mb-2">
                                        <label>የጨርቁ ጠቅላላ ስፋት (available width)</label>
                                    <div class="input-group">
                                     <asp:TextBox ID="tbSofaWidth" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" MaxLength="5" required="required"></asp:TextBox>
                                        <div class="input-group-text"> ሜ</div>
                                    </div>
                                </div>
                                <div class="col-sm-4 mb-2">
                                        <label>የጨርቁ ቁመት (Standared Height)</label>
                                    <div class="input-group">
                                    <asp:TextBox ID="tbSofaHeight" runat="server" onkeypress="return onlyNumberKey(event)" maxlength="3" class="form-control" required="required"></asp:TextBox>
                                        <div class="input-group-text"> ሜ</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4 mb-2">
                                    <label>የጨርቁ ልዩ ስም/ቀለም</label>
                                    <div class="input-group">
                                    <asp:TextBox ID="tbSofaName_Color" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="col-sm-4 mb-2">
                                    <label>የጨርቁ ዋጋ ለ1 ሜ</label>
                                    <div class="input-group">
                                    <asp:TextBox ID="tbSofaPricePerMeter" runat="server" onkeypress="return onlyNumberKey(event)" maxlength="5" class="form-control" required="require"></asp:TextBox>
                                        <div class="input-group-text">ETB </div>
                                </div>
                                </div>
                                <div class="col-sm-4 mb-2">
                                    <label>ጨርቁ ምን ልያሰራ ይችላል？</label>
                                    <div class="input-group">
                                        <asp:DropDownList ID="ddlClotheUsesFor" CssClass="form-select form-control-sm" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                            <asp:ListItem Selected="true" disabled> </asp:ListItem>
                                            <asp:ListItem>Sofa And Curtain</asp:ListItem>
                                            <asp:ListItem>Sofa Only</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="row">
                                <div class="col-sm-6 mb-2">
                                    <label>የጨርቁ ፎቶ</label>
                                    <asp:FileUpload ID="fupldSofaPhoto" runat="server" class="form-control" required="required" />
                                </div>
                                <div class="col-sm-6 mb-2">
                                    <label for="tbSofaDescription">ስለ ጨርቁ ማብራርያ (< 100 ፍደሎች)</label>
                                    <textarea ID="tbSofaDescription" runat="server" class="form-control"  MaxLength="100" Rows="2"></textarea>
                                </div>
                            </div>
                            
                            <div class="row justify-content-center mt-3">
                                <h6 class="text-center">
                                    <asp:Button ID="lbtnSaveSofaClothDetail" runat="server" CssClass="btn btn-sm btn-outline-primary mb-2" OnClick="lbtnSaveSofaClothDetail_Click" Text="ጨርቅ ይመዝገብ"/> 
                                    <asp:LinkButton ID="lbtnClearSofaClothDetail" runat="server" CssClass="btn btn-sm btn-outline-danger mb-2" OnClick="lbtnClearSofaClothDetail_Click" OnClientClick="return confirm('Are you sure you want to clean all the fields?')"><i class="fa fa-remove-format"></i> የፃፉት ያጥፉ </asp:LinkButton></h6>
                            </div>
                        </div>


                    </article>
                    <!-- card-body end .// -->

                </div>
            </div>

       
            <div class="col-md-11 mb-3 divToggleContent">

                <div class="card rounded shadow-lg  table-responsive p-2">

                    <table id="example" class="table table-hover table-sm" style="width: 100%;"
                        data-show-refresh="true"
                        data-show-fullscreen="true">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>ቁጥር</th>
                                <th>ኣቅርቦት</th>
                                <th>ቁመት</th>
                                <th>ምን ያሰራል</th>
                                <th>ዋጋ (ሜ)</th>
                                <th>Delete</th>
                                <th>Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptrSofasList" runat="server">
                                <ItemTemplate>
                                    <tr class=" align-text-bottom">
                                        <td>
                                            <img width="40" height="40"  class="rounded" src="../Handlers/SofaClothPhotoHandler.ashx?IdNumber=<%# Eval("IdNumber") %>" />
                                            </td>
                                        <td><%# Eval("IdNumber") %></td>
                                        <td><%# Eval("Width") %> ሜ</td>
                                        <td><%# Eval("Height") %> ሰ.ሜ</td>
                                        <td><%# Eval("SubCatagory") %></td>
                                        <td><%# Eval("PricePerMeter") %> ETB</td>
                                        <td><span class="btn btn-sm btn-outline-danger" title='Deleting sofa cloth' data-bs-toggle="modal" data-bs-target="#DeletingSofaCloth<%# Eval("IdNumber") %>" data-bs-whatever="@getbootstrap">
                                                <i class="fa fa-trash-alt"></i></span></td>
                                        <td>
                                            <a class="btn btn-sm btn-outline-primary" href="SofaClothDetail.aspx?IdNumber=<%# Eval("IdNumber") %>" title="Item Detail"><i class="fa fa-eye"></i></a>
                                        </td>
                                        <div class="modal fade" id="DeletingSofaCloth<%# Eval("IdNumber") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <div class="modal-header bg-danger">
                                                    <p class="text-center text-light"><i class="fa fa-exclamation-triangle"></i> You are about deleting sofa cloth of ID <%# Eval("IdNumber") %> from this site completly, Are you sure about this? </p>
                                                </div>
                                                <div class="modal-body">
                                                    <p class="text-muted"><strong><i class="fa fa-cat"></i> :-</strong> Deleting a cloth from the site may causes Image undisplayblity in some pages like in order detail. Eg:- if someone has an order of this item and yoou delete this you and your employees are not able to see
                                                        what the customer has. So i highly recommend you not to delete this but to <a href="SofaClothDetail.aspx?IdNumber=<%# Eval("IdNumber") %>" title="edit cloth detail">Edit</a> it.</p>
                                                </div>
                                                <div class=" modal-footer bg-danger">
                                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-sm btn-danger" runat="server" CommandArgument='<%# Eval("IdNumber") %>' OnClick="btnDeleteItemAlt_Click"><i class="fa fa-check"></i> YES</asp:LinkButton>
                                                    <button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal"> <i class="fa fa-times"></i> NO</button>
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
                                <th>Image</th>
                                <th>ቁጥር</th>
                                <th>ኣቅርቦት</th>
                                <th>ቁመት</th>
                                <th>ምን ያሰራል</th>
                                <th>ዋጋ (ሜ)</th>
                                <th>Delete</th>
                                <th>Detail</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

     

</asp:content>

