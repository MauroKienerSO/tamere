// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require bootstrap-datepicker
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
};

var lastScrollTop = 0;

$(document).ready(function(){

    var doc = document.documentElement;
    var w = window;

    var prevScroll = w.scrollY || doc.scrollTop;
    var curScroll;
    var direction = 0;
    var prevDirection = 0;
    var wScrollY;

    var header = document.getElementById('myHeader');

    /**
     * pushes the initial state of the page
     */
    window.onload = function () {
        var pushState = $('#pushState').val();
        history.replaceState({stateValue: pushState}, pushState, pushState);
    }

    /**
     * opens the new template (liveShow, band, music etc.)
     */
    $(document).on('click', 'a.clickableHeader', function (e) {
        e.preventDefault();
        $('#navbarSupportedContent').collapse('hide');
        var that = $(this);
        changePage(that.data('url'), that.data('pushstate'), false, $(this).data('pushstate'), $(this).data('url').replace('/body', ''));
    });

    /**
     * opens the new template (liveShow, band, music etc.)
     */
    $(document).on('click', '#showPlexian', function (e) {
        e.preventDefault();
        var that = $(this);
        changePage(that.data('url'), that.data('pushstate'), false, that.data('headervalue'), that.data('url'));
    });

    /**
     * opens the new template (liveShow, band, music etc.)
     */
    $(document).on('click', '#back-to-shop', function (e) {
        e.preventDefault();
        var that = $(this);
        changePage(that.data('url'), that.data('url'), false, that.data('headervalue'), that.data('url').replace('/body', ''));
    });

    /**
     * listens to popstate event (on the back button)
     * see: https://stackoverflow.com/questions/60120434/ajax-navigation-window-history-pushstate-back-browser-button-doesnt-work
     */
    window.addEventListener('popstate', function(event) {
        var state = event.state;
        // State Change for Article Entry
        if(state !== null && state['stateValue'].indexOf('/shop/') !== -1){
            changePage(state['stateValue'], state['stateValue'], true, 'shop', state['stateValue']);
        } else {
            if(state !== null && state['stateValue'] !== undefined){
                // Change State for Header Entry
                var domElement = $('[data-pushstate="'+ state['stateValue'] +'"]');
                changePage(domElement.data('url'), domElement.data('pushstate'), true, state['stateValue'], domElement.data('url').replace('/body', ''));
            }
        }
    });

    // Listener if you click on an article
    $(document).on('click', 'a.go-to-article', function (e) {
        e.preventDefault();
        var that = $(this);
        var headerValue = $(this).data('headervalue');
        var url = $(this).data('url')

        changePage(that.data('url'), that.data('pushstate'),  false, headerValue, url);
    });

    /**
     * for file input type
     */
    $('#fileInput').on('change', function () {
        var selectedFiles =  this.files;

        var url = $(this).data('url');

        // which dom element should be updated
        var update = $(this).data('update');

        // collect all the files
        var formData = new FormData();
        $.each(selectedFiles, function(i, file) {
            formData.append('file', file);
        });

        $.ajax({
            url: url,
            cache: false,
            contentType: false,
            processData: false,
            data : formData,
            type: 'POST',
            success: function(data, result){
                $(update).html(data);
            }
        });
    });

    var checkScroll = function() {

        /*
        ** Find the direction of scroll
        ** 0 - initial, 1 - up, 2 - down
        */

        curScroll = w.scrollY || doc.scrollTop;

        if (curScroll > prevScroll) {
            //scrolled down
            direction = 2;
        }
        else if (curScroll < prevScroll) {
            //scrolled up
            direction = 1;
            if(w.scrollY < 10){
                header.classList.remove('opacity-and-background');
            }
        }

        if (direction !== prevDirection) {
            toggleHeader(direction, curScroll);
        }

        prevScroll = curScroll;
    };

    var toggleHeader = function(direction, curScroll) {
        if (direction === 2 && curScroll > 25) {
            header.classList.add('d-none');
            prevDirection = direction;
        }
        else if (direction === 1) {
            header.classList.remove('d-none');
            if(curScroll > 10){
                header.classList.add('opacity-and-background');
            }
            prevDirection = direction;
        }
    };

    /**
     * scroll event listener for header
     */
    window.addEventListener('scroll',checkScroll);

    /**
     * hides datepicker on click
     */
    $(document).on('changeDate', '#date', function(ev){
        $(this).datepicker('hide');
    });

    $('input[name="date"]').datepicker({
        format: 'dd.mm.yyyy',
        orientation: "bottom right",
        // not working
        buttonImage: '../images/icons/calendar.svg',
        todayHighlight: true,
        autoclose: true
    });

    $('#navbarSupportedContent').on('show.bs.collapse', function (event) {
        $('.content-wrapper').addClass('loading-spinner');
    })

    $('#navbarSupportedContent').on('hidden.bs.collapse', function (event) {
        $('.content-wrapper').removeClass('loading-spinner');
        $('.navbar-toggler').blur();
    })

    // To keep track of the styling for the navbar toggler
    $(document).on('focusout', '.navbar-toggler', function () {
        if(!$(this).hasClass('collapsed')){
            $(this).focus();
        };
    });

    // Amount Minus and Amount Plus
    $(document).on('click', '.amount-indicator', function (e) {
        e.preventDefault();

        // element that got clicked on
        var that = $(this);
        var inputElement = $('#amount');

        var currentValue = inputElement.val();

        // Update the value of the input field
        if(that.hasClass('amount-plus')){
            currentValue++;
            if(!$('.error-message').hasClass('d-none')){
                $('.error-message').addClass('d-none');
                $('.shop-article-input-fields').css('height', '2rem');
            }
        }
        if (that.hasClass('amount-minus') && currentValue > 0){
            currentValue--;
        }

        inputElement.val(currentValue);

        that.blur();
    });

    /**
     * Styling when select Value Changed
     */
    $(document).on('change', '#size-select', function (e) {
        var inputElement = $('#amount');
        var currentValue = inputElement.val();

        if(currentValue == 0){
            currentValue++;
        }
        inputElement.val(currentValue);
        $('.amount-plus').focus();
    })

    /**
     * add to Cart Form
     */
    $(document).on('submit', '#addToCartForm', function (e) {
        e.preventDefault();

        var form = $(this);

        if($('#amount').val() == 0){
            $('.error-message').html('add Amount')
            $('.error-message').removeClass('d-none');
            $('.shop-article-input-fields').css('height', '3rem');
            $('.add-to-cart-button').blur();
            return;
        };

        $.ajax({
            url: form.attr('action'),
            data: form.serialize(), // serializes the form's elements.
            success: function(data, result) {
                $('.add-to-cart-button').blur();
                $('#modal-wrapper-content').html(data);
                var amountOfItemsInShoppingCart = $('#amountOfCartItemsInShoppingCartModal').html();
                $('#modal-wrapper').modal('show');
                $('#shoppingCart-indicator').removeClass('d-none');
                $('#amountOfCartItemsInShoppingCart').html(amountOfItemsInShoppingCart);
            },
            error: function(XMLHttpRequest,textStatus,errorThrown){
                $('.add-to-cart-button').blur();
                $('#article-not-stored').removeClass('d-none');
                setTimeout(function(){
                    $('#article-not-stored').fadeOut(1000,function(){
                        $('#article-not-stored').addClass('d-none');
                        $('#article-not-stored').fadeIn();
                    });
                }, 7000);
            }
        });
    });

    /**
     * complete order Form
     */
    $(document).on('submit', '#createOrder', function (e) {
        e.preventDefault();

        var form = $(this);

        window.scrollTo(0, 0);
        if($('#myHeader').hasClass('opacity-and-background')){
            $('#myHeader').removeClass('opacity-and-background');
        }
        showSpinner();

        $.ajax({
            url: form.attr('action'),
            data: form.serialize(), // serializes the form's elements.
            success: function(data, result) {
                hideSpinner();
                $('#page-container').fadeOut(300,function(){
                    $('#page-container').html(data);
                    $('#page-container').fadeIn(300);
                });
            },
            error: function(XMLHttpRequest,textStatus,errorThrown){
                hideSpinner();
                $('#errorMessageOrderConfirmation').removeClass('d-none')
            }
        });
    });

    /**
     * for changing the amount in the ShoppingCart Modal
     */
    $(document).on('click', '.cartItem-amount-indicator', function (e) {

        var that = $(this);

        var cartItemId = that.data('cart')
        var domClassAmountTarget = that.data('targetamount')
        var domClassTotalPriceTarget = that.data('cartprice')
        var url = that.data('url')
        
        if(that.hasClass('amount-minus')){
            changeAmountOfCartItem(domClassAmountTarget, domClassTotalPriceTarget, -1, cartItemId, url);
        } else {
            if(that.hasClass('amount-plus')){
                changeAmountOfCartItem(domClassAmountTarget, domClassTotalPriceTarget, 1, cartItemId, url);
            }
        }
    });

    /**
     * Loads the shopping Cart Modal
     */
    $(document).on('click', '#loadCartbutton', function (e) {
       var that = $(this);

        $.ajax({
            url: that.data('url'),
            success: function(data, result){

                $('#loadCartbutton').blur();
                $('#modal-wrapper-content').html(data);
                $('#modal-wrapper').modal('show');
            }
        });
    });
});
// doc ready

/**
 * changes the url
 * important, we only want to push the state if we don't use the back button
 * see: https://stackoverflow.com/questions/60120434/ajax-navigation-window-history-pushstate-back-browser-button-doesnt-work
 */
function changePage(url, pushState, popState, headerValue, stateToPush){

    // Blur the active Element
    document.activeElement.blur();
    $( '#myHeader .navbar-nav' ).find( '.nav-item.active' ).removeClass( 'active' );

    // Set the active Header
    $('.clickableHeader[data-pushstate='+ headerValue +']').parent('.nav-item').addClass('active');

    $.ajax({
        url: url,
        data: {ajax: 'true'},
        success: function(data, result){

            $('#modal-wrapper').modal('hide');

            $('#page-container').fadeOut(200,function(){
                window.scrollTo(0, 0);
                if($('#myHeader').hasClass('opacity-and-background')){
                    $('#myHeader').removeClass('opacity-and-background');
                }
                $('#page-container').html(data);
                if(popState == false){
                    history.pushState({stateValue: pushState}, pushState, stateToPush);
                }
                $('#page-container').fadeIn(200);
            });
        }
    });
}

/**
 * deletes an image from an article
 */
function deleteImage(element) {

    var that = $(element);

    var url = that.data('url');

    // which state should be pushed
    var remove = that.data('remove');

    $.ajax({
        url: url,
        success: function(data, result){

            $(remove).fadeOut(200,function(){});
        }
    });
}

/**
 * EventListener for + / - Sign on ShoppingCart Modal for updating the Price
 */
function changeAmountOfCartItem(domClassAmountTarget, domClassTotalPriceTarget, increment, cartItemId, url) {
    var currentAmount = $(document).find('span.' + domClassAmountTarget).first().html();
    $(':button').prop('disabled', true); // Disable all the buttons

    $.ajax({
        url: url,
        data: {
            id: cartItemId,
            changeAmount: increment
        }, // serializes the form's elements.
        success: function(data, result) {

            if(data.cartItemAmount <= 0){
                if(data.totalPrice <= 0){
                    $('#modal-wrapper').modal('hide');
                    $('#shoppingCart-indicator').addClass('d-none');
                    $('#amountOfCartItemsInShoppingCart').html('');
                } else {
                    $('#cartItem_modal_' + cartItemId).fadeOut(200,function(){
                        $('#cartItem_modal_' + cartItemId).remove();
                        $('#shopping-cart-total-price').html(data.totalPrice);
                        $('#amountOfCartItemsInShoppingCartModal').html(data.amountOfItems);
                        $('#amountOfCartItemsInShoppingCart').html(data.amountOfItems);
                    });
                }
            } else {
                $(document).find('span.' + domClassAmountTarget).each(function () {
                    $(this).html(data.cartItemAmount);
                });

                $(document).find('span.' + domClassTotalPriceTarget).each(function () {
                    $(this).html(data.cartItemPrice);
                });

                $('#shopping-cart-total-price').html(data.totalPrice);

                $('#amountOfCartItemsInShoppingCartModal').html(data.amountOfItems);
                $('#amountOfCartItemsInShoppingCart').html(data.amountOfItems);
            }

            $(':button').prop('disabled', false);
        },
        error: function(XMLHttpRequest,textStatus,errorThrown){
            console.log('error')
        }
    });
}

function showSpinner(){
    $('#page-content-wrapper').addClass('loading-spinner');
    $('.spinner').removeClass('d-none');
}
function hideSpinner(){
    $('.spinner').addClass('d-none');
    $('#page-content-wrapper').removeClass('loading-spinner');
}
