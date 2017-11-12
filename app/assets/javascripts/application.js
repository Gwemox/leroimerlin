// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
// function getRandomSize(min, max) {
//   return Math.round(Math.random() * (max - min) + min);
// }
//
// var allImages = "";
//
// for (var i = 0; i < 3; i++) {
//   var width = getRandomSize(200, 400);
//   var height =  getRandomSize(200, 400);
//   allImages += '<div class="container-picture"><div class="tag">Truc</div><img src="https://placekitten.com/'+width+'/'+height+'" alt="pretty kitty"></div>';
// }
//
// $('#photos').append(allImages);

$(document).on('turbolinks:load', function() {

    $("body").on('click'," [data-do='like']",function (e) {
        e.preventDefault();
        var that = this;
        $.ajax({
            type:'POST',
            url:'/like',
            data: {
                picture_id: $(that).data('id')
            },
            success:function(data){
              $("#nb-like-" + data.picture_id).text(data.number_like);
              if(data.liked){
                  $(that).addClass("liked");
              }
              else{
                  $(that).removeClass("liked");
              }
            }
          });
    });


    $("body").on('click'," [data-do='more']",function (e) {
        e.preventDefault();
        var that = this;
        var ref = $(that).attr('href');
        console.log(window.last)
        $.ajax({
            type:"GET",
            url: ref,
            data: {
                last_id: window.last
            },
            success: function(data){
                $("#photos").append(data.data);
                window.last = data.last_id
                if (data.last_id === 0) {
                  $("[data-do='more']").hide();
                }
            },
            error: function(){
                $("[data-do='more']").hide();
            }
        })
    });
})
