<%@ include file="../koneksi.jsp" %>
<%
int id = Integer.parseInt(request.getParameter("id_transaksi"));
String status = request.getParameter("status");

Statement st = conn.createStatement();

// cek lunas
ResultSet rs = st.executeQuery(
 "SELECT total_bayar, total_harga FROM transaksi WHERE id_transaksi=" + id
);
rs.next();

if (rs.getDouble("total_bayar") < rs.getDouble("total_harga")) {
    st.executeUpdate(
        "UPDATE transaksi SET status='" + status + "' WHERE id_transaksi=" + id
    );
}

// kalau lunas ? DIABAIKAN
response.sendRedirect("transaksi_detail.jsp?id=" + id);
%>
