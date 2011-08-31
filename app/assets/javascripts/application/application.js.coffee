$ ->
  $(".flash a.close").click (e) ->
    e.preventDefault()
    $(this).parents('.flash').close()

