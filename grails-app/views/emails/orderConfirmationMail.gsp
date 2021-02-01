<div style="font-weight: bold;">Hi ${order.name}</div>
<br>

<div>Thank you very much for purchasing from our Store!</div>
<div>We kindly ask you to transfer the required amount to the following bank adress: </div>

<br>

<div>Name: Ta Mère Band</div>
<div>Adress: Obachstrasse 2, 4500 Solothurn</div>
<div>Bank account number: 473.533.74.150</div>
<div>IBAN: CH26 0878 5047 3553 7415 0</div>

<br>

<div style="font-weight: bold; padding: 1rem 0;">Your order:</div>

<g:each in="${order.shoppingCart.cartItems}" var="${cartItem}">
    <div style="padding-bottom: 0.5rem;">
        <div style="font-weight: bold; padding: 0.3rem 0;"><span>${cartItem.amount}</span> × ${cartItem.article?.title}</div>
        <g:if test="${cartItem.size}">
            <div style="font-style: italic; padding: 0.3rem 0;">Size: ${cartItem.size.size}</div>
        </g:if>
        <div style="padding: 0.3rem 0;">${cartItem.price} CHF </div>
    </div>
</g:each>

<div style="font-weight: bold;text-decoration-line: underline;text-decoration-style: double; margin: 0 0 1rem;">
    ${order.shoppingCart.price} CHF
</div>

<div>We are looking forward to see you at one of our upcoming shows!</div>

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