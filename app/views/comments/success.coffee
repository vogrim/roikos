$("#comments").append "<%= j render @comment %>"
$("form#new_comment").replaceWith "<%= j render 'form', comment: @new_comment %>"