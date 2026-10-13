<%-- 
    Document   : koneksi
    Created on : Dec 24, 2025, 11:58:58 AM
    Author     : ASUS
--%>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/laundryjavaweb",
            "root",
            ""
        );
    } catch (Exception e) {
        out.println("Koneksi gagal: " + e.getMessage());
    }
%>
