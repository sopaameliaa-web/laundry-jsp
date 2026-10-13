<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM outlet WHERE id_outlet=?"
);
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Outlet</title>

<style>
/* ===== CONTENT ONLY (SIDEBAR TIDAK DIUBAH) ===== */
.content{
    padding:30px;
    background:#f4f4f4;
    min-height:100vh;
}

h2{
    margin-top:0;
    color:#7b1fa2;
}

/* ===== BUTTON ===== */
.btn-kembali{
    display:inline-block;
    margin-bottom:20px;
    padding:10px 16px;
    background:#b39ddb;
    color:#4a148c;
    text-decoration:none;
    border-radius:6px;
    font-weight:bold;
}

.btn-kembali:hover{
    background:#9c27b0;
    color:white;
}

/* ===== FORM ===== */
.form-box{
    background:white;
    padding:25px;
    max-width:500px;
    border-radius:10px;
    box-shadow:0 4px 8px rgba(0,0,0,.1);
}

.form-box label{
    display:block;
    margin-top:15px;
    font-weight:bold;
    color:#555;
}

.form-box input,
.form-box textarea{
    width:100%;
    padding:10px;
    margin-top:6px;
    border-radius:6px;
    border:1px solid #ccc;
    font-size:14px;
}

.form-box textarea{
    resize:vertical;
    height:80px;
}

/* ===== SUBMIT BUTTON ===== */
.form-box button{
    margin-top:20px;
    padding:10px 18px;
    background:#7b1fa2;
    color:white;
    border:none;
    border-radius:6px;
    font-size:15px;
    cursor:pointer;
}

.form-box button:hover{
    background:#9c27b0;
}
</style>
</head>

<body>

<div class="content">

    <a href="javascript:history.back()" class="btn-kembali">? Kembali</a>
    <h2>Edit Outlet</h2>

    <div class="form-box">
        <form action="outlet_update.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">

            <label>Nama Outlet</label>
            <input type="text" name="nama" value="<%= rs.getString("nama_outlet") %>" required>

            <label>Owner</label>
            <input type="text" name="owner" value="<%= rs.getString("owner") %>" required>

            <label>Telp</label>
            <input type="text" name="telp" value="<%= rs.getString("telp") %>">

            <label>Alamat</label>
            <textarea name="alamat"><%= rs.getString("alamat") %></textarea>

            <button type="submit">Update</button>
        </form>
    </div>

</div>

</body>
</html>
