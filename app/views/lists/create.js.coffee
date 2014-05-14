$(".row.lists").append "<%=j render @list %>"
$("#lists-modal").modal "hide"
$("input[name=name]").val ""
$("#new_list_btn").attr "disabled", true

lists_size = "<%= @lists_size %>"
if lists_size >= 6
  list_input = $("input[name=name]#name.form-control")
  list_input.attr "disabled", true
  list_input.attr "placeholder", "Maximum lists added"  
  
alert = $(".alert-success").show 200
window.setTimeout (->
  alert.hide 200
  return
), 3000
return