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

/* ===== SIDEBAR ===== */
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
    padding:40px;
}

/* ===== HEADER ===== */
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.header h2{
    margin:0;
}

/* ===== BUTTON ===== */
.btn{
    padding:8px 14px;
    border-radius:6px;
    background:#7b1fa2;
    color:white;
    text-decoration:none;
    font-size:14px;
}

.btn:hover{
    background:#9c27b0;
}

.btn-kembali{
    background:#b39ddb;
    margin-bottom:15px;
    display:inline-block;
}

/* ===== TABLE ===== */
table{
    width:100%;
    border-collapse:collapse;
    background:white;
    box-shadow:0 4px 10px rgba(0,0,0,.1);
}

table th, table td{
    padding:12px;
    border:1px solid #ddd;
    text-align:center;
}

table th{
    background:#7b1fa2;
    color:white;
}

.action a{
    color:white;
    background:#e53935;
    padding:6px 10px;
    border-radius:5px;
    text-decoration:none;
    font-size:13px;
}

.action a:hover{
    background:#c62828;
}
</style>
</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <h2>KASIR</h2>
        <a href="paket.jsp">Paket</a>
        <a href="pelanggan.jsp">Pelanggan</a>
        <a href="transaksi.jsp">Transaksi</a>
        <a href="laporan.jsp">Laporan</a>
        <a href="../logout.jsp">Logout</a>
    </div>

    <!-- CONTENT -->
    <div class="content">

        <a href="javascript:history.back()" class="btn btn-kembali">? Kembali</a>

        <div class="header">
            <h2>Data Pelanggan</h2>
            <a href="pelanggan_tambah.jsp" class="btn">+ Tambah</a>
        </div>

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
                <td class="action">
                    <a href="pelanggan_hapus.jsp?id=<%=rs.getInt("id_pelanggan")%>"
                       onclick="return confirm('Hapus data pelanggan?')">Hapus</a>
                </td>
            </tr>
            <% } %>
        </table>

    </div>
</div>

</body>
</html>
