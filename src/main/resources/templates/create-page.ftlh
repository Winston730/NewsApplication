<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Создание новости</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h3 {
            font-size: 24px;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="date"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
<hr>
<h3>Создать новость</h3>
<form action="/news/create" method="post" enctype="multipart/form-data">
    <label for="title">Название новости:</label>
    <input type="text" name="title" id="title" required/><br>

    <label for="author">Автор:</label>
    <input type="text" name="author" id="author" required/><br>

    <label for="text">Текст:</label>
    <textarea name="text" id="text" rows="6" required></textarea><br>

    <label for="date">Дата:</label>
    <input type="date" name="date" id="date" required/><br>

    <label for="file1">Первое фото:</label>
    <input type="file" name="file1" id="file1" accept="image/*" required/><br>

    <label for="file2">Второе фото:</label>
    <input type="file" name="file2" id="file2" accept="image/*"/><br>

    <label for="file3">Третье фото:</label>
    <input type="file" name="file3" id="file3" accept="image/*"/><br>

    <input type="submit" value="Добавить новость"/>
</form>
</body>

</html>
