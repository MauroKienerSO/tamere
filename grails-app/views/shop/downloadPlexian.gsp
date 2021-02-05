<!doctype html>
<%@ page import="tamere.*" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>tamere</title>
</head>
<body>

    <h1 class="title inside-page-container">
        <g:message code="default.download.plexian.label"/>
    </h1>

    <div class="inside-page-container">
        <p>Thank you for purchasing our album PLEXIAN! We hope you enjoy it!</p>
        <p>Please make sure to download the album on a device that is capable of downloading a ZIP-File!</p>
        <br>
        <p>We are looking forward to see you at one of our shows!</p>
        <br>
        <g:link class="btn btn-primary" controller="shop" action="donwloadZipFilePlexian">
            <g:message code="default.download.plexian.label"/>
        </g:link>

        <div class="d-flex mt-5">
            <g:link controller="home" action="index" class="d-flex align-items-center btn btn-primary">
                <span class="material-icons">
                    keyboard_backspace
                </span>
                Back to homepage
            </g:link>
        </div>
    </div>

</body>
</html>
