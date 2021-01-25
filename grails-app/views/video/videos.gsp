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
    <div class="d-flex mb-5">
        <g:link controller="admin" action="index" class="d-flex align-items-center btn btn-primary">
            <span class="material-icons">
                keyboard_backspace
            </span>
            Admin
        </g:link>
    </div>

    <g:each in="${videos}" var="video" status="index">
        <div class="d-flex flex-column flex-md-row pt-3 pb-3 ${index % 2 == 0? 'borderClass':''}">
            <div class="video-container">
                <iframe width="100%" src="https://www.youtube.com/embed/${video.youtubeVideoCode}"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen>
                </iframe>
            </div>
            <div class="ml-0 ml-md-5 mt-3 mb-3 video-description">
                <p>${video.title}</p>
                <p class="font-italic">${video.description}</p>
                <p>${video.youtubeVideoCode}</p>
                <div class="d-flex flex-row">
                    <g:link controller="video" action="editVideo" params="[id: video.id]" title="edit">
                        <span class="material-icons">
                            create
                        </span>
                    </g:link>
                    <g:link controller="video" action="deleteVideo" params="[id: video.id]" title="delete">
                        <span class="material-icons">
                            delete
                        </span>
                    </g:link>
                </div>
            </div>
        </div>
    </g:each>
</div>

<div class="inside-page-container">
    <g:link controller="video" action="createVideo" class="btn btn-primary">
        <g:message code="video.create.label"/>
    </g:link>
</div>

</body>
</html>