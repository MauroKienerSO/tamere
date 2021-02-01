<div class="d-flex flex-column flex-md-row cartItem-entry ${index % 2 == 0? 'borderClass':''} ${((shoppingCart.cartItems.size() == index + 1) && (index % 2 != 0))? 'last-Element':''}" id="cartItem_modal_${cartItem.id}">
    <div class="cartItem-image">
        <g:imageDisplay image="${cartItem.article?.images?.first()}" class="shop-image" width="100%"></g:imageDisplay>
    </div>
    <div class="cartItem-data d-flex justify-content-between">
        <div class="cartItem-main-info d-flex flex-column mr-3">
            <div class="cartItem-title"><span class="cartItem-amount cartItem_amount_${cartItem.id}">${cartItem.amount}</span> × ${cartItem.article?.title}</div>
            <g:if test="${cartItem.size}">
                <div class="cartItem-size">
                    Size: ${cartItem.size.size}
                </div>
            </g:if>
        </div>
        <div class="price-calculation flex-grow-1">
            <div class="d-flex flex-column">
                <div>
                    <span class="pr-2"><span class="cartItem-amount cartItem_amount_${cartItem.id}">${cartItem.amount}</span> × <g:formatNumber number="${cartItem.article?.price}" format="##.##"/> CHF </span>
                </div>
                <div class="pt-2">
                    <button class="btn-primary cartItem-amount-indicator-${cartItem.id} amount-minus">
                        -
                    </button>
                    <button class="btn-primary cartItem-amount-indicator-${cartItem.id} amount-plus" style="margin-left: -13px;">
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
<script>
    %{--addDataBinding('#cartItem_amount_${cartItem.id}');--}%
    addCartItemAmountEventListener('.cartItem-amount-indicator-${cartItem.id}', 'cartItem_amount_${cartItem.id}', 'cartItem_total_price_${cartItem.id}', '${cartItem.article?.price}', '${cartItem.id}', '${createLink(controller: 'shop', action: 'changeArticleAmountAjax', params: [shoppingCartId: shoppingCart.id])}');
</script>