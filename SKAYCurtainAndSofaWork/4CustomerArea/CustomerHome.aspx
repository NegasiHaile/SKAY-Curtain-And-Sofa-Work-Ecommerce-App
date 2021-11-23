<%@ Page Title="" Language="C#" MasterPageFile="~/4CustomerArea/CustomerArea.master" AutoEventWireup="true" CodeFile="CustomerHome.aspx.cs" Inherits="_4CustomerArea_CustomerHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .bgd-img-c0l-3{
            background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)); background-size: 100% 100%; background-repeat: no-repeat;
        margin: 5px 7px 5px 7px;
            }
        .FreSty{
            background-color: rgba(10, 10, 10, 0.5); padding: 4px;
        }

                .sKYcard {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            max-width: 300px;
            margin: auto;
            text-align: center;
            font-family: arial;
        }

        .quantity {
            color: #06bb21;
            font-size: 19px;
        }

        .sKYcard button {
            border: none;
            outline: 0;
            padding: 12px;
            color: #93938c;
            background-color: #21192f;
            text-align: center;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
        }

            .sKYcard button:hover {
                opacity: 0.7;
            }

        .imgSize {
            width: 100%;
            height: 270px;
        }

        .ht-restr {
            max-height: 480px;
            min-height: 40px;
            opacity: 0.5;
            filter: alpha(opacity=50); /* For IE8 and earlier */
            -webkit-filter: saturate(7);
            filter: saturate(7);
        }

        .bgd-img-c0l-3 {
            background-repeat: no-repeat;
            margin: 5px 7px 5px 7px;
            height: 480px;
            padding: 10px;
            background-attachment: fixed;
            background-size: 100% 100%;
            width: 100%;
        }
        .landing-text{
            color: #fff; font-family: serif; font-weight: normal; font-size: 30px; font-family: 'Lucida Calligraphy'; text-align:center; margin-top: 40px;
        }
        @media screen and (max-width: 580px) {
            .bgd-img-c0l-3 {
                height: 300px;
            }
            .landing-text{
                font-size: 23px;
            }
        }
    </style>
   <div class=" mainContent" style="margin-top: 70px;" >
       <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <ol class="carousel-indicators">
                <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"></li>
                <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../5Assets/3Images/sc1.jpg" class="d-block w-100" style="max-height: 700px;" />
                    <div class="carousel-caption">
                        <div id="defaultwelcom" runat="server" class=" text-center" style="font-family: serif; padding: 3px; 
                            background-color: rgba(20, 20, 20, 0.2); border-radius: 2px;">
                            <h4 class="my-2">እንኳን ወደ SKAY የመጋረጃና የሶፋ ጨርቃ ጨርቅ ስራ በደህና መጡ።</h4>
                              
                            <p class="mt-2 d-none d-md-block">የቤትዎ የዉስጠኛው ክፍል ማለትም መጋረጃዎና ሶፋዎ እንድያምሪሎት ይፈልጋሉ？እንግድያዉስ ትኪክለኛው ቦታ ላይ ኖት፤ 
                                ከ'ኛጋ ይማከሩ እናስደስቶታለን።</p>
                        </div>
                        <div class="mb-0 mb-md-5" id="divCustomWelcome" runat="server" style="border: solid 1px #2AC97A; border-left: solid 8px #2AC97A; padding: 10px; color: #fff; margin-top: 20px; border-radius: 2px; background-color: rgba(0, 0, 0, 0.4)">
                    <span class="text-center" runat="server">
                        <i class="fa fa-check-circle"></i> Welcome Dear 
                    <span id="spnUserFullName" runat="server" class=" text-capitalize text-decoration-underline skyname"></span>
                        You have Successfuly logedin.
                    </span>
                </div>
                        <h5 class=" mt-2 mt-md-5"><a href="DrapeCloths.aspx" class="btn btn-primary"> 
                            <i class="fa fa-images"></i> የመጋረጃ ጨርቆች ያገኙ </a></h5>
                        <%--<h6 class=" ">Nulla vitae elit libero, a pharetra augue mollis interdum.</h6>--%>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../5Assets/3Images/ss1.jpg" class="d-block w-100" alt="..." style="max-height: 700px;" />
                    <div class="carousel-caption">
                        <h5><a href="DrapeCloths.aspx" class="btn btn-primary"> <i class="fa fa-images"></i> የሶፋ ጨርቆች ያገኙ </a></h5>
                        <%--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>--%>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </a>
        </div>
        
       <br />
       <br />
       <%-- <div class="row justify-content-center mb-5">
            <div class="col-12" style="background-image: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.8)), url('../5Assets/3Images/1.jpg'); background-repeat: no-repeat; min-height: 350px; padding: 10px; background-attachment: fixed; background-size: 100% 100%; width: 100%;">
                
                <div class="" id="divCustomWelcome" runat="server" style="border: solid 1px #2AC97A; border-left: solid 8px #2AC97A; padding: 10px; color: #fff; margin-top: 20px; border-radius: 2px;">
                    <span class="text-center" runat="server">
                        <i class="fa fa-check-circle"></i> Welcome Dear 
                    <span id="spnUserFullName" runat="server" class=" text-capitalize text-decoration-underline skyname">rrr</span>
                        You have Successfuly logedin.
                    </span>
                </div>
                <div class=" mt-5"><h5 class=" text-center text-light"> እቤትዎ ስገቡ ደስ እንድሎት ይፈሊጋሉ？ እንግድያውስ የቤትዎ ሶፋዎና መጋረጃዎች እናሳምሪሎት።  </h5></div>

                <div class=" d-flex justify-content-center">
                    <div class="col-sm-6 m-2 m-sm-5 ">
                        <div class="d-flex justify-content-between">
                            <a href="MyAccount.aspx" class="btn btn-outline-Pa-Sky m-2"> <i class="fa fa-cart-plus"></i> |My Account</a>
                            <a href="Help.aspx" class="btn btn-outline-Pa-Sky m-2"> <i class="fa fa-question"></i> | Get Help</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        
        <div class="text-muted">
            <h2 class="text-center mt-3">የምንሰራቸው ስራዎች</h2>
        <hr />
        </div>

        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/Curtain%20And%20Sofa%201.jpg" alt="Curtain work" style="width: 100%" />
                    <h3 class="pt-2">ሙሉ የመጋረጃ ስራ</h3>
                    
                    <p>የፈለጉት የመጋረጃ ጨርቅ ይምረጡና ይዘዙን። እኛ የመጋረጃዎ ስፋት ለክተን፤ በፈለጉት ዲዛይን ሰፍተን እቤትዎ እናደርስሎታለን።</p>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#staticCurtainModal" disabled="disabled">በ <span> 63 </span> ዓይነት ጨርቆች</button>
                </div>
            </div>
            <div class="col-md-4  mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/Curtain%20and%20Sofa.jpg" alt="Sofa textile work" style="width: 100%" />
                    <h3 class="pt-2">ሙሉ የሶፋ ልብስ ስራ</h3>
                    <p>ሶፋዎ በምፈልጉት የሶፋ ዲዛይን፣ የጨርቆች ብዛትና የጨርቅ ዓይነቶች ሰፍተን ከ2 በማይበልጡ ቀናት እንሰራሎታለን።</p>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#staticSofaModal">ከ <span> 45 </span> የሶፋ ጨርቆች</button>
                </div>
            </div>
            
            <div class="col-md-4  mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/Hangers.jpg" alt="Curtain Accessories" style="width: 100%" />
                    <h3 class="pt-2">የመጋረጃ ኣክሰሰሪዎች</h3>
                    <p>የመጋረጃ ኣክሰሰርዎች ማለትም መስቀያ፤ ማስያዣዎች፤ ሁክ፤ ጌጣጌጥና ሌሎች የመጋረጃ መግጠምያ እቃዎች በሚፈልጉት መጠን እንሸጣለን።</p>
                    <button type="button" disabled="disabled" data-bs-toggle="modal" data-bs-target="#staticAcceModal">ከ <span> ሙሉ </span> የመጋረጃ ኣክሰሰርዎች</button>
                </div>
            </div>
            <div class="col-md-4  mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/Drill/drl2.png" alt="Drilling" style="width: 100%" />
                    <h3 class="pt-2">የመግጠምና የእድሳት ስራ</h3>
                    <p>መጋረጃዎ እድሳት ያሰፈልገዋል？ እንግድያውስ ወደ የሚፈልጉት የመጋረጃ ድዛይን በሚፈልጉት የመጋረጃ ኣክሰሰርዎች በጥራት እናድስሎታለን። የተፈታ የመጋረጃ መስቀያም እንገጥማለን።</p>
                    <button type="button" disabled="disabled" data-bs-toggle="modal" data-bs-target="#staticAcceModal">ጥራት ያለው እድሳት</button>
                </div>
            </div>
            <div class="col-md-4  mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/Delivery/deliver4.jpg" alt="Order Delivering" style="width: 100%" />
                    <h3 class="pt-2">ትዛዝ እቤትዎ ማድረስ</h3>
                    <p>እኛጋ መጥተው የመጋረጃዎና የሶፋዎ ጨርቅ ለማዘዝና ለመውሰድ ግዜ የሎዎትም？ ኣያሳስቦት ብቻ እኛን ያሳውቁንና ሙሉ ስራዉን ሰርተን እቤትዎ እናደርስሎታለን። </p>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#staticAcceModal">በቅናሽ የማድረስ ዋጋ</button>
                </div>
            </div>
            <div class="col-md-4  mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/consult1.jpeg" alt="Customer Consulting" style="width: 100%" />
                    <h3 class="pt-2">ደንበኞች ማማከር</h3>
                    <p> ሶፋዎና መጋረጃዎ ስንት እደሚፈጅ በደንብ የማያውቁ ከሆኑ ከኛጋ ይሁኑና እናማክሮታለን። በተጨማሪም የሶፋዎና የመጋረጃዎ ቀለም ከ የቤትዎ የውስጠኛው ቀለም የሚስማማ እናማርጦታለን።</p>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#staticAcceModal" disabled="disabled">ልምድ ባላቸው  ባለሙያዎቻችን</button>
                </div>
            </div>
        </div>

        <div class="text-muted mt-5">
            <h2 class="text-center mt-3">የትዛዝ ኣፈፃፀም</h2>
            <h6 class="text-center text-uppercase">ያዘዝቱን ትዛዝ ስፈፀም የምከተሉት ኣከሄዶች የምከተል ይሆናል።</h6>
        <hr />
            <div class="col-12 mt-3">
                    <div class="row">
                        <div class="col-sm mt-2">
                            <h5 class="text-center">1, ምርጫዎን ይላኩልን</h5>
                            <p class="text-center"> ከምኒሰራቸው ስራዎች የሚፈሊጉት ምርጫዎ ያሳውቁንና ልምድ ባላቸው ሰራቶቻችን በጥራት እናሰራሎታለን።  </p>
                        </div>
                        
                        <div class="col-sm  mt-2">
                            <h5 class="text-center">2, ቀብድ ይክፈሉ</h5>
                            <p class="text-center"> ቀብድ ሳይከፍሉን ትዛዝዎ መስራት ኣንጀምርም። ቀብድ ስከፍሉ ግን ሰርተን የምናደርስሎት ቀጠሮ እሰጦታለን።</p>
                        </div>
                        <div class="col-sm  mt-2">
                            <h5 class="text-center">3, ስራዉን ጨርሰን እናደርስሎታለን</h5>
                            <p class="text-center"> በትዛዝዎና በቀጠሮ ሰዓታችን እቤትዎ እናደርስሎታለን።</p>
                        </div>
                        <div class="col-sm  mt-2">
                            <h5 class="text-center">4, ቀሪዉን ይከፍላሉ</h5>
                            <p class="text-center"> የሰራንሎት ስራ ከወደዱት ቀሪ ክፍያው ስከፍሉን እናስረክቦታለን። </p>
                        </div>
                        
                    </div>
                </div>
        </div>

        <div class="text-muted mt-5">
            <h2 class="text-center mt-3">ለምን እኛን ይመርጣሉ?</h2>
            <p class="text-center text-uppercase">WE SELL ORIGINAL PRODUCTS, FAST AND LOW-COST DELIVERY, PERFECT WORK AND WE RECOMMEND OUR CUSTOMERS HOW THEY CAN CHOOSE THE BEST MATCH OF THEIR SOFA AND CURTAIN WITH THE INTERIOR PART OF THEIR HOUSE..</p>
        <hr />
        </div>
       <div class="m-sm-5">
            <div class="alert alert-success alert-dismissible fade show" role="alert" id="divAlertSuccess" runat="server">
                    <span id="spnSuccessAlertText" runat="server"><i class="fa fa-check-circle"></i> Your Message has been sent successfuly.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="divAlertError" runat="server">
                    <span id="spnErrorAlertText" runat="server"><i class="fa fa-times-circle"></i> Somthing went wrong! Try again.</span>
                    <button class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <div class="card shadow-lg mt-3">
                <header class="card-header">
                    <h6 class=" text-center skywelcome">If any Feedback, Message us here. </h6>
                </header>

                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4 mb-2">
                            <label>Full Name</label>
                            <asp:TextBox ID="tbFeedBackerName" runat="server" class="form-control" required="required" onkeypress="return onlyLetterKey(event)"></asp:TextBox>
                        </div>
                        <div class="col-sm-4 mb-2">
                            <label>Phone Number</label>
                            <asp:TextBox ID="tbFeedBackerPhoneNo" runat="server" class="form-control" required="required" MaxLength="10" onkeypress="return onlyNumberKey(event)"></asp:TextBox>
                        </div>
                        <div class="col-sm-4 mb-2">
                            <label>Subject</label>
                            <asp:TextBox ID="tbFeedBackSubject" runat="server" class="form-control" required="required"></asp:TextBox>
                        </div>

                        <div class="col-sm-12 mb-2">
                            <label>Message <small> (< 300 Characters)</small></label>
                            <asp:TextBox ID="tbFeedBackDetail" runat="server" TextMode="multiline" Rows="5" class="form-control" required="required"></asp:TextBox>
                        </div>
                    </div>

                    <div class="justify-content-center mt-3 mb-2">
                        <h6 class="text-center">
                            <asp:Button ID="btnSendFeedBack" runat="server" class="btn login-button" Text="Send" OnClick="btnSendFeedBack_Click" /></h6>
                    </div>
                </div>
            </div>

            
        </div>
    </div>
    
</asp:Content>

