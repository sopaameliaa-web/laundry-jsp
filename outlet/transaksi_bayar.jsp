<%@ include file="../koneksi.jsp" %>
<%
int id = Integer.parseInt(request.getParameter("id"));

Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(
    "SELECT * FROM transaksi WHERE id_transaksi=" + id
);
rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bayar Transaksi</title>

<style>
body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#f4f4f4;
}

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

/* ===== CARD ===== */
.card{
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0 4px 10px rgba(0,0,0,.1);
    max-width:500px;
}

/* ===== FORM ===== */
label{
    font-weight:bold;
    display:block;
    margin-top:15px;
    color:#555;
}
input, select{
    width:100%;
    padding:8px;
    margin-top:5px;
    border-radius:6px;
    border:1px solid #ccc;
}

button{
    padding:10px 18px;
    background:#7b1fa2;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
}
button:hover{
    background:#9c27b0;
}

.btn-kembali{
    display:inline-block;
    background:#b39ddb;
    padding:8px 14px;
    border-radius:6px;
    color:white;
    text-decoration:none;
    margin-bottom:20px;
}
.info{
    margin-bottom:10px;
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

        <a href="transaksi.jsp" class="btn-kembali">? Kembali</a>

        <div class="card">
            <h3>Bayar Transaksi</h3>

            <div class="info">
                Total Harga : <b>Rp <%= rs.getDouble("total_harga") %></b>
            </div>
            <div class="info">
                Sudah Dibayar : <b>Rp <%= rs.getDouble("total_bayar") %></b>
            </div>

            <form action="transaksi_bayar_proses.jsp" method="post">
                <input type="hidden" name="id" value="<%=id%>">

                <label>Jumlah Bayar</label>
                <input type="number" name="bayar" required>

                <label>Metode Bayar</label>
                <select name="metode">
                    <option value="Cash">Cash</option>
                    <option value="Transfer">Transfer</option>
                    <option value="QRIS">QRIS</option>
                </select>

                <br><br>
                <button type="submit">Proses Bayar</button>
            </form>
        </div>

    </div>
</div>

</body>
</html>
