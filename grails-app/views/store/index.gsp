<%@ page import="tamere.*" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="default.store.label"/></title>
</head>

<body>

    <h1 class="title inside-page-container">
        <g:message code="default.store.label"/>
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

        <div class="d-flex article-list">
            <g:each in="${Article.list()}" var="article">
                <g:render template="/article/articleEntry" model="[article: article]"/>
            </g:each>
        </div>
    </div>

    <div class="inside-page-container">
        <g:link controller="store" action="createArticle" class="btn btn-primary">
            <g:message code="article.create.label"/>
        </g:link>
    </div>

</body>
</html>