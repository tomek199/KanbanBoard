$("#lists-modal-content").html "<%= escape_javascript(render 'delete') %>"
$("#lists-modal").modal "show"