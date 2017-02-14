$ ->
  progress_job = (id) ->
      finished = false
      failed = false
      progress = 0
      progress_string =
      $.ajax
        url: '/api/v1/jobs',
        method: 'GET',
        data: "id=" + id,
        success: (data)->
          switch data.status
            when 'complete'
              $('.js-progress-bar-value').html('100% Complete')
              $('.js-progress-bar').attr('style', 'width: 100%')
            when 'working'
              percent = data.at / data.total * 100
              $('.js-progress-bar-value').html(Math.floor(percent).toString() + '% Complete')
              $('.js-progress-bar').attr('style', 'width: ' + percent.toString() + '%')
              setTimeout(progress_job, 1000, id)
            else
              $('.js-progress-bar-value').html('FAILED')
        failure: (data)->
          $('.js-progress-bar-value').html('FAILED')

  $('.js-start-sync').on 'click', ->
    console.log($('.js-progress'))
    $('.js-progress').removeClass('hidden')
    $.ajax
      url: '/api/v1/games/sync',
      method: 'POST',
      success: (data)->
        progress_job(data.job_id)
