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
    $('a.clickableHeader' ).on( 'click', function (e) {

        var that = $(this);
        var url = that.data('url');

        $.ajax({
            url: url,
            success: function(data, result){

                $( '#myHeader .navbar-nav' ).find( '.nav-item.active' ).removeClass( 'active' );
                that.parent( '.nav-item').addClass( 'active' );

                $('#page-container').fadeOut(700,function(){
                    $('#page-container').html(data);
                    $('#page-container').fadeIn(700);
                });
            }
        });
    });

    window.addEventListener('scroll',function(){

        if(document.body.scrollTop > 600){
            document.body.style.backgroundAttachment = "static";
        }
        else{
            $('#templateBody').style.backgroundAttachment='fixed';
        }
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
