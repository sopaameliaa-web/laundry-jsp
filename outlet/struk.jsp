<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../koneksi.jsp" %>
<%
int id = Integer.parseInt(request.getParameter("id"));

PreparedStatement ps = conn.prepareStatement(
"SELECT t.*, p.nama, p.alamat " +
"FROM transaksi t JOIN pelanggan p ON t.id_pelanggan=p.id_pelanggan " +
"WHERE t.id_transaksi=?");
ps.setInt(1, id);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<title>Struk Pembayaran</title>
<style>
body{
    font-family: monospace;
}
.struk{
    width: 280px;
    margin: auto;
}
hr{
    border: 1px dashed #000;
}
@media print{
    button{display:none;}
}
</style>
</head>

<body onload="window.print()">

<div class="struk">
    <center>
        <h3>LAUNDRY SOPA</h3>
        <small>PANDEGLANG</small><br>
        <small>Telp: 083139830169</small>
    </center>

    <hr>

    Invoice : <%=rs.getString("invoice")%><br>
    Tanggal : <%=rs.getTimestamp("dibayar_pada")%><br>
    Pelanggan : <%=rs.getString("nama")%>

    <hr>

    Total Harga : Rp <%=rs.getDouble("total_harga")%><br>
    Dibayar : Rp <%=rs.getDouble("total_bayar")%><br>
    Kembalian : Rp <%=rs.getDouble("kembalian")%><br>
    Metode : <%=rs.getString("metode_bayar")%>

    <hr>

    <center>
        <small>Terima kasih 🙏</small><br>
        <small>Kepercayaan Anda Adalah Tanggung Jawab Kami</small>
    </center>

    <br>
    <center>
        <button onclick="window.print()">Cetak</button>
    </center>
</div>

</body>
</html>
