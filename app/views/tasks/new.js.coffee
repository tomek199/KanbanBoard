$("#lists-modal-content").html "<%= escape_javascript(render 'new') %>"
$("#lists-modal").modal "show"