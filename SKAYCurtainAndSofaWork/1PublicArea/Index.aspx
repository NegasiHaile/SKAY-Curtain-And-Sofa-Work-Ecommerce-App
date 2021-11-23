<%@ Page Title="" Language="C#" MasterPageFile="~/1PublicArea/PublicArea.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="_1PublicArea_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
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
    <div class=" container-fluid" style="font-family: Arial; margin-top: 72px; width: 100%;">
        
        <div class="row justify-content-center mb-5" style="">
            <div class="col-12 bgd-img-c0l-3" style="background-image: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.6)), url('../5Assets/3Images/4.jpg');">

                <div class="m-2 m-sm-5 ">
                    <p class="landing-text">
                        Welcome to S.K.A.Y Curtain and Sofa Textile work
                    <br />
                        <span class="mt-1 d-none d-sm-block">እንኳን ወደ ስካይ የመጋረጃና የሶፋ ጨርቃ ጨርቅ ስራ <br /> በደህና መጡ！<br /> <i class="fas fa-map-marker-alt"></i>Addis Ababa, ETHIOPIA</span>
                        <br />
                    </p>
                    <h4 class=" text-center text-light" style="font-family:'Lucida Calligraphy'">ሶፋዎና መጋረጃዎ ማስዋብ ከፈለጉ፣ ከኛ ጋር ይማከሩ!</h4>
                </div>

            </div>
        </div>
        <div class="text-muted">
            <h2 class="text-center mt-3">የምንሰራቸው ስራዎች</h2>
        <hr />
        </div>

        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/Curtain%20And%20Sofa%201.jpg" alt="Denim Jeans" style="width: 100%" />
                    <h3 class="pt-2">ሙሉ የመጋረጃ ስራ</h3>
                    
                    <p>የፈለጉት የመጋረጃ ጨርቅ ይምረጡና ይዘዙን። እኛ የመጋረጃዎ ስፋት ለክተን፤ በፈለጉት ዲዛይን ሰፍተን እቤትዎ እናደርስሎታለን።</p>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#staticCurtainModal" disabled="disabled">በ <span> 63 </span> ዓይነት ጨርቆች</button>
                </div>
            </div>
            <div class="col-md-4  mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/Curtain%20and%20Sofa.jpg" alt="Denim Jeans" style="width: 100%" />
                    <h3 class="pt-2">ሙሉ የሶፋ ልብስ ስራ</h3>
                    <p>ሶፋዎ በምፈልጉት የሶፋ ዲዛይን፣ የጨርቆች ብዛትና የጨርቅ ዓይነቶች ሰፍተን ከ2 በማይበልጡ ቀናት እንሰራሎታለን።</p>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#staticSofaModal">ከ <span> 45 </span> የሶፋ ጨርቆች</button>
                </div>
            </div>
            
            <div class="col-md-4  mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/Hangers.jpg" alt="Denim Jeans" style="width: 100%" />
                    <h3 class="pt-2">በቂ የመጋረጃ ኣክሰሰሪዎች</h3>
                    <p>የመጋረጃ ኣክሰሰርዎች ማለትም መስቀያ፤ ማስያዣዎች፤ ሁክ፤ ጌጣጌጥና ሌሎች የመጋረጃ መግጠምያ እቃዎች በሚፈልጉት መጠን እንሸጣለን።</p>
                    <button type="button" disabled="disabled" data-bs-toggle="modal" data-bs-target="#staticAcceModal">ከ <span> ሙሉ </span> የመጋረጃ ኣክሰሰርዎች</button>
                </div>
            </div>
            <div class="col-md-4  mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/Drill/drl2.png" alt="Denim Jeans" style="width: 100%" />
                    <h3 class="pt-2">የመግጠምና የእድሳት ስራ</h3>
                    <p>መጋረጃዎ እድሳት ያሰፈልገዋል？ እንግድያውስ ወደ የሚፈልጉት የመጋረጃ ድዛይን በሚፈልጉት የመጋረጃ ኣክሰሰርዎች በጥራት እናድስሎታለን። የተፈታ የመጋረጃ መስቀያም እንገጥማለን።</p>
                    <button type="button" disabled="disabled" data-bs-toggle="modal" data-bs-target="#staticAcceModal">ጥራት ያለው እድሳት</button>
                </div>
            </div>
            <div class="col-md-4  mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/Delivery/deliver.jpg" alt="Denim Jeans" style="width: 100%" />
                    <h3 class="pt-2">ትዛዝ እቤትዎ ማድረስ</h3>
                    <p>እኛጋ መጥተው የመጋረጃዎና የሶፋዎ ጨርቅ ለማዘዝና ለመውሰድ ግዜ የሎዎትም？ ኣያሳስቦት ብቻ እኛን ያሳውቁንና ሙሉ ስራዉን ሰርተን እቤትዎ እናደርስሎታለን። </p>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#staticAcceModal">በቅናሽ የማድረስ ዋጋ</button>
                </div>
            </div>
            <div class="col-md-4  mb-4">
                <div class="sKYcard">
                    <img class="imgSize" src="../5Assets/3Images/consult1.jpeg" alt="Denim Jeans" style="width: 100%" />
                    <h3 class="pt-2">ስለመጋረጃና ሶፋ ማማከር</h3>
                    <p> ሶፋዎና መጋረጃዎ ስንት እደሚፈጅ በደንብ የማያውቁ ከሆኑ ከኛጋ ይሁኑና እናማክሮታለን። በተጨማሪም የሶፋዎና የመጋረጃዎ ቀለም ከ የቤትዎ የውስጠኛው ቀለም የሚስማማ እናማርጦታለን።</p>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#staticAcceModal" disabled="disabled">ልምድ ባላቸው  ባለሙያዎቻችን</button>
                </div>
<%--                <!-- Sofa Modal -->
                <div class="modal fade" id="staticAcceModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticAcceLabel">About Sofa</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ...
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>--%>
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
    </div>
</asp:Content>

