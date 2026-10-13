<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Laporan Transaksi</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">

<script src="script.js" defer></script>
</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <h3>ADMIN</h3>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="outlet.jsp">Outlet</a>
    <a href="paket.jsp">Paket</a>
    <a href="pengguna.jsp">Pengguna</a>
    <a href="pelanggan.jsp">Pelanggan</a>
    <a href="transaksi.jsp">Transaksi</a>
    <a href="laporan.jsp">Laporan</a>
    <a href="../logout.jsp">Logout</a>
    </div>

    <!-- CONTENT -->
    <div class="content">

        <a href="javascript:history.back()" class="btn-kembali">Kembali</a>
        <h2>Laporan Transaksi Laundry</h2>

        <%-- ================== LOGIC JSP TETAP DI SINI ================== --%>
        <%
        double totalHarian  = 0;
        double totalBulanan = 0;
        double totalTahunan = 0;

        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery(
            "SELECT IFNULL(SUM(total_harga),0) total FROM transaksi " +
            "WHERE DATE(tanggal)=CURDATE() AND status='diambil'"
        );
        if(rs1.next()) totalHarian = rs1.getDouble("total");

        Statement st2 = conn.createStatement();
        ResultSet rs2 = st2.executeQuery(
            "SELECT IFNULL(SUM(total_harga),0) total FROM transaksi " +
            "WHERE MONTH(tanggal)=MONTH(CURDATE()) AND YEAR(tanggal)=YEAR(CURDATE()) " +
            "AND status='diambil'"
        );
        if(rs2.next()) totalBulanan = rs2.getDouble("total");

        Statement st3 = conn.createStatement();
        ResultSet rs3 = st3.executeQuery(
            "SELECT IFNULL(SUM(total_harga),0) total FROM transaksi " +
            "WHERE YEAR(tanggal)=YEAR(CURDATE()) AND status='diambil'"
        );
        if(rs3.next()) totalTahunan = rs3.getDouble("total");
        %>

        <!-- SUMMARY -->
        <div class="summary">
            <div class="card">
                <h4>Penghasilan Hari Ini</h4>
                <p>Rp <%= totalHarian %></p>
            </div>
            <div class="card">
                <h4>Penghasilan Bulan Ini</h4>
                <p>Rp <%= totalBulanan %></p>
            </div>
            <div class="card">
                <h4>Penghasilan Tahun Ini</h4>
                <p>Rp <%= totalTahunan %></p>
            </div>
        </div>

        <!-- FILTER -->
        <form method="get" class="filter-box">
            <label>Dari</label>
            <input type="date" name="tgl1">
            <label>Sampai</label>
            <input type="date" name="tgl2">
            <button type="submit">Tampilkan</button>
        </form>

        <!-- TABLE -->
        <table>
            <tr>
                <th>Tanggal</th>
                <th>Invoice</th>
                <th>Pelanggan</th>
                <th>Total</th>
            </tr>

        <%
        String tgl1 = request.getParameter("tgl1");
        String tgl2 = request.getParameter("tgl2");

        if(tgl1 != null && tgl2 != null){
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(
                "SELECT t.invoice, p.nama, t.total_harga, DATE(t.tanggal) tgl " +
                "FROM transaksi t JOIN pelanggan p ON t.id_pelanggan=p.id_pelanggan " +
                "WHERE DATE(t.tanggal) BETWEEN '"+tgl1+"' AND '"+tgl2+"' " +
                "AND t.status='diambil'"
            );

            double total = 0;
            while(rs.next()){
                total += rs.getDouble("total_harga");
        %>
            <tr>
                <td><%=rs.getString("tgl")%></td>
                <td><%=rs.getString("invoice")%></td>
                <td><%=rs.getString("nama")%></td>
                <td>Rp <%=rs.getDouble("total_harga")%></td>
            </tr>
        <% } %>
            <tr>
                <th colspan="3">TOTAL</th>
                <th>Rp <%= total %></th>
            </tr>
        <% } %>
        </table>

    </div>
</div>

</body>
</html>
