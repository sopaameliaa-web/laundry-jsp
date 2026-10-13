<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
Statement st = conn.createStatement();

/* ===== TOTAL PENGHASILAN ===== */
double totalHarian = 0;
double totalBulanan = 0;
double totalTahunan = 0;

/* HARI INI */
ResultSet rsHarian = st.executeQuery(
    "SELECT IFNULL(SUM(total_harga),0) AS total " +
    "FROM transaksi WHERE DATE(tanggal) = CURDATE()"
);
if(rsHarian.next()) totalHarian = rsHarian.getDouble("total");

/* BULAN INI */
ResultSet rsBulanan = st.executeQuery(
    "SELECT IFNULL(SUM(total_harga),0) AS total " +
    "FROM transaksi WHERE MONTH(tanggal) = MONTH(CURDATE()) " +
    "AND YEAR(tanggal) = YEAR(CURDATE())"
);
if(rsBulanan.next()) totalBulanan = rsBulanan.getDouble("total");

/* TAHUN INI */
ResultSet rsTahunan = st.executeQuery(
    "SELECT IFNULL(SUM(total_harga),0) AS total " +
    "FROM transaksi WHERE YEAR(tanggal) = YEAR(CURDATE())"
);
if(rsTahunan.next()) totalTahunan = rsTahunan.getDouble("total");

/* ===== JUMLAH DATA ===== */
ResultSet rsTrans = st.executeQuery("SELECT COUNT(id_transaksi) AS jumlah FROM transaksi");
int jTransaksi = 0;
if(rsTrans.next()) jTransaksi = rsTrans.getInt("jumlah");

ResultSet rsPelanggan = st.executeQuery("SELECT COUNT(id_pelanggan) AS jumlah FROM pelanggan");
int jPelanggan = 0;
if(rsPelanggan.next()) jPelanggan = rsPelanggan.getInt("jumlah");

ResultSet rsOutlet = st.executeQuery("SELECT COUNT(id_outlet) AS jumlah FROM outlet");
int jOutlet = 0;
if(rsOutlet.next()) jOutlet = rsOutlet.getInt("jumlah");

/* ===== TRANSAKSI TERBARU ===== */
ResultSet rsData = st.executeQuery(
    "SELECT t.id_transaksi, t.invoice, t.status, t.total_harga, p.nama " +
    "FROM transaksi t JOIN pelanggan p ON p.id_pelanggan = t.id_pelanggan " +
    "ORDER BY t.id_transaksi DESC LIMIT 10"
);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard ADMIN</title>

<style>
body{margin:0;font-family:Arial;background:#f4f4f4;}
.layout{display:flex;min-height:100vh;}

.sidebar{
    width:220px;
    background:#7b1fa2;
    color:white;
    padding:20px;
}
.sidebar h3{text-align:center;margin-bottom:30px;}
.sidebar a{
    display:block;
    color:white;
    padding:12px;
    margin-bottom:10px;
    text-decoration:none;
    border-radius:6px;
    background:#8e24aa;
}

.main{flex:1;display:flex;flex-direction:column;}

.header{
    background:violet;
    padding:20px;
    color:white;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.owner-menu a{
    background:#7b1fa2;
    color:white;
    padding:10px 16px;
    border-radius:6px;
    text-decoration:none;
    font-weight:bold;
}

.container{padding:20px;}

.cards,.summary{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:20px;
    margin-bottom:20px;
}

.card{
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 4px 8px rgba(0,0,0,.1);
}

.card h3,.card h4{margin:0;color:#555;}
.card p{font-size:24px;font-weight:bold;margin-top:10px;}

.table-box{
    background:white;
    padding:20px;
    border-radius:10px;
}

table{width:100%;border-collapse:collapse;}
th,td{border:1px solid #ddd;padding:8px;text-align:center;}
th{background:#eee;}
</style>
</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->
    <div class="sidebar">
      <h2>ADMIN</h2>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="outlet.jsp">Outlet</a>
    <a href="paket.jsp">Paket</a>
    <a href="pengguna.jsp">Pengguna</a>
    <a href="pelanggan.jsp">Pelanggan</a>
    <a href="transaksi.jsp">Transaksi</a>
    <a href="laporan.jsp">Laporan</a>
    <a href="../logout.jsp">Logout</a>
    </div>

    <!-- KONTEN -->
    <div class="main">

        <div class="header">
            <h2>Dashboard ADMIN</h2>
            <div class="owner-menu">
                <a href="../logout.jsp">Logout</a>
            </div>
        </div>

        <div class="container">

            <!-- RINGKASAN -->
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

            <!-- JUMLAH DATA -->
            <div class="cards">
                <div class="card"><h3>Outlet</h3><p><%= jOutlet %></p></div>
                <div class="card"><h3>Pelanggan</h3><p><%= jPelanggan %></p></div>
                <div class="card"><h3>Transaksi</h3><p><%= jTransaksi %></p></div>
            </div>

            <!-- TRANSAKSI TERBARU -->
            <div class="table-box">
                <h3>Transaksi Terbaru</h3>
                <table>
                    <tr>
                        <th>No</th>
                        <th>Invoice</th>
                        <th>Pelanggan</th>
                        <th>Status</th>
                        <th>Total</th>
                    </tr>
                    <%
                    int no = 1;
                    while(rsData.next()){
                    %>
                    <tr>
                        <td><%= no++ %></td>
                        <td><%= rsData.getString("invoice") %></td>
                        <td><%= rsData.getString("nama") %></td>
                        <td><%= rsData.getString("status") %></td>
                        <td>Rp <%= rsData.getDouble("total_harga") %></td>
                    </tr>
                    <% } %>
                </table>
            </div>

        </div>
    </div>

</div>

</body>
</html>
