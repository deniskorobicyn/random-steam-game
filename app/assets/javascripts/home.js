function reload_achievement() {
  console.log('test12');
  $.ajax({
    url: $('.js-new-achievement').data('action-url'),
    method: 'GET',
    data: 'appid=' + $('.js-new-achievement').data('appid'),
    success: (data) => {
      console.log('test');
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
  $.ajax({
    url: $('.js-regenerate').data('action-url'),
    method: 'GET',
    success: (data) => {
      $('.js-game-name').html(data.name);
      $('.js-game-image').attr('src', data.img);
      $('.js-new-achievement').data('appid', data.appid);
      console.log('test1');
      reload_achievement();
    }
  });
});

$('.js-new-achievement').on('click', () => { reload_achievement(); });