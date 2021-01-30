<div class="modal-header">
    <h5 class="modal-title">Shopping Cart</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
    <div class="d-flex flex-column">
        <g:each in="${shoppingCart.cartItems}" var="cartItem" status="index">
            <g:render template="cartItemEntryModal" model="[cartItem: cartItem, index: index]"/>
        </g:each>
    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Continue shopping</button>
    <button type="button" class="btn btn-primary">Checkout</button>
</div>