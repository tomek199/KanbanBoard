$("#board_<%= @board.id.to_s %>").remove()
$("#board-modal").modal "hide"
alert = $(".alert-success").show 200
window.setTimeout (->
  alert.hide 200
  return
), 3000
return