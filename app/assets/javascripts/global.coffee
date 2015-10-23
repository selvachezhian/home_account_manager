$(document).on "ready page:load", ->
  $.each($(".datepicker"), (index, value) ->
    $(this).datepicker(
      showWeek: true
      firstDay: 1
      showAnim: "blind"
      dateFormat: "dd/mm/yy"
    )
  )

$(document).on "ready page:load", ->
  alert_remove

alert_remove = ->
  window.setTimeout( ->
    $(".alert").fadeTo(1500, 0).slideUp(500, ->
      $(this).remove();
    )
  , 5000)

$(document).on "ready page:load", ->
  $('#get_expenditure').on 'click', ->
    path = '/expenditure/month/' + $('#date_month').val() + '/year/' + $('#date_year').val()
    Turbolinks.visit(path)

$(document).on "ready page:load", ->
  $('#get_year_glance').on 'click', ->
    path = '/expenditure/year_glance/year/'+ $('#date_year').val()
    Turbolinks.visit(path)

@bootstrap_notify_js = (title, message, type) ->
  $.notify({
    icon: 'glyphicon glyphicon-warning-sign'
    title: title
    message: message
  },{
    type: type
  });