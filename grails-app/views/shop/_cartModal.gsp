<div class="modal-header">
    <h5 class="modal-title">Shopping Cart</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
    <div class="d-flex flex-column cartItemList">
        <g:each in="${shoppingCart.cartItems}" var="cartItem" status="index">
            <g:render template="cartItemEntryModal" model="[cartItem: cartItem, index: index, shoppingCart: shoppingCart]"/>
        </g:each>
        <div class="cartItem-entry d-flex align-items-center justify-content-end">
            <span class="font-weight-bold">=
                <span id="shopping-cart-total-price">
                    <g:formatNumber number="${shoppingCart.price}" format="##.##"/>
                </span> CHF</span>
        </div>
    </div>
</div>
<div class="modal-footer">
    <div class="d-flex flex-column flex-sm-row width-under-sm-100">
        <a data-url="${g.createLink(controller: 'shop', action: 'body')}" data-pushstate="shop" class="btn btn-secondary mb-2 mb-sm-0 mr-sm-2 width-under-sm-100 clickableHeader">
            Continue shopping
        </a>
%{--        <button type="button" class="btn btn-secondary mb-2 mb-sm-0 mr-sm-2 width-under-sm-100" data-dismiss="modal">Continue shopping</button>--}%
        <button type="button" class="btn btn-primary width-under-sm-100">
            (<span id="amountOfCartItemsInShoppingCartModal">${shoppingCart.amountOfItems()}</span>) Checkout
        </button>
    </div>
</div>