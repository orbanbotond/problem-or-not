#// This is a manifest file that'll be compiled into including all the files listed below.
#// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
#// be included in the compiled file accessible from http://example.com/assets/application.js
#// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
#// the compiled file.
#//
#//= require jquery
#//= require jquery_ujs
#//= require droparea.js
#//= require_tree .
#//= require_self

window.problemOrNot = { 
  vital_functions: [
    ->
      $(".cancel").click ->
        $('.cancelable_remove').remove()
        $('.cancelable_show').show()

  ]
  run_vital_functions: ->
    $.each problemOrNot.vital_functions, ->
      @()
}

jQuery ->
  problemOrNot.run_vital_functions()

jQuery ->
  selector = "section strong em"
  if $(selector).length > 0
    setInterval ->
      $(selector).effect "highlight", { times:20, color: 'lightgreen' }, 1000
    , 2000

$ ->
  counter = null
  $(".mouse-stay").hover ->
    counter = setTimeout ->
      i = null
      # console.debug('stayed... :)')
    , 800
  , ->
    # console.debug('stopped...out :(')
    clearTimeout(counter);
