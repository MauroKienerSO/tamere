<%@ page import="tamere.*" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="liveShowController.label"/></title>
</head>

<body>

<h1 class="title inside-page-container">
    <g:message code="liveShow.create.label"/>
</h1>

<div class="inside-page-container">
    <g:form id="liveShowForm" name="liveShowForm" url="[controller: 'liveShow', action: 'saveLiveShow']" method="post">
        <f:all bean="liveShow"/>
        <button type="submit" class="btn btn-primary">Submit</button>
    </g:form>
</div>

</body>
</html>