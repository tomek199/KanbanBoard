# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
      
lists_ready = -> 

  list_input = $("input[name=name]#name.form-control")
  list_input.keyup ->
    if $(this).val() isnt null and $(this).val().length isnt 0
      $("#new_list_btn").attr "disabled", false
    else 
      $("#new_list_btn").attr "disabled", true
  if "<%= @owner %>" == 1    
    $(".row.lists").sortable
      placeholder: "col-md-2 panel panel-info"
      handle: ".panel-heading"
      axis: "x"
      cursor: "move"
      items: ".col-md-2"
      opacity: 0.8
      start: (e, ui) ->
        ui.placeholder.height(ui.item.height())
      update: ->
        $.ajax
          url: "lists/sort"
          type: "post"
          data: $(".row.lists").sortable("serialize"), "<%= @board.id %>"        
  
$(document).on "page:load", lists_ready
$(document).ready(lists_ready)