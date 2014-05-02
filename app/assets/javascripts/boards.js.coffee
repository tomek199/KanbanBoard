# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
  $("a.btn").tooltip()
  $(".best_in_place").best_in_place()
  $(".alert").hide()
  $("best_in_place").tooltip()
  
$(document).on "page:load", ready
$(document).ready(ready)

  

  