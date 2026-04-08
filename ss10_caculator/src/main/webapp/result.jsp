<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Result</title>
</head>
<body>

<h1>Result</h1>

<%
  Object error = request.getAttribute("error");

  if (error != null) {
%>
<h3>Lỗi: <%= error %></h3>
<%
} else {
%>
<h3>
  <%= request.getAttribute("firstOperand") %>
  <%= request.getAttribute("operator") %>
  <%= request.getAttribute("secondOperand") %>
  =
  <%= request.getAttribute("result") %>
</h3>
<%
  }
%>

<br>
<a href="index.jsp">Quay lại</a>

</body>
</html>