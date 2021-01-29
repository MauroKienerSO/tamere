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
        var that = $(this);
        changePage(that.data('url'), that.data('pushstate'), false, $(this).data('pushstate'), $(this).data('url').replaceAll('/body', ''));
    });

    /**
     * listens to popstate event (on the back button)
     * see: https://stackoverflow.com/questions/60120434/ajax-navigation-window-history-pushstate-back-browser-button-doesnt-work
     */
    window.addEventListener('popstate', event => {
        const { state } = event;
        // State Change for Article Entry
        if(state !== null && state['stateValue'].indexOf('/shop/') !== -1){
            changePage(state['stateValue'], state['stateValue'], true, 'shop', state['stateValue']);
        } else {
            if(state !== null && state['stateValue'] !== undefined){
                // Change State for Header Entry
                var domElement = $('[data-pushstate="'+ state['stateValue'] +'"]');
                changePage(domElement.data('url'), domElement.data('pushstate'), true, state['stateValue'], domElement.data('url').replaceAll('/body', ''));
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
            //scrolled up
            direction = 2;
        }
        else if (curScroll < prevScroll) {
            //scrolled down
            direction = 1;
            if(w.scrollY < 70){
                console.log('scrolled to the top');
                header.classList.remove('opacity-and-background');
            }
        }

        if (direction !== prevDirection) {
            toggleHeader(direction, curScroll);
        }

        prevScroll = curScroll;
    };

    var toggleHeader = function(direction, curScroll) {
        if (direction === 2 && curScroll > 70) {

            //replace 52 with the height of your header in px

            header.classList.add('d-none');
            prevDirection = direction;
        }
        else if (direction === 1) {
            header.classList.remove('d-none');
            header.classList.add('opacity-and-background');
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

    $(document).on('submit', '#addToCartForm', function (e) {
        e.preventDefault();

        var form = $(this);

        if($('#amount').val() == 0){
            $('.error-message').html('add Amount')
            $('.error-message').removeClass('d-none');
            $('.shop-article-input-fields').css('height', '3rem');
            $('.add-to-cart-button').blur();
        }
    });
});

/**
 * changes the url
 * important, we only want to push the state if we don't use the back button
 * see: https://stackoverflow.com/questions/60120434/ajax-navigation-window-history-pushstate-back-browser-button-doesnt-work
 */
function changePage(url, pushState, popState, headerValue, stateToPush){
    $('#navbarSupportedContent').collapse('hide');

    $.ajax({
        url: url,
        data: {ajax: 'true'},
        success: function(data, result){

            $( '#myHeader .navbar-nav' ).find( '.nav-item.active' ).removeClass( 'active' );

            // Set the active Header
            $('.clickableHeader[data-pushstate='+ headerValue +']').parent('.nav-item').addClass('active');

            $('#page-container').fadeOut(300,function(){
                window.scrollTo(0, 0);
                $('#page-container').html(data);
                if(popState == false){
                    history.pushState({stateValue: pushState}, pushState, stateToPush);
                }
                $('#page-container').fadeIn(300);
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

function showSpinner(){
    $('#page-content-wrapper').addClass('loading-spinner');
    $('.spinner').removeClass('d-none');
}
function hideSpinner(){
    $('.spinner').addClass('d-none');
    $('#page-content-wrapper').removeClass('loading-spinner');
}
