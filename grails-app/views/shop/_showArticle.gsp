<h1 class="title inside-page-container">
    <g:message code="default.shop.label"/>
</h1>

<div class="inside-page-container">
    <div class="d-flex flex-column flex-md-row align-items-center show-article justify-content-between">
        <div id="article-carousel-${article.id}" class="carousel slide article-carousel d-flex flex-column-reverse align-items-center show-article-carousel" data-ride="carousel">
            <g:if test="${article.images}">
                <ol class="carousel-indicators show-article-carousel-indicators">
                    <g:each in="${article.images}" var="value" status="index">
                        <li data-target="#article-carousel-${article.id}" data-slide-to="${index}" class="${index == 0? 'active':''} show-article-carousel-list">
                            <g:imageDisplay image="${value}" width="100%"></g:imageDisplay>
                        </li>
                    </g:each>
                </ol>
                <div class="carousel-inner show-article-carousel-inner box-shadow">
                    <g:each in="${article.images}" var="image" status="index">
                        <div class="carousel-item ${index == 0? 'active':''}">
                            <g:imageDisplay image="${image}" width="100%"></g:imageDisplay>
                        </div>
                    </g:each>
                </div>
            %{--                <a class="carousel-control-prev" href="#article-carousel-${article.id}" role="button" data-slide="prev">--}%
            %{--                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>--}%
            %{--                    <span class="sr-only">Previous</span>--}%
            %{--                </a>--}%
            %{--                <a class="carousel-control-next" href="#article-carousel-${article.id}" role="button" data-slide="next">--}%
            %{--                    <span class="carousel-control-next-icon" aria-hidden="true"></span>--}%
            %{--                    <span class="sr-only">Next</span>--}%
            %{--                </a>--}%
            </g:if>
        </div>
        <div class="show-article-data align-self-start">
            <h6 class="article-title">${article.title}</h6>
            <p class="article-description">${article.description}</p>
            <div class="article-price"><g:formatNumber number="${article.price}" format="##.##"/> CHF</div>
        </div>
    </div>

</div>