// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require jquery-ui/datepicker
//= require_tree .


String.prototype.format = function() {
    var str = this;
    for (var i = 0; i < arguments.length; i++) {
        var reg = new RegExp("\\{" + i + "\\}", "gm");
        str = str.replace(reg, arguments[i]);
    }
    return str;
}

var app_host_url = window.location.protocol + "//"+window.location.host+"/"



jQuery(document).ready(function($) {
    //line needed to make dropdowns work
    $('.dropdown-toggle').dropdown();

    console.log("What's going on?! -from inside current.js in assets/javascripts")

    // Sets interval...
    $('#testimonialCarousel').carousel({
        interval: 15000
    });

    /* SLIDE ON CLICK */

    $('.carousel-linked-nav > li > a').click(function() {

        // grab href, remove pound sign, convert to number
        var item = Number($(this).attr('href').substring(1));

        // slide to number -1 (account for zero indexing)
        $('#testimonialCarousel').carousel(item - 1);

        // remove current active class
        $('.carousel-linked-nav .active').removeClass('active');

        // add active class to just clicked on item
        $(this).parent().addClass('active');

        // don't follow the link
        return false;
    });

    /* AUTOPLAY NAV HIGHLIGHT */

// bind 'slid' function
    $('#testimonialCarousel').bind('slid', function() {

        // remove active class
        $('.carousel-linked-nav .active').removeClass('active');

        // get index of currently active item
        var idx = $('#testimonialCarousel .item.active').index();

        // select currently active item and add active class
        $('.carousel-linked-nav li:eq(' + idx + ')').addClass('active');

    });

});