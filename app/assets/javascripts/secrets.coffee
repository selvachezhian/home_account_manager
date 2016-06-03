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
        $('#secrets_cancel').removeAttr('disabled')
        $('#secret_values > tbody:last-child').append(data)
    )

  $('#secrets_save_value').on 'click', ->
    url = '/secrets/create_value/'
    secret_id = $('#secret_id').val()
    key = $('#secret_key').val()
    value = $('#secret_value').val()
    $.ajax(
      type: 'POST'
      url: url
      dataType: 'html'
      data:
        id: secret_id
        secret:
          key: key
          value: value
      success: (data) ->
        $('#secret_values > tbody tr.active').replaceWith(data)
        $('#secrets_add_new_value').removeAttr('disabled')
        $('#secrets_save_value').attr('disabled', 'disabled')
        $('#secrets_cancel').attr('disabled', 'disabled')
      error: () ->
        alert('Something went wrong ... please try again later')
    )

  $('#secrets_cancel').on 'click', ->
    $('#secret_values > tbody > tr.active').remove()
    $('#secrets_cancel').attr('disabled', 'disabled')
    $('#secrets_save_value').removeAttr('disabled')
    $('#secrets_add_new_value').removeAttr('disabled')
