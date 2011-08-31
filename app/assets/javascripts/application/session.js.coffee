$ ->
  ajaxize = $('.ajax')
  # If there's more than 1 ajax div, session should
  # be loaded by other by other call
  if ajaxize.size() == 1 and ajaxize[0].id == 'session'
    $.getScript('/session.js')

