<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
String nama = request.getParameter("nama");
String owner = request.getParameter("owner");
String telp = request.getParameter("telp");
String alamat = request.getParameter("alamat");

PreparedStatement ps = conn.prepareStatement(
    "UPDATE outlet SET nama_outlet=?, owner=?, telp=?, alamat=? WHERE id_outlet=?"
);
ps.setString(1, nama);
ps.setString(2, owner);
ps.setString(3, telp);
ps.setString(4, alamat);
ps.setInt(5, id);

ps.executeUpdate();

response.sendRedirect("outlet.jsp");
%>
