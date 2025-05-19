<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/EnKa.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="yonetim_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>


</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <!-- Begin Page Content -->
    <div class="container-fluid">


        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Ana Sayfa</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i># </a>
        </div>


        <div class="row">
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                    Toplam Müşteri
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <asp:Label ID="lblMusteri" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-user fa-2x text-gray"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                    Toplam Satış
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <asp:Label ID="lblTSatis" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                    Toplam Alınan
                                </div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                                            <asp:Label ID="lblAlinan" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                    Toplam Alınacak
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <asp:Label ID="lblAlinacak" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
          <div class="col-xl-12 col-md-12 mb-4">
            <table class="display" id="example" width="100%">
                <thead>
                    <tr>
                        <th>Adı Soyadı</th>
                        <th>Telefonu</th>
                        <th>Açıklama</th>
                        <th>Bilgiler</th>
                        <th>Toplam Borç</th>
                        <th>Durum</th>

                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Adı Soyadı</th>
                        <th>Telefonu</th>
                        <th>Açıklama</th>
                        <th>Bilgiler</th>
                        <th>Toplam Borç</th>
                        <th>Durum</th>
                    </tr>
                </tfoot>
                <tbody>
                    <asp:Literal ID="lblMusteriler" runat="server"></asp:Literal>


                </tbody>
            </table>
            <script>
                $(document).ready(function () {
                    $('#example').DataTable();
                });
            </script>
              </div>
        </div>
    </div>




</asp:Content>

