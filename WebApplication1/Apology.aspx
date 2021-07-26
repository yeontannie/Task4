﻿<!DOCTYPE html>

<html lang="en">

<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- documentation at http://getbootstrap.com/docs/4.1/, alternative themes at https://bootswatch.com/ -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">

    <link href="/static/style.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <title>Web App</title>

</head>

<body>

    <nav class="navbar navbar-expand-md navbar-light bg-light border">
        <a class="navbar-brand" href="/"><span class="blue">W</span><span class="red">E</span><span class="yellow">B</span> <span class="green">App</span></a>
        <button aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbar" data-toggle="collapse" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav ml-auto mt-2">
                <li class="nav-item"><a class="nav-link" href="/register">Register</a></li>
                <li class="nav-item"><a class="nav-link" href="/login">Log In</a></li>
            </ul>
        </div>
    </nav>
    <main class="container p-5">
        <img alt="{{ top }}" class="border" src="http://memegen.link/custom/{{ top | urlencode }}/{{ bottom | urlencode }}.jpg?alt=https://i.imgur.com/CsCgN7Ll.png" title="{{ top }}">
    </main>
</body>

</html>
