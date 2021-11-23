<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="DrapeSampleRegistration.aspx.cs" Inherits="_2AdminArea_DrapeSampleRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container mainContent">
        <div class="row justify-content-center">

            <div class="col-md-11">
                <div class="d-flex justify-content-between p-3 bg-white mb-1 rounded shadow-lg">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-images"></i> ተሰርተው የተመዘገቡ መጋረጃዎች ብዛት: <strong><%= RegsNumOfCurtainSamples %></strong></span>
                    <div>
                        <asp:linkbutton id="lbtn1" runat="server" class="btn btn-sm btn-outline-primary m-0" data-bs-toggle="modal" data-bs-target="#sofaSampleRegistration" data-bs-whatever="@getbootstrap">
                            <i class="fa fa-plus"></i> ኣድስ ይመዝግቡ </asp:linkbutton>
                    </div>
                </div>
            </div>
            <div class="col-md-11" id="div1" runat="server">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnAlertSccess" runat="server"><i class="fa fa-check"></i> Sample Added Successfuly.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnAlertError" runat="server"><i class="fa fa-times"></i> Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>


            <div class="modal fade" id="sofaSampleRegistration" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h6 class="modal-title" id="exampleModalLabel"><i class="fa fa-images">  </i> ተሰርቶ ያለቀ መጋረጃ ይመዝግቡ </h6>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row g-2">
                                <div class="col-md-6">
                                    <label for="tbTotalMeter">ለስንት ሜትር መስኮት ተሰራ?</label>
                                    <div class="input-group">
                                    <asp:TextBox ID="tbTotalMeter" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" required="required"></asp:TextBox>
                                        <div class="input-group-text">ሜ</div>
                                   </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="tbTotalMeter">በስንት ተሸበሸበ?</label>
                                    <div class="input-group">
                                    <asp:dropdownlist id="ddlShirrinkby" runat="server" cssclass="form-control" onkeypress="return onlyNumberKey(event)" required="required">
                                        <asp:ListItem Selected="true" disabled> </asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>2.5</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        </asp:dropdownlist>
                                        <div class="input-group-text">ሜ</div>
                                   </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="tbTotalCost">ጠቅላላ ዋጋ</label>
                                    <div class="input-group">
                                    <asp:TextBox ID="tbTotalCost" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" required="required"></asp:TextBox>
                                        <div class="input-group-text">ETB</div>
                                   </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="tbToolsIdNumbers">የተጠቀሙበት ጨርቅ(Material)</label>
                                    <asp:TextBox ID="tbMaterialIdNumber" runat="server" class="form-select form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                            <label>የመስኮት/የመጋረጃው ዓይነት</label>
                                            <div class="input-group">
                                                <asp:TextBox ID="tbCurtainTypeName" runat="server" class="form-control"></asp:TextBox>
                                                <%--<asp:DropDownList ID="ddlCurtainType" CssClass="form-select form-control-sm" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                                    <asp:ListItem Selected="true" disabled> </asp:ListItem>
                                                    <asp:ListItem>መጋረጃ ከነገበሩ</asp:ListItem>
                                                    <asp:ListItem>ያለ ገበር</asp:ListItem>
                                                    <asp:ListItem>ገበር ብቻ</asp:ListItem>
                                                </asp:DropDownList>--%>
                                            </div>
                                        </div>
                                <div class="col-md-6">
                                    <label for="fupldSofaSampleImage">የመጋረጃው ፎቶ</label>
                                    <asp:FileUpload ID="fupldSofaSampleImage" runat="server" class="form-control" required="required"/>
                                </div>
                                <div class="col-md-12 mt-3 border-bottom pb-1">
                                    <div class="d-flex justify-content-center">
                                        <asp:Button ID="btnSofaSaveSample" runat="server" CssClass="btn btn-primary" Text=" ስራው ይመዝገብ" OnClick="btnSofaSaveSample_Click"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <small><i class="fa fa-cat"></i> 3 ምክንያቶች ለምን የተሰራ መጋረጃ እንደምመዘግቡ：</small>
                                    <ol>
                                        <li>1：<small> የSKY የመጋረጃ ስራዎች ጥራት ለማሳታወቅ (Advertisment)</small></li>
                                        <li>2：<small> መጋረጃው መስኮት ላይ ምን ዓይነት ዉበት እደምሰጥ ለማሳየት</small></li>
                                        <li>3：<small> ደንበኞች የመስኮትዎ ሞደል ኣይተው በቀላሉ ለማዘዝ</small></li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-11 mb-3 divToggleContent">

                <div class="card  rounded shadow-lg  table-responsive p-2">

                    <table id="example" class="table table-hover table-sm" style="width: 100%;"
                        data-show-refresh="true"
                        data-show-fullscreen="true">
                        <thead>
                            <tr>
                                <th>ፎቶ</th>
                                <th>መለያ ቁጥር</th>
                                <th>ጨርቅ</th>
                                <th>ስፋት</th>
                                <th>ዋጋ</th>
                                <th>የመጋረጃ ዓይነት</th>
                                 <th>ማስወገድ</th>
                                 <th>ጥልቅ</th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptrSofaSamplesList" runat="server">
                                <ItemTemplate>
                                    <tr class="align-text-bottom">
                                        <td>
                                            <img width="35" height="40" src="../Handlers/SampleImagesHandler.ashx?Id=<%# Eval("Id") %>"/>
                                            </td>
                                        <td><%# Eval("Id") %></td>
                                        <td><%# Eval("IdsOfTools") %></td>
                                        <td><%# Eval("Drp_Wndw_Sf_TtlMeter") %> ሜ</td>
                                        <td><%# Eval("TotalCost") %></td>
                                        <td><%# Eval("Sample_SubCatagory") %></td>
                                        <td><span class="btn btn-sm btn-outline-danger" title='Deleting Curtain Sample' data-bs-toggle="modal" data-bs-target="#DeletingSampleCurtain<%# Eval("Id") %>" data-bs-whatever="@getbootstrap">
                                                <i class="fa fa-trash-alt"></i></span></td>
                                        <td >
                                            <a class="btn btn-sm btn-outline-primary" href="SampleDetail.aspx?Id=<%# Eval("Id") %>" title="Item Detail"><i class="fa fa-eye"></i></a>
                                        </td>
                                        <div class="modal fade" id="DeletingSampleCurtain<%# Eval("Id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <div class="modal-header bg-danger">
                                                    <p class="text-center text-light"><i class="fa fa-exclamation-triangle"></i>You are about deleting a curtain sample of ID <%# Eval("Id") %> from this site completly, Are you sure about this? </p>
                                                </div>
                                                <div class="modal-body">
                                                    <p class="text-muted">
                                                        <strong><i class="fa fa-cat"></i>:-</strong> Instead if deleting the sample it's recommendable to <a href="SampleDetail.aspx?Id=<%# Eval("Id") %>" title="edit cloth detail">Edit</a> it.
                                                    </p>
                                                </div>
                                                <div class=" modal-footer bg-danger">
                                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-sm btn-danger" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="btnDeleteItemAlt_Click"><i class="fa fa-check"></i> YES</asp:LinkButton>
                                                    <button type="button" class="btn btn-sm btn-danger" data-bs-dismiss="modal"><i class="fa fa-times"></i> NO</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                       </tr>

                                   <%-- <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>

                                        </ItemTemplate>
                                    </asp:Repeater>--%>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Image</th>
                                <th>ቁጥር</th>
                                <th>Material</th>
                                <th>Window width</th>
                                <th>Total Cost</th>
                                <th>Curtain Type</th>
                                 <th>Delete</th>
                                 <th>detail</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

