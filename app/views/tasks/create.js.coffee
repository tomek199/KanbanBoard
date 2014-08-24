$(".col-md-2#list_<%=@list.id%>").find(".panel-body").append "<%=j render @task %>"

$("#task-modal").modal "hide"

alert = $(".alert-success").show 200
window.setTimeout (->
  alert.hide 200
  return
), 3000
return