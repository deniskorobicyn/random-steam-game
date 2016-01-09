# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
#You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
 $(".regenerate").on "click", ->
   console.log("start")
   $.ajax 
     url: "api/random_game",
     method: 'GET',
     success: (data)->
       console.log(data)
       $(".game").html data.name
       $(".image").attr('src', data.img)
