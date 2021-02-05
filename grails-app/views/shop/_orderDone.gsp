<%@ page import="tamere.*" %>

<h1 class="title inside-page-container">
    <g:message code="order.complete.default.label"/>
</h1>

<div class="inside-page-container">
    Thank you very much for purchasing in our Store!

    We are already looking forward to see you at our next concert!

    <div class="d-flex mt-5">
        <g:link controller="home" action="index" class="d-flex align-items-center btn btn-primary width-under-sm-100">
            <span class="material-icons">
                keyboard_backspace
            </span>
            Back to homepage
        </g:link>
    </div>
</div>