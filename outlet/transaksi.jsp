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
    margin-bottom:15px;
    display:inline-block;
}

/* ===== CARD ===== */
.card{
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,.1);
}

/* ===== TABLE ===== */
table{
    width:100%;
    border-collapse:collapse;
    margin-top:15px;
}

table th, table td{
    border:1px solid #ddd;
    padding:10px;
    text-align:center;
}

table th{
    background:#ede7f6;
}

.action a{
    text-decoration:none;
    font-weight:bold;
    margin:0 4px;
}

.action .bayar{ color:green; }
.action .struk{ color:purple; }
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

        <div class="card">
            <h2>Data Transaksi</h2>
            <a href="transaksi_tambah.jsp" class="btn">+ Tambah Transaksi</a>

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
                    "SELECT t.*, p.nama FROM transaksi t " +
                    "JOIN pelanggan p ON t.id_pelanggan=p.id_pelanggan"
                );

                while(rs.next()){
                    boolean lunas =
                        rs.getDouble("total_bayar") >= rs.getDouble("total_harga");
                %>

                <tr>
                    <td><%=rs.getString("invoice")%></td>
                    <td><%=rs.getString("nama")%></td>
                    <td><%=rs.getString("status")%></td>
                    <td><%= lunas ? "Dibayar" : "Belum" %></td>
                    <td>Rp <%=rs.getDouble("total_harga")%></td>
                    <td class="action">
                        <a href="transaksi_detail.jsp?id=<%=rs.getInt("id_transaksi")%>">
                            Detail
                        </a>

                        <% if(!lunas){ %>
                        | <a class="bayar"
                             href="transaksi_bayar.jsp?id=<%=rs.getInt("id_transaksi")%>">
                             Bayar
                          </a>
                        <% } %>

                        <% if(lunas){ %>
                        | <a class="struk"
                             href="struk.jsp?id=<%=rs.getInt("id_transaksi")%>"
                             target="_blank">
                             Cetak Struk
                          </a>
                        <% } %>
                    </td>
                </tr>

                <% } %>
            </table>
        </div>

    </div>
</div>

</body>
</html>
