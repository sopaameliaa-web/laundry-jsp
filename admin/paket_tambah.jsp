<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tambah Paket</title>

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

/* ===== SIDEBAR ADMIN (JANGAN DIUBAH) ===== */
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
    display:flex;
    flex-direction:column;
    align-items:center;        /* FORM KE TENGAH */
    padding:30px;
}

.content h2{
    color:#7b1fa2;
    margin-bottom:20px;
}

/* ===== BUTTON ===== */
.btn-kembali{
    align-self:flex-start;
    margin-bottom:20px;
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

button{
    padding:10px;
    background:#7b1fa2;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-weight:bold;
}

button:hover{
    background:#9c27b0;
}

/* ===== FORM ===== */
form{
    width:420px;
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 4px 8px rgba(0,0,0,.15);
}

input, select{
    width:100%;
    padding:10px;
    margin-top:6px;
    margin-bottom:16px;
    border:1px solid #ccc;
    border-radius:6px;
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

        <a href="javascript:history.back()" class="btn-kembali">? Kembali</a>
        <h2>Tambah Paket</h2>

        <form action="paket_simpan.jsp" method="post">
            Nama Paket
            <input type="text" name="nama" required>

            Jenis
            <select name="jenis">
                <option>Kiloan</option>
                <option>Satuan</option>
            </select>

            Harga
            <input type="number" name="harga" required>

            Outlet
            <select name="outlet">
                <%
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM outlet");
                while(rs.next()){
                %>
                <option value="<%=rs.getInt("id_outlet")%>">
                    <%=rs.getString("nama_outlet")%>
                </option>
                <% } %>
            </select>

            <button type="submit">Simpan</button>
        </form>

    </div>
</div>

</body>
</html>
