<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim/EnKa.master" AutoEventWireup="true" CodeFile="CariCek.aspx.cs" Inherits="yonetim_CariCek" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h2>Cari Hareket Listesi</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ch_id" EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="ch_id" HeaderText="ID" ReadOnly="True" 
                    SortExpression="ch_id" />
                <asp:BoundField DataField="ch_urun" HeaderText="Ürün" SortExpression="ch_urun" />
                <asp:BoundField DataField="ch_tutar" HeaderText="Tutar" 
                    SortExpression="ch_tutar" />
                <asp:BoundField DataField="ch_tarih" HeaderText="Tarih" 
                    SortExpression="ch_tarih" />
                <asp:BoundField DataField="ch_aciklama" HeaderText="Açıklama" 
                    SortExpression="ch_aciklama" />
                <asp:BoundField DataField="m_id" HeaderText="Müşteri ID" 
                    SortExpression="m_id" />
                <asp:BoundField DataField="ch_harekettipi" HeaderText="Hareket Tipi" 
                    SortExpression="ch_harekettipi" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

