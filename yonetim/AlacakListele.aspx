<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/EnKa.master" AutoEventWireup="true" CodeFile="AlacakListele.aspx.cs" Inherits="yonetim_AlacakListele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="table">
  <thead>
    <tr>
      <th scope="col"><h1 class="h3 mb-2 text-gray-800">Alacak Listesi</h1></th>
      <th scope="col"><asp:Button ID="btnExtractToExcel" runat="server" Text="ExceleAktar" class="btn btn-danger" OnClick="btnExtractToExcel_Click" /></div></th>
      
    </tr>
  </thead>
      </table>
    
   
    

    <div class="card shadow mb-4">
        
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
    
</asp:Content>

