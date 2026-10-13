<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
String outletParam = request.getParameter("outlet");
String pelangganParam = request.getParameter("pelanggan");
String totalParam = request.getParameter("total");

if(outletParam == null || pelangganParam == null || totalParam == null){
    out.println("Data belum lengkap");
    return;
}

int idOutlet = Integer.parseInt(outletParam);
int idPelanggan = Integer.parseInt(pelangganParam);
double total = Double.parseDouble(totalParam);
String invoice = request.getParameter("invoice");

/* INSERT TRANSAKSI */
PreparedStatement ps = conn.prepareStatement(
    "INSERT INTO transaksi " +
    "(invoice, id_outlet, id_pelanggan, tanggal, status, total_harga) " +
    "VALUES (?, ?, ?, NOW(), 'baru', ?)"
);

ps.setString(1, invoice);
ps.setInt(2, idOutlet);
ps.setInt(3, idPelanggan);
ps.setDouble(4, total);

ps.executeUpdate();
response.sendRedirect("transaksi.jsp");
%>
