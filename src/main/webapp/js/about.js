/**
 * 
 */
$(document).ready(function(){
    var images = ['img/darkdog.jpg', 'img/black.jpg', 'img/black2.jpg'];
    var i = 0;
    
    function changeBg(){
      $('#bg-slider').css('background-image', 'url(' + images[i] + ')');
      i = (i + 1) % images.length;
    }
    
    setInterval(changeBg, 3000);
  });
  