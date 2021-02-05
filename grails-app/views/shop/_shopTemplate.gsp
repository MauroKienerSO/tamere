<%@ page import="tamere.*" %>

<h1 class="title inside-page-container">
    <g:message code="default.shop.label"/>
</h1>

<div class="inside-page-container">
    <div class="d-flex article-list flex-wrap flex-column flex-sm-row">
        <g:each in="${Article.list([sort: 'price', order: 'desc'])}" var="article">
            <g:render template="/article/articleEntry" model="[article: article]"/>
        </g:each>
    </div>
</div>
