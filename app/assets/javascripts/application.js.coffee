#= require jquery
#= require jquery_ujs
#= require turbolinks

class Application

  constructor: ->

    @$body = $('body')

    this.clickBindings()

  clickBindings: ->
    @$body.on 'click', '#navigation-toggle', =>
      @$body.toggleClass 'navigation-open'
      return false


$(document).on 'page:load ready', ->
  window.app = new Application()


  $('#nav-container .parent .active').each ->
    $(this).closest('.parent').addClass 'parent-active'

  $('#nav-container .parent > a').not('.parent-active > a').on 'click', ->
    $(this).parent().toggleClass 'visible'
    return false