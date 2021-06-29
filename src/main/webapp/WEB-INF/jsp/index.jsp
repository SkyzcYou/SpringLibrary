<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录Skyzc图书馆</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <style>
        #myCarousel {
            margin-left: 2%;
            margin-top: 3%;
            width: 60%;
            height: 70%;
            float: left;
            z-index: 999;
            display: inline;
        }

        #login {
            float: left;
            /*height: 50%;*/
            width: 23%;
            margin-left: 6%;
            margin-top: 8%;
            display: inline;
            z-index: 999;
        }

        * {
            padding: 0;
            margin: 0;
        }
    </style>
    <script>
        $(function () {
            $('#myCarousel').carousel({
                interval: 2000
            })
        });
    </script>
</head>
<body>
<c:if test="${!empty error}">
    <script>
        alert("${error}");
        window.location.href = "login.html";
    </script>
</c:if>
<h2 style="text-align: center;font-family: 'Adobe 楷体 Std R';color: palevioletred">Skyzc 图 书 馆 后 台 管 理 系 统</h2>
<div style="float:right;" id="github_iframe"></div>
<script src="js/canvas-nest.js"></script>   <!-- 网页动态线条特效 -->
<div id="myCarousel" class="carousel slide">
    <img src="img/books_library_shelves_1280x720.jpg" alt="" style="width: 100%; height: 100%">
</div>
<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">请登录</h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <label for="id">登录ID</label>
            <input type="text" class="form-control" id="id" placeholder="请输入用户名">
        </div>
        <div class="form-group">
            <label for="passwd">密码</label>
            <input type="password" class="form-control" id="passwd" placeholder="请输入密码">
        </div>
        <div class="checkbox text-left">
            <label>
                <input type="checkbox" id="remember">记住密码
            </label>
            <a style="margin-left: 100px" href="#">忘记密码?</a>
        </div>

        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
        <button id="loginButton" class="btn btn-primary  btn-block">登录
        </button>
    </div>
</div>
<script src="js/bootstrap.min.js"></script>
<script src="js/js.cookie.js"></script>
<script>
    $("#id").keyup(
        function () {
            if (isNaN($("#id").val())) {
                $("#info").text("提示:账号只能为数字");
            } else {
                $("#info").text("");
            }
        }
    )

    // 使用js.cookie.js 记住登录信息
    function rememberLogin(username, password, checked) {
        Cookies.set('loginStatus', {
            username: username,
            password: password,
            remember: checked
        }, {expires: 30, path: ''})
    }

    // 若选择记住登录信息，则进入页面时设置登录信息
    function setLoginStatus() {
        var loginStatusText = Cookies.get('loginStatus')
        if (loginStatusText) {
            var loginStatus
            try {
                loginStatus = JSON.parse(loginStatusText);
                $('#id').val(loginStatus.username);
                $('#passwd').val(loginStatus.password);
                $("#remember").prop('checked', true);
            } catch (__) {
            }
        }
    }

    // 设置登录信息
    setLoginStatus();
    $("#loginButton").click(function () {
        var id = $("#id").val();
        var passwd = $("#passwd").val();
        var remember = $("#remember").prop('checked');

        if (id === '' && passwd === '') {
            $("#info").text("提示:账号和密码不能为空");
        } else if (id === '') {
            $("#info").text("提示:账号不能为空");
        } else if (passwd === '') {
            $("#info").text("提示:密码不能为空");
        } else if (isNaN(id)) {
            $("#info").text("提示:账号必须为数字");
        } else {
            $.ajax({
                type: "POST",
                url: "/api/loginCheck",
                data: {
                    id: id,
                    passwd: passwd
                },
                dataType: "json",
                success: function (data) {
                    if (data.stateCode.trim() === "0") {
                        $("#info").text("提示:账号或密码错误！");
                    } else if (data.stateCode.trim() === "1") {
                        $("#info").text("提示:登陆成功，跳转中...");
                        window.location.href = "/admin_main.html";
                    } else if (data.stateCode.trim() === "2") {
                        if (remember) {
                            rememberLogin(id, passwd, remember);
                        } else {
                            Cookies.remove('loginStatus');
                        }
                        $("#info").text("提示:登陆成功，跳转中...");
                        window.location.href = "/reader_main.html";
                    }
                }
            });
        }
    })
</script>
</body>
</html>
