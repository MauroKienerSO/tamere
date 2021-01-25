<div class="d-flex article-entry flex-column align-items-center align-items-sm-stretch">
    <div id="article-carousel-${article.id}" class="carousel slide article-carousel" data-ride="carousel">
        <g:if test="${article.images}">
            <ol class="carousel-indicators">
                <g:each in="${article.images}" var="value" status="index">
                    <li data-target="#article-carousel-${article.id}" data-slide-to="${index}" class="${index == 0? 'active':''}"></li>
                </g:each>
            </ol>
            <div class="carousel-inner box-shadow">
                <g:each in="${article.images}" var="image" status="index">
                    <div class="carousel-item height-equal-to-width ${index == 0? 'active':''}">
                        <g:imageDisplay image="${image}" class="shop-image" width="100%"></g:imageDisplay>
                    </div>
                </g:each>
            </div>
            <a class="carousel-control-prev" href="#article-carousel-${article.id}" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#article-carousel-${article.id}" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
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
</div>