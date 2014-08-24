$("#task-modal-content").html "<%= escape_javascript(render 'show') %>"
$("#task-modal").modal "show"