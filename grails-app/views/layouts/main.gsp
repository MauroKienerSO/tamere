<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>

    <title>
        <g:layoutTitle default="tamere [Official Webpage Ta Mère Band]"/>
    </title>
    <meta name="description" content="Official Webpage of the Band tamere. The Band Ta Mère from Solothurn Switzerland."/>
</head>
<body>

    %{-- Wrapper around content of page--}%
    <div class="wrapper" id="page-content-wrapper">

        %{--Header--}%
        <g:if test="${hideNavbar? false: true}">
            <g:render template="/navbar/header" />
        </g:if>
        <g:else>
            <g:render template="/navbar/reduced"/>
        </g:else>

        %{--Page Content--}%
        <div class="container content-wrapper">
            <div id="page-container">
                <input id="pushState" class="d-none hidden" value="${pushState?:headerActive}">
                <g:layoutBody/>
            </div>
        </div>

        <div id="shoppingCart-indicator" class="box-shadow ${amountOfItemsInShoppingCart? '':'d-none'}">
            <button type="button" class="btn btn-secondary width-under-sm-100 d-flex align-items-center justify-content-center justify-content-sm-end" id="loadCartbutton" data-url="${createLink(controller: 'shop', action: 'loadShoppingCartAjax')}">
                <span class="material-icons pr-2">
                shopping_cart
                </span>
                (<span id="amountOfCartItemsInShoppingCart">${amountOfItemsInShoppingCart}</span>) Checkout</button>
        </div>

        <g:render template="/templates/links"/>

        %{--Footer--}%
%{--        <g:render template="/footer/footer"/>--}%

        <g:render template="/templates/modalWrapper"/>

    </div>

    <div class="d-none spinner">
        <asset:image src="wave2.gif"/>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <asset:javascript src="application.js"/>

</body>
</html>
