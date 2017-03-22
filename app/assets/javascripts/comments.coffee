$(document).on "turbolinks:load", ->
  $('#comments-link').click (event) ->
    event.preventDefault()
    $('#comments-section').fadeToggle()
    $('#comment_body').focus()
