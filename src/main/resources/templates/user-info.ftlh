<!DOCTYPE html>
<html>
<head>
    <title>Профиль</title>
</head>
<body>
<h1>Новости пользователя ${user.name} </h1>
<h3>Подробная информация о пользователе</h3>

<b> Имя: </b> ${user.name}
<b> email: </b> ${user.email}


<#list newss as news>
    <div>
        <p><b><a href="/news/${news.id}">${news.title}</a></b></p>
        <img src="/images/${news.previewImageId}" alt="Превью новости"/>
        <br><br>
    </div>
<#else>
    <h3> Новостей нет!</h3>
</#list>
</body>
</html>