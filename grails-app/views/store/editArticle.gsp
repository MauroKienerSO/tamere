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
    <g:form id="articleForm" name="articleForm" url="[controller: 'store', action: 'updateArticle', params: [id: article?.id]]" method="put" enctype="multipart/form-data">
        <f:all bean="article"/>
        <button type="submit" class="btn btn-primary">Submit</button>
    </g:form>
</div>

</body>
</html>