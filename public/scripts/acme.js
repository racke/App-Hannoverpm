/*! App::Hannoverpm - Homepage of Perl Mongers group in Hanover, Germany.
 * @copyright © 2013, Hannover.pm.
 * @license http://creativecommons.org/publicdomain/zero/1.0/ CC0 1.0 Universal */
//$('#header-logo-title').html('Fressen.pm');
$('#header-logo-title')
  .css('position', 'absolute');
$('#header-logo-slogan')
  .css('position', 'absolute')
  .css('margin-top', '12.5em');
var acme_fressen_ani2 = false;
$('#header-logo > a').append(
  $('#header-logo-title')
    .clone()
    .attr('id', 'header-logo-title-2')
    .attr('class', 'header-logo-title')
    .html('Fressen.pm')
    .css('top', '0.88em')
    .css('margin-left', '15em')
    .animate({
        'margin-left': '20pt'
      },{
        duration: 2000,
        step: function (now, fx) {
          if (now < 240 && acme_fressen_ani2 == false) {
            acme_fressen_ani2 = true;
            $('#header-logo-title')
              .animate({
                  'margin-left': '-20em'
                },{
                  duration: 1000,
                  complete: function(){
                    $('#header-logo-title').remove();
                    $('#header-logo-title-2').attr('id', 'header-logo-title');
                  }
                }
              );
          }
        }
      }
    )
);