# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
boards_ready = -> 
  $(".best_in_place").best_in_place()
  $(".alert").hide()
  
$(document).on "page:load", boards_ready
$(document).ready(boards_ready)
