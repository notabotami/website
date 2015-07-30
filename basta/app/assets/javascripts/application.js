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
//= require jquery.ui.datepicker
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


function clickAnywhereToClosePopovers(){

}

function colorCodeScheduleButtonHelper(jquery_object,new_button_class){
    var button_classes = ["btn-default","btn-primary","btn-success","btn-info","btn-warning","btn-danger"];
    var i;
    for(i = 0; i< button_classes.length;i++){
        $(jquery_object).removeClass(button_classes[i]);
    }

    $(jquery_object).addClass(new_button_class);
}

function colorCodeScheduleButton(jquery_object,shift_status){


    if(shift_status == "up_for_pick_up"){
        colorCodeScheduleButtonHelper(jquery_object,"btn-danger")
    } else if(shift_status == "up_for_trade"){
        colorCodeScheduleButtonHelper(jquery_object,"btn-warning")
    } else{
        colorCodeScheduleButtonHelper(jquery_object,"btn-default")
    }


}
function addShift(user_id,year,month,day,hour,minute){

    window.location.href = app_host_url + "shifts/new"

    /**
    $("#shift_date_id option[value=" + user_id + "]").attr("selected","selected");
    $("#shift_date_1i option[value=" + year + "]").attr("selected","selected");
    $("#shift_date_2i option[value=" + month + "]").attr("selected","selected");
    $("#shift_date_3i option[value=" + day + "]").attr("selected","selected");
    $("#shift_date_4i option[value=" + hour + "]").attr("selected","selected");
    $("#shift_date_5i option[value=" + minute + "]").attr("selected","selected");
    $('#addShiftModal').modal('toggle');
     */

}

function editShift(shift_id,user_id,year,month,day,hour,minute){

    window.location.href = app_host_url + "shifts/{0}/edit".format(shift_id)

    /**
    $("#shift_date_id option[value=" + user_id + "]").attr("selected","selected");
    $("#shift_date_1i option[value=" + year + "]").attr("selected","selected");
    $("#shift_date_2i option[value=" + month + "]").attr("selected","selected");
    $("#shift_date_3i option[value=" + day + "]").attr("selected","selected");
    $("#shift_date_4i option[value=" + hour + "]").attr("selected","selected");
    $("#shift_date_5i option[value=" + minute + "]").attr("selected","selected");
    $('#editShiftModal').modal('toggle');

    $('#scheduleShiftForm').attr("method","put")
    $('#scheduleShiftForm').attr("action","/shifts/{0}".format(shift_id))
     */
}

function releaseShift(shift_id){
    console.log("release shift_id: " + shift_id)
    window.location.href = app_host_url + "shift/{0}/put_up_for_pick_up".format(shift_id)
}

function putUpForTradeShift(shift_id){
    console.log("trade shift_id: " + shift_id)
    window.location.href = app_host_url + "shift/{0}/put_up_for_trade".format(shift_id)
}



function pickShiftToTrade(shift_id){
    window.location.href = app_host_url + "user/{0}/trade".format(shift_id)
}

function updateTradedShifts(from,to){

    window.location.href = app_host_url + "shift/trade/{0}/{1}".format(from,to)
}

function pickUpShift(shift_id){
    console.log("picking up: " + shift_id)
    window.location.href = app_host_url + "shift/{0}/pickup".format(shift_id)
}

function normalizeShift(shift_id){
    window.location.href = app_host_url + "shift/{0}/reset".format(shift_id)
}

function parseDate(date){
    return date.split("/");
}

function foodTime(lunch_or_dinner){
    if(lunch_or_dinner == "L"){
        return ["10","30"]
    }
    else{
        return ["4","30"]
    }
}

function hideModals(){
    $("#addShiftModal").hide();
}

function createSchedulePopOvers(){
    console.log("creating schedule popovers")

    hideModals();



    //code makes the popovers
    $( ".basta-popover" ).each(function( index ) {
        var jquery_object = this
        var user_id = $(this).attr("user_id")
        var shift_id = $(this).attr("shift_id")
        var day_of_week = $(this).attr("day_of_week")
        var date = $(this).attr("date")
        var parsed_date = parseDate(date)
        var month = parsed_date[0]
        var day = parsed_date[1]
        var year = "2014"
        var lunch_or_dinner = $(this).attr("lunch_or_dinner")
        var food_time_info = foodTime(lunch_or_dinner)
        var hour = food_time_info[0]
        var minute = food_time_info[1]

        var at_least_manager = ($(this).attr("at_least_manager") == "true")
        var owns_shift = ($(this).attr("owns_shift") == "true")

        var shift_being_traded = $(this).attr("trade")
        var trading = (shift_being_traded != "nil")

        var shift_status = $(this).attr("shift_status")

        console.log(shift_status)
        colorCodeScheduleButton(jquery_object,shift_status)
        var shift_status_message = "releasing"
        if(shift_status == "up_for_trade"){
            shift_status_message = "trading"
        }

        var content = ""
        var title = ""

        var single_button_template = '<button type="button" id="close" class="close" onclick={0}>{1}</button>'
        var double_button_template = '<button type="button" id="close" class="close" onclick={0}>{1}</button><br>' +
            '<button type="button" id="close" class="close" onclick={2}>{3}</button>'


        if( owns_shift && !at_least_manager){
            // if status indicates up for release and trade, displays which and allows reset otherwise can put up for trade or put up for release,
            if(shift_status == "normal"){
                if(shift_id != "nil" && !trading) {
                    function_call_1 = "releaseShift({0})".format(shift_id)
                    function_call_2 = "putUpForTradeShift({0})".format(shift_id)
                    message_1 = "release"
                    message_2 = "trade"
                    content = double_button_template.format(function_call_1, message_1, function_call_2, message_2)
                }else if(shift_id != "nil" && trading){
                    function_call = "updateTradedShifts({0},{1})".format(shift_being_traded,shift_id)
                    message = "accept trade"
                    content = single_button_template.format(function_call,message)
                }

            }else{
                if(shift_id != "nil") {
                    function_call_1 = "normalizeShift({0})".format(shift_id)
                    title = shift_status_message
                    message_1 = "reset"
                    content = single_button_template.format(function_call_1,message_1)
                }else if(shift_id != "nil" && trading){
                    function_call = "updateTradedShifts({0},{1})".format(shift_being_traded,shift_id)
                    content = single_button_template.format(function_call,message)

                }
            }

        }
        if(!owns_shift && !at_least_manager){
            //should be able to pick up and trade if their status indicates it, otherwise, don't do anything
            if(shift_status == "up_for_trade"){
                function_call = "pickShiftToTrade({0})".format(shift_id)
                message = "trade for"
                content=single_button_template.format(function_call,message)
            }else if(shift_status == "up_for_pick_up"){
                function_call = "pickUpShift({0})".format(shift_id)
                message = "pick up"
                content=single_button_template.format(function_call, message)
            }
        }
        if(at_least_manager){
            //if not a shift, add shift, if  a shift edit shift
            $("#scheduleDateSelect").hide()
            if(shift_id == "nil") {
                function_call = "addShift({0},{1},{2},{3},{4},{5})".format(user_id,year, month, day, hour, minute)
                message = "add shift"
                content = single_button_template.format(function_call,message)
            } else{
                function_call = "editShift({0},{1},{2},{3},{4},{5},{6})".format(shift_id,user_id,year,month,day,hour,minute)
                message = "edit shift"
                content = single_button_template.format(function_call,message)
            }
        }

        $(this).popover({
            placement: 'bottom',
            html: 'true',
            title: title,
            content: content
        })


    });
}

jQuery(document).ready(function($) {
    //line needed to make dropdowns work
    $('.dropdown-toggle').dropdown();

    console.log("What's going on?! -from inside current.js in assets/javascripts")

    createSchedulePopOvers()

});