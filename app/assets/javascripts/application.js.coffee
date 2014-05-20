#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require semantic-ui

$(document).on "page:change", ->
  $('.ui.dropdown').dropdown()