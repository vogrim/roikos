#= require jquery
#= require jquery_ujs
#= require bootstrap-datepicker/core
#= require bootstrap-datepicker/locales/bootstrap-datepicker.de.js
#= require turbolinks
#= require navigation
#= require form


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
  window.app = new Application()