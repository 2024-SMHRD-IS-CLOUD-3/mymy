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
        <!-- enctype="multipart/form/data" -> 어떤 데이터들을 어떻게 보낼건지 경로 + 실체 -->
        <form action="BoardWrite" method="post" enctype="multipart/form-data">
            <table id="list">
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="writer"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea rows="10" style="resize: none;" name="content"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="file" name="file" style="float: right;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="reset" value="초기화"> <input type="submit" value="작성하기"></td>
                </tr>
            </table>
        </form>
    </div>
</body>

</html>
</body>
</html>