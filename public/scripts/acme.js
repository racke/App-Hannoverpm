/*! App::Hannoverpm - Homepage of Perl Mongers group in Hanover, Germany.
 * @copyright © 2013, Hannover.pm.
 * @license http://creativecommons.org/publicdomain/zero/1.0/ CC0 1.0 Universal */
//$('#header-logo-title').html('Fressen.pm');
$('#header-logo-title')
  .css('position', 'absolute');
$('#header-logo-slogan')
  .css('position', 'absolute')
  .css('margin-top', '12.5em');
$('#header-logo > a').append(
  $('#header-logo-title')
    .clone()
    .attr('id', 'header-logo-title-2')
    .attr('class', 'header-logo-title')
    .html('Fressen.pm')
    .css('top', '0.88em')
    .css('margin-left', '15em')
    .animate({
      'margin-left': '7em'
    }, 2000, function(){
      $('#header-logo-title')
        .animate({
          'margin-left': '-100em'
        }, 4000);
      $('#header-logo-title-2').animate({
        'margin-left': '20pt'
      }, 1000);
    })
);