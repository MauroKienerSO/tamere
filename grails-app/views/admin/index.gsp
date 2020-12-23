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
    <g:link controller="store" action="index" class="admin-link">
        <g:message code="default.store.label"/>
    </g:link>
    <g:link controller="order" action="index" class="admin-link">
        <g:message code="default.orders.label"/>
    </g:link>
    <g:link controller="contact" action="index" class="admin-link">
        <g:message code="default.contactMessages.label"/>
    </g:link>
</div>

</body>
</html>