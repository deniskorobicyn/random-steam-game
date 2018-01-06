function reload_achievement(appid) {
  $.ajax({
    url: 'api/v1/random/steam/' + appid + '/achievement',
    method: 'GET',
    success: (data) => {
      if(Object.keys(data.achievement).length != 0) {
        $('.js-achievement-title').html(data.achievement.displayName);
        $('.js-achievement-icon').attr('src', data.achievement.icon);
        $('.js-achievement-description').html(data.achievement.description);
        $('.js-achievement-block').show();
      } else {
        $('.js-achievement-block').hide();
      }
    }
  });
}

$('.js-regenerate').on('click', () => {

  let genre_ids = [];
  $(".js-genre-checkbox:checkbox:checked").each(function() {
    genre_ids.push($(this).attr('id'));
  });
  $.ajax({
    url: $('.js-regenerate').data('action-url'),
    method: 'GET',
    data: {
      genre_ids: genre_ids.join(',')
    },
    success: (data) => {
      console.log(data);
      $('.js-game-name').html(data.name);
      $('.js-game-image').attr('src', data.full_image_url);
      $('.js-new-achievement').data('appid', data.steam_appid);
      reload_achievement(data.steam_appid);
    }
  });
});

$('.js-new-achievement').on('click', () => {
  let app_id = $('.js-new-achievement').data('appid')
  reload_achievement(app_id);
});
