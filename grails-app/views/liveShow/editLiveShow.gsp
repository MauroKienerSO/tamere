<%@ page import="tamere.*" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="liveShowController.label"/></title>
</head>

<body>

<h1 class="title inside-page-container">
    <g:message code="liveShow.edit.label"/>
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

    <g:form id="liveShowEditForm" name="liveShowEditForm" url="[controller: 'liveShow', action: 'updateLiveShow']" method="put">
        <g:hiddenField name="id" value="${liveShow.id}" />
        <f:all bean="${liveShow}"/>
        <button type="submit" class="btn btn-primary">Submit</button>
    </g:form>
</div>

</body>
</html>