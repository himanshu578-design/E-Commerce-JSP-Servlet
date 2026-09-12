<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin | Messages</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
body{
    margin:0;
    font-family:'Poppins', sans-serif;
    background:#f4f6f9;
    color:#333;
}

/* Main container */
.container{
    padding:30px 40px;
    min-height:calc(100vh - 120px);
}

h2{
    margin-bottom:20px;
    font-weight:500;
}

/* Table box */
.table-box{
    background:#fff;
    border-radius:12px;
    padding:20px;
    box-shadow:0 5px 20px rgba(0,0,0,0.08);
    overflow-x:auto;
}

/* Table */
table{
    width:100%;
    border-collapse:collapse;
    min-width:900px;
}

th, td{
    padding:14px 16px;
    text-align:left;
}

th{
    background:#f1f3f6;
    font-size:14px;
    font-weight:500;
    color:#555;
    border-bottom:1px solid #ddd;
}

td{
    font-size:14px;
    border-bottom:1px solid #eee;
}

tr:hover{
    background:#f9fafb;
}

/* Message column */
.message{
    max-width:350px;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}

/* Empty row */
.empty{
    text-align:center;
    padding:30px;
    color:#777;
}
</style>
</head>

<body>

<jsp:include page="adminHeader.jsp"/>

<div class="container">
    <h2>📨 Messages Received</h2>

    <div class="table-box">
        <table>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Date</th>
            </tr>

            <%
            try{
                Connection con = DBconnection.getConnection();
                PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM contact_messages ORDER BY id DESC"
                );
                ResultSet rs = ps.executeQuery();

                int i = 1;
                boolean hasData = false;

                while(rs.next()){
                    hasData = true;
            %>
            <tr>
                <td><%= i++ %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td class="message" title="<%= rs.getString("message") %>">
                    <%= rs.getString("message") %>
                </td>
                <td><%= rs.getTimestamp("created_at") %></td>
            </tr>
            <%
                }

                if(!hasData){
            %>
            <tr>
                <td colspan="5" class="empty">No messages received yet</td>
            </tr>
            <%
                }
            }catch(Exception e){
                out.println(e);
            }
            %>

        </table>
    </div>
</div>

<jsp:include page="adminFooter.jsp"/>

</body>
</html>
