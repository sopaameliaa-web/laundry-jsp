<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data Paket</title>

<style>
/* ===== BODY ===== */
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

/* ===== SIDEBAR (ADMIN ? TETAP) ===== */
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

.content h2{
    margin-top:0;
    color:#7b1fa2;
}

/* ===== BUTTON ===== */
.btn-kembali{
    display:inline-block;
    margin-bottom:15px;
    padding:10px 16px;
    background:#b39ddb;
    color:#4a148c;
    text-decoration:none;
    border-radius:6px;
    font-weight:bold;
}

.btn-kembali:hover{
    background:#9c27b0;
    color:white;
}

.btn{
    display:inline-block;
    margin-bottom:20px;
    padding:10px 16px;
    background:#7b1fa2;
    color:white;
    text-decoration:none;
    border-radius:6px;
    font-weight:bold;
}

.btn:hover{
    background:#9c27b0;
}

/* ===== TABLE ===== */
table{
    width:100%;
    border-collapse:collapse;
    background:white;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 4px 8px rgba(0,0,0,.1);
}

th{
    background:#ede7f6;
    padding:12px;
    text-align:center;
}

td{
    padding:10px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

tr:hover{
    background:#f9f5fc;
}

/* ===== AKSI ===== */
.action a{
    color:#7b1fa2;
    font-weight:bold;
    text-decoration:none;
}

.action a:hover{
    text-decoration:underline;
}
</style>
</head>

<body>

<div class="layout">

    <!-- SIDEBAR ADMIN (ISI TETAP) -->
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

        <a href="javascript:history.back()" class="btn-kembali">? Kembali</a>
        <h2>Data Paket</h2>

        <a href="paket_tambah.jsp" class="btn">+ Tambah Paket</a>

        <table>
            <tr>
                <th>Nama Paket</th>
                <th>Jenis</th>
                <th>Harga</th>
                <th>Outlet</th>
                <th>Aksi</th>
            </tr>

            <%
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(
              "SELECT p.*, o.nama_outlet FROM paket p JOIN outlet o ON p.id_outlet=o.id_outlet"
            );
            while(rs.next()){
            %>
            <tr>
                <td><%= rs.getString("nama_paket") %></td>
                <td><%= rs.getString("jenis") %></td>
                <td>Rp <%= rs.getDouble("harga") %></td>
                <td><%= rs.getString("nama_outlet") %></td>
                <td class="action">
                    <a href="paket_edit.jsp?id=<%=rs.getInt("id_paket")%>">Edit</a> |
                    <a href="paket_hapus.jsp?id=<%=rs.getInt("id_paket")%>"
                       onclick="return confirm('Hapus?')">Hapus</a>
                </td>
            </tr>
            <% } %>
        </table>

    </div>
</div>

</body>
</html>
