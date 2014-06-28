class window.Navigation

  constructor: ->

    @$body = $('body')

    this.preperation()
    this.clickEvents()


  preperation: =>

    $('#nav-container .parent .active').each ->
      $(this).closest('.parent').addClass 'parent-active'


  clickEvents: =>

    @$body.on 'click', '#navigation-toggle', =>
      @$body.toggleClass 'navigation-open'
      return false

    $('#nav-container .parent > a').not('.parent-active > a').on 'click', ->
      $(this).parent().toggleClass 'visible'
      return false

