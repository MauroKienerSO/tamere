<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="default.admin.label"/></title>
</head>
<body>

<h1 class="title inside-page-container">
    <g:message code="default.admin.label"/>
</h1>

<div class="inside-page-container d-flex">
    <g:link controller="store" action="index" class="btn btn-primary">
        <g:message code="default.store.label"/>
    </g:link>
    <g:link controller="order" action="index" class="btn btn-primary">
        <g:message code="default.orders.label"/>
    </g:link>
    <g:link controller="contact" action="messages" class="btn btn-primary">
        <g:message code="default.contactMessages.label"/>
    </g:link>
    <g:link controller="video" action="videos" class="btn btn-primary">
        <g:message code="video.label"/>
    </g:link>
    <g:link controller="liveShow" action="show" class="btn btn-primary">
        Shows
    </g:link>
</div>

</body>
</html>