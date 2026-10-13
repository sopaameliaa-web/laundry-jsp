<%@ include file="../koneksi.jsp" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
Statement st = conn.createStatement();

ResultSet tr = st.executeQuery(
 "SELECT t.*, p.nama FROM transaksi t JOIN pelanggan p ON t.id_pelanggan=p.id_pelanggan WHERE id_transaksi="+id
);
tr.next();

boolean lunas = tr.getDouble("total_bayar") >= tr.getDouble("total_harga");

// AUTO SET STATUS JIKA LUNAS
if(lunas && !tr.getString("status").equals("diambil")){
    PreparedStatement psAuto = conn.prepareStatement(
        "UPDATE transaksi SET status='diambil' WHERE id_transaksi=?"
    );
    psAuto.setInt(1, id);
    psAuto.executeUpdate();
    tr = st.executeQuery(
     "SELECT t.*, p.nama FROM transaksi t JOIN pelanggan p ON t.id_pelanggan=p.id_pelanggan WHERE id_transaksi="+id
    );
    tr.next();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Transaksi</title>

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
    padding:20px;
    border-radius:10px;
    box-shadow:0 4px 10px rgba(0,0,0,.1);
    margin-bottom:20px;
}

/* ===== FLEX ===== */
.flex{
    display:flex;
    gap:20px;
}
.half{
    width:50%;
}

/* ===== TABLE ===== */
table{
    width:100%;
    border-collapse:collapse;
}
th,td{
    padding:10px;
    border:1px solid #ddd;
    text-align:center;
}
th{
    background:#7b1fa2;
    color:white;
}

/* ===== FORM ===== */
select,input{
    width:100%;
    padding:8px;
    margin-bottom:10px;
    border-radius:6px;
    border:1px solid #ccc;
}

button{
    padding:8px 16px;
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
    margin-bottom:15px;
}

.locked{
    color:red;
    font-weight:bold;
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

        <!-- INFO TRANSAKSI -->
        <div class="card">
            <h3>Info Transaksi</h3>
            <p>Invoice : <b><%=tr.getString("invoice")%></b></p>
            <p>Pelanggan : <b><%=tr.getString("nama")%></b></p>
            <p>Status : <b><%=tr.getString("status").toUpperCase()%></b></p>

            <% if(lunas){ %>
            <p class="locked">Transaksi sudah lunas & DIAMBIL</p>
            <% } %>
        </div>

        <div class="flex">

            <!-- STATUS -->
            <div class="card half">
                <h4>Status Laundry</h4>

                <% if(!lunas){ %>
                <form action="transaksi_status_update.jsp" method="post">
                    <input type="hidden" name="id_transaksi" value="<%=id%>">

                    <select name="status">
                        <option value="baru">Baru</option>
                        <option value="diproses">Diproses</option>
                        <option value="dicuci">Dicuci</option>
                        <option value="disetrika">Disetrika</option>
                    </select>

                    <button>Update</button>
                </form>
                <% } else { %>
                <p class="locked">Status terkunci</p>
                <% } %>
            </div>

            <!-- TAMBAH PAKET -->
            <div class="card half">
                <h4>Tambah Paket</h4>

                <% if(!lunas){ %>
                <form action="transaksi_detail_simpan.jsp" method="post">
                    <input type="hidden" name="id_transaksi" value="<%=id%>">

                    <select name="id_paket">
                        <%
                        ResultSet pk = st.executeQuery("SELECT * FROM paket");
                        while(pk.next()){
                        %>
                        <option value="<%=pk.getInt("id_paket")%>">
                            <%=pk.getString("nama_paket")%> - Rp <%=pk.getDouble("harga")%>
                        </option>
                        <% } %>
                    </select>

                    <input type="number" name="qty" step="0.1" required>
                    <button>Tambah</button>
                </form>
                <% } else { %>
                <p class="locked">Tidak bisa tambah paket</p>
                <% } %>
            </div>

        </div>

        <!-- DETAIL -->
        <div class="card">
            <h3>Detail Laundry</h3>
            <table>
                <tr>
                    <th>Paket</th>
                    <th>Qty</th>
                    <th>Harga</th>
                    <th>Subtotal</th>
                </tr>

                <%
                ResultSet dt = st.executeQuery(
                 "SELECT d.*, p.nama_paket FROM transaksi_detail d JOIN paket p ON d.id_paket=p.id_paket WHERE id_transaksi="+id
                );
                double total = 0;
                while(dt.next()){
                    total += dt.getDouble("subtotal");
                %>
                <tr>
                    <td><%=dt.getString("nama_paket")%></td>
                    <td><%=dt.getDouble("qty")%></td>
                    <td>Rp <%=dt.getDouble("harga")%></td>
                    <td>Rp <%=dt.getDouble("subtotal")%></td>
                </tr>
                <% } %>
            </table>

            <h3>Total : Rp <%=total%></h3>
        </div>

    </div>
</div>

</body>
</html>
