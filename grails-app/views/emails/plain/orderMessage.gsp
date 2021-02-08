Hi Ta Mère

A User purchased something from the Store

The Order:

Name: ${order.name}
Address:
${order.address}
${order.plz} ${order.city}
Mail: ${order.email}

<g:each in="${order.shoppingCart.cartItems}" var="${cartItem}">
    ${cartItem.amount} × ${cartItem.article?.title}
    <g:if test="${cartItem.size}">
        Size: ${cartItem.size.size}
    </g:if>
    Price: ${cartItem.price} CHF
</g:each>
Total
${order.shoppingCart.price} CHF

Please make sure to ship the required items to the user!
Best regards,
Ta Mère
tamereband@hotmail.com
www.tamereband.com
www.facebook.com/bandtamere
www.instagram.com/tamereband/
