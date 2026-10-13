<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
int id_user = Integer.parseInt(request.getParameter("id"));

try {
    PreparedStatement ps = conn.prepareStatement(
        "DELETE FROM user WHERE id_user = ?"
    );
    ps.setInt(1, id_user);
    int result = ps.executeUpdate();

    ps.close();
    conn.close();

    if(result > 0){
        response.sendRedirect("pengguna.jsp");
    } else {
        out.println("Gagal menghapus data!");
    }

} catch(Exception e){
    out.println("Error: " + e.getMessage());
}
%>
