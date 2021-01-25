<%@ page import="tamere.*" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="video.edit.label"/></title>
</head>

<body>

<h1 class="title inside-page-container">
    <g:message code="video.edit.label"/>
</h1>

<div class="inside-page-container">
    <div class="d-flex mb-5">
        <g:link controller="admin" action="index" class="d-flex align-items-center btn btn-primary">
            <span class="material-icons">
                keyboard_backspace
            </span>
            Admin
        </g:link>
    </div>

    <div class="d-flex mt-5 justify-content-between">
        <iframe width="280" src="https://www.youtube.com/embed/${video.youtubeVideoCode}"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen>
        </iframe>
    </div>

    <g:form id="videoEditForm" name="videoEditForm" url="[controller: 'video', action: 'updateVideo']" method="put">
        <g:hiddenField name="id" value="${video.id}" />
        <f:all bean="${video}"/>
        <button type="submit" class="btn btn-primary">Submit</button>
    </g:form>
</div>

</body>
</html>