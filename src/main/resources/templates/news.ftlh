<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Новости</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            font-size: 24px;
        }

        h4 {
            font-size: 18px;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="submit"] {
            margin-bottom: 10px;
        }

        .positioned {
            display: inline-block;
            float: right;
            margin-bottom: 0;
            vertical-align: middle;
        }

        div {
            margin-bottom: 20px;
        }

        img {
            max-height: 160px;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
<h1><a href="/">Новости</a></h1> <hr>

<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="ВЫЙТИ"/>
    </form>

<#else>
    <h1><a href="/login">Войти</a></h1>
</#if>

<hr>
<form action="/" method="get">
    Поиск по названию новости: <input type="text" name="title"> <br>
    <input type="submit" value="Поиск"/>
</form>

<form action="/create" class="positioned" method="get">
    <input type="hidden" name="_csrf" value="_csrf.token">
    <input type="submit" value="Добавить новость"/>
</form>

<h4>Новости по всему миру</h4>

<#list newss as news>
    <div>
        <p><b><a href="/news/${news.id}">${news.title}</a></b></p>
        <img src="/images/${news.previewImageId}" alt="Превью новости"/>
        <br><br>
    </div>
    <#else>
    <h3> Новостей нет!</h3>
</#list>

<hr>
</body>

</html>
