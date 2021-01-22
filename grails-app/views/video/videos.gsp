<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="video.label"/></title>
</head>
<body>

<h1 class="title inside-page-container">
    <g:message code="video.label"/>
</h1>

<div class="inside-page-container">
    <g:each in="${videos}" var="video">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/${video.youtubeVideoCode}"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen>
        </iframe>
    </g:each>
</div>

<div class="inside-page-container">
    <g:link controller="video" action="createVideo" class="btn btn-primary">
        <g:message code="video.create.label"/>
    </g:link>
</div>

</body>
</html>