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
    alert('working')