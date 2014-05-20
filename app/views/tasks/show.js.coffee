$("#lists-modal-content").html "<%= escape_javascript(render 'show') %>"
$("#lists-modal").modal "show"