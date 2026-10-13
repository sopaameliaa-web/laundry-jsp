<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tambah Pelanggan</title>

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

/* ===== SIDEBAR (TETAP) ===== */
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
    justify-content:center;
    align-items:center;
}

/* ===== FORM CARD ===== */
.form-box{
    background:white;
    padding:30px;
    width:420px;
    border-radius:10px;
    box-shadow:0 4px 10px rgba(0,0,0,.1);
}

.form-box h2{
    text-align:center;
    margin-bottom:20px;
}

/* ===== INPUT ===== */
input, textarea, select{
    width:100%;
    padding:10px;
    border-radius:6px;
    border:1px solid #ccc;
    margin-top:6px;
    margin-bottom:14px;
}

textarea{
    resize:vertical;
    min-height:80px;
}

/* ===== BUTTON ===== */
.btn{
    width:100%;
    padding:10px;
    background:#7b1fa2;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:15px;
}

.btn:hover{
    background:#9c27b0;
}

.btn-kembali{
    display:inline-block;
    margin-bottom:15px;
    color:#7b1fa2;
    text-decoration:none;
    font-weight:bold;
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

        <div class="form-box">
            <a href="javascript:history.back()" class="btn-kembali">← Kembali</a>
            <h2>Tambah Pelanggan</h2>

            <form action="pelanggan_simpan.jsp" method="post">

                Nama
                <input type="text" name="nama" required>

                Alamat
                <textarea name="alamat" required></textarea>

                Jenis Kelamin
                <select name="jk" required>
                    <option value="">-- Pilih --</option>
                    <option value="L">Laki-laki</option>
                    <option value="P">Perempuan</option>
                </select>

                Telp
                <input type="text" name="telp" required>

                No KTP
                <input type="text" name="ktp" required>

                <button type="submit" class="btn">Simpan</button>
            </form>
        </div>

    </div>
</div>

</body>
</html>
