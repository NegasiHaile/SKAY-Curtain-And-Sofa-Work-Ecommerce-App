<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="Cart_Detail.aspx.cs" Inherits="_4CustomerArea_Cart_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container mainContent">
        <div class="row d-flex justify-content-center">
            <div class="col-12 border-bottom pb-1">
                <h6> Order Type</h6>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="d-flex justify-content-between">
                            <span>Qantity: </span> 
                            <span>3: </span>
                        </div>
                    </div>
                    <div class="col-sm-4">

                    </div>
                    
                    <div class="col-sm-4">
                        <lable>Description (<250 Characters)</lable>
                        <textarea id="TextArea1" rows="3" class="form-control"></textarea>
                    </div>
                </div>
            </div>
            <asp:Repeater ID="rptrSelectedItems" runat="server">
                <ItemTemplate>
                    
                    <div class="col-sm-4">
                        <h6>Cart Detail</h6>
                        <p><%# Eval("Cart_Id") %></p>
                        
                        <p><%# Eval("Item_Id") %></p>
                        
                        <p><%# Eval("wndw_ClothSofa_Meter") %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <p id="demo1"></p>
        <p id="demo"></p>

<script>
    window.onload(getAllowedHangerMeter());

    function getAllowedHangerMeter() {
        var AllowedMeters = [1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 4.25, 4.5, 4.75, 5, 5.25, 5.5, 5.75, 6];

        var HangerWidth = 2.75;
        var CheckedNumber;

        var first = AllowedMeters.find(GetAllowedWdith);

        var i;
        for (i = 0; i < AllowedMeters.length; i++) {
            if (AllowedMeters[i] == HangerWidth) {
                first = AllowedMeters[i];
                break;
            }
        }

        document.getElementById("demo").innerHTML = "First number over 2.3 is " + first;
    }

    function GetAllowedWdith(value, index, array) {
        return value > 2.3;
    }
</script>
    </div>

</asp:Content>

