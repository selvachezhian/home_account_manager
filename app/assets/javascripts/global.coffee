$(document).on "ready page:load", ->
  $.each($(".datepicker"), (index, value) ->
    $(this).datepicker(
      showWeek: true
      firstDay: 1
      showAnim: "blind"
      dateFormat: "dd/mm/yy"
    )
  )
