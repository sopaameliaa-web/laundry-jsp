<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data Transaksi</title>
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
    display:inline-block;
    padding:10px 16px;
    background:#7b1fa2;
    color:white;
    text-decoration:none;
    border-radius:6px;
    margin-bottom:15px;
}

.btn:hover{
    background:#9c27b0;
}

.btn-kembali{
    background:#b39ddb;
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

        <h2>Data Transaksi</h2>

        <table>
            <tr>
                <th>Invoice</th>
                <th>Pelanggan</th>
                <th>Status</th>
                <th>Pembayaran</th>
                <th>Total</th>
                <th>Aksi</th>
            </tr>

            <%
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(
                "SELECT t.*, p.nama FROM transaksi t JOIN pelanggan p ON t.id_pelanggan=p.id_pelanggan"
            );
            while(rs.next()){
            %>
            <tr>
                <td><%=rs.getString("invoice")%></td>
                <td><%=rs.getString("nama")%></td>
                <td><%=rs.getString("status")%></td>
                <td>
                    <%
                        if (rs.getDouble("total_bayar") >= rs.getDouble("total_harga")) {
                            out.print("Dibayar");
                        } else {
                            out.print("Belum");
                        }
                    %>
                </td>
                <td>Rp <%=rs.getDouble("total_harga")%></td>
                <td>
                    <a href="transaksi_detail.jsp?id=<%=rs.getInt("id_transaksi")%>">
                        Detail
                    </a>
                </td>
            </tr>
            <% } %>
        </table>

    </div>
</div>

</body>
</html>
