<%@ include file="../koneksi.jsp" %>
<%
PreparedStatement ps = conn.prepareStatement(
 "INSERT INTO pelanggan VALUES(null,?,?,?,?,?)"
);
ps.setString(1, request.getParameter("nama"));
ps.setString(2, request.getParameter("alamat"));
ps.setString(3, request.getParameter("jk"));
ps.setString(4, request.getParameter("telp"));
ps.setString(5, request.getParameter("ktp"));
ps.executeUpdate();
response.sendRedirect("pelanggan.jsp");
%>
