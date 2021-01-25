<%@ page import="tamere.*" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="article.edit.label"/></title>
</head>

<body>

<h1 class="title inside-page-container">
    <g:message code="article.edit.label"/>
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

    <g:form id="articleForm" name="articleForm" url="[controller: 'store', action: 'updateArticle', params: [id: article?.id]]" method="put" enctype="multipart/form-data">
        <f:all bean="article"/>
        <button type="submit" class="btn btn-primary">Submit</button>
    </g:form>
</div>

</body>
</html>