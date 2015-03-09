class window.Navigation

  constructor: ->

    @$body = $('body')
    @$navGroup = $('.nav-group')

    this.clickEvents()
    this.hoverEvents()

    # Close sidebar if localstore-item isset
    @$body.addClass('sidebar-closed') if localStorage.getItem @$body.data("sidebar-closed")


  clickEvents: =>

    @$body.on 'click', '#navigation-toggle', =>
      @$body.toggleClass 'navigation-open'
      return false

    @$navGroup.find('.nav-seperator').on 'click', ->
      $(this).closest('.nav-group').toggleClass 'open'

    @$body.on 'click', '#sidebar-toggle', =>
      @$body.toggleClass 'sidebar-closed'
      if localStorage.getItem @$body.data("sidebar-closed")
        localStorage.removeItem @$body.data("sidebar-closed")
        $('#nav-container').show()
      else
        localStorage.setItem @$body.data("sidebar-closed"), true
      return false


  hoverEvents: =>

    $navContainer = $('#nav-container')

    @$body.on 'mouseenter', '#logo-container', =>
      if @$body.hasClass 'sidebar-closed'
        $('#nav-container').show()

    @$body.on 'mouseleave', '#nav-container', =>
      if @$body.hasClass 'sidebar-closed'
        $navContainer.hide()

    @$body.on 'mouseleave', '#sidebar-toggle', =>
      if !$navContainer.is(':hover') and @$body.hasClass 'sidebar-closed'
        $navContainer.hide()
