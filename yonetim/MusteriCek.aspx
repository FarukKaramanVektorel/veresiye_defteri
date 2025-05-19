<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/EnKa.master" AutoEventWireup="true" CodeFile="MusteriCek.aspx.cs" Inherits="yonetim_MusteriDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h2>Müşteri Listesi</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" 
            DataKeyNames="m_id" EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="m_id" HeaderText="ID" ReadOnly="True" 
                    SortExpression="m_id" />
                <asp:BoundField DataField="m_ad" HeaderText="Ad" SortExpression="m_ad" />
                <asp:BoundField DataField="m_soyad" HeaderText="Soyad" 
                    SortExpression="m_soyad" />
                <asp:BoundField DataField="m_telefon" HeaderText="Telefon" 
                    SortExpression="m_telefon" />
                <asp:BoundField DataField="m_ceptel" HeaderText="Cep Telefonu" 
                    SortExpression="m_ceptel" />
                <asp:BoundField DataField="m_mail" HeaderText="E-mail" 
                    SortExpression="m_mail" />
                <asp:BoundField DataField="m_tc" HeaderText="TC Kimlik No" 
                    SortExpression="m_tc" />
                <asp:BoundField DataField="m_adres" HeaderText="Adres" 
                    SortExpression="m_adres" />
                <asp:BoundField DataField="m_aciklama" HeaderText="Açıklama" 
                    SortExpression="m_aciklama" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

