<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="EmployeeDetail.aspx.cs" Inherits="_2AdminArea_EmployeeDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid mainContent">
        <div class="row mb-5">
            
        <div class="col-12">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnSuccessAlertText" runat="server"><i class="fa fa-check-circle"></i> Employee Detail Has been Updated.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnErrorAlertText" runat="server"><i class="fa fa-times-circle"></i> Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card card-user shadow-sm" style="margin-top: 46px;">
                    <asp:Repeater ID="rptrAllEmployees" runat="server">
                        <ItemTemplate>
                            <div class="card-body">
                                <div class="author">
                                    <a class="text-uppercase text-primary">
                                        <img class="avatar border-gray" src="../Handlers/EmployeePhotohandler.ashx?PhoneNumber=<%# Eval("PhoneNumber") %>" />
                                    </a>
                                </div>
                                <div class="col-12">
                                    <div class="d-flex justify-content-between">
                                        <p>Full Name: </p>
                                        <p><%# Eval("FName") %> <%# Eval("MName") %> <%# Eval("LName") %></p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p>Gender: </p>
                                        <p><%# Eval("Gender") %></p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p>Phone Number: </p>
                                        <p><%# Eval("PhoneNumber") %></p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p>Email: </p>
                                        <p><%# Eval("Email") %></p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p>Salary:</p>
                                        <p><%# Eval("Salary") %> ETB</p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p>Branch : </p>
                                        <p><%# Eval("Branch") %></p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p>Position: </p>
                                        <p><%# Eval("Position") %></p>
                                    </div>
                                    <hr />
                                    <div class="d-flex justify-content-between">
                                        <p>Account Status : </p>
                                        <p><%# Eval("Account_Status") %></p>
                                    </div>
                                    <%--<div class="d-flex justify-content-between">
                                        <p>Encrepted Paswword : </p>
                                        <p><%# Eval("Password") %></p>
                                    </div>--%>
                                </div>
                            </div>
                            
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
                <div class="col-12 mt-1 mb-2">
                    <div class=" d-flex justify-content-between p-3 bg-white shadow-sm rounded">
                        <span id="lbtnToggleButton" class="btn btn-outline-success" title="Edit Profile" data-bs-toggle="modal" data-bs-target="#EditEmployeeDetail" data-bs-whatever="@getbootstrap" ><i class="fa fa-edit"></i></span>
                        <asp:linkbutton id="lbtnDeactivateEmployeeAccount" runat="server" class="btn btn-outline-danger m-1" title="Block Account" OnClick="lbtnDeactivateEmployeeAccount_Click"
                            ><i class="fa fa-user-lock"></i> </asp:linkbutton>
                    <asp:linkbutton id="lbtnActivateEmployeeAccount" runat="server" class="btn btn-outline-primary m-1" title="Activate Account" OnClick="lbtnActivateEmployeeAccount_Click">
                        <i class="fa fa-lock-open"></i></asp:linkbutton>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="EditEmployeeDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h6 class="text-center"><i class="fa fa-edit"></i>Edit Employee Detail Here</h6>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="px-2 mb-2">
                                <div class="form-group">
                                    <label>Name</label>
                                    <asp:TextBox ID="tbEmployeeName" MaxLength="23" onkeypress="return onlyLetterKey(event)" name="tbNFName" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="px-2 mb-2">
                                <div class="form-group">
                                    <label>Father's Name</label>
                                    <asp:TextBox ID="tbEmployeeFathersName" MaxLength="20" onkeypress="return onlyLetterKey(event)" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="px-2 mb-2">
                                <div class="form-group">
                                    <label>Grandfather's Name</label>
                                    <asp:TextBox ID="tbEmployeeGrandFathersName" MaxLength="20" onkeypress="return onlyLetterKey(event)" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="px-2 mt-3 mb-3">
                                <label class="form-label">Gender</label>
                                <label class="form-check-inline">
                                    <asp:RadioButton runat="server" ID="rbEmployeeGenderMale" type="radio" GroupName="gender" />
                                    <span>Male </span>
                                </label>
                                <label class=" form-check-inline">
                                    <asp:RadioButton runat="server" ID="rbEmployeeGenderFemale" type="radio" GroupName="gender" />
                                    <span>Female </span>
                                </label>
                            </div>

                            <div class=" px-2 mb-2">
                                <div class="form-group">
                                    <label>Emaile Address</label>
                                    <asp:TextBox ID="tbEmployeeEmailAddress" runat="server" TextMode="Email" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="px-2 mb-2">
                                <div class="form-group">
                                    <label>Salary (Month)</label>
                                    <asp:TextBox ID="tbEnployeeSalary" MaxLength="10" onkeypress="return onlyNumberKey(event)" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="px-2 mb-2">
                                <div class="form-group">
                                    <label>የሰራ ቦታ （ቅርንጫፍ）</label>
                                    <asp:DropDownList CssClass="form-select form-control" runat="server" ID="ddlEmployeeBranch" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                        <asp:ListItem Selected="true" disabled>  </asp:ListItem>
                                        <asp:ListItem>ሳሊተ ምህረት</asp:ListItem>
                                        <asp:ListItem>ጀሞ ሚክኤል</asp:ListItem>
                                        <asp:ListItem>Super Admin</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="px-2 mb-2">
                                <div class="form-group">
                                    <label>የስራ መደብ （Position）</label>
                                    <asp:DropDownList ID="ddlEployeePostion" CssClass=" form-select form-control dropdown" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                        <asp:ListItem Selected="true" disabled></asp:ListItem>
                                        <asp:ListItem>ስፌት</asp:ListItem>
                                        <asp:ListItem>ሽያጭ</asp:ListItem>
                                        <asp:ListItem>መጋረጃ መስቅል</asp:ListItem>
                                        <asp:ListItem>ቅርንጫፍ ኣስተዳዳሪ</asp:ListItem>
                                        <asp:ListItem>ሌላ</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="px-2 mb-2">
                                <div class="form-group">
                                    <label>Employee photo</label>
                                    <asp:FileUpload ID="fupldEmployeePhoto" runat="server" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="row">
                                <div class=" d-flex justify-content-center p-3 bg-white">
                                    <asp:Button ID="btnSaveChangeInEmployeeDetail" runat="server" class="btn btn-outline-primary m-1" Text="Save Change" OnClick="btnSaveChangeInEmployeeDetail_Click" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="img-thumbnail">
                    <img class="w-100" title=" የተያዥ ማስረጃ " src="../Handlers/EployeTeyazDetailHandler.ashx?PhoneNumber=<%= EmplPhoneNumber %>" />
                </div>
            </div>
        </div>
        </div>
</asp:Content>
