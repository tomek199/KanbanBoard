$("#task-modal-content").html "<%= escape_javascript(render 'new') %>"
$("#task-modal").modal "show"