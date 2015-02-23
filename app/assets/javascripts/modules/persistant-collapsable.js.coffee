$$ ->
  
  openClass    = "open"
  baseSelector = ".nav-group.toggle"
  
  $("body").on "click", "#{baseSelector}.#{openClass} .nav-seperator", ->
    localStorage.setItem $(@).parent().data("name"), true
    
  $("body").on "click", "#{baseSelector}:not(.#{openClass}) .nav-seperator", ->
    localStorage.removeItem $(@).parent().data("name")
    
  $(".nav-group.toggle").each ->
    $(@).addClass "without-animation #{openClass}" if localStorage.getItem $(@).data("name")