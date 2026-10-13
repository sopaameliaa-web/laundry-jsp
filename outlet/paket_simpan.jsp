<%@ include file="../koneksi.jsp" %>
<%
PreparedStatement ps = conn.prepareStatement(
 "INSERT INTO paket VALUES(null,?,?,?,?)"
);
ps.setString(1, request.getParameter("nama"));
ps.setString(2, request.getParameter("jenis"));
ps.setDouble(3, Double.parseDouble(request.getParameter("harga")));
ps.setInt(4, Integer.parseInt(request.getParameter("outlet")));
ps.executeUpdate();
response.sendRedirect("paket.jsp");
%>
