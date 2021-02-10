<%@ page import="tamere.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="default.admin.label"/></title>
</head>
<body>

<h1 class="title inside-page-container">
    <g:message code="default.admin.label"/>
</h1>

<div class="inside-page-container">
    <div class="mt-3 mb-3">Hi Admin, here you have an overview of the webpage</div>
    <div class="d-flex admin-page flex-wrap flex-column flex-md-row">
        <g:link controller="store" action="index" class="btn btn-primary">
            <g:message code="default.store.label"/>
        </g:link>
        <g:link controller="order" action="index" class="btn btn-primary">
            <g:message code="default.orders.label"/>
        </g:link>
        <g:link controller="contact" action="messages" class="btn btn-primary">
            <g:message code="default.contactMessages.label"/>
        </g:link>
        <g:link controller="video" action="videos" class="btn btn-primary">
            <g:message code="video.label"/>
        </g:link>
        <g:link controller="live" action="liveShows" class="btn btn-primary">
            Shows
        </g:link>
    </div>

    <div class="mb-4 mt-5 subtitle-4">
        Orders:
    </div>

    <div class="d-flex flex-column mb-3 order-list-container">
        <g:each in="${ShopOrder.list([sort: 'date', order: 'desc', max: 20])}" var="order">
            <div class="d-flex flex-column flex-md-row w-100 justify-content-between order-entry" id="order-entry-${order.id}">
                <div class="d-flex flex-column">
                    <div class="font-italic">
                        <g:formatDate date="${order.date}" format="dd.MM.yyyy"/>
                    </div>
                    <div class="font-weight-bold">${order.name}</div>
                    <div>${order.address}</div>
                    <div>${order.plz} ${order.city}</div>
                    <div>${order.email}</div>
                </div>
                <div class="d-flex flex-column">
                    <g:each in="${order.shoppingCart?.cartItems}" var="cartItem">
                        <div>${cartItem.amount} × ${cartItem.article?.title}</div>
                        <g:if test="${cartItem.size}">
                            <div class="font-italic">Size: ${cartItem.size.size}</div>
                        </g:if>
                        <div class="font-weight-bold">
                            Price: <g:formatNumber number="${cartItem.price}" format="##.##"/> CHF
                        </div>
                    </g:each>
                </div>
                <div class="d-flex flex-column font-weight-bold">
                    <div>Total Price:</div>
                    <div><g:formatNumber number="${order.shoppingCart?.price}" format="##.##"/> CHF</div>
                </div>
                <div class="d-flex flex-column">
                    <g:if test="${!order.shipped}">
                        <g:link class="btn btn-primary mt-1 mb-1" controller="order" action="shipOrder" params="[id: order.id]">
                            Ship Order
                        </g:link>
                    </g:if>
                    <g:else>
                        <div class="color-primary">Shipped</div>
                    </g:else>
                    <g:if test="${!order.paymentReceived}">
                        <g:link class="btn btn-primary mt-1 mb-1" controller="order" action="paymentReceived" params="[id: order.id]">
                            Payment Received?
                        </g:link>
                    </g:if>
                    <g:else>
                        <div class="color-primary">Payment Received</div>
                    </g:else>
                </div>
            </div>
        </g:each>
    </div>
</div>

</body>
</html>