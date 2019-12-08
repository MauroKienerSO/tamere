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

    /**
     * opens the new template (liveShow, band, music etc.)
     */
    $('#myHeader .navbar-nav a' ).on( 'click', function () {

        $( '#myHeader .navbar-nav' ).find( 'li.active' ).removeClass( 'active' );
        $(this).parent( 'li' ).addClass( 'active' );

        var that = $(this);
        var url = that.data('url');

        var navbarSupportedContent = $('#navbarSupportedContent');
        navbarSupportedContent.collapse('hide');

        $.ajax({
            url: url,
            success: function(data, result){

                $('#myTemplate').html(data);
                $("html, body").animate({scrollTop: $('#titleID').offset().top }, 2000);
            }
        });

    });

    /**
     * hides / shows navbar on scroll
     */
    $(window).scroll(function () {
        var st = $(this).scrollTop();
        if (st > lastScrollTop){
            $('#myHeader').addClass('d-none');
        } else {
            $('#myHeader').removeClass('d-none');
        }
        lastScrollTop = st;

    });

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
       console.log(url);

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

        console.log('delete');

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
