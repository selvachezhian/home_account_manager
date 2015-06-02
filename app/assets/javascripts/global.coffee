$(document).on 'click', '.datepicker', (e) ->
  $(this).datepicker(
    showWeek: true
    firstDay: 1
    "option", "showAnim", "blind"
  )