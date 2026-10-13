<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Laporan Transaksi</title>
<meta charset="UTF-8">

<style>
body{
    font-family:'Segoe UI', Arial;
    background:#f3f3f3;
    margin:0;
    padding:20px;
}

/* ===== BUTTON ===== */
.btn-kembali{
    display:inline-block;
    background:#6a1b9a;
    color:white;
    padding:10px 18px;
    border-radius:6px;
    text-decoration:none;
    font-weight:bold;
    margin-bottom:15px;
}
.btn-kembali:hover{
    background:#8e24aa;
}

/* ===== JUDUL ===== */
h2{
    margin-top:0;
    color:#6a1b9a;
}

/* ===== SUMMARY ===== */
.summary{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:20px;
    margin:25px 0;
}
.card{
    background:#fff;
    padding:20px;
    border-radius:10px;
    box-shadow:0 4px 8px rgba(0,0,0,.1);
    text-align:center;
}
.card h4{
    margin:0;
    color:#555;
}
.card p{
    font-size:24px;
    font-weight:bold;
    color:#6a1b9a;
    margin-top:10px;
}

/* ===== FILTER ===== */
.filter-box{
    background:#fff;
    padding:15px 20px;
    border-radius:10px;
    box-shadow:0 4px 8px rgba(0,0,0,.1);
    margin-bottom:25px;
    display:flex;
    gap:15px;
    align-items:center;
    flex-wrap:wrap;
}
.filter-box label{
    font-weight:bold;
    color:#555;
}
.filter-box input[type="date"]{
    padding:8px 10px;
    border:1px solid #ccc;
    border-radius:6px;
}
.filter-box button{
    padding:9px 18px;
    background:#6a1b9a;
    border:none;
    color:white;
    border-radius:6px;
    cursor:pointer;
    font-weight:bold;
}
.filter-box button:hover{
    background:#8e24aa;
}

/* ===== TABLE ===== */
table{
    width:100%;
    border-collapse:collapse;
    background:#fff;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 4px 8px rgba(0,0,0,.1);
}
th,td{
    padding:12px;
    border:1px solid #ddd;
    text-align:center;
}
th{
    background:#ede7f6;
    color:#4a148c;
}
tr:hover{
    background:#f6f0fa;
}
</style>
</head>

<body>

<a href="javascript:history.back()" class="btn-kembali">Kembali</a>

<h2>Laporan Transaksi Laundry</h2>

<%
/* ===============================
   RINGKASAN PENGHASILAN
   =============================== */
double totalHarian  = 0;
double totalBulanan = 0;
double totalTahunan = 0;

// HARIAN
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(
    "SELECT IFNULL(SUM(total_harga),0) total " +
    "FROM transaksi WHERE DATE(tanggal)=CURDATE() AND status='diambil'"
);
if(rs1.next()) totalHarian = rs1.getDouble("total");

// BULANAN
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(
    "SELECT IFNULL(SUM(total_harga),0) total " +
    "FROM transaksi WHERE MONTH(tanggal)=MONTH(CURDATE()) " +
    "AND YEAR(tanggal)=YEAR(CURDATE()) AND status='diambil'"
);
if(rs2.next()) totalBulanan = rs2.getDouble("total");

// TAHUNAN
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(
    "SELECT IFNULL(SUM(total_harga),0) total " +
    "FROM transaksi WHERE YEAR(tanggal)=YEAR(CURDATE()) AND status='diambil'"
);
if(rs3.next()) totalTahunan = rs3.getDouble("total");
%>

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

<form method="get" class="filter-box">
    <label>Dari</label>
    <input type="date" name="tgl1" value="<%= request.getParameter("tgl1") != null ? request.getParameter("tgl1") : "" %>">

    <label>Sampai</label>
    <input type="date" name="tgl2" value="<%= request.getParameter("tgl2") != null ? request.getParameter("tgl2") : "" %>">

    <button type="submit">Tampilkan</button>
</form>

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

</body>
</html>
