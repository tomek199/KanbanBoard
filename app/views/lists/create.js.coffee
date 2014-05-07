$(".row.lists").append "<%=j render @list %>"
$("#lists-modal").modal "hide"
$("input[name=name]").val ""
$("#new_list_btn").attr "disabled", true
alert = $(".alert-success").show 200
window.setTimeout (->
  alert.hide 200
  return
), 3000
return