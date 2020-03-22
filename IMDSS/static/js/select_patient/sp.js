$(document).ready(function(){
    $('select').formSelect();
});

  $(document).ready(function(){
    $('.tooltipped').tooltip();
  });

  $(document).ready(function(){
    $('.parallax').parallax();
  });

  var instance = M.Parallax.getInstance(elem);


  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.parallax');
    var instances = M.Parallax.init(elems, options);
  });
  $(document).ready(function(){
    $('.sidenav').sidenav();
  });

  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.sidenav');
    var instances = M.Sidenav.init(elems, options);
  });

  var instance = M.Sidenav.getInstance(elem);
  instance.open();
  instance.close();
  instance.destroy();