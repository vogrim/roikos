$$ ->
  
  openClass    = "open"
  baseSelector = ".nav-group.toggle.#{openClass}"
  
  $("body").on "click", "#{baseSelector} .nav-seperator", ->
    localStorage.setItem $(@).parent().data("name"), true
    
  $("body").on "click", "#{baseSelector}:not(.#{openClass}) .nav-seperator", ->
    localStorage.removeItem $(@).parent().data("name")
    
  $(".nav-group.toggle").each ->
    $(@).addClass "without-animation #{openClass}" if localStorage.getItem $(@).data("name")