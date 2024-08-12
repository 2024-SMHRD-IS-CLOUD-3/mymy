<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
</head>

<style>
    #board {
        width: 1000px !important;
        margin: 0px auto !important;
        text-align: center !important;
        margin-top: 100px !important;
    }

    #list {
        margin: 0px auto !important;
    }

    #writer {
        margin-top: 50px !important;
    }

    a {
        text-decoration: none !important;
    }
</style>

<body>
    <div id="board">
        <form action="postWrite" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="userId" value="${loginInfo.userId}" />
            <table id="list">
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="postTitle"></td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td>${loginInfo.userName}</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea rows="10" style="resize: none;" name="postContent"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <input type="reset" value="초기화"> 
                    <input type="submit" value="작성하기">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>

</html>
</body>
</html>