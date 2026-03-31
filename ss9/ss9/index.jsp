
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Product Discount Calculator</h2>

    <form action="display-discount" method="post">
        <label>Product Description:</label><br/>
        <input type="text" name="description" placeholder="Nhập tên sản phẩm"/>

        <label>List Price:</label><br/>
        <input type="text" name="price" placeholder="Nhập giá sản phẩm"/>

        <label>Discount Percent:</label><br/>
        <input type="text" name="percent" placeholder="Nhập % giảm giá"/>

        <input type="submit" value="Calculate Discount"/>
    </form>
</div>
</body>
</html>


