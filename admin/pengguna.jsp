<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data Pengguna</title>

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

/* ===== TABLE ===== */
.table-box{
    background:white;
    padding:20px;
    border-radius:12px;
    box-shadow:0 4px 8px rgba(0,0,0,.15);
}

table{
    width:100%;
    border-collapse:collapse;
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

        <h2>Data Pengguna</h2>
        <a href="pengguna_tambah.jsp" class="btn">+ Tambah Pengguna</a>

        <div class="table-box">
            <table>
                <tr>
                    <th>Nama</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Aksi</th>
                </tr>

                <%
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM user");
                while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString("nama")%></td>
                    <td><%=rs.getString("username")%></td>
                    <td><%=rs.getString("role")%></td>
                    <td class="action">
                      
                        <a href="pengguna_edit.jsp?id=<%=rs.getInt("id_user")%>">Edit</a> |
                        <a href="pengguna_hapus.jsp?id=<%=rs.getInt("id_user")%>"
                           onclick="return confirm('Hapus pengguna?')">Hapus</a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>

    </div>
</div>

</body>
</html>
