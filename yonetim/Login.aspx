<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="yonetim_Login" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>En-Ka Çelik</title>  
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
    <form id="form1" runat="server">
       <div class="container">

       
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                       
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">--Giriş Formu--</h1>
                                    </div>
                                   
                                        <div class="form-group">
                                            <asp:TextBox placeholder="Kullanıcı Adı..." class="form-control form-control-user" ID="txtKadi" runat="server"></asp:TextBox>
                                           
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox placeholder="Parola" type="password" class="form-control form-control-user" ID="txtParola" runat="server"></asp:TextBox>
                                            
                                        </div>
                                    
                                       <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-user btn-block" Text="Giriş" OnClick="Button1_Click" />
                                    <p>
                                    <asp:Label ID="lblDurum" runat="server"  Text="" style="font-weight: 700; color: #990000"></asp:Label>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    </form>
</body>
</html>
