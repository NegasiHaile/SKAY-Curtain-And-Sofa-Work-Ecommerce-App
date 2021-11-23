<%@ Page Title="" Language="C#" MasterPageFile="~/2AdminArea/AdminArea.master" AutoEventWireup="true" CodeFile="Feedbacks.aspx.cs" Inherits="_2AdminArea_Feedbacks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid mainContent">
        <%--List of feedbacks--%>
        <div class=" p-3 bg-white rounded shadow-sm">
            <h6 class="border-bottom pb-2 mb-0 text-muted"><span id="spnNumberOfFunctions" runat="server"><%= totalFeedBacks %></span>
                <span>- New Feedbacks </span></h6>

            <asp:Repeater ID="rptrFeedBacksList" runat="server">
                <ItemTemplate>
                    <div class="d-flex text-muted pt-3">
                <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#007bff" />
                    <text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>

                <div class="pb-3 small lh-sm border-bottom w-100">
                    <div class="d-flex justify-content-between">
                        <strong class="text-gray-dark"><i class="fa fa-user-alt"></i><span> <%# Eval("FullName") %></span></strong>
                    </div>
                    <span class="d-block">
                        <span class="text-gray-dark"><i class="fa fa-mobile-alt"></i><small> <%# Eval("Phone_Email") %>,</small> </span>
                        <span class="d-inline"><%# Eval("Subject") %> <i class="fa fa-comment-alt"></i>
                                <%# Eval("Message") %>
                    </span>
                </div>
                <div class="pb-3small lh-sm border-bottom h-auto">
                    <a href="#" class="text-danger">Delete</a>
                </div>
            </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <%--list end--%>
    </div>
</asp:Content>

