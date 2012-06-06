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
//= require_self

$(function(){
  var selector = "section strong em";
  if($(selector).length > 0){
    setInterval(function(){
      $(selector).effect("highlight", { times:20, color: 'lightgreen' }, 1000);
    }, 2000);
  }
});