<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2021/12/15
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page  contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Login Validation</title>
</head>
<body>
<div style="align-content: center">
    <h1>Clinic Management System</h1>
    <form action="<%=request.getContextPath()%>/login" method="post">
        <table style="with: 100%">
            <tr>
                <td>UserName</td>
                <td><input type="text" name="username" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" /></td>
            </tr>
        </table>
        <input type="submit" value="Submit" />
    </form>
</div>



</body>
</html>
