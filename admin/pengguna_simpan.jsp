<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
String nama = request.getParameter("nama");
String username = request.getParameter("username");
String password = request.getParameter("password");
String role = request.getParameter("role");

try {
    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO user(nama, username, password, role) VALUES (?, ?, ?, ?)"
    );
    ps.setString(1, nama);
    ps.setString(2, username);
    ps.setString(3, password);
    ps.setString(4, role);

    int result = ps.executeUpdate(); // ini akan mengembalikan 1 jika berhasil
    if(result > 0){
        response.sendRedirect("pengguna.jsp");
    } else {
        out.println("Gagal menyimpan data!");
    }

    ps.close();
    conn.close();
} catch(Exception e){
    out.println("Error: " + e.getMessage());
}
%>
