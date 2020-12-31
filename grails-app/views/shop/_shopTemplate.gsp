<%@ page import="tamere.*" %>

<h1 class="title inside-page-container">
    <g:message code="default.shop.label"/>
</h1>

<div class="inside-page-container">
    <g:each in="${Article.list()}" var="article">
        <g:render template="/article/articleEntry" model="[article: article]"/>
    </g:each>
</div>
