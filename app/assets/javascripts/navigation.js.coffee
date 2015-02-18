class window.Navigation

  constructor: ->

    @$body = $('body')
    @$navGroup = $('.nav-group')

    this.clickEvents()


  clickEvents: =>

    @$body.on 'click', '#navigation-toggle', =>
      @$body.toggleClass 'navigation-open'
      return false

    @$navGroup.find('.nav-seperator').on 'click', ->
      $(this).closest('.nav-group').toggleClass 'open'