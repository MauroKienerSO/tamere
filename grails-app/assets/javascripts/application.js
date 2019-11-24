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

    // Link Button
  var link = $('#addTableRow');
  // Counts how many liveShows are displayed
  var counter = link.data('counter');

  // get the table
  var table = $('#liveShowTable');

  // get the hidden input row
  var rowToDisplay = $('#inputRow-'+counter);

  // icrease counter and add new hidden table row
  counter++;
  var newRow = rowToDisplay.clone();
  table.append(newRow);
  newRow.attr('id','inputRow-'+counter);

  // override Counter
  link.data('counter', counter);

  // display hidden table row
  rowToDisplay.removeClass('d-none');

  // reinit datepicker
  initDatePicker();

};

function createDomain(element){
    var link = $('#createDomainInstance');
    var url = link.data('url');

    console.log("creating domain Instance");
    $.ajax({
        url: url,
        data: {

        },
        success: function(data, result){

            $('#myTemplate').html(data);
        }
    });

};

function addLiveShow(element){
    var that = $(element);
    var target = that.data('target');
    var url = that.data('url');
    var inputTags = $(target).find('input');
    var invalidInputs = 0;

    inputTags.each(function(){

        if($(this).attr('name') != 'tickets'){
           if($(this).prop('value') == ""){
                    $(this).addClass('invalid');
                    invalidInputs++;
                }
       };
    });

    if(invalidInputs != 0){

    }else {
        $.ajax({
            url: url,
            data: inputTags,
            success: function(data, result){

                // $('#myTemplate').html(data);
            }
        });
    }
};

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
