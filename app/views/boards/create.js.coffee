$(".row.boards").append "<%=j render @board %>"
$("#board-modal").modal "hide"
alert = $(".alert-success").show 200
window.setTimeout (->
  alert.hide 200
  return
), 3000
return