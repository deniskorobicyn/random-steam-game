# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
#You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  reload_achievement = () ->
    $.ajax
      url: $('.js-new-achievement').data('action-url'),
      method: 'GET',
      data: 'appid=' + $('.js-new-achievement').data('appid'),
      success: (data)->
        if Object.keys(data.achievement).length != 0
          $('.js-achievement-title').html data.achievement.displayName
          $('.js-achievement-icon').attr 'src', data.achievement.icon
          $('.js-achievement-description').html data.achievement.description
          $('.js-achievement-block').show()
        else
          $('.js-achievement-block').hide()

  $('.js-new-achievement').on 'click', reload_achievement

  $('.js-regenerate').on 'click', ->
    $.ajax
      url: $('.js-regenerate').data('action-url'),
      method: 'GET',
      success: (data)->
        $('.js-game-name').html data.name
        $('.js-game-image').attr('src', data.img)
        $('.js-new-achievement').data('appid', data.appid)
        reload_achievement()
