$('.comments').prepend("<li class='rounded cancelable_remove'><%=j render :partial => 'form' %></li>")
$('#comment_operations').hide()
$('#comment_oppinion').focus()
problemOrNot.run_vital_functions()