<%-- 
    Document   : paket_hapus
    Created on : Dec 25, 2025, 8:33:51 AM
    Author     : ASUS
--%>
<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

PreparedStatement ps = conn.prepareStatement(
    "DELETE FROM paket WHERE id_paket=?"
);
ps.setInt(1, id);
ps.executeUpdate();

response.sendRedirect("paket.jsp");
%>
