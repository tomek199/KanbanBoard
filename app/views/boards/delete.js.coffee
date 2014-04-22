$("#board-modal-content").html "<%= escape_javascript(render 'delete') %>"
$("#board-modal").modal "show"