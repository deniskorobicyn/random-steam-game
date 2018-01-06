function progress_job(id){
  $.ajax({
    url: '/api/v1/jobs',
    method: 'GET',
    data: "id=" + id,
    success: (data) => {
      switch(data.status){
        case 'complete': {
          $('.js-progress-bar-value').html('100% Complete');
          $('.js-progress-bar').attr('style', 'width: 100%');
          location = location;
          break;
        }
        case 'working': {
          let percent = data.at / data.total * 100;
          $('.js-progress-bar-value').html(Math.floor(percent).toString() + '% Complete');
          $('.js-progress-bar').attr('style', 'width: ' + percent.toString() + '%');
          setTimeout(progress_job, 1000, id);
          break;
        }
        default: {
          $('.js-progress-bar-value').html('FAILED');
        }
      }
    },
    failure: (data) => {
      $('.js-progress-bar-value').html('FAILED');
    }
  });
}

$('.js-start-sync').on('click', () => {
    $('.js-progress').removeClass('hidden');
    $('.js-progress-bar-value').html('0% Complete');

    $.ajax({
      url: '/api/v1/games/sync',
      method: 'POST',
      success: (data) => {
        progress_job(data.job_id)
      }
    });
});
