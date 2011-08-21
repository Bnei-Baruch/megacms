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
    'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
});
jQuery.fn.postWithAjax = function(url, data, success, error) {
    jQuery.fn.sendWithAjax('post', url, data, success, error);
};
jQuery.fn.putWithAjax = function(url, data, success, error) {
    jQuery.fn.sendWithAjax('put', url, data, success, error);
}
jQuery.fn.sendWithAjax = function(method, url, data, success, error) {
    success = typeof(success) != 'undefined' ? success : null;
    error = typeof(error) != 'undefined' ? error : null;
    jQuery.ajax({
        type: method,
        url: url,
        data: data,
        success: success,
        error: error,
        dataType: "script",
        async: false
    });
    return this;
};
if (!Array.prototype.last) {
    Array.prototype.last = function() {
        return this[this.length - 1];
    }
}
