<div class="modal-header">
    <h5 class="modal-title">Shopping Cart</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
    <div class="d-flex flex-column">
        <g:each in="${shoppingCart.cartItems}" var="cartItem" status="index">
            <div class="d-flex flex-column flex-md-row cartItem-entry ${index % 2 == 0? 'borderClass':''} ${((shoppingCart.cartItems.size() == index + 1) && (index % 2 != 0))? 'last-Element':''}" id="cartItem_modal_${cartItem.id}">
                <div class="cartItem-image">
                    <g:imageDisplay image="${cartItem.article?.images?.first()}" class="shop-image" width="100%"></g:imageDisplay>
                </div>
                <div class="cartItem-data d-flex justify-content-between">
                    <div class="cartItem-main-info d-flex flex-column mr-3">
                        <div class="cartItem-title">${cartItem.amount} × ${cartItem.article?.title}</div>
                        <g:if test="${cartItem.size}">
                            <div class="cartItem-size">
                                Size: ${cartItem.size.size}
                            </div>
                        </g:if>
                    </div>
                    <div class="price-calculation flex-grow-1">
                        <div class="d-flex flex-column">
                            <div>
                                <span class="pr-2"><span id="cardItem-amount">${cartItem.amount}</span> × <g:formatNumber number="${cartItem.article?.price}" format="##.##"/> CHF </span>
                            </div>
                            <div class="pt-2">
                                <button class="btn-primary amount-indicator cartItem-amount amount-minus" data-update="cartItem_modal_${cartItem.id}">
                                    -
                                </button>
                                <button class="btn-primary amount-indicator cartItem-amount amount-plus" data-update="cartItem_modal_${cartItem.id}" style="margin-left: -13px;">
                                    +
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="cartItem-total">
                        <span class="font-weight-bold">=
                            <span id="cartItem-total-price">
                                <g:formatNumber number="${cartItem.price}" format="##.##"/>
                            </span> CHF</span>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Continue shopping</button>
    <button type="button" class="btn btn-primary">Checkout</button>
</div>