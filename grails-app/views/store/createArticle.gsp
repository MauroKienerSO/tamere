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
    <g:render template="/article/articleForm" model="[article: article]"/>
</div>

</body>
</html>