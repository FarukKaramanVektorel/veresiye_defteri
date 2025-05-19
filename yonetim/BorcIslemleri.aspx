<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/EnKa.master" AutoEventWireup="true" CodeFile="BorcIslemleri.aspx.cs" Inherits="yonetim_BorcOde" %>

<asp:Content ID="head1" ContentPlaceHolderID="head" runat="Server">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">

            <div class="row">

                <div class="col-lg-12">
                    <div class="p-3">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Cari İşlemler!</h1>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <asp:Label ID="label" runat="server" Text="Adı Soyadı : "></asp:Label>
                                <asp:Label ID="lblMusteri" runat="server" Text=" "></asp:Label>
                            </div>
                            <div class="col-sm-6">
                                <asp:Label ID="label11" runat="server" Text="Toplam Borç : "></asp:Label>
                                <asp:Label ID="lblBorc" runat="server" Text=""></asp:Label>
                            </div>
                        </div>


                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <asp:Label ID="Label1" runat="server" Text="Ürün"></asp:Label>
                                <asp:TextBox class="form-control form-control-user" ID="txtUrun" runat="server" Height="79px" TextMode="MultiLine" Width="441px"></asp:TextBox>

                            </div>
                            <div class="col-sm-6">
                                <asp:Label ID="lblAciklama" runat="server" Text="Açıklama : "></asp:Label>
                                <asp:TextBox class="form-control form-control-user" ID="txtAciklama" runat="server" Height="79px" TextMode="MultiLine" Width="441px"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <asp:Label ID="Label2" runat="server" Text="Tutar"></asp:Label>
                                <asp:TextBox class="form-control form-control-user" ID="txtTutar" runat="server" onkeypress="return SayiGirme(event)" TextMode="SingleLine" Width="441px"></asp:TextBox>

                            </div>
                            <div class="col-sm-1">
                                <asp:Label ID="Label3" runat="server" Text="İşlem"></asp:Label>
                                <asp:DropDownList ID="ddlİslem" runat="server">
                                    <asp:ListItem Value="1">Alış Veriş</asp:ListItem>
                                    <asp:ListItem Value="0">Borç Ödeme</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-sm-4 m-3">
                                İşlem Tarihi
                                <ajaxToolkit:MaskedEditExtender
                                    ID="MaskedEditExtender1"
                                    runat="server"
                                    DisplayMoney="Right"
                                    InputDirection="LeftToRight"
                                    TargetControlID="txtTarih"
                                    Mask="99/99/9999"
                                    MessageValidatorTip="true"
                                    MaskType="Date" />
                                <asp:TextBox ID="txtTarih" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender
                                    ID="TextBox1_CalendarExtender"
                                    runat="server"
                                    BehaviorID="TextBox1_CalendarExtender"
                                    TargetControlID="txtTarih"
                                    Format="dd/MM/yyyy" />
                                <ajaxToolkit:MaskedEditValidator 
                                    ID="MaskedEditValidator1" 
                                    runat="server"
                                    ControlToValidate="txtTarih"
                                    ControlExtender="MaskedEditExtender1"
                                    Display="Static"                                   
                                    EmptyValueMessage="Tarih Girilmedi!"
                                    InvalidValueMessage="Geçersiz Tarih!"
                                    Text="Hata"
                                    >

                                </ajaxToolkit:MaskedEditValidator>

                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                            </div>
                            <div class="col-sm-1">
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="lblDurum" runat="server" Text=""></asp:Label>
                                <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-user btn-block" Text="Kaydet" OnClick="Button1_Click" />

                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function SayiGirme(degisken) {
            if (event.keyCode > 47 && event.keyCode < 58 || event.keyCode == 46) {
                var txtbx = document.getElementById(txt);
                var amount = document.getElementById(txt).value;
                var present = 0;
                var count = 0;

                if (amount.indexOf(".", present) || amount.indexOf(".", present + 1));
                {
                    // alert('0');
                }

                /*if(amount.length==2)
                {
                  if(event.keyCode != 46)
                  return false;
                }*/
                do {
                    present = amount.indexOf(".", present);
                    if (present != -1) {
                        count++;
                        present++;
                    }
                }
                while (present != -1);
                if (present == -1 && amount.length == 0 && event.keyCode == 46) {
                    event.keyCode = 0;
                    //alert("Wrong position of decimal point not  allowed !!");
                    return false;
                }

                if (count >= 1 && event.keyCode == 46) {

                    event.keyCode = 0;
                    //alert("Only one decimal point is allowed !!");
                    return false;
                }
                if (count == 1) {
                    var lastdigits = amount.substring(amount.indexOf(".") + 1, amount.length);
                    if (lastdigits.length >= 2) {
                        //alert("Two decimal places only allowed");
                        event.keyCode = 0;
                        return false;
                    }
                }
                return true;
            }
            else {
                event.keyCode = 0;
                //alert("Only Numbers with dot allowed !!");
                return false;
            }

        }

    </script>


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
    </asp:ScriptManager>


</asp:Content>

