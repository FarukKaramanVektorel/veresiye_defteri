<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/EnKa.master" AutoEventWireup="true" CodeFile="MusteriDetay.aspx.cs" Inherits="yonetim_MusteriDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">

            <div class="row">

                <div class="col-lg-12">
                    <div class="p-3">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Müşteri Detay!</h1>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-4 mb-3 mb-sm-0">
                                <asp:Label ID="lblMusteri" runat="server" Text="Adı Soyadı : "></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="lblTelefon" runat="server" Text="Telefonu : "></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="lblToplamAlinan" runat="server" Text="Toplam Alınan : " style="color: #000066; font-weight: 700"></asp:Label>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-4 mb-3 mb-sm-0">
                                <asp:Label ID="lblAciklama" runat="server" Text="Açıklama : "></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="lblAdres" runat="server" Text="Adresi : "></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="lblToplamOdenen" runat="server" Text="Toplam Ödenen : " style="color: #006600; font-weight: 700"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4 mb-3 mb-sm-0">
                                <asp:Label ID="Label1" runat="server" Text=" İşlem Yap "></asp:Label>
                                

                            </div>
                            <div class="col-sm-4">
                                
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="lblBorc" runat="server" Text="Toplam Borç : " style="color: #800000; font-weight: 700"></asp:Label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
         <div class="card shadow mb-4">        
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>İşlem</th>  
                            <th>Tarih</th>
                            <th>Ürün</th>
                            <th>Açıklama</th>
                             <th>Tutar</th>
                            <th>Düzenle</th>
                            

                        </tr>
                    </thead>
                   
                    <tbody>
                        <asp:Label ID="lblMusteriler" runat="server" Text=""></asp:Label>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
</div>
</asp:Content>

