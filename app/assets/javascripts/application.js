// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .
jQuery.ajaxSetup({
    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});
jQuery.fn.submitWithAjax = function(action, serial, callback){
    callback = typeof(callback) != 'undefined' ? callback : null;
    $.ajaxSetup({async:false});
    $.post(action, serial, callback, "script");
    $.ajaxSetup({async:true});
    return this;
};
