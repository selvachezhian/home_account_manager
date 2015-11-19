$(document).on "ready page:load", ->
  $('#secrets_add_new_value').on 'click', ->
    url = '/secrets/add_new_value/'
    secret_id = $(this).data().secret
    $.ajax(
      type: 'GET'
      url: url
      dataType: 'html'
      data:
      	id: secret_id
      success: (data) ->
        $('#secrets_add_new_value').attr('disabled', 'disabled')
        $('#secrets_save_value').removeAttr('disabled')
        $('#secret_values > tbody:last-child').append(data)
    )
    