<%@ page import="tamere.*" %>

<div class="d-flex article-entry flex-column align-items-center align-items-sm-stretch">
    <a class="go-to-article" href="${createLink(controller: 'shop', action: 'showArticleAjax', params: [alias: article.alias])}" data-url="${createLink(controller: 'shop', action: 'showArticleAjax', params: [alias: article.alias])}" data-update="page-container" data-headervalue="shop" data-pushstate="${createLink(controller: 'shop', action: 'showArticleAjax', params: [alias: article.alias])}" title="Show ${article.title}">
        <div id="article-carousel-${article.id}" class="carousel slide article-carousel" data-ride="carousel">
            <g:if test="${article.images}">
                <div class="carousel-inner box-shadow">
                    <g:each in="${Image.findAllByIdInList(article.images*.id, [sort: 'orderEntry', max: 1])}" var="image" status="index">
                        <div class="carousel-item height-equal-to-width ${index == 0? 'active':''}">
                            <g:imageDisplay image="${image}" class="shop-image" width="100%"></g:imageDisplay>
                        </div>
                    </g:each>
                </div>
            </g:if>
        </div>
        <div class="article-data">
            <h6 class="article-title">${article.title}</h6>
            <p class="article-description">${article.description}</p>
            <div class="article-price"><g:formatNumber number="${article.price}" format="##.##"/> CHF</div>

            <sec:ifLoggedIn>
                <g:link controller="store" action="editArticle" params="[id: article.id]">Edit Article</g:link>
                <g:link controller="store" action="deleteArticle" params="[id: article.id]">Delete Article</g:link>
            </sec:ifLoggedIn>
        </div>
    </a>
</div>