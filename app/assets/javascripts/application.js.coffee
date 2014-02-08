#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

window.FindABoffin = {}

$ ->
  $( '#flash' ).hide().removeClass( 'hide')
    .slideDown( 300 ).delay( 3000 ).slideUp 600
