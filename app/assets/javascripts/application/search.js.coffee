
$ ->
  $("#wikileaksSearch").submit (e) ->
    e.preventDefault()
    term = $("#term").val()
    window.location = "/search/#{term}"

