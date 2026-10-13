<%-- 
    Document   : transaksi_detail
    Created on : Dec 24, 2025, 7:36:14 PM
    Author     : ASUS
--%>
<%@ include file="../koneksi.jsp" %>
<%
    
int id = Integer.parseInt(request.getParameter("id"));
Statement st = conn.createStatement();

ResultSet tr = st.executeQuery(
 "SELECT t.*, p.nama FROM transaksi t JOIN pelanggan p ON t.id_pelanggan=p.id_pelanggan WHERE id_transaksi="+id
);
tr.next();
%>
<a href="javascript:history.back()" class="btn-kembali">Kembali</a>
<h2>Detail Transaksi</h2>

Invoice: <b><%=tr.getString("invoice")%></b><br>
Pelanggan: <b><%=tr.getString("nama")%></b><br>
Status: <b><%=tr.getString("status")%></b><br><br>


<form action="transaksi_detail_simpan.jsp" method="post">
<input type="hidden" name="id_transaksi" value="<%=id%>">

Paket:
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

Qty:
<input type="number" name="qty" step="0.1" required>

Pembayaran
<select name="Pembayaran">
  <option>lunas</option>
  <option>belum</option>
</select><br>

<button>Tambah</button>
</form>
<table border="1">
<tr><th>Paket</th><th>Qty</th><th>Harga</th><th>Subtotal</th></tr>

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

<h3>Total: Rp <%=total%></h3>
<link rel="stylesheet" href="style.css">
<style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }
        .sidebar {
            width: 230px;
            height: 100vh;
            background: #2c3e50;
            position: fixed;
            color: white;
        }
        .sidebar h2 {
            text-align: center;
            padding: 20px 0;
            margin: 0;
            background: #1a252f;
        }
        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
        }
        .sidebar a:hover {
            background: #34495e;
        }
        .content {
            margin-left: 230px;
            padding: 20px;
        }
        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .card h3 {
            margin: 0;
            color: #555;
        }
        .card p {
            font-size: 28px;
            font-weight: bold;
            margin-top: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        table th {
            background: #2980b9;
            color: white;
        }
        .btn {
            padding: 5px 10px;
            border-radius: 4px;
            color: white;
            background: #3498db;
            text-decoration: none;
        }
    </style>