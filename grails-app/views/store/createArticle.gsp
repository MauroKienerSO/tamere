<%@ page import="tamere.*" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="article.create.label"/></title>
</head>

<body>

<h1 class="title inside-page-container">
    <g:message code="article.create.label"/>
</h1>

<div class="inside-page-container" id="createArticleContainer">
    <div class="d-flex mb-5">
        <g:link controller="admin" action="index" class="d-flex align-items-center btn btn-primary">
            <span class="material-icons">
                keyboard_backspace
            </span>
            Admin
        </g:link>
    </div>

    <g:render template="/article/articleForm" model="[article: article]"/>
</div>

</body>
</html>