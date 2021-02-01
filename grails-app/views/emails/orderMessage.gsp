<div>
    Hi
</div>

<div>There has been a new order on your website!</div>
<div>Please Ship the order to the required address!</div>

<div>${order.name}</div>
<div>${order.email}</div>
<div>${order.address}</div>
<div>${order.plz}</div>
<div>${order.city}</div>

<g:each in="${order.shoppingCart.cartItems}" var="${cartItem}">
    <div><span>${cartItem.amount}</span> × ${cartItem.article?.title}</div>
    <g:if test="${cartItem.size}">
        <div style="font-style: italic;">Size: ${cartItem.size.size}</div>
    </g:if>
    <div>${cartItem.price}</div>
</g:each>

<div style="font-weight: bold;">
    ${order.shoppingCart.price}
</div>

<div style="margin: 20px 0;">
    Best regards, <br>
    Ta Mère <br>
    <br>
    <p style="font-style: italic; font-weight: bold;">
        tamereband@hotmail.com<br>
        <a href="https://www.facebook.com/bandtamere">www.facebook.com/bandtamere</a>  <br>
        <a href="https://www.instagram.com/tamereband">www.instagram.com/tamereband/</a>
    </p>
</div>