API = 'http://api.leakfeed.com/v1'

loadCable = (element) ->
  identifier = element.text()
  url = "#{API}/cable/#{identifier}.json?callback=?"
  $.getJSON url


fillForm = ->
  req = loadCable $("#newCableIdentifier")
  req.success (result) ->
    $("#cable_subject").val(result.subject)
    body = result.body.toString()
    $("#cable_body").val(body)
  req.fail -> $('#output').text('Error conectando con wikileaks. Inténtalo de nuevo más tarde.')

fillCable = ->
  req = loadCable $('#cableIdentifier')
  req.success (result) ->
    $("#cable_subject").val(result.subject)
    $("#cable_body").val(result.body)
    $("#subject").html(result.subject)
    original = result.body.split('¶')
    paragraphs = {original: original}
    template = $('#paragraphs-tmpl').html()
    $("#cableParagraphs tbody").html(tmpl(template, paragraphs))
    $("#addTranslationMessage").show()

    $("#addTranslationMessage .submitAction").click (e) ->
      $("form#new_cable").submit()
      false

    $("#addTranslationMessage .closeAction").click (e) ->
      $("#addTranslationMessage").hide()
      false

  req.fail -> $("#apiError").show()

$ ->
  if $('#searchTerm')[0]
    term = $('#searchTerm').text()
    url = "#{API}/cables/find.json?query=#{term}&callback=?"
    req = $.getJSON(url)
    template = $('#cables-tmpl').html()
    req.success (results) ->
      console.log results.cables
      $("#searchResults").html(tmpl(template, results))

  fillForm() if $("#newCableIdentifier")[0]
  fillCable() if $("#cableIdentifier")[0]

