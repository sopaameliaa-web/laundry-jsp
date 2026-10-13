<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tambah Outlet</title>

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
    display:flex;
    flex-direction:column;
    align-items:center;   /* FORM KE TENGAH */
    padding:30px;
}

.content h2{
    color:#7b1fa2;
    margin-bottom:20px;
}

/* ===== FORM BOX ===== */
.form-box{
    background:white;
    padding:30px;
    border-radius:12px;
    width:420px;
    box-shadow:0 4px 8px rgba(0,0,0,.15);
}

/* ===== INPUT ===== */
input, textarea{
    width:100%;
    padding:10px;
    border-radius:6px;
    border:1px solid #ccc;
    margin-top:6px;
    margin-bottom:16px;
}

textarea{
    resize:vertical;
    min-height:80px;
}

/* ===== BUTTON ===== */
.btn{
    padding:10px 16px;
    background:#7b1fa2;
    color:white;
    text-decoration:none;
    border-radius:6px;
    border:none;
    cursor:pointer;
    font-weight:bold;
}

.btn:hover{
    background:#9c27b0;
}

.btn-kembali{
    align-self:flex-start;
    margin-bottom:20px;
    background:#b39ddb;
    color:#4a148c;
}

.btn-kembali:hover{
    background:#9c27b0;
    color:white;
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
        <h2>Tambah Outlet</h2>

        <div class="form-box">
            <form action="outlet_simpan.jsp" method="post">

                Nama Outlet
                <input type="text" name="nama" required>

                Owner
                <input type="text" name="owner" required>

                Telp
                <input type="text" name="telp">

                Alamat
                <textarea name="alamat"></textarea>

                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>

    </div>
</div>

</body>
</html>
