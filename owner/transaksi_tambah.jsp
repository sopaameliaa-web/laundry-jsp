<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>
<link rel="stylesheet" href="style.css">
<a href="javascript:history.back()" class="btn-kembali">Kembali</a>
<h2>Tambah Transaksi</h2>

<form action="transaksi_simpan.jsp" method="post">

Invoice <br>
<input type="text" name="invoice" required><br><br>

Outlet <br>
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
</select><br><br>

Pelanggan <br>
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
</select><br><br>

Total <br>
<input type="number" name="total" required><br><br>

<button type="submit">Simpan</button>
</form>
