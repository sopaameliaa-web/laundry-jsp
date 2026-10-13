<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data Pelanggan</title>

<style>
body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#f4f4f4;
}

/* ===== LAYOUT ===== */
.layout{
    display:flex;
    min-height:100vh;
}

/* ===== SIDEBAR (JANGAN DIUBAH) ===== */
.sidebar{
    width:220px;
    background:#7b1fa2;
    color:white;
    padding:20px;
}

.sidebar h2{
    text-align:center;
    margin-bottom:30px;
}

.sidebar a{
    display:block;
    color:white;
    text-decoration:none;
    padding:12px;
    border-radius:6px;
    margin-bottom:10px;
    background:#8e24aa;
}

.sidebar a:hover{
    background:#9c27b0;
}

/* ===== CONTENT ===== */
.content{
    flex:1;
    padding:30px;
}

/* ===== BUTTON ===== */
.btn{
    display:inline-block;
    padding:8px 14px;
    background:#7b1fa2;
    color:white;
    text-decoration:none;
    border-radius:6px;
    font-size:14px;
}

.btn:hover{
    background:#9c27b0;
}

.btn-kembali{
    background:#b39ddb;
    margin-bottom:15px;
}

/* ===== TABLE ===== */
table{
    width:100%;
    border-collapse:collapse;
    background:white;
    margin-top:15px;
    box-shadow:0 4px 8px rgba(0,0,0,.1);
}

table th{
    background:#7b1fa2;
    color:white;
    padding:12px;
}

table td{
    padding:10px;
    border-bottom:1px solid #ddd;
    text-align:center;
}

table tr:hover{
    background:#f3e5f5;
}

.aksi a{
    color:#7b1fa2;
    text-decoration:none;
    font-weight:bold;
}

.aksi a:hover{
    text-decoration:underline;
}
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

    <!-- CONTENT -->
    <div class="content">

        <a href="javascript:history.back()" class="btn btn-kembali">? Kembali</a>
        <a href="pelanggan_tambah.jsp" class="btn">+ Tambah</a>

        <h2>Data Pelanggan</h2>

        <table>
            <tr>
                <th>Nama</th>
                <th>Alamat</th>
                <th>JK</th>
                <th>Telp</th>
                <th>KTP</th>
                <th>Aksi</th>
            </tr>

            <%
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM pelanggan");
            while(rs.next()){
            %>
            <tr>
                <td><%=rs.getString("nama")%></td>
                <td><%=rs.getString("alamat")%></td>
                <td><%=rs.getString("jk")%></td>
                <td><%=rs.getString("telp")%></td>
                <td><%=rs.getString("no_ktp")%></td>
                <td class="aksi">
                    <a href="pelanggan_hapus.jsp?id=<%=rs.getInt("id_pelanggan")%>"
                       onclick="return confirm('Yakin hapus data?')">
                       Hapus
                    </a>
                </td>
            </tr>
            <% } %>
        </table>

    </div>
</div>

</body>
</html>
