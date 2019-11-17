// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap.bundle
//= require_tree .
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

$(document).ready(function(){

    $( '#myHeader .navbar-nav a' ).on( 'click', function () {
        $( '#myHeader .navbar-nav' ).find( 'li.active' ).removeClass( 'active' );
        $(this).parent( 'li' ).addClass( 'active' );

        var that = $(this);
        var url = that.data('url');
        var target = that.data('target');

        var divElement = $('#'+target);

        $.ajax({
            url: url,
            success: function(data, result){

                $('#myTemplate').html(data);
            }
        });

    });

});

function createDomain(element){
  var link = $('#createDomainInstance');
  var url = link.data('url');

  console.log("creating domain Instance");
    $.ajax({
        url: url,
        success: function(data, result){

            $('#myTemplate').html(data);
        }
    });

};
