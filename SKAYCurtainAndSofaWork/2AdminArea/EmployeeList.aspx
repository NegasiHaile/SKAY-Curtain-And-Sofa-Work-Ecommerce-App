<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="EmployeeList.aspx.cs" Inherits="_2AdminArea_EmployeeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class=" container-fluid mainContent">
        <div class="row justify-content-center">

            <div class="col-md-12">
                <div class="d-flex justify-content-between p-3 bg-white mb-2 shadow-lg rounded">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-list"></i> የሰራተኞች ዝርዝር </span>
                    <div>
                        <a href="EmployeesRegistration.aspx" id="LinkButton4" runat="server" class="btn btn-sm btn-outline-primary m-0"><i class="fa fa-user-plus"></i> ኣድስ ይመዝግቡ</a>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnSuccessAlertText" runat="server"><i class="fa fa-check-circle"></i> ሰራተኛው በተሳካ ሁኔታ ጠፍተዋል！</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                </div>
            
            <div class="col-md-12 mb-3">
                <div class="card rounded shadow-lg  table-responsive p-2">

                    <table id="example" class="table table-hover table-sm" style="width: 100%;"
                        data-show-refresh="true"
                        data-show-fullscreen="true">
                        <thead>
                            <tr>
                                <th><i class="fa fa-user"></i> ስም</th>
                                <th>ቁጥር ስልክ</th>
                                <th>ፆታ</th>
                                <th>ደመወዝ</th>
                                <th>ቅርንጫፍ</th>
                                <th>ስራ መደብ</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptrAllEmployees" runat="server">
                                <ItemTemplate>
                                    <tr class=" align-text-bottom">
                                        <td><%# Eval("FName") %> <%# Eval("MName") %> <%# Eval("LName") %></td>
                                        <td><%# Eval("PhoneNumber") %></td>
                                        <td><%# Eval("Gender") %></td>
                                        <td><%# Eval("Salary") %> ETB</td>
                                        <td><%# Eval("Branch") %></td>
                                        <td><%# Eval("Position") %></td>
                                        <td>
                                            <span class=" d-flex justify-content-between">
                                                <asp:LinkButton ID="btnDeleteItemAlt" ForeColor="Red" runat="server" title="Delete Employee" CommandArgument='<%# Eval("PhoneNumber") %>'  
                                            OnClientClick="return ConfirmationForDelete();" OnClick="btnDeleteEmployee_Click" >
                                                <i class="fa fa-trash-alt"></i></a></asp:LinkButton>
                                            
                                            <a href="EmployeeDetail.aspx?PhoneNumber=<%# Eval("PhoneNumber") %>" title="Edit Employee"><i class="fa fa-pen-alt"></i></a>
                                            </span>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                                        

                        </tbody>
                        <tfoot>
                           <tr>
                                <th>Full Name</th>
                                <th>Phone No</th>
                                <th>Gender</th>
                                <th>Salary</th>
                                <th>Branch</th>
                                <th>Position</th>
                                <th>Actions</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

