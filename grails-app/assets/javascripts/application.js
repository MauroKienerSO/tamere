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

        $( '#myHeader .navbar-nav a' ).on( 'click', function () {

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

        $(window).scroll(function () {

            var st = $(this).scrollTop();
            if (st > lastScrollTop){
                $('#myHeader').addClass('d-none');
            } else {
                $('#myHeader').removeClass('d-none');
            }
            lastScrollTop = st;

            if ($(this).scrollTop() == 0) {
                $('#myHeader').removeClass('bg-custom');
                $('#myHeader').addClass('bg-transparent');
            } else {
                $('#myHeader').removeClass('bg-transparent');
                $('#myHeader').addClass('bg-custom');
            }
        });


});

function addRow(element){
  var link = $('#addTableRow');
  var target = link.data('target');
  var counter = link.data('counter');
  counter++;

  var table = $('#liveShowTable');

  var rowToDisplay = $('#inputRow-'+target);
  var newRow = rowToDisplay.clone();
  table.append(newRow);
  newRow.attr('id','inputRow-'+counter);

  link.data('counter', counter);
  link.data('target', counter);

  rowToDisplay.removeClass('d-none');

  initDatePicker();

};

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

function initDatePicker(){
    console.log("executing");
    $('input[name="date"]').datepicker({
        format: 'mm/dd/yyyy',
        orientation: "bottom right",
        todayHighlight: true,
        autoclose: true
    });
};
