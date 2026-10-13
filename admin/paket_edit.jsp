<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(
    "SELECT * FROM paket WHERE id_paket=" + id
);

if(!rs.next()){
    out.println("Data paket tidak ditemukan");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Paket</title>

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
    align-items:center;
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
input{
    width:100%;
    padding:10px;
    border-radius:6px;
    border:1px solid #ccc;
    margin-top:6px;
    margin-bottom:16px;
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

.btn-batal{
    background:#ccc;
    color:#333;
    margin-left:10px;
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
        <h2>Edit Paket Laundry</h2>

        <div class="form-box">
            <form action="paket_update.jsp" method="post">
                <input type="hidden" name="id_paket" value="<%=rs.getInt("id_paket")%>">

                Nama Paket
                <input type="text" name="nama_paket"
                       value="<%=rs.getString("nama_paket")%>" required>

                Harga
                <input type="number" name="harga"
                       value="<%=rs.getDouble("harga")%>" required>

                <button type="submit" class="btn">Update</button>
                <a href="paket.jsp" class="btn btn-batal">Batal</a>
            </form>
        </div>

    </div>
</div>

</body>
</html>
