<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="_4CustomerArea_Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .collapsible {
            background-color: #777;
            color: white;
            cursor: pointer;
            padding: 15px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            border-radius: 1px;
        }

            .active, .collapsible:hover {
                background-color: #333;
            }

        .content {
            padding: 0 18px;
            display: none;
            overflow: hidden;
            background-color: #f1f1f1;
            margin-bottom: 3px;
        }

            .content p {
                font-family: Arial;
            }
    </style>
    <div class="container-fluid mainContent">
        <div class="d-block justify-content-center">
            <div class="col-md-12">
                <div class="d-flex justify-content-between p-3 bg-light mb-1 rounded shadow-lg">
                    <span class="font-weight-bold text-uppercase"><i class="fa fa-info-circle"></i>
                         List of Helps, her you can get the clue how you can go with this apllication.  </span>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="col-12">
                    <div class="shadow-lg rounded bg-light p-2">
                        <asp:Repeater ID="rptrHelpsList" runat="server">
                            <ItemTemplate>
                                <h5 class="collapsible"><%# Eval("Help_Subject") %> ?</h5>
                                <div class="content pb-2">
                                    <p class="text-muted"><%# Eval("Help_Detail") %></p>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
        <script>
            var coll = document.getElementsByClassName("collapsible");
            var i;

            for (i = 0; i < coll.length; i++) {
                coll[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var content = this.nextElementSibling;
                    if (content.style.display === "block") {
                        content.style.display = "none";
                    } else {
                        content.style.display = "block";
                    }
                });
            }
        </script>
</asp:Content>

