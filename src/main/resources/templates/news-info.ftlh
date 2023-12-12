<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Новость детально</title>
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

        img {
            max-height: 200px;
            margin-bottom: 10px;
        }

        pre {
            white-space: pre-wrap;
            font-family: inherit;
        }

        form {
            margin-top: 20px;
        }
    </style>

</head>

<body>
<h1><a href="/">Новости</a></h1>
<hr>
<h4>Подробная информация о новости</h4>

<#list images as img>
    <img src="/images/${img.id}" alt="Новостное изображение" />
    <br><br>
</#list>

<b>Название новости:</b> ${news.title} <br>
<b>Новость:</b> <pre>${news.text}</pre><br>
<b>Дата:</b> ${news.date} <br>
<b>Автор новости:</b> ${news.author} <br>
<hr>

<form action="/news/delete/${news.id}" method="post">
    <input type="submit" value="Удалить новость" />
</form>
</body>

</html>
