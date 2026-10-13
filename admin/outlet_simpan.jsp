<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
String nama = request.getParameter("nama");
String owner = request.getParameter("owner");
String telp = request.getParameter("telp");
String alamat = request.getParameter("alamat");

PreparedStatement ps = conn.prepareStatement(
    "INSERT INTO outlet (nama_outlet, owner, telp, alamat) VALUES (?,?,?,?)"
);
ps.setString(1, nama);
ps.setString(2, owner);
ps.setString(3, telp);
ps.setString(4, alamat);

ps.executeUpdate();

response.sendRedirect("outlet.jsp");
%>
