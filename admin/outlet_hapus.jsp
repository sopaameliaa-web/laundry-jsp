<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

PreparedStatement ps = conn.prepareStatement(
    "DELETE FROM outlet WHERE id_outlet=?"
);
ps.setInt(1, id);
ps.executeUpdate();

response.sendRedirect("outlet.jsp");
%>
