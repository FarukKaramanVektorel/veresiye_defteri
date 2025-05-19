<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/EnKa.master" AutoEventWireup="true" CodeFile="MusteriEkleGuncelle.aspx.cs" Inherits="yonetim_MusteriEkleGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-5">

            <div class="row">
                <div class="col-lg-12">
                    <div class="p-3">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Müşteri Ekle!</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row m-4">
                <div class="col-lg-2">Müşteri Adı</div>
                <div class="col-lg-2">
                    <asp:TextBox class="form-control form-control-user" ID="txtAd" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtAd"
                        ErrorMessage="Doldurulmamıştır."
                        ValidationGroup="ButonlaCalisacak"></asp:RequiredFieldValidator>
                </div>
                <div class="col-lg-2">Müşteri Soyadı</div>
                <div class="col-lg-2">
                    <asp:TextBox class="form-control form-control-user" ID="txtSoyad" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtSoyad"
                        ErrorMessage="Doldurulmamıştır."
                        ValidationGroup="ButonlaCalisacak"></asp:RequiredFieldValidator>
                </div>
                <div class="col-lg-2">Müşteri Telefon</div>
                <div class="col-lg-2">
                    <asp:TextBox class="form-control form-control-user" ID="txtTelefon" runat="server" MaxLength="11"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="txtTelefon"
                        ErrorMessage="Doldurulmamıştır."
                        ValidationGroup="ButonlaCalisacak"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CepKoduSayisalKontrolu"
                        runat="server"
                        ControlToValidate="txtTelefon"
                        ErrorMessage="Telefon No Girmelisiniz."
                        Operator="DataTypeCheck" Type="Double" ValidationGroup="ButonlaCalisacak" />
                </div>
            </div>


            <div class="row m-4">

                <div class="col-lg-2">Müşteri Adres</div>
                <div class="col-lg-4">
                    <asp:TextBox class="form-control form-control-user" ID="txtAdres" runat="server" Height="70px" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="col-lg-2">Açıklama</div>
                <div class="col-lg-4">
                    <asp:TextBox class="form-control form-control-user" ID="txtAciklama" runat="server" Height="70px" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div class="row m-4">
                <div class="col-lg-12">
                    <asp:Label ID="lblDurum" runat="server" Text=""></asp:Label>

                </div>
            </div>
            <div class="row m-4">
                <div class="col-5">
                    <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-user btn-block" Text="Kaydet" OnClick="Button1_Click" ValidationGroup="ButonlaCalisacak" />
                    <asp:Button ID="Button2" runat="server" class="btn btn-primary btn-user btn-block" Text="Güncelle" OnClick="Button2_Click" ValidationGroup="ButonlaCalisacak" />


                </div>
                <div class="col-5">
                    <asp:Button ID="Button3" runat="server" class="btn btn-danger btn-user btn-block" Text="sil" OnClick="Button3_Click" ValidationGroup="ButonlaCalisacak" />

                </div>
            </div>


            <asp:Label ID="lblMesaj" runat="server" Text="" Style="color: #CC3300; font-weight: 700"></asp:Label>
        </div>
    </div>
</asp:Content>

