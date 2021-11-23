<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="EmployeesRegistration.aspx.cs" Inherits="_2AdminArea_EmployeesRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container mainContent">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="d-flex justify-content-between p-3 bg-white mb-2 shadow-lg rounded">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-user-plus"></i> ሰራተኛ መመዝገብያ ቅፅ </span>
                    <div>
                        <span> Employee Default Password: Sky@123 </span>
                    </div>
                    <div>
                        <a href="EmployeeList.aspx" runat="server" class="btn btn-sm btn-outline-primary"><i class="fa fa-list"></i> ዝርዝር ያገኙ</a>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnSuccessAlertText" runat="server"><i class="fa fa-check"></i> ሰራተኛው በተሳካ ሁኔታ ተመዝግበዋል！</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnErrorAlertText" runat="server"><i class="fa fa-times"></i> ምዝገባው ኣልተሳካም፤ እባክዎ ደግመው ይሞክሩ！</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>


            <div class="col-md-7">
                <div class="card shadow-lg rounded">
                    <div class="card-header">
                        <h6 class="text-center">የSKY ሰራተኛ እዝህ ይመዝግቡ </h6>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>ስም</label>
                                    <asp:textbox id="tbEmplFName" maxlength="23" onkeypress="return onlyLetterKey(event)" name="tbNFName" runat="server" class="form-control" required="required"></asp:textbox>
                                    <%--<input type="text" class="form-control" disabled="" placeholder="Company" value="Creative Code Inc.">--%>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>የኣባት ስም</label>
                                    <asp:textbox id="tbEmplMName" maxlength="23" onkeypress="return onlyLetterKey(event)" runat="server" class="form-control" required="required"></asp:textbox>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>የኣያት ስም</label>
                                    <asp:textbox id="tbEmplLName" maxlength="20" onkeypress="return onlyLetterKey(event)" runat="server" class="form-control"></asp:textbox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 px-2 mt-3 mb-3">
                                <label class="form-label">ፆታ</label>
                                <label class="form-check-inline">
                                    <asp:radiobutton runat="server" id="rbEmplMaleGender" type="radio" groupname="gender" />
                                    <span>ወንድ </span>
                                </label>
                                <label class=" form-check-inline">
                                    <asp:radiobutton runat="server" id="rbEmplFemaleGender" type="radio" groupname="gender" />
                                    <span>ሴት </span>
                                </label>
                            </div>
                            <div class="col-md-6 px-2">
                                <div class="form-group">
                                    <label>ቁጥር ስልክ</label>
                                    <asp:textbox id="tbEmplPhoneNumber" maxlength="10" min="10" onkeypress="return onlyNumberKey(event)" runat="server" class="form-control" required="require"></asp:textbox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 px-2">
                                <div class="form-group">
                                    <label>የእሜል ኣድራሻ</label>
                                    <asp:textbox id="tbEmplEmail" runat="server" textmode="Email" class="form-control"></asp:textbox>
                                </div>
                            </div>
                            <div class="col-md-6 px-2">
                                <div class="form-group">
                                    <label>ደሞወዝ (Month)</label>
                                    <asp:textbox id="tbEmplSalary" maxlength="6" onkeypress="return onlyNumberKey(event)" runat="server" class="form-control" required="require"></asp:textbox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 px-2">
                                <div class="form-group">
                                    <label>የሰራ ቦታ （ቅርንጫፍ）</label>
                                    <asp:dropdownlist cssclass="form-select form-control" runat="server" id="ddlEmplBranch" datatextfield="CHOOSE" datavaluefield="BACK" required="require">
                                        <asp:ListItem Selected="true" disabled>  </asp:ListItem>
                                        <asp:ListItem>ሳሊተ ምህረት</asp:ListItem>
                                        <asp:ListItem>ጀሞ ሚክኤል</asp:ListItem>
                                    </asp:dropdownlist>
                                </div>
                            </div>
                            <div class="col-md-6 px-2">
                                <div class="form-group">
                                    <label>የስራ መደብ （Position）</label>
                                    <asp:dropdownlist cssclass=" form-select form-control dropdown" runat="server" ID="ddlEmplPosition" datatextfield="CHOOSE" datavaluefield="BACK" required="require">
                                        <asp:ListItem Selected="true" disabled></asp:ListItem>
                                        <asp:ListItem>ስፌት</asp:ListItem>
                                        <asp:ListItem>ሽያጭ</asp:ListItem>
                                        <asp:ListItem>መጋረጃ መስቅል</asp:ListItem>
                                        <asp:ListItem>ቅርንጫፍ ኣስተዳዳሪ</asp:ListItem>
                                        <asp:ListItem>ሌላ</asp:ListItem>
                                    </asp:dropdownlist>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-5 shadow-lg rounded">
                <div class="card card-user" style="margin-top: 65px;">
                    <div class="card-body">
                        <div class="author">
                            <a class="text-uppercase text-primary">
                                <asp:Image ID="Image1" runat="server" class="avatar border-gray" src="../5Assets/3Images/avatar2.png" />
                                <%--<img class="avatar border-gray" src="../5Assets/3Images/avatar2.png" />--%>
                            </a>
                        </div>
                        <div class="row">
                            
                        <div class="col-sm-6">
                            <label>የሰራተኛ ፎቶ</label>
                            <asp:fileupload id="fupldEmplPhoto" runat="server" cssclass="form-control" required="require"/>
                        </div>
                        <div class="col-sm-6">
                            <label>የተያዥ ማስረጃ(scaned)</label>
                            <asp:fileupload id="fupldEplTeyazDetail" runat="server" cssclass="form-control" required="require"/>
                        </div>
                        </div>

                    </div>
                </div>
                <div class="col-12 mt-1">
                    <div class=" d-flex justify-content-between p-3 bg-white">
                        <asp:button id="btnSaveEmplDetail" runat="server" cssclass="btn btn-outline-primary m-1" text="ሰራተኛ ይመዝገብ" OnClick="btnSaveEmplDetail_Click" />
                        <asp:linkbutton id="btnClearEmplDetail" runat="server" cssclass="btn btn-outline-danger m-1" OnClick="btnClearEmplDetail_Click"><i class="fa fa-remove-format"></i> የፃፉት ይጥፋ </asp:linkbutton>
                    </div>
                </div>
            </div>


        </div>
    </div>
</asp:Content>

