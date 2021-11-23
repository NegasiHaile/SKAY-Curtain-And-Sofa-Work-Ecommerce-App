<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="SofaSampleRegistration.aspx.cs" Inherits="_2AdminArea_SofaSampleRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mainContent">
        <div class="row justify-content-center">

            <div class="col-md-11">
                <div class="d-flex justify-content-between p-3 bg-white mb-1 rounded shadow-lg">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-couch"></i> ተሰርተው የተመዘገቡ ሶፋዎች ብዛት: <strong><%= RegsNumOfSofaSamples %></strong></span>
                    <div>
                        <asp:linkbutton id="lbtn1" runat="server" class="btn btn-sm btn-outline-primary m-0" data-bs-toggle="modal" data-bs-target="#sofaSampleRegistration" data-bs-whatever="@getbootstrap">
                            <i class="fa fa-plus"></i> ኣድስ ይመዝግቡ </asp:linkbutton>
                    </div>
                </div>
            </div>
            <div class="col-md-11" id="div1" runat="server">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnAlertSccess" runat="server"><i class="fa fa-check-circle"></i> የሶፋው ስራ በተሳካ ሁኔታ ተመዝግበዋል።</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnAlertError" runat="server"><i class="fa fa-times-circle"></i> ምዝገባው ኣልተሳካም፤ እባክዎ ደግመው ይሞክሩት.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>


            <div class="modal fade" id="sofaSampleRegistration" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h6 class="modal-title" id="exampleModalLabel"><i class="fa fa-couch">  </i> ተሰርቶ ያለቀ ሶፋ ይመዝግቡ</h6>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="tbToolsIdNumbers"> የተጠቀሙበት ጨርቅ/ቆች(Material)</label>
                                    <asp:TextBox ID="tbToolsIdNumbers" runat="server" class="form-select form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label for="tbTotalMeter" >ስንት ሜትር ጨርቅ ፈጀ？</label>
                                   <div class="input-group">
                                        <asp:TextBox ID="tbTotalMeter" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" required="required"></asp:TextBox>
                                       <div class="input-group-text">ሜ</div>
                                   </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="tbTotalCost"> የተሸጠው ጠቅላላ ዋጋ</label>
                                    <div class="input-group">
                                    <asp:TextBox ID="tbTotalCost" runat="server" class="form-control" onkeypress="return onlyNumberKey(event)" required="required"></asp:TextBox>
                                        <div class="input-group-text">ETB</div>
                                   </div>
                                </div>
                                <div class="col-md-6">
                                            <label>የሶፋ ዓይነት （ልዩ ስም）</label>
                                            <div class="input-group">
                                                <asp:TextBox ID="tbSofaCatagory" runat="server" class="form-control" required="required"></asp:TextBox>
                                            </div>
                                        </div>
                                <div class="col-md-12">
                                    <label for="fupldSofaSampleImage"> የሶፋው ፎቶ</label>
                                    <asp:FileUpload ID="fupldSofaSampleImage" runat="server" class="form-control" required="required"/>
                                </div>
                                <div class="col-md-12 mt-3 border-bottom pb-1">
                                    <div class="d-flex justify-content-center">
                                        <asp:Button ID="btnSofaSaveSample" runat="server" CssClass="btn btn-primary" Text=" ሶፋው ይመዝገብ" OnClick="btnSofaSaveSample_Click"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <small><i class="fa fa-cat"></i> 3 ምክንያቶች ለምን የተሰራ ሶፋ እንደምመዘግቡ：</small>
                                    <ol>
                                        <li>1：<small> የSKY ስራዎች ጥራት ለማሳወቅ (Advertisment)</small></li>
                                        <li>2：<small> ጨርቆች ተሰፍተው ስለብሱ ምን እደምመስሉ ለማሳየት</small></li>
                                        <li>3：<small> ደንበኞች የሶፋዎ ሞደል ኣይተው ስንት ሜ እንደሚፈጅ ለማወቅ</small></li>
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
                                <th>ቁጥር</th>
                                <th>ጨርቅ/ቆች</th>
                                <th>የፈጀው ጨርቅ</th>
                                <th>ዋጋ</th>
                                <th>የሶፋ ዓይነት</th>
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
                                        <td><span class="btn btn-sm btn-outline-danger" title='Deleting sofa sample' data-bs-toggle="modal" data-bs-target="#DeletingSampleSofa<%# Eval("Id") %>" data-bs-whatever="@getbootstrap">
                                                <i class="fa fa-trash-alt"></i></span></td>
                                        <td >
                                            <a class="btn btn-sm btn-outline-primary" href="SampleDetail.aspx?Id=<%# Eval("Id") %>" title="Item Detail"><i class="fa fa-eye"></i></a>
                                        </td>
                                        
                                    <div class="modal fade" id="DeletingSampleSofa<%# Eval("Id") %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <div class="modal-header bg-danger">
                                                    <p class="text-center text-light"><i class="fa fa-exclamation-triangle"></i>You are about deleting a sofa sample of ID <%# Eval("Id") %> from this site completly, Are you sure about this? </p>
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
                                <th>photo</th>
                                <th>Id</th>
                                <th>Tools</th>
                                <th>Total Meter</th>
                                <th>Total Cost</th>
                                <th>Sofa Type</th>
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

