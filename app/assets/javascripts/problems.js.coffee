# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#TODO this need to be optimized
jQuery ->
  $('.hover').mouseenter ->
    $this = $(@)
    locator = $this.data 'hover'

    $('.visible-on-hover', $this ).show 'fast'
    $('.visible-on-hover-everywhere' ).show 'fast'
  $('.hover').mouseleave ->
    $this = $(@);
    locator = $this.data 'hover'

    $('.visible-on-hover', $this ).hide 'fast'
    $('.visible-on-hover-everywhere' ).hide 'fast'

jQuery ->
  $('.hover-table').mouseenter ->
    $this = $(@)
    locator = $this.data 'hover'
    $table = $this.parents 'table'

    if !$('.hover', $this ).length
      $('.' + locator + '.hover', $table ).hide('fast').removeClass 'hover'
    $('.' + locator, $this ).show('fast').addClass 'hover'
    $('.' + locator + '-everywhere:not(.hover)').show('fast').addClass 'hover'
  $('.hover-table').parents('table').mouseleave ->
    $this = $(@);
    locator = $('.hover-table').data 'hover'

    $('.' + locator, $this ).hide('fast').removeClass 'hover'
    $('.' + locator + '-everywhere' ).hide('fast').removeClass 'hover'
