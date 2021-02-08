<body style="font-family: Consolas !important;">
<div style="font-weight: bold; margin: 0 0 1rem 0; font-size: 20px;">Hi Ta Mère</div>

<div>A User purchased something from the Store</div>

<div style="font-weight: bold; padding: 1rem 0;">The Order:</div>

<table style="padding-bottom: 0.5rem; width: 70%; border-collapse: collapse;margin: 0 0 1rem 0;">
    <tr>
        <th style="border: 1px solid black;text-align: left;padding: 5px;">Name</th>
        <th style="border: 1px solid black;text-align: left;padding: 5px;">Address</th>
        <th style="border: 1px solid black;text-align: left;padding: 5px;">Mail</th>
    </tr>
    <tr>
        <td style="font-weight: bold; border: 1px solid black;text-align: left;padding: 5px;">
            ${order.name}
        </td>
        <td style="font-weight: bold; border: 1px solid black;text-align: left;padding: 5px;">
            ${order.address}<br>
            ${order.plz} ${order.city}
        </td>
        <td style="font-weight: bold; border: 1px solid black;text-align: left;padding: 5px;">
            ${order.email}
        </td>
    </tr>
</table>

<table style="padding-bottom: 0.5rem; width: 70%; border-collapse: collapse;margin: 0 0 1rem 0;">
    <tr>
        <th style="border: 1px solid black;text-align: left;padding: 5px;">Article</th>
        <th style="border: 1px solid black;text-align: left;padding: 5px;">Price</th>
    </tr>
    <g:each in="${order.shoppingCart.cartItems}" var="${cartItem}">
        <tr>
            <td style="border: 1px solid black;text-align: left;padding: 5px;">
                <span>${cartItem.amount}</span> × ${cartItem.article?.title}
                <g:if test="${cartItem.size}">
                    <span style="padding-left: 1.5rem; font-style: italic;">
                        Size: ${cartItem.size.size}
                    </span>
                </g:if>
            </td>
            <td style="border: 1px solid black;text-align: left;padding: 5px;">
                ${cartItem.price} CHF
            </td>
        </tr>
    </g:each>
    <tr>
        <td style="font-weight: bold; border: 1px solid black;text-align: left;padding: 5px;">
            Total
        </td>
        <td style="font-weight: bold; border: 1px solid black;text-align: left;padding: 5px;">
            ${order.shoppingCart.price} CHF
        </td>
    </tr>
</table>

<div>Please make sure to ship the required items to the user!</div>

<br>

<table style="padding-bottom: 0.5rem; width: 70%; border-collapse: collapse;">
    <tr>
        <td style="border: 1px solid black;text-align: left;padding: 5px;">Name:</td>
        <td style="border: 1px solid black;text-align: left;padding: 5px;">Ta Mère Band</td>
    </tr>
    <tr>
        <td style="border: 1px solid black;text-align: left;padding: 5px;">Address:</td>
        <td style="border: 1px solid black;text-align: left;padding: 5px;">
            Obachstrasse 2,<br>
            4500 Solothurn
        </td>
    </tr>
    <tr>
        <td style="border: 1px solid black;text-align: left;padding: 5px;">Bank account number:</td>
        <td style="border: 1px solid black;text-align: left;padding: 5px;">473.533.74.150</td>
    </tr>
    <tr>
        <td style="border: 1px solid black;text-align: left;padding: 5px;">IBAN:</td>
        <td style="border: 1px solid black;text-align: left;padding: 5px;">CH26 0878 5047 3553 7415 0</td>
    </tr>
</table>
<br>
<div>We are looking forward to see you at one of our upcoming shows!</div>
<div style="margin: 20px 0;">
    Best regards, <br>
    <span style="font-weight: bold;">Ta Mère</span> <br>
    tamereband@hotmail.com<br>
    <p style="font-style: italic; font-weight: bold;">
        <a href="${createLink(controller: 'home', action: 'index', absolute: true)}" style="color: rgb(198, 127, 175);text-decoration: underline;">www.tamereband.com</a> <br>
        <a href="https://www.facebook.com/bandtamere" style="color: rgb(198, 127, 175);text-decoration: underline;">www.facebook.com/bandtamere</a>  <br>
        <a href="https://www.instagram.com/tamereband" style="color: rgb(198, 127, 175);text-decoration: underline;">www.instagram.com/tamereband/</a>
    </p>
</div>

</body>