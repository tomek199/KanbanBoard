$("#list_<%= @list.id.to_s %>").remove()
$("#lists-modal").modal "hide"
alert = $(".alert-success").show 200

list_input = $("input[name=name]#name.form-control")
list_input.attr "disabled", false
list_input.attr "placeholder", ""

window.setTimeout (->
  alert.hide 200
  return
), 3000
return