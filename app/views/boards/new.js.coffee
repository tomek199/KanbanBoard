$("#board-modal-content").html "<%= escape_javascript(render 'new') %>"
$("#board-modal").modal "show"