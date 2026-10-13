<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tambah Transaksi</title>

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
    padding:30px;
}

/* ===== BUTTON ===== */
.btn{
    padding:8px 14px;
    border-radius:6px;
    background:#7b1fa2;
    color:white;
    text-decoration:none;
    font-size:14px;
    border:none;
    cursor:pointer;
}

.btn:hover{
    background:#9c27b0;
}

.btn-kembali{
    background:#b39ddb;
    margin-bottom:15px;
    display:inline-block;
}

/* ===== CARD ===== */
.card{
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,.1);
    max-width:500px;
}

/* ===== FORM ===== */
form label{
    font-weight:bold;
    display:block;
    margin-top:15px;
}

form input, form select{
    width:100%;
    padding:8px 10px;
    margin-top:6px;
    border:1px solid #ccc;
    border-radius:6px;
    font-size:14px;
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

        <a href="javascript:history.back()" class="btn btn-kembali">← Kembali</a>

        <div class="card">
            <h2>Tambah Transaksi</h2>

            <form action="transaksi_simpan.jsp" method="post">

                <label>Invoice</label>
                <input type="text" name="invoice" required>

                <label>Outlet</label>
                <select name="outlet" required>
                    <option value="">-- Pilih Outlet --</option>
                    <%
                    Statement st = conn.createStatement();
                    ResultSet ro = st.executeQuery("SELECT * FROM outlet");
                    while(ro.next()){
                    %>
                        <option value="<%=ro.getInt("id_outlet")%>">
                            <%=ro.getString("nama_outlet")%>
                        </option>
                    <% } %>
                </select>

                <label>Pelanggan</label>
                <select name="pelanggan" required>
                    <option value="">-- Pilih Pelanggan --</option>
                    <%
                    ResultSet rp = st.executeQuery("SELECT * FROM pelanggan");
                    while(rp.next()){
                    %>
                        <option value="<%=rp.getInt("id_pelanggan")%>">
                            <%=rp.getString("nama")%>
                        </option>
                    <% } %>
                </select>

                <label>Total</label>
                <input type="number" name="total" required>

                <br><br>
                <button type="submit" class="btn">Simpan Transaksi</button>
            </form>
        </div>

    </div>
</div>

</body>
</html>
