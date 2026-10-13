<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {

        PreparedStatement ps = conn.prepareStatement(
            "SELECT * FROM user WHERE username=? AND password=?"
        );
        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("role", rs.getString("role"));
            session.setAttribute("id_user", rs.getInt("id_user"));

            String role = rs.getString("role");

            if ("admin".equals(role)) {
                response.sendRedirect("admin/dashboard.jsp");
            } else if ("outlet".equals(role)) {
                response.sendRedirect("outlet/dashboard.jsp");
            } else {
                response.sendRedirect("owner/dashboard.jsp");
            }
        } else {
            out.println("<script>alert('Username atau Password salah');location='index.jsp';</script>");
        }
    }
%>
