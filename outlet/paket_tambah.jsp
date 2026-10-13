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

/* ===== FORM BOX ===== */
.form-box{
    background:white;
    max-width:500px;
    padding:30px;
    border-radius:12px;
    box-shadow:0 4px 10px rgba(0,0,0,.15);
}

/* ===== FORM ===== */
.form-box h2{
    margin-top:0;
    margin-bottom:20px;
    color:#444;
}

.form-group{
    margin-bottom:15px;
}

label{
    display:block;
    font-weight:bold;
    margin-bottom:6px;
    color:#555;
}

input, select{
    width:100%;
    padding:10px;
    border-radius:6px;
    border:1px solid #ccc;
}

/* ===== BUTTON ===== */
.btn{
    display:inline-block;
    padding:10px 18px;
    border:none;
    border-radius:6px;
    background:#7b1fa2;
    color:white;
    font-size:15px;
    cursor:pointer;
}

.btn:hover{
    background:#9c27b0;
}

.btn-kembali{
    background:#b39ddb;
    margin-bottom:20px;
    display:inline-block;
    text-decoration:none;
    color:white;
    padding:8px 14px;
    border-radius:6px;
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

        <a href="javascript:history.back()" class="btn-kembali">? Kembali</a>

        <div class="form-box">
            <h2>Tambah Paket</h2>

            <form action="paket_simpan.jsp" method="post">

                <div class="form-group">
                    <label>Nama Paket</label>
                    <input name="nama" required>
                </div>

                <div class="form-group">
                    <label>Jenis</label>
                    <select name="jenis">
                        <option>Kiloan</option>
                        <option>Satuan</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Harga</label>
                    <input name="harga" required>
                </div>

                <div class="form-group">
                    <label>Outlet</label>
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
                </div>

                <button class="btn">Simpan</button>

            </form>
        </div>

    </div>
</div>

</body>
</html>
