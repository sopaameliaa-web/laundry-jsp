<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
int id_user = Integer.parseInt(request.getParameter("id_user"));
String nama = request.getParameter("nama");
String username = request.getParameter("username");
String password = request.getParameter("password");
String role = request.getParameter("role");

try {
    PreparedStatement ps = conn.prepareStatement(
        "UPDATE user SET nama=?, username=?, password=?, role=? WHERE id_user=?"
    );
    ps.setString(1, nama);
    ps.setString(2, username);
    ps.setString(3, password);
    ps.setString(4, role);
    ps.setInt(5, id_user);
    
    ps.executeUpdate();
    ps.close();
    conn.close();

    response.sendRedirect("pengguna.jsp"); // kembali ke halaman data pengguna
} catch(Exception e){
    out.println("Error: " + e.getMessage());
}
%>
