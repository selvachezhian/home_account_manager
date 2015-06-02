$(document).on "ready page:load", ->
  $.each($(".datepicker"), (index, value) ->
    $(this).datepicker(
      showWeek: true
      firstDay: 1
      "option", "showAnim", "blind"
    )
  )
