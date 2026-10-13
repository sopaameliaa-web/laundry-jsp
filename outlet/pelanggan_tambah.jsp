<%@ page contentType="text/html; charset=UTF-8" %>

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
    margin-bottom:20px;
    display:inline-block;
}

/* ===== FORM CARD ===== */
.form-card{
    background:white;
    padding:30px;
    border-radius:10px;
    width:420px;
    box-shadow:0 4px 12px rgba(0,0,0,.1);
}

.form-card h2{
    margin-top:0;
    margin-bottom:20px;
}

.form-group{
    margin-bottom:15px;
}

.form-group label{
    display:block;
    margin-bottom:6px;
    font-weight:bold;
}

.form-group input,
.form-group textarea,
.form-group select{
    width:100%;
    padding:10px;
    border-radius:6px;
    border:1px solid #ccc;
}

.form-group textarea{
    resize:none;
}

.form-actions{
    margin-top:20px;
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

        <a href="javascript:history.back()" class="btn btn-kembali">← Kembali</a>

        <div class="form-card">
            <h2>Tambah Pelanggan</h2>

            <form action="pelanggan_simpan.jsp" method="post">

                <div class="form-group">
                    <label>Nama</label>
                    <input type="text" name="nama" required>
                </div>

                <div class="form-group">
                    <label>Alamat</label>
                    <textarea name="alamat" rows="3" required></textarea>
                </div>

                <div class="form-group">
                    <label>Jenis Kelamin</label>
                    <select name="jk">
                        <option value="L">L</option>
                        <option value="P">P</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Telepon</label>
                    <input type="text" name="telp" required>
                </div>

                <div class="form-group">
                    <label>No KTP</label>
                    <input type="text" name="ktp" required>
                </div>

                <div class="form-actions">
                    <button class="btn" type="submit">Simpan</button>
                </div>

            </form>
        </div>

    </div>
</div>

</body>
</html>
