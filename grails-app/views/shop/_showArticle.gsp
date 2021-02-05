<%@ page import="tamere.*" %>

<h1 class="title inside-page-container">
    <g:message code="default.shop.label"/>
</h1>

<div class="inside-page-container">
    <div class="subtitle-3 response d-none" id="article-not-stored">
        Sorry! Unfortunately we couldn't store the article in the cart. Please try again!
    </div>
    <div class="d-flex flex-column flex-md-row align-items-center show-article justify-content-between">
        <div id="article-carousel-${article.id}" class="carousel slide article-carousel d-flex flex-column-reverse align-items-center show-article-carousel" data-ride="carousel">
            <g:if test="${article.images}">
                <ol class="carousel-indicators show-article-carousel-indicators">
                    <g:each in="${Image.findAllByIdInList(article.images*.id, [sort: 'orderEntry'])}" var="value" status="index">
                        <li data-target="#article-carousel-${article.id}" data-slide-to="${index}" class="${index == 0? 'active':''} show-article-carousel-list">
                            <g:imageDisplay image="${value}" width="100%"></g:imageDisplay>
                        </li>
                    </g:each>
                </ol>
                <div class="carousel-inner show-article-carousel-inner box-shadow">
                    <g:each in="${Image.findAllByIdInList(article.images*.id, [sort: 'orderEntry'])}" var="image" status="index">
                        <div class="carousel-item ${index == 0? 'active':''}">
                            <g:imageDisplay image="${image}" width="100%"></g:imageDisplay>
                        </div>
                    </g:each>
                </div>
            </g:if>
        </div>
        <div class="show-article-data align-self-start">
            <h6 class="article-title">${article.title}</h6>
            <p class="article-description">${article.description}</p>
            <div class="article-price"><g:formatNumber number="${article.price}" format="##.##"/> CHF</div>

            <form action="${createLink(controller: 'shop', action: 'addToCartAjax')}" name="addToCartForm" id="addToCartForm">
                <g:hiddenField name="id" value="${article.id}" />
                <div class="d-flex mb-3 mb-md-5 mt-3 justify-content-between shop-article-input-fields align-items-center flex-wrap">
                    <g:if test="${article.sizes}">
                        <select aria-label="Select Sizes" class="form-control select-sizes" name="size" id="size-select" required>
                            <option value="" disabled selected>Size</option>
                            <g:each in="${article.sizes}" var="size" status="index">
                                <option>${size.size}</option>
                            </g:each>
                        </select>
                    </g:if>
                    <div class="amount-calculator d-flex flex-row ${article.sizes? 'justify-content-end':'justify-content-start'}">
                        <button class="btn-primary amount-indicator amount-minus">
                            -
                        </button>
                        <input name="amount" id="amount" value="0" class="disabled-input-field" readonly="readonly" required>
                        <button class="btn-primary amount-indicator amount-plus">
                            +
                        </button>
                    </div>
                    <div class="error-message d-none ${article.sizes?'text-align-right':''}"></div>
                </div>
                <button type="submit" class="btn btn-primary d-flex align-items-center justify-content-center w-100 add-to-cart-button">
                    <span class="material-icons pr-2">
                        shopping_bag
                    </span>
                    Add to cart
                </button>
            </form>
        </div>
    </div>

</div>