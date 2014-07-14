$(function(){

  var heighest = 0;

  $('.beers li').each(function(){
    heighest = ($(this).height() > heighest) ? $(this).height() : heighest;

  });

  $('.beers li').css('height', heighest + 48 + 'px');
});
