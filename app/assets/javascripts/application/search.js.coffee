API = 'http://api.leakfeed.com/v1'

fillForm = ->
  identifier = $("#newCableIdentifier").text()
  url = "#{API}/cable/#{identifier}.json?callback=?"
  req = $.getJSON url
  req.success (result) ->
    $("#cable_subject").val(result.subject)
    $("#cable_body").val(result.body)
  req.fail -> $('#output').text('Error conectando con wikileaks. Inténtalo de nuevo más tarde.')

$ ->
  if $('#searchTerm')[0]
    term = $('#searchTerm').text()
    url = "#{API}/cables/find.json?query=#{term}&callback=?"
    req = $.getJSON(url)
    template = $('#cables-tmpl').html()
    req.success (results) ->
      console.log results.cables
      $("#searchResults").html(tmpl(template, results))

  if $("#newCableIdentifier")[0]
    fillForm()

