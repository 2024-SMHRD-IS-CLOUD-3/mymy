<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Python Script Executor</title>
</head>
<body>
    <h1>파이썬 스크립트 실행기</h1>
    
    <form action="/run-python-script" method="post">
        <label for="variable1">Variable 1:</label>
        <input type="text" id="variable1" name="variable1">
        <br>
        <label for="variable2">Variable 2:</label>
        <input type="text" id="variable2" name="variable2">
        <br>
        <button type="submit">Run Python Script</button>
    </form>
</body>
</html>
