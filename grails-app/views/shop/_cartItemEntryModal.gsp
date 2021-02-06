<%@ page import="tamere.*" %>

<div class="d-flex flex-column flex-sm-row align-items-center align-items-sm-start cartItem-entry ${checkout?'checkout':''} borderClass" id="cartItem_modal_${cartItem.id}">
    <div class="cartItem-image">
        <g:imageDisplay image="${Image.findAllByIdInList(cartItem.article?.images*.id, [sort: 'orderEntry', max: 1]).first()}" class="shop-image" width="100%"></g:imageDisplay>
    </div>
    <div class="cartItem-data d-flex flex-column flex-sm-row justify-content-between">
        <div class="cartItem-main-info d-flex flex-column mr-3">
            <div class="cartItem-title"><span class="cartItem-amount cartItem_amount_${cartItem.id}">${cartItem.amount}</span> × ${cartItem.article?.title}</div>
            <g:if test="${cartItem.size}">
                <div class="cartItem-size">
                    Size: ${cartItem.size.size}
                </div>
            </g:if>
        </div>
        <div class="flex-grow-1 d-flex flex-row justify-content-between cartItem-prices">
            <div class="price-calculation flex-grow-1">
                <div class="d-flex flex-column align-items-start">
                    <div>
                        <span class="pr-2"><span class="cartItem-amount cartItem_amount_${cartItem.id}">${cartItem.amount}</span> × <g:formatNumber number="${cartItem.article?.price}" format="##.##"/> CHF </span>
                    </div>
                    <div class="pt-2">
                        <button class="btn-primary cartItem-amount-indicator cartItem-amount-indicator-${cartItem.id} amount-minus"
                                data-cart="${cartItem.id}"
                                data-targetamount="cartItem_amount_${cartItem.id}"
                                data-cartprice="cartItem_total_price_${cartItem.id}"
                                data-url="${createLink(controller: 'shop', action: 'changeArticleAmountAjax', params: [shoppingCartId: shoppingCart.id])}">
                            -
                        </button>
                        <button class="btn-primary cartItem-amount-indicator cartItem-amount-indicator-${cartItem.id} amount-plus"
                                data-cart="${cartItem.id}"
                                data-targetamount="cartItem_amount_${cartItem.id}"
                                data-cartprice="cartItem_total_price_${cartItem.id}"
                                data-url="${createLink(controller: 'shop', action: 'changeArticleAmountAjax', params: [shoppingCartId: shoppingCart.id])}">
                            +
                        </button>
                    </div>
                </div>
            </div>
            <div class="cartItem-total">
                <span class="font-weight-bold">=
                    <span class="cartItem-total-price cartItem_total_price_${cartItem.id}">
                        <g:formatNumber number="${cartItem.price}" format="##.##"/>
                    </span> CHF</span>
            </div>
        </div>
    </div>
</div>