#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap/transition
#= require bootstrap/modal
#= require twitter/bootstrap/rails/confirm
#= require bootstrap-datepicker/core
#= require bootstrap-datepicker/locales/bootstrap-datepicker.de.js

$.fn.twitter_bootstrap_confirmbox.defaults.fade = true
$.fn.twitter_bootstrap_confirmbox.defaults.cancel = "Abbrechen"

$(document).on 'changeDate', '.bootstrap-datepicker', (evt) ->
  rails_date = evt.date.getFullYear() + '-' + ('0' + (evt.date.getMonth() + 1)).slice(-2) + '-' + ('0' + evt.date.getDate()).slice(-2)
  $(this).next("input[type=hidden]").val(rails_date)