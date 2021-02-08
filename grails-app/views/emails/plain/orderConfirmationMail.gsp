Hi ${order.name}

Thank you very much for purchasing from our Store! You are a rockstar!

Your order:

<g:each in="${order.shoppingCart.cartItems}" var="${cartItem}">
    Article: ${cartItem.amount} × ${cartItem.article?.title}
    <g:if test="${cartItem.size}">
            Size: ${cartItem.size.size}
    </g:if>
    Price: ${cartItem.price} CHF
</g:each>
    Total: ${order.shoppingCart.price} CHF
<g:if test="${order.plexianCartItem}">
    We are very pleased that you purchased the Album Plexian!
    You can download the Album by clicking on the following link.
    Make sure that you download the album on a device that is capable of downloading a ZIP file.
    Attention: Every link is only valid once!
    <g:each in="${order.plexianCartItem.accessTokens}" var="accessToken" status="index">
        ${index}) ${createLink(controller: 'shop', action: 'downloadPlexian', params: [token: accessToken.token], absolute: true)}
    </g:each>
</g:if>

We kindly ask you to transfer the required amount to the following bank adress:

Name: Ta Mère Band
Address: Obachstrasse 2, 4500 Solothurn
Bank account number: 473.533.74.150
IBAN: CH26 0878 5047 3553 7415 0

We are looking forward to see you at one of our upcoming shows!
Best regards,
Ta Mère
tamereband@hotmail.com
www.tamereband.com
www.facebook.com/bandtamere
www.instagram.com/tamereband/
