# Traducir el texto con google api
# Esto dejará de funcionar en enero

google.load("language", "1");

divide = (text, size) ->
  chunks = []

  while text
    if text.length < size
      chunks.push text
      break
    else
      chunks.push(text.substr(0, size))
      text = text.substr(size)
  chunks

translationSteps = 2

process = ->
  translate_summary()
  translate_body()

translate_summary = ->
  text = $("#cable_subject").val()
  google.language.translate text, 'en', 'es', (result) ->
    if result.translation
      $("#cable_translated_subject").val(result.translation)
      translationSteps = translationSteps - 1

# We should divide the body because the api length limit
translate_body = ->
  body = $("#cable_body").val()
  chunks = divide(body, 1000)
  translated = []
  total = chunks.length
  translate = (text) ->
    google.language.translate text, 'en', 'es', (result) ->
      if result.translation
        total = total - 1
        translated.push result.translation
        if total == 0
          body = translated.join('').replace /¶/g, '\n\n¶'
          $("#cable_translated_body").val(body)
          translationSteps = translationSteps - 1
          checkIfDone()
  translate chunk for chunk in chunks

checkIfDone = ->
  if translationSteps == 0
    $("#translateRecommendation").hide()
    $("#translatedByAjax").show()

google.setOnLoadCallback(process);

