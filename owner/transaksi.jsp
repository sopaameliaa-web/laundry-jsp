<%-- 
    Document   : transaksi
    Created on : Dec 24, 2025, 12:43:37 PM
    Author     : ASUS
--%>
<%@ include file="../koneksi.jsp" %>

<a href="javascript:history.back()" class="btn-kembali">Kembali</a>

<h2>Transaksi</h2>
<a href="transaksi_tambah.jsp">+ Tambah</a>

<table border="1">
<tr>
<th>Invoice</th><th>Pelanggan</th><th>Status</th>
<th>Pembayaran</th><th>Total</th><th>Aksi</th>
</tr>

<%
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(
"SELECT t.*, p.nama FROM transaksi t JOIN pelanggan p ON t.id_pelanggan=p.id_pelanggan"
);
while(rs.next()){
%>

<tr>
<td><%=rs.getString("invoice")%></td>
<td><%=rs.getString("nama")%></td>
<td><%=rs.getString("status")%></td>
<td>
<%
    if (rs.getDouble("total_bayar") >= rs.getDouble("total_harga")) {
        out.print("Dibayar");
    } else {
        out.print("Belum");
    }
%>
</td>

<td>Rp <%=rs.getDouble("total_harga")%></td>

<td>
<a href="transaksi_detail.jsp?id=<%=rs.getInt("id_transaksi")%>">Detail</a>
</td>
</tr>
<% } %>
</table>

<link rel="stylesheet" href="style.css">