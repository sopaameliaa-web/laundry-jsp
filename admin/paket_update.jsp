<%-- 
    Document   : paket_update
    Created on : Dec 24, 2025, 8:07:32 PM
    Author     : ASUS
--%>
<%@ include file="../koneksi.jsp" %>
<%
int id = Integer.parseInt(request.getParameter("id_paket"));
String nama = request.getParameter("nama_paket");
double harga = Double.parseDouble(request.getParameter("harga"));
String jk = request.getParameter("jk");
String ktp = request.getParameter("ktp");


Statement st = conn.createStatement();
st.executeUpdate(
 "UPDATE paket SET nama_paket='"+nama+"', harga="+harga+" WHERE id_paket="+id
);

response.sendRedirect("paket.jsp");
%>
