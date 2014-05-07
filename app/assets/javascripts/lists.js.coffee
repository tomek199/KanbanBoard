# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
      
lists_ready = -> 
  $("input[name=name]#name.form-control").keyup ->
    if $(this).val() isnt null and $(this).val().length isnt 0
      $("#new_list_btn").attr "disabled", false
    else 
      $("#new_list_btn").attr "disabled", true
  
$(document).on "page:load", lists_ready
$(document).ready(lists_ready)