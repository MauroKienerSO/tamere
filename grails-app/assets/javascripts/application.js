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
    $('a.clickableHeader').on( 'click', function (e) {
        var that = $(this);
        changePage(that, false);
    });

    /**
     * listens to popstate event (on the back button)
     * see: https://stackoverflow.com/questions/60120434/ajax-navigation-window-history-pushstate-back-browser-button-doesnt-work
     */
    window.addEventListener('popstate', event => {
        const { state } = event;
        if(state !== null && state['stateValue'] !== undefined){
            var domElement = $('[data-pushstate="'+ state['stateValue'] +'"]');
            changePage(domElement, true);
        }
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

    /**
     * adds input row for live show
     */
    $(document).on('click', '.addLiveShow', function(){
       var that = $(this);
       var url = that.data('url');
       var target = that.data('target');

        $.ajax({
            url: url,
            success: function(data, result){
                $(data).hide().appendTo(target).fadeIn(1000);
            }
        });
    });

    /**
     * deletes a show and removes it from the row
     */
    $(document).on('click', '.deleteShow', function(){
        var that = $(this);
        var url = that.data('url');
        var target = that.data('target');

        $.ajax({
            method: 'DELETE',
            url: url,
            success: function(data, result){
                $(target).fadeOut(1000);
            }
        });

    });
});

/**
 * initializes Datepicker
 */
function initDatePicker(){
    $('input[name="date"]').datepicker({
        format: 'dd.mm.yyyy',
        orientation: "bottom right",
        // not working
        buttonImage: '../images/icons/calendar.svg',
        todayHighlight: true,
        autoclose: true
    });
};

/**
 * changes the url
 * important, we only want to push the state if we don't use the back button
 * see: https://stackoverflow.com/questions/60120434/ajax-navigation-window-history-pushstate-back-browser-button-doesnt-work
 */
function changePage(jQueryElement, popState){
    var url = jQueryElement.data('url');

    // which state should be pushed
    var pushState = jQueryElement.data('pushstate');

    $.ajax({
        url: url,
        success: function(data, result){

            $( '#myHeader .navbar-nav' ).find( '.nav-item.active' ).removeClass( 'active' );
            jQueryElement.parent( '.nav-item').addClass( 'active' );

            $('#page-container').fadeOut(400,function(){
                $('#page-container').html(data);
                if(popState == false){
                    history.pushState({stateValue: pushState}, pushState, pushState);
                }
                $('#page-container').fadeIn(400);
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
