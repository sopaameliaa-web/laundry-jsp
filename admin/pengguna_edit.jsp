<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM user WHERE id_user=?"
);
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
if(!rs.next()){
    out.println("Data pengguna tidak ditemukan");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Pengguna</title>

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
    display:flex;
    justify-content:center;
    align-items:center;
}

/* ===== FORM CARD ===== */
.form-box{
    background:white;
    padding:30px;
    border-radius:12px;
    width:100%;
    max-width:420px;
    box-shadow:0 4px 8px rgba(0,0,0,.15);
}

.form-box h2{
    text-align:center;
    margin-bottom:20px;
    color:#7b1fa2;
}

/* ===== INPUT ===== */
input, select{
    width:100%;
    padding:10px;
    margin-top:6px;
    margin-bottom:15px;
    border-radius:6px;
    border:1px solid #ccc;
}

/* ===== BUTTON ===== */
.btn{
    width:100%;
    padding:12px;
    background:#7b1fa2;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:16px;
}

.btn:hover{
    background:#9c27b0;
}

.btn-kembali{
    display:inline-block;
    margin-bottom:15px;
    background:#b39ddb;
    color:white;
    padding:8px 14px;
    border-radius:6px;
    text-decoration:none;
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
            <a href="pengguna.jsp" class="btn-kembali">? Kembali</a>
            <h2>Edit Pengguna</h2>

            <form action="pengguna_update.jsp" method="post">
                <input type="hidden" name="id_user" value="<%= rs.getInt("id_user") %>">

                Nama
                <input type="text" name="nama" value="<%= rs.getString("nama") %>" required>

                Username
                <input type="text" name="username" value="<%= rs.getString("username") %>" required>

                Password
                <input type="password" name="password" value="<%= rs.getString("password") %>" required>

                Role
                <select name="role" required>
                    <option value="admin" <%= "admin".equals(rs.getString("role")) ? "selected" : "" %>>Admin</option>
                    <option value="outlet" <%= "outlet".equals(rs.getString("role")) ? "selected" : "" %>>Outlet</option>
                    <option value="owner" <%= "owner".equals(rs.getString("role")) ? "selected" : "" %>>Owner</option>
                </select>

                <button type="submit" class="btn">Update</button>
            </form>
        </div>

    </div>
</div>

</body>
</html>
