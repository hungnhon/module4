<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>

<h1>Simple Calculator</h1>

<form action="calculate" method="post">

    <label>First Number:</label>
    <input type="number" step="any" name="firstOperand" required>
    <br><br>

    <label>Operator:</label>
    <select name="operator">
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
    </select>
    <br><br>

    <label>Second Number:</label>
    <input type="number" step="any" name="secondOperand" required>
    <br><br>

    <button type="submit">Calculate</button>
</form>

</body>
</html>