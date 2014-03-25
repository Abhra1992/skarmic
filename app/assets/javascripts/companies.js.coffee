# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#selected-count").html "(" + $("input:checkbox:checked").length + " selected)"
$(document).on "change", "#candidates-list input:checkbox", ->
  $("#selected-count").html "(" + $("input:checkbox:checked").length + " selected)"
  return

$("#message-chars-count").html $("#new-message-box").val().length if $("#new-message-box").length
$(document).on "input", "#new-message-box", ->
  $("#message-chars-count").html $(this).val().length
  return

return
