$(document).on "ready page:load", ->
  $('#secrets_add_new_value').on 'click', ->
    path = '/secrets/add_new_value'
#    Turbolinks.visit(path)
    alert('js function calling...')