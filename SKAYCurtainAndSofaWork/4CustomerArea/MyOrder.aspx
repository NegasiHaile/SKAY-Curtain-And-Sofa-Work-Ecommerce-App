<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="_4CustomerArea_MyOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
body {
  font-family: Arial, Helvetica, sans-serif;
}
.input-group-text{
    background-color: white;
}
.input-group-text, .form-control{
    border: none;
    border-bottom: solid 1px #a7a7b2;
    border-bottom-left-radius: 0px;
}
</style>
    <div class="container-fluid mainContent">
        <div class="row">
            <asp:Repeater ID="rptrMyOrders" runat="server">
                <ItemTemplate>
            <div class="col-md-6 mb-3">
                <div class="card shadow-lg rounded">
                    <div class="row">
                        <div class="col-sm-5">
                            <div>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="../5Assets/3Images/4qXhMAM.jpg" style="width: 100%; height: 326px;" alt="Avatar" />
                                        <div class="carousel-caption">
                                            <a href="OrderDetail.aspx?Order_Id=<%# Eval("Order_Id") %>" class="btn btn-outline-Pa-Sky"><i class="fa fa-cat"></i> ሙሉ መረጃ </a>
                                            <p> <strong>Order Status: <%# Eval("Order_Status") %></strong></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-7">
                            <div class="input-group mb-1">
                                <span class="input-group-text">ት.መ.ቁ:</span>
                                <span class="form-control"> <strong><%# Eval("Order_Id") %></strong></span>
                                </div>
                            <div class="input-group mb-1">
                                <span class="input-group-text">የትእዛዛ ዓይነት:</span>
                                <span class="form-control" style="max-height: 37px; overflow-y: scroll;"> <%# Eval("Slected_Items") %></span>
                                </div>
                            <div class="input-group mb-1">
                                <span class="input-group-text">ጠቅላላ ዋጋ:</span>
                                <span class="form-control"> <%# Eval("Total_Price") %> ብር</span>
                                </div>
                            <div class="input-group mb-1">
                                <span class="input-group-text">ቀብድ:</span>
                                <span class="form-control"> <%# Eval("Holding_Amount") %> ብር <%# Eval("Payment_Status").ToString() == "New"? "<i class='float-end text-danger fa fa-times-circle'  title='ኣልተከፈለም'></i>": "<i class='float-end text-success fa fa-check-circle'  title='ተከፍለዋል'></i>" %></span>
                            </div>
                            <div class="input-group mb-1">
                                <span class="input-group-text">ቀሪ:</span>
                                <span class="form-control"> <%# Eval("Left_Amount") %> ብር <%# Eval("Payment_Status").ToString() == "Fully Covered"? "<i class='float-end text-success fa fa-check-circle'  title='ተከፍለዋል'></i>": "<i class='float-end text-danger fa fa-times-circle'  title='ኣልተከፈለም'></i>" %></span>
                            </div>
                            <div class="input-group mb-1">
                                <span class="input-group-text">ቀጠሮ:</span>
                                <span class="form-control"> <%# Eval("Appointmet_Date").ToString() == ""? "Pendding <i class='text-danger fa fa-times-circle'  title='ኣልተሰጠም'></i>": Eval("Appointmet_Date") %> </span>
                                </div>
                            <div>
                                <p class="text-center"> 
                                    <span><strong><i class="fa fa-cat"></i> የምንሰራቸው ስራዎች</strong></span><br />
                                    <small><i class="fa fa-check"></i> የመጋረጃ ስራ</small>
                                    <small><i class="fa fa-check"></i> የሶፋ ስራ</small>
                                    <small><i class="fa fa-check"></i> የኣልጋ፤ የተለያዩ ትራሶችና የመጋረጃ ኣክሰሰሪ</small><br />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                </ItemTemplate>
            </asp:Repeater>


            <div class="col-12 mt-5" id="divInfoForNoOrder" runat="server">
                <p style=" border: solid 1px #216be1; color: #216be1; border-left: solid 10px #216be1; padding: 5px; font-size: 17px; border-radius: 2px; "> <i class="fa fa-info-circle"></i> you haven't any order yet!</p>
            </div>
        </div>
    </div>
</asp:Content>

