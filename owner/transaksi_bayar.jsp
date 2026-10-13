<%@ include file="../koneksi.jsp" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
int bayar = Integer.parseInt(request.getParameter("bayar"));
String metode = request.getParameter("metode_bayar");

PreparedStatement ps = conn.prepareStatement(
    "UPDATE transaksi SET status_bayar='lunas', bayar=?, metode_bayar=?, tgl_bayar=CURDATE() WHERE id_transaksi=?"
);

ps.setInt(1, bayar);
ps.setString(2, metode);
ps.setInt(3, id);

ps.executeUpdate();

response.sendRedirect("transaksi_detail.jsp?id=" + id);
%>
