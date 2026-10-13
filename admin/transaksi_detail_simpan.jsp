<%-- 
    Document   : transaksi_detail_simpan
    Created on : Dec 24, 2025, 7:38:32 PM
    Author     : ASUS
--%>
<%@ include file="../koneksi.jsp" %>
<%
int idTrans = Integer.parseInt(request.getParameter("id_transaksi"));
int idPaket = Integer.parseInt(request.getParameter("id_paket"));
double qty = Double.parseDouble(request.getParameter("qty"));

Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("SELECT harga FROM paket WHERE id_paket="+idPaket);
rs.next();

double harga = rs.getDouble("harga");
double subtotal = harga * qty;

st.executeUpdate(
 "INSERT INTO transaksi_detail VALUES (NULL,"+idTrans+","+idPaket+","+qty+","+harga+","+subtotal+")"
);

// update total transaksi
st.executeUpdate(
 "UPDATE transaksi SET total_harga=(SELECT SUM(subtotal) FROM transaksi_detail WHERE id_transaksi="+idTrans+") WHERE id_transaksi="+idTrans
);

response.sendRedirect("transaksi_detail.jsp?id="+idTrans);
%>
