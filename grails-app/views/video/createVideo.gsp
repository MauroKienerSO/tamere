<%@ page import="tamere.*" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="video.create.label"/></title>
</head>

<body>

<h1 class="title inside-page-container">
    <g:message code="video.create.label"/>
</h1>

<div class="inside-page-container">
    <g:form id="videoForm" name="videoForm" url="[controller: 'video', action: 'saveVideo']" method="post">
        <f:all bean="video"/>
        <button type="submit" class="btn btn-primary">Submit</button>
    </g:form>
</div>

</body>
</html>