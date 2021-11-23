<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="AccessoryRegistration.aspx.cs" Inherits="_2AdminArea_AccessoryRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mainContent">
        <div class="row justify-content-center">
            <div class="col-md-11">
                <div class="d-flex justify-content-between p-3 bg-info mb-1 rounded shadow-lg">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-tools"></i> Accessories </span>
                    <div>
                        <span id="lbtnToggleButton" onclick="AddAndListToggle();"><span class="btn btn-sm btn-outline-secondary m-0"><i class='fa fa-plus'></i> ኣድስ ይመዝግቡ </span></span>
                    </div>
                </div>
            </div>

            <div class="col-md-11">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnAlertSuccess" runat="server"><i class="fa fa-check-circle"></i> Accessory added successfuly!.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnAlertError" runat="server"><i class="fa fa-times-circle"></i> Somthing went wrong pleasse Try again!</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>

            <div class="col-md-11 mb-0 sky-d-none divToggleContent">
                <div class="card rounded shadow-lg">
                    <header class="card-header cont-bg">
                        <h6 class="mt-2 text-center skywelcome"> <i class="fas fa-tools"></i> ሌሎች የማስዋብያ እቃዎች እዚ ይመዝግቡ</h6>
                    </header>
                    <article class="card-body card-body-responsve">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-sm-4 mb-2">
                                    <label>የኣክሰሰሪ ዓይነት</label>
                                    <asp:DropDownList ID="ddlAcceType" CssClass=" form-select form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                    <asp:ListItem Selected="true" disabled></asp:ListItem>
                                    <asp:ListItem>Holder</asp:ListItem>
                                    <asp:ListItem>Hanger</asp:ListItem>
                                    <asp:ListItem>Tier</asp:ListItem>
                                    <asp:ListItem>Jowelery</asp:ListItem>
                                </asp:DropDownList>
                                </div>
                                <div class="col-sm-4 mb-2">
                                    <label>የቀለም ዓይነት/ልዩ ስም</label>
                                    <asp:TextBox ID="tbNameOrColor" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-sm-4 mb-2">
                                    <label>ዋጋ ለ 1 ሜ/ፍሬ</label>
                                    <asp:TextBox ID="tbAccePricePerMeterOrOne" runat="server" MaxLength="5" class="form-control" onkeypress="return onlyNumberKey(event)" required="required" ></asp:TextBox>
                                </div>
                                
                            <div class="col-sm-4 mb-2">
                                <label>ብዛት/ጠቅላላ ሜትር</label>
                                <asp:TextBox ID="tbAcceAvailableQuantityOrMeter" runat="server" MaxLength="5" class="form-control" onkeypress="return onlyNumberKey(event)" required="required"></asp:TextBox>
                            </div>
                                <div class="col-sm-4 mb-2">
                                    <label>የኣክሰሰሪ ፎቶ</label>
                                    <asp:FileUpload ID="fupldAccePhoto" runat="server" class="form-control" required="required" />
                            </div>
                               <div class="col-sm-4 mb-2">
                                    <label for="tbAcceDescription">ስለ ኣክሰሰሪው ማብራርያ (< 100 ፍደሎች)</label>
                                    <textarea id="tbAcceDescription" runat="server" class="form-control" maxlength="100" rows="2"></textarea>
                            </div>
                            </div>
                            <div class="col-sm-12 mb-2">
                                <div class="justify-content-center mt-3">
                                    <h6 class="text-center">
                                        <asp:Button ID="btnSaveAccessory" runat="server" CssClass="btn btn-outline-primary mb-2" Text="Save Item" OnClick="btnSaveAccessory_Click" />
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-outline-danger mb-2"><i class="fa fa-remove-format"></i> Clear All </asp:LinkButton></h6>
                                </div>
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
                                <th>ዓይነት</th>
                                <th>ልዩ ስም/ቀለም</th>
                                <th>ዋጋ ለ 1 ሜ/ፍሬ</th>
                                <th>ቀረብ</th>
                                <th>ማስወግድ</th>
                                <th>ጥልቅ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptrAccessories" runat="server">
                                <ItemTemplate>
                                    <tr class=" align-text-bottom">
                                        <td>
                                            <img src="../Handlers/AccessoriesPhotoHandler.ashx?Id=<%# Eval("Id") %>" class="rounded" height="30" width="35" /></td>
                                        <td><%# Eval("Id") %></td>
                                        <td><%# Eval("Acce_Type") %></td>
                                        <td><%# Eval("SpecialName_color") %></td>
                                        <td><%# Eval("PricePerMeter_One") %> ETB</td>
                                        <td><%# Eval("Available_Quantity") %> <%# Eval("Acce_Type").ToString() == "Meskeya"? "ሜ": "ፍሬ" %></td>
                                        <td>
                                            <asp:LinkButton ID="btnDeleteItemAlt" CssClass="btn btn-sm btn-outline-danger" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="btnDeleteItemAlt_Click" OnClientClick="return ConfirmationForDelete();">
                                                <i class="fa fa-trash-alt"></i></asp:LinkButton>
                                        </td>
                                        <td><a class="btn btn-sm btn-outline-primary" href="AccessoryDetail.aspx?Id=<%# Eval("Id") %>" title="Item Detail"><i class="fa fa-eye"></i></a></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>image</th>
                                <th>Number</th>
                                <th>Type</th>
                                <th>Name/Color</th>
                                <th>Price (Meter)</th>
                                <th>Available</th>
                                <th>Delete</th>
                                <th>Detail</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

