<%@ include file="../koneksi.jsp" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
double bayarBaru = Double.parseDouble(request.getParameter("bayar"));
String metode = request.getParameter("metode");

// ambil data lama
PreparedStatement ps1 = conn.prepareStatement(
    "SELECT total_harga, total_bayar FROM transaksi WHERE id_transaksi=?"
);
ps1.setInt(1, id);
ResultSet rs = ps1.executeQuery();
rs.next();

double totalHarga = rs.getDouble("total_harga");
double totalBayarLama = rs.getDouble("total_bayar");

double totalBayarBaru = totalBayarLama + bayarBaru;
double kembalian = totalBayarBaru - totalHarga;

// update pembayaran
PreparedStatement ps = conn.prepareStatement(
    "UPDATE transaksi SET total_bayar=?, bayar=?, kembalian=?, metode_bayar=?, dibayar_pada=NOW() WHERE id_transaksi=?"
);

ps.setDouble(1, totalBayarBaru);
ps.setDouble(2, bayarBaru);
ps.setDouble(3, kembalian > 0 ? kembalian : 0);
ps.setString(4, metode);
ps.setInt(5, id);

ps.executeUpdate();

// ? AUTO STATUS DIAMBIL JIKA LUNAS
if (totalBayarBaru >= totalHarga) {
    PreparedStatement psStatus = conn.prepareStatement(
        "UPDATE transaksi SET status='diambil' WHERE id_transaksi=?"
    );
    psStatus.setInt(1, id);
    psStatus.executeUpdate();
}

response.sendRedirect("transaksi.jsp");
%>
