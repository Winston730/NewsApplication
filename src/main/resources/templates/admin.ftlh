<!DOCTYPE html>
<html>
<head>
    <title>Новости</title>
</head>
<body>
<h1>АДМИН ПАНЕЛЬ</h1>

<table border="1" >
    <tr>
        <th>Email</th>
        <th>Id</th>
        <th>Имя</th>
        <th>Роли</th>
        <th>Активность</th>
        <th>Бан</th>
        <th>Редактирование</th>
        <th>Подробная информация</th>

    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
            <th>${user.id}</th>
            <th>${user.name}</th>
            <th><#list user.roles as role> ${role}</#list> </th>
            <th><#if user.active>true<#else>false</#if>></th>
            <th>
            <form action="/admin/user/ban/${user.id}" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Бан">
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}"> Редактирование роли</a></th>
            <th><a href="/user/${user.id}"> Подробная информация </a></th>

        </tr>
    <#else>
        <h3> Пользователей нет</h3>
    </#list>
</table>

</body>
</html>