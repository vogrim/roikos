#= require jquery
#= require jquery_ujs
#= require bootstrap/tooltip
#= require bootstrap-datepicker/core
#= require bootstrap-datepicker/locales/bootstrap-datepicker.de.js
#= require turbolinks
#= require navigation
#= require form
#= require select2


class Application

  constructor: ->

    this.clickBindings()

    new Navigation()
    new Form()


  clickBindings: ->

    $headerBox = $('.header-box')
    $headerBox.on 'click', ->
      $headerBox.not($(this)).removeClass 'active'
      $(this).toggleClass 'active'



# Init app

$(document).on 'page:load ready', ->


  # $("body").on "ajax:success", "form", ->
  #   alert "ajax done"


  window.app = new Application()

  $('[data-toggle=tooltip]').tooltip()