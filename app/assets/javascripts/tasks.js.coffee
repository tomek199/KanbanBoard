# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

tasks_ready = ->
  $(".panel-body").sortable
    connectWith: ".panel-body",
    cursor: "move"
    receive: (event, ui) ->
      task_id = $(ui.item).attr("id");
      list_id = $(this).parent().parent().attr("id");
      list_id = list_id.substring 5
      $.ajax
        url: "/tasks/" + task_id + "/sort"
        type: "post"
        data: list_id: list_id
        
$(document).on "page:load", tasks_ready
$(document).ready(tasks_ready)