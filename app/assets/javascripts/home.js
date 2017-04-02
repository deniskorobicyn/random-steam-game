function reload_achievement() {
  $.ajax({
    url: $('.js-new-achievement').data('action-url'),
    method: 'GET',
    data: 'appid=' + $('.js-new-achievement').data('appid'),
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
      $('.js-game-name').html(data.name);
      $('.js-game-image').attr('src', data.img);
      $('.js-new-achievement').data('appid', data.appid);
      reload_achievement();
    }
  });
});

$('.js-new-achievement').on('click', () => { reload_achievement(); });