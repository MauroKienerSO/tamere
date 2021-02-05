<body style="font-family: Consolas !important;">
<div style="margin: 20px 0; font-weight: bold;">
    Hello ${contact.name}
</div>
<div style="margin: 20px 0;">
    We received your message, thanks for writing us! Your message:
</div>
<div style="margin: 20px; font-style: italic;">
    ${contact.message}
</div>
<div style="margin: 20px 0;">
    We will reply to you as soon as possible. Until then - keep rocking!
</div>
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