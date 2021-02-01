<%@ page import="tamere.*" %>

<h1 class="title inside-page-container">
    <g:message code="default.checkout.label"/>
</h1>

<div class="inside-page-container">

    <div class="d-flex flex-column">
        <div class="mb-3 subtitle-4">
            Please enter the shipping adress.
        </div>

        <form action="${createLink(controller: 'shop', action: 'createOrderAjax')}" name="createOrder" id="createOrder">
            <f:all bean="order" except="shoppingCart"/>

            <div class="mb-4 mt-5 subtitle-4">
                Your order:
            </div>

            <div class="d-flex flex-column cartItemList checkout">
                <g:each in="${shoppingCart.cartItems}" var="cartItem" status="index">
                    <g:render template="cartItemEntryModal" model="[cartItem: cartItem, index: index, shoppingCart: shoppingCart, checkout: true]"/>
                </g:each>
                <div class="cartItem-entry checkout d-flex align-items-center justify-content-end">
                    <span class="font-weight-bold total-price-cart">=
                        <span id="shopping-cart-total-price">
                            <g:formatNumber number="${shoppingCart.price}" format="##.##"/>
                        </span> CHF</span>
                </div>
            </div>

            <div class="d-flex mb-3 mt-3 justify-content-end">
                <button type="submit" class="btn btn-primary width-under-sm-100">Complete Order</button>
            </div>
        </form>
    </div>

</div>
