<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    if (id == null) {
        response.sendRedirect("pelanggan.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/laundry",
            "root",
            ""
        );

        PreparedStatement ps = c.prepareStatement(
            "DELETE FROM member WHERE id_member = ?"
        );
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();

        ps.close();
        c.close();

        response.sendRedirect("pelanggan.jsp");

    } catch (Exception e) {
        out.println("<pre>" + e + "</pre>");
    }
%>
